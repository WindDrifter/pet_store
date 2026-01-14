defmodule PetStore.Adoptable.Pets do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias PetStore.Adoptable.Pets
  alias PetStore.Repo

  schema "adoptable_pets" do
    field :animal_type, :string
    field :name, :string
    field :gender, :string
    field :nurtered, :boolean, default: false
    field :age, :integer
    field :animal_breed, :string
    field :in_cafe, :boolean, default: false
    field :birth_date, :utc_datetime
    field :ready_to_adopt, :boolean, default: false
    field :description, :string
    field :adopted, :boolean, default: false
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pets, attrs) do
    pets
    |> cast(attrs, [
      :animal_type,
      :name,
      :gender,
      :nurtered,
      :age,
      :animal_breed,
      :in_cafe,
      :ready_to_adopt
    ])
    |> validate_required([
      :animal_type,
      :name,
      :gender,
      :nurtered,
      :age,
      :animal_breed,
      :in_cafe,
      :ready_to_adopt
    ])
  end

  def get_adoptable_pets(limit \\ 10, offset \\ 0) do
    from(p in Pets, where: p.ready_to_adopt == true and p.adopted == false)
    |> Repo.all(limit: limit, offset: offset)
  end

  def get_adoptable_pet_by_animal_type(animal_type, limit \\ 10, offset \\ 0) do
    from(p in Pets,
      where: p.ready_to_adopt == true and p.animal_type == ^animal_type and p.adopted == false
    )
    |> Repo.all(limit: limit, offset: offset)
  end
end
