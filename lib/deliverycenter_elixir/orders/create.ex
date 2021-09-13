defmodule DeliverycenterElixir.Orders.Create do
  alias DeliverycenterElixir.Address
  alias DeliverycenterElixir.Customer
  alias DeliverycenterElixir.Item
  alias DeliverycenterElixir.Order
  alias DeliverycenterElixir.Payment
  alias DeliverycenterElixir.Repo
  alias Ecto.Changeset
  alias Ecto.Multi

  def call(order_data, customer_data, address_data, payment_data, item_data) do
    # Usando Changeset para fazer o casting dos dados de endereço e pagamento a serem inseridos via Ecto.build_assoc
    %Changeset{changes: payment} = Payment.changeset(payment_data)
    %Changeset{changes: address} = Address.changeset(address_data)

    # Transação de gravação dos registros do pedido
    Multi.new()
    |> Multi.insert(:customer, Customer.changeset(customer_data))
    |> Multi.insert(:address, fn %{customer: customer} ->
      Ecto.build_assoc(customer, :address, address)
    end)
    |> Multi.insert(:item, Item.changeset(item_data))
    |> Multi.insert(:order, fn %{item: item} ->
      Order.changeset(order_data, [item])
    end)
    |> Multi.insert(:payment, fn %{customer: customer, order: order} ->
      Ecto.build_assoc(customer, :payments, payment)
      |> struct(order_id: order.id)
    end)
    |> Repo.transaction()
  end
end
