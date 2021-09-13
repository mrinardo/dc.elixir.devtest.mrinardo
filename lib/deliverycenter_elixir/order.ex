defmodule DeliverycenterElixir.Order do
  use Ecto.Schema

  import Ecto.Changeset

  alias DeliverycenterElixir.Item
  alias DeliverycenterElixir.Payment

  @required_params [
    :external_id,
    :store_id,
    :date_created,
    :date_closed,
    :last_updated,
    :total_amount,
    :total_shipping,
    :total_amount_with_shipping,
    :paid_amount,
    :expiration_date
  ]

  schema "orders" do
    field :external_id, :integer
    field :store_id, :integer
    field :date_created, :utc_datetime
    field :date_closed, :utc_datetime
    field :last_updated, :utc_datetime
    field :total_amount, :float
    field :total_shipping, :float
    field :total_amount_with_shipping, :float
    field :paid_amount, :float
    field :expiration_date, :utc_datetime

    many_to_many :items, Item, join_through: "order_items"
    has_many :payments, Payment
  end

  def changeset(struct \\ %__MODULE__{}, attrs, items) do
    struct
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
    |> put_assoc(:items, items)
  end
end
