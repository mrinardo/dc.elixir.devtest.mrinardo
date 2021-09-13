defmodule DeliverycenterElixir.ItemTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Item
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when param is valid, returns a changeset for a new record" do
      item_params = build(:item_params)

      response = Item.changeset(item_params)

      assert %Changeset{changes: %{external_id: "IT4801901403"}, valid?: true} = response
    end

    test "when param is invalid, returns an error" do
      item_params = build(:item_failed_params)

      response = Item.changeset(item_params)

      expected_response = %{title: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
