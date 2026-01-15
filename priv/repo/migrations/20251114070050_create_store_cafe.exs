defmodule PetStore.Repo.Migrations.CreateStoreCafe do
  use Ecto.Migration

  def change do
    create table(:cafe_items) do
      add :item_name, :string
      add :item, :string
      add :menu_type, :string
      add :price, :decimal
      add :hot_only, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:cafe_items, [:item_name], unique: true)
  end
end
