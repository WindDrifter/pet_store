defmodule PetStore.Store.Cafe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "store_cafe" do
    field :item, :string
    field :menu_type, :string
    field :add_ons, :string
    field :price, :decimal

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(cafe, attrs) do
    cafe
    |> cast(attrs, [:item, :menu_type, :add_ons, :price])
    |> validate_required([:item, :menu_type, :add_ons, :price])
  end
end
