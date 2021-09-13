defmodule DeliverycenterElixir.OrderTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Order
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when param is valid, returns a changeset for a new record" do
      order_params = build(:order_params)
      item_params = %{}

      response = Order.changeset(order_params, [item_params])

      assert %Changeset{changes: %{external_id: 9_987_071}, valid?: true} = response
    end

    test "when param is invalid, returns an error" do
      order_params = build(:order_failed_params)
      item_params = %{}

      response = Order.changeset(order_params, [item_params])

      expected_response = %{expiration_date: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
