defmodule DeliverycenterElixir.Item do
  use Ecto.Schema

  import Ecto.Changeset

  alias DeliverycenterElixir.Order

  @required_params [
    :external_id,
    :title,
    :quantity,
    :unit_price,
    :full_unit_price
  ]

  schema "items" do
    field :external_id, :string
    field :title, :string
    field :quantity, :integer
    field :unit_price, :float
    field :full_unit_price, :float

    many_to_many :orders, Order, join_through: "order_items"
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
