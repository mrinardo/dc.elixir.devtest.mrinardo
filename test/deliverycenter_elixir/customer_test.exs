defmodule DeliverycenterElixir.CustomerTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Customer
  alias Ecto.Changeset

  describe "changeset/2" do
    test "when param is valid, returns a changeset for a new record" do
      customer_params = build(:customer_params)

      response = Customer.changeset(customer_params)

      assert %Changeset{changes: %{external_id: 136_226_073}, valid?: true} = response
    end

    test "when param is invalid, returns an error" do
      customer_params = build(:customer_failed_params)

      response = Customer.changeset(customer_params)

      expected_response = %{doc_number: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
