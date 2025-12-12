defmodule PetStore.Store.Cafe do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  alias PetStore.Store.Cafe
  alias PetStore.Repo
  schema "store_cafe" do
    field :item, :string
    field :item_name, :string

    field :menu_type, :string
    field :add_ons, :string
    field :price, :decimal



    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cafe, attrs) do
    cafe
    |> cast(attrs, [:item, :menu_type, :add_ons, :price, :item_name])
    |> validate_required([:item, :menu_type, :add_ons, :price, :item_name])
    |> unique_constraint(:item_name)
  end

  def get_items_by_type(item_type, limit \\ 0, offset \\ 0) do
    from(c in Cafe, where: c.menu_type == ^item_type) |> Repo.all(limit: limit, offset: offset)
  end

  def get_item_by_name(item_name) do
        from(c in Cafe, where: c.item_name == ^item_name) |> Repo.one()

  end

end
