defmodule PetStore.StoreTest do
    use PetStore.DataCase, async: true
  alias PetStore.Store
import PetStore.Factory
  setup do
    drink = insert(:drink)
    food = insert(:food)
    drink2 = insert(:drink)

    %{drink: drink, food: food, drink2: drink2}
  end
  test "get_item_by_name returns correct item", %{drink: %{item_name: item_name}} do
    item = Store.get_item_by_name(item_name)
    assert item.item_name == item_name
  end

  test "get_item_by_name returns correct types", %{drink: %{menu_type: menu_type}} do
    items = Store.get_items_by_type(menu_type)
    assert length(items) == 2
  end

end
