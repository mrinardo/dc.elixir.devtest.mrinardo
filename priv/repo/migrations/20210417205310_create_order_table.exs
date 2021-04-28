defmodule DeliverycenterElixir.Repo.Migrations.CreateOrderTable do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :external_id, :integer
      add :store_id, :integer
      add :date_created, :utc_datetime
      add :date_closed, :utc_datetime
      add :last_updated, :utc_datetime
      add :total_amount, :float
      add :total_shipping, :float
      add :total_amount_with_shipping, :float
      add :paid_amount, :float
      add :expiration_date, :utc_datetime
    end
  end
end
