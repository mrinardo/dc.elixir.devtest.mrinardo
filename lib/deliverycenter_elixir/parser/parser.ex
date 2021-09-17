defmodule DeliverycenterElixir.Parser do
  alias DeliverycenterElixir.Orders.Create, as: OrderCreate
  alias DeliverycenterElixir.Parser.CalculateExpirationDate

  @default_json_file "priv/payload/payload.json"

  def call(payload_file \\ @default_json_file) do
    with {:ok, open_file} <- File.read(payload_file),
         {:ok, json} <- Jason.decode(open_file) do
      # Extrair do JSON os dados de cada entidade
      order_data = get_order_data(json)
      customer_data = get_customer_data(json)
      item_data = get_item_data(json)
      address_data = get_address_data(json)
      payment_data = get_payment_data(json)

      # Cadastrar os dados no banco de dados
      result = OrderCreate.call(order_data, customer_data, address_data, payment_data, item_data)

      case result do
        {:ok, _trans_result} ->
          parser(json)

        {:error, _failed_operation, failed_value, _changes_so_far} ->
          {:error, failed_value}
      end
    else
      {:error, :enoent} ->
        {:error, "Unable to open JSON file"}

      {:error, _message} = error ->
        error
    end
  end

  defp get_address_data(%{"shipping" => shipping}) do
    receiver_address = Map.get(shipping, "receiver_address")

    rename_id(receiver_address)
  end

  defp get_customer_data(%{"buyer" => customer}) do
    customer
    |> rename_id()
    |> Map.merge(customer["billing_info"])
    |> Map.delete("billing_info")
  end

  defp get_item_data(%{"order_items" => [item | _tail]}) do
    item
    |> Map.put("external_id", item["item_id"])
    |> Map.delete("item_id")
  end

  defp get_payment_data(%{"payments" => [payment | _tail]}) do
    rename_id(payment)
  end

  defp get_order_data(order) do
    create_date = order["date_created"]
    expiration_in_minutes = order["expiration_in_minutes"]

    with {:ok, expiration_date} <-
           CalculateExpirationDate.call(create_date, expiration_in_minutes) do
      order
      |> rename_id()
      |> Map.put("expiration_date", expiration_date)
    else
      _ ->
        order
    end
  end

  defp rename_id(map) do
    map
    |> Map.put("external_id", map["id"])
    |> Map.delete("id")
  end

  defp parser(map) do
    order_itens = hd(map["order_items"])
    payments = hd(map["payments"])

    {:ok, time_to_expire} =
      CalculateExpirationDate.call(map["date_created"], map["expiration_in_minutes"])

    {:ok,
     %{
       externalCode: map["id"],
       storeId: map["store_id"],
       subTotal: map["total_amount"],
       deliveryFee: map["total_shipping"],
       total_shipping: map["total_shipping"],
       total: map["total_amount_with_shipping"],
       country: map["shipping"]["receiver_address"]["country"],
       state: map["shipping"]["receiver_address"]["state"],
       city: map["shipping"]["receiver_address"]["city"],
       district: map["shipping"]["receiver_address"]["neighborhood"],
       street: map["shipping"]["receiver_address"]["neighborhood"],
       complement: map["shipping"]["receiver_address"]["comment"],
       latitude: map["shipping"]["receiver_address"]["latitude"],
       longitude: map["shipping"]["receiver_address"]["longitude"],
       dtOrderCreate: map["date_created"],
       timeToExpire: time_to_expire,
       postalCode: map["shipping"]["receiver_address"]["zip_code"],
       number: map["shipping"]["receiver_address"]["street_number"],
       customer: %{
         externalCode: map["buyer"]["id"],
         name: map["buyer"]["first_name"],
         email: map["buyer"]["email"],
         contact: map["buyer"]["phone"]
       },
       items: [
         %{
           externalCode: order_itens["item_id"],
           name: order_itens["title"],
           price: order_itens["unit_price"],
           quantity: order_itens["quantity"],
           total: order_itens["full_unit_price"]
         }
       ],
       payments: [
         %{
           type: payments["payment_type"],
           value: payments["total_paid_amount"]
         }
       ]
     }}
  end
end
