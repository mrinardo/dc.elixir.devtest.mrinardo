defmodule DeliverycenterElixir.PaymentTest do
  use DeliverycenterElixir.DataCase, async: true

  import DeliverycenterElixir.Factory

  alias DeliverycenterElixir.Payment
  alias Ecto.Changeset

  describe "changeset/1" do
    test "when param is valid, returns a changeset for a new record" do
      payment_params = build(:payment_params)

      response = Payment.changeset(payment_params)

      assert %Changeset{changes: %{external_id: 12_312_313}, valid?: true} = response
    end

    test "when param is invalid, returns an error" do
      payment_params = build(:payment_failed_params)

      response = Payment.changeset(payment_params)

      expected_response = %{payment_type: ["can't be blank"]}

      assert errors_on(response) == expected_response
    end
  end
end
