defmodule PetStore.Repo.Migrations.CreateCafeAddons do
  use Ecto.Migration

  def change do
    create table(:cafe_addons) do
      add :name, :string
      add :price, :decimal
      add :limit_to, :string

      timestamps(type: :utc_datetime)
    end

    create index(:cafe_addons, [:name], unique: true)

    create table(:cafe_item_addons) do
      add :cafe_item_id, :integer, references: :cafe_items, on_delete: :delete_all
      add :cafe_addons_id, :integer, references: :cafe_addons, on_delete: :delete_all

      timestamps(type: :utc_datetime)
    end

    create index(:cafe_item_addons, [:cafe_item_id, :cafe_addons_id], unique: true)
  end
end
