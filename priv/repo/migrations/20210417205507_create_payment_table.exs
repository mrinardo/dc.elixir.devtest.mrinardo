defmodule DeliverycenterElixir.Repo.Migrations.CreatePaymentTable do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :external_id, :integer
      add :order_id, references(:orders)
      add :payer_id, references(:customers)
      add :installments, :integer
      add :payment_type, :string
      add :status, :string
      add :transaction_amount, :float
      add :taxes_amount, :float
      add :shipping_cost, :float
      add :total_paid_amount, :float
      add :installment_amount, :float
      add :date_approved, :utc_datetime
      add :date_created, :utc_datetime
    end
  end
end
