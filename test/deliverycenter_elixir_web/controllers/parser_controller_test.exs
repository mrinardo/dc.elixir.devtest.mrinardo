defmodule DeliverycenterElixirWeb.ParserControllerTest do
  use DeliverycenterElixirWeb.ConnCase

  test "GET /parser", %{conn: conn} do
    conn = get(conn, "/parser")
    response = json_response(conn, 200)
    assert response["externalCode"] == 9_987_071
  end
end
