defmodule DeliverycenterElixir.Parser.CalculateExpirationDate do
  def call(nil, _expiration_in_minutes), do: {:error, "Invalid create date"}

  def call(create_datetime, expiration_in_minutes) do
    case DateTime.from_iso8601(create_datetime) do
      {:ok, datetime, utc_offset} ->
        result =
          datetime
          |> DateTime.add((expiration_in_minutes || 0) * 60, :second)
          |> DateTime.to_iso8601(:extended, utc_offset)

        {:ok, result}

      _ ->
        {:error, "Invalid create date"}
    end
  end
end
