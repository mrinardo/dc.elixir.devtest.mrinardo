defmodule DeliverycenterElixir.Repo do
  use Ecto.Repo,
    otp_app: :deliverycenter_elixir,
    adapter: Ecto.Adapters.Postgres
end
