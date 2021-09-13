defmodule DeliverycenterElixir.Parser.CalculateExpirationDate do
  def call(create_datetime, expiration_in_minutes) do
    case DateTime.from_iso8601(create_datetime) do
      {:ok, datetime, utc_offset} ->
        datetime
        |> DateTime.add(expiration_in_minutes * 60, :second)
        |> DateTime.to_iso8601(:extended, utc_offset)

      _ ->
        {:error, "Invalid date"}
    end
  end
end
