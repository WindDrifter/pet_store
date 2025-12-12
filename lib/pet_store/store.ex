defmodule PetStore.Store do
  alias PetStore.Store.Cafe
  @spec get_item_by_name(String.t()) :: Cafe.t() | nil
  def get_item_by_name(item_name) do
    Cafe.get_item_by_name(item_name)
  end
  @spec get_items_by_type(String.t(), non_neg_integer(), non_neg_integer()) :: [Cafe.t()]
  def get_items_by_type(item_name, limit \\ 0, page \\ 0) do
    Cafe.get_items_by_type(item_name, limit, page)
  end



end
