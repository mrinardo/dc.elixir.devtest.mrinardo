defmodule DeliverycenterElixir.Parser.CalculateExpirationDateTest do
  use ExUnit.Case

  alias DeliverycenterElixir.Parser.CalculateExpirationDate

  describe "call/2" do
    test "when there are a valid datetime and expiration minutes, returns an expiration date" do
      date = "2019-06-24T16:45:32.000-04:00"

      response = CalculateExpirationDate.call(date, 60)

      expected_response = {:ok, "2019-06-24T17:45:32.000-04:00"}

      assert expected_response == response
    end

    test "when there is an invalid datetime, returns an error" do
      date = "2019-06-24"

      response = CalculateExpirationDate.call(date, 60)

      expected_response = {:error, "Invalid create date"}

      assert expected_response == response
    end
  end
end
