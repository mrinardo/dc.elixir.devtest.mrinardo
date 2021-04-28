defmodule DeliverycenterElixir.Repo.Migrations.CreateItemTable do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :external_id, :string
      add :title, :string
      add :quantity, :integer
      add :unit_price, :float
      add :full_unit_price, :float
    end
  end
end
