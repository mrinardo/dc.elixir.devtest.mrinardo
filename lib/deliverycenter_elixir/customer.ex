defmodule DeliverycenterElixir.Customer do
  use Ecto.Schema

  import Ecto.Changeset

  alias DeliverycenterElixir.Address
  alias DeliverycenterElixir.Payment

  @required_params [
    :external_id,
    :nickname,
    :email,
    :phone,
    :first_name,
    :last_name,
    :doc_type,
    :doc_number
  ]

  schema "customers" do
    field :external_id, :integer
    field :nickname, :string
    field :email, :string
    field :phone, :string
    field :first_name, :string
    field :last_name, :string
    field :doc_type, :string
    field :doc_number, :string

    has_one :address, Address
    has_many :payments, Payment, foreign_key: :payer_id
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
