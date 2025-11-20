defmodule PetStore.Adoptable.Pets do
  use Ecto.Schema
  import Ecto.Changeset

  schema "adoptable_pets" do
    field :animal_type, :string
    field :name, :string
    field :gender, :string
    field :nurtered, :boolean, default: false
    field :age, :integer
    field :animal_breed, :string
    field :in_cafe, :boolean, default: false
    field :ready_to_adopt, :boolean, default: false

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(pets, attrs) do
    pets
    |> cast(attrs, [:animal_type, :name, :gender, :nurtered, :age, :animal_breed, :in_cafe, :ready_to_adopt])
    |> validate_required([:animal_type, :name, :gender, :nurtered, :age, :animal_breed, :in_cafe, :ready_to_adopt])
  end
end
