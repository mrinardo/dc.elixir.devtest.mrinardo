defmodule DeliverycenterElixir.Order do
  use Ecto.Schema

  import Ecto.Changeset

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
  end

  def changeset(order, attrs) do
    cast(order, attrs, [
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
    ])
  end
end
