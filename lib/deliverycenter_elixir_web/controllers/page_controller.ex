defmodule DeliverycenterElixirWeb.PageController do
  use DeliverycenterElixirWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
