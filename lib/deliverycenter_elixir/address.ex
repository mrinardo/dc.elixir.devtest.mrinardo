defmodule DeliverycenterElixir.Address do
  use Ecto.Schema

  import Ecto.Changeset

  @required_params [
    :external_id,
    :address_line,
    :street_name,
    :street_number,
    :comment,
    :zip_code,
    :city,
    :state,
    :country,
    :neighborhood,
    :latitude,
    :longitude,
    :receiver_phone
  ]

  schema "addresses" do
    field :external_id, :integer
    field :address_line, :string
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

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
