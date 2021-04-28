defmodule DeliverycenterElixir.Repo.Migrations.CreateAddressTable do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :external_id, :integer
      add :customer_id, references(:customers)
      add :address_line, :string
      add :street_name, :string
      add :street_number, :string
      add :comment, :string
      add :zip_code, :string
      add :city, :string
      add :state, :string
      add :country, :string
      add :neighborhood, :string
      add :latitude, :float
      add :longitude, :float
      add :receiver_phone, :float
    end
  end
end
