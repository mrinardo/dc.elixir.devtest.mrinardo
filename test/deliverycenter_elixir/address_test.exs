defmodule DeliverycenterElixir.AddressTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Address
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when param is valid, returns a changeset for a new record" do
      address_params = build(:address_params)

      response = Address.changeset(address_params)

      assert %Changeset{changes: %{external_id: 1_051_695_306}, valid?: true} = response
    end

    test "when param is invalid, returns an error" do
      address_params = build(:address_failed_params)

      response = Address.changeset(address_params)

      expected_response = %{address_line: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
