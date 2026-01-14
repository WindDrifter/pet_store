defmodule PetStore.Store.CafeAddons do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  alias PetStore.Store.CafeAddons
  alias PetStore.Repo

  schema "cafe_addons" do
    field :name, :string
    field :price, :decimal
    field :limit_to, :string
    many_to_many :cafe_items, PetStore.Store.CafeItem, join_through: PetStore.Store.CafeItemAddons
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cafe_addons, attrs) do
    cafe_addons
    |> cast(attrs, [:name, :price, :limit_to])
    |> validate_required([:name, :price, :limit_to])
  end

  def get_addons_by_id(addon_id) do
    from(c in CafeAddons, where: c.id == ^addon_id) |> Repo.one()
  end
end
