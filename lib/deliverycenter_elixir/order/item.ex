defmodule DeliverycenterElixir.Item do
  use Ecto.Schema

  import Ecto.Changeset

  schema "items" do
    field :external_id, :string
    field :title, :string
    field :quantity, :integer
    field :unit_price, :float
    field :full_unit_price, :float
  end

  def changeset(order, attrs) do
    cast(order, attrs, [
      :external_id,
      :title,
      :quantity,
      :unit_price,
      :full_unit_price
    ])
  end
end
