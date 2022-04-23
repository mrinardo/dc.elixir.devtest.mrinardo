defmodule DeliverycenterElixirWeb.ParserController do
  use DeliverycenterElixirWeb, :controller

  alias DeliverycenterElixirWeb.FallbackController

  action_fallback FallbackController

  def parse(conn, _params) do
    with {:ok, parsed} <- DeliverycenterElixir.Parser.call() do
      conn
      |> put_status(:ok)
      |> json(parsed)
    end
  end
end
