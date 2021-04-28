defmodule DeliverycenterElixir.ParserTest do
  use DeliverycenterElixirWeb.ConnCase

  alias DeliverycenterElixir.Parser

  test "call/0 - should open and parse json - assert some items" do
    assert json = Parser.call()
    assert json.externalCode != nil
    assert json.customer != nil
    assert json.total >= 0.0
  end

  test "call/0 - should open and parse json - assert timeToExpire is one hour after creation" do
    assert json = Parser.call()
    assert json.dtOrderCreate == "2019-06-24T16:45:32.000-04:00"
    assert json.timeToExpire == "2019-06-24T17:45:32.000-04:00"
  end
end
