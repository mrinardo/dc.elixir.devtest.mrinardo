defmodule DeliverycenterElixir.Repo.Migrations.CreateCustomerTable do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :external_id, :integer
      add :nickname, :string
      add :email, :string
      add :phone, :string
      add :first_name, :string
      add :last_name, :string
      add :doc_type, :string
      add :doc_number, :string
    end
  end
end
