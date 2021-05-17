defmodule DeliverycenterElixir.Parser do
  def call() do
    payload_file = "priv/payload/payload.json"
    open_file = File.read!(payload_file)
    json = Jason.decode!(open_file)
    # Aqui é recomendável cadastrar o payload no database antes de realizar o parser
    parser(json)
  end

  defp parser(map) do
    order_itens = hd(map["order_items"])
    payments = hd(map["payments"])
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
      timeToExpire: map["date_created"],
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
    }
  end
end
