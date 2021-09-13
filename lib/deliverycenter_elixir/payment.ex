defmodule DeliverycenterElixir.Payment do
  use Ecto.Schema

  import Ecto.Changeset

  alias DeliverycenterElixir.Customer
  alias DeliverycenterElixir.Order

  @required_params [
    :external_id,
    :installments,
    :payment_type,
    :status,
    :transaction_amount,
    :taxes_amount,
    :shipping_cost,
    :total_paid_amount,
    :installment_amount,
    :date_approved,
    :date_created
  ]

  schema "payments" do
    field :external_id, :integer
    field :installments, :integer
    field :payment_type, :string
    field :status, :string
    field :transaction_amount, :float
    field :taxes_amount, :float
    field :shipping_cost, :float
    field :total_paid_amount, :float
    field :installment_amount, :float
    field :date_approved, :utc_datetime
    field :date_created, :utc_datetime

    belongs_to :order, Order
    belongs_to :payer, Customer
  end

  def changeset(struct \\ %__MODULE__{}, attrs) do
    struct
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end
