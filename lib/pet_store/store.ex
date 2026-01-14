defmodule PetStore.Store do
  alias PetStore.Store.{CafeItem, CafeAddons}
  @spec get_item_by_name(String.t()) :: CafeItem.t() | nil
  def get_item_by_name(item_name) do
    CafeItem.get_item_by_name(item_name)
  end

  @spec get_items_by_type(String.t(), non_neg_integer(), non_neg_integer()) :: [CafeItem.t()]
  def get_items_by_type(item_type, limit \\ 0, page \\ 0) do
    CafeItem.get_items_by_type(item_type, limit, page)
  end
  @spec get_item_by_id(non_neg_integer()) :: CafeItem.t() | nil
  def get_item_by_id(item_id) do
    CafeItem.get_item_by_id(item_id)
  end
  @spec get_addons_by_id(non_neg_integer()) :: CafeAddons.t() | nil
  def get_addons_by_id(addon_id) do
    PetStore.Store.CafeAddons.get_addons_by_id(addon_id)
  end

  @spec get_item_addons_by_item_id(non_neg_integer()) :: CafeItem.t() | nil
  def get_item_addons_by_item_id(item_id) do
    CafeItem.get_item_addons_by_item_id(item_id)
  end

  @spec save_cafe_item(map()) :: {:ok, CafeItem.t()} | {:error, Ecto.Changeset.t()}
  def save_cafe_item(attrs \\ %{}) do
    CafeItem.insert_cafe_item(attrs)
  end

  @spec save_cafe_addon(map()) :: {:ok, CafeAddons.t()} | {:error, Ecto.Changeset.t()}
  def save_cafe_addon(attrs \\ %{}) do
    CafeAddons.changeset(%CafeAddons{}, attrs) |> PetStore.Repo.insert()
  end

  @spec link_addons_to_item(map()) :: {:ok, CafeItemAddons.t()} | {:error, Ecto.Changeset.t()}
  def link_addons_to_item(%{cafe_item_id: _, cafe_addons_id: _} = attrs) do
    with %{limit_to: limit_to} <- get_addons_by_id(attrs[:cafe_addons_id]),
         %{menu_type: menu_type} <- get_item_by_id(attrs[:cafe_item_id]) do
      if limit_to != menu_type && limit_to != "NONE" do
        {:error, "Addon type #{limit_to} does not match item type #{menu_type}"}
      else
        PetStore.Store.CafeItemAddons.insert_cafe_item_addons(attrs)
      end
    end
  end
end
