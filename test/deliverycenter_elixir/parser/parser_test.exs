defmodule DeliverycenterElixir.ParserTest do
  use DeliverycenterElixirWeb.ConnCase

  alias DeliverycenterElixir.Parser

  describe "call/1" do
    test "should open, parse json and save data in the database - assert some items" do
      assert {:ok, json} = Parser.call()
      assert json.externalCode != nil
      assert json.customer != nil
      assert json.total >= 0.0
    end

    test "should open and parse json - assert timeToExpire is one hour after creation" do
      assert {:ok, json} = Parser.call()
      assert json.dtOrderCreate == "2019-06-24T16:45:32.000-04:00"
      assert json.timeToExpire == "2019-06-24T17:45:32.000-04:00"
    end
  end
end
