defmodule DeliverycenterElixir.Address do
  use Ecto.Schema

  import Ecto.Changeset

  schema "addresses" do
    field :external_id, :integer
    field :fieldress_line, :string
    field :street_name, :string
    field :street_number, :string
    field :comment, :string
    field :zip_code, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :neighborhood, :string
    field :latitude, :float
    field :longitude, :float
    field :receiver_phone, :float

    belongs_to :customer, DeliverycenterElixir.Customer
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
