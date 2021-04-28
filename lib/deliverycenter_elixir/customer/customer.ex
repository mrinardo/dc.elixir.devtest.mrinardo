defmodule DeliverycenterElixir.Customer do
  use Ecto.Schema

  import Ecto.Changeset

  schema "customers" do
    field :external_id, :integer
    field :nickname, :string
    field :email, :string
    field :phone, :string
    field :first_name, :string
    field :last_name, :string
    field :doc_type, :string
    field :doc_number, :string
  end

  def changeset(order, attrs) do
    cast(order, attrs, [
      :external_id,
      :nickname,
      :email,
      :phone,
      :first_name,
      :last_name,
      :doc_type,
      :doc_number,
    ])
  end
end
