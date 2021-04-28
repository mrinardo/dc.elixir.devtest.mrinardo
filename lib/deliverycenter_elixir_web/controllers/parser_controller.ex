defmodule DeliverycenterElixirWeb.ParserController do
  use DeliverycenterElixirWeb, :controller

  def parse(conn, _params) do
    parsed = DeliverycenterElixir.Parser.call()
    conn
    |> put_status(:ok)
    |> json(parsed)
  end
end
