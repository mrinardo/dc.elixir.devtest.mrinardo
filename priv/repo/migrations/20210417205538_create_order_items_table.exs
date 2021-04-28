defmodule DeliverycenterElixir.Repo.Migrations.CreateOrderItensTable do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :item_id, references(:items)
      add :order_id, references(:orders)
    end
  end
end
