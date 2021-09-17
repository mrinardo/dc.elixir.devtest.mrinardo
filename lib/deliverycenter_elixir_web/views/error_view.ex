defmodule DeliverycenterElixirWeb.ErrorView do
  use DeliverycenterElixirWeb, :view

  import Ecto.Changeset, only: [traverse_errors: 2]

  alias Ecto.Changeset

  # If you want to customize a particular status code
  # for a certain format, you may uncomment below.
  # def render("500.html", _assigns) do
  #   "Internal Server Error"
  # end

  # By default, Phoenix returns the status message from
  # the template name. For example, "404.html" becomes
  # "Not Found".
  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end

  def render("error.json", %{result: %Changeset{} = changeset}) do
    %{error: translate_errors(changeset)}
  end

  def render("error.json", %{result: %Jason.DecodeError{position: position, token: token}}) do
    %{error: %{message: "Invalid JSON", position: position, token: token}}
  end

  def render("error.json", %{result: result}) do
    %{error: result}
  end

  defp translate_errors(changeset) do
    traverse_errors(changeset, fn {msg, opts} ->
      Enum.reduce(opts, msg, fn {key, value}, acc ->
        String.replace(acc, "%{#{key}}", translate_value(value))
      end)
    end)
  end

  # Trata erro com Ecto.Enum
  defp translate_value({:parameterized, Ecto.Enum, _map}), do: ""
  defp translate_value(value), do: to_string(value)
end
