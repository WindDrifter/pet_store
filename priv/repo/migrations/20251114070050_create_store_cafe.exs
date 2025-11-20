defmodule PetStore.Repo.Migrations.CreateStoreCafe do
  use Ecto.Migration

  def change do
    create table(:store_cafe) do
      add :item_name, :string
      add :item, :string
      add :menu_type, :string
      add :add_ons, :string
      add :price, :decimal

      timestamps(type: :utc_datetime)
    end
    create index(:store_cafe, [:item_name], unique: true)
  end
end
