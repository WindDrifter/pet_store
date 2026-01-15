defmodule PetStore.Store.CafeItem do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias PetStore.Store.CafeItem
  alias PetStore.Repo

  schema "cafe_items" do
    field :item, :string
    field :item_name, :string
    field :menu_type, :string
    # available addons, seperated by commas
    field :price, :decimal
    many_to_many  :cafe_addons, PetStore.Store.CafeAddons, join_through: PetStore.Store.CafeItemAddons
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cafe, attrs) do
    cafe
    |> cast(attrs, [:item, :menu_type, :price, :item_name])
    |> validate_required([:item, :menu_type, :price, :item_name])
    |> unique_constraint(:item_name)
  end

  def get_items_by_type(item_type, limit \\ 0, offset \\ 0) do
    from(c in CafeItem, where: c.menu_type == ^item_type)
    |> Repo.all(limit: limit, offset: offset)
  end

  def get_item_by_name(item_name) do
    from(c in CafeItem, where: c.item_name == ^item_name) |> Repo.one()
  end

  def get_item_by_id(item_id) do
    from(c in CafeItem, where: c.id == ^item_id) |> Repo.one()
  end

  def get_item_addons_by_item_id(item_id) do
    from(c in CafeItem, where: c.id == ^item_id, preload: [:cafe_item_addons]) |> Repo.one()
  end

  def insert_cafe_item(attrs \\ %{}) do
    %CafeItem{}
    |> changeset(attrs)
    |> Repo.insert()
  end
end
