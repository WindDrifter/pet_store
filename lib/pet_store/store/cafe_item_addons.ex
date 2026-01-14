defmodule PetStore.Store.CafeItemAddons do
  use Ecto.Schema
  import Ecto.Changeset
  alias PetStore.Store.CafeItemAddons
  alias PetStore.Repo

  schema "cafe_item_addons" do
    belongs_to :cafe_item, PetStore.Store.CafeItem
    belongs_to :cafe_addons, PetStore.Store.CafeAddons

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cafe_item_addons, attrs) do
    cafe_item_addons
    |> cast(attrs, [:cafe_item_id, :cafe_addons_id])
    |> validate_required([:cafe_item_id, :cafe_addons_id])
  end

  def insert_cafe_item_addons(attrs \\ %{}) do
    %CafeItemAddons{}
    |> changeset(attrs)
    |> Repo.insert()
  end
end
