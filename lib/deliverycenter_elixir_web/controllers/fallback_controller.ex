defmodule DeliverycenterElixirWeb.FallbackController do
  use DeliverycenterElixirWeb, :controller

  # alias Rockelivery.Error
  alias DeliverycenterElixirWeb.ErrorView

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("error.json", result: result)
  end
end
