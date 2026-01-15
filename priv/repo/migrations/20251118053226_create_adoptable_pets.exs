defmodule PetStore.Repo.Migrations.CreateAdoptablePets do
  use Ecto.Migration

  def change do
    create table(:adoptable_pets) do
      add :animal_type, :text
      add :name, :text
      add :gender, :text
      add :nurtered, :boolean, default: false, null: false
      add :age, :integer, default: 0, null: false
      add :birth_date, :utc_datetime
      add :animal_breed, :text
      add :in_cafe, :boolean, default: false, null: false
      add :ready_to_adopt, :boolean, default: false, null: false
      add :description, :text
      add :adopted, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:adoptable_pets, [:name, :birth_date, :animal_type], unique: true)
    create index(:adoptable_pets, [:animal_type])
    create index(:adoptable_pets, [:name])
  end
end
