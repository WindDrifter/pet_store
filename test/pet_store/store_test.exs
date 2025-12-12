defmodule PetStore.StoreTest do
    use PetStore.DataCase, async: true
  alias PetStore.Store
import PetStore.Factory
  setup do
    drink = insert(:drink)
    %{drink: drink}
  end
  test "get_item_by_name returns correct item", %{drink: %{item_name: item_name}} do
    item = Store.get_item_by_name(item_name)
    assert item.item_name == item_name
  end



end
