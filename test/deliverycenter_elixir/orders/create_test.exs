defmodule DeliverycenterElixir.Order.CreateTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Orders.Create
  alias Ecto.Changeset

  describe "call/0" do
    test "when params are valid, create record in the order and all related tables" do
      order_params = build(:order_params)
      customer_params = build(:customer_params)
      address_params = build(:address_params)
      payment_params = build(:payment_params)
      item_params = build(:item_params)

      response =
        Create.call(order_params, customer_params, address_params, payment_params, item_params)

      assert {:ok,
              %{
                address: _address,
                customer: _customer,
                payment: _payment,
                item: _item,
                order: _order
              }} = response
    end

    test "when there are invalid params, rolls back the transaction and returns an error" do
      order_params = build(:order_failed_params)
      customer_params = build(:customer_params)
      address_params = build(:address_params)
      payment_params = build(:payment_params)
      item_params = build(:item_params)

      response =
        Create.call(order_params, customer_params, address_params, payment_params, item_params)

      expected_response = %{expiration_date: ["can't be blank"]}

      assert {:error, :order, %Changeset{} = changeset, %{}} = response
      assert errors_on(changeset) == expected_response
    end
  end
end
