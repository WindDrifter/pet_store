defmodule PetStore.StoreTest do
  use PetStore.DataCase, async: true
  alias PetStore.Store
  import PetStore.Factory

  describe "cafe items" do
    setup do
      drink = insert(:drink)
      food = insert(:food)
      drink2 = insert(:drink)
      food_parameter = build(:food)
      %{drink: drink, food: food, drink2: drink2, food_parameter: food_parameter}
    end

    test "get_item_by_name returns correct item", %{drink: %{item_name: item_name}} do
      item = Store.get_item_by_name(item_name)
      assert item.item_name == item_name
    end

    test "get_item_by_name returns correct types", %{drink: %{menu_type: menu_type}} do
      items = Store.get_items_by_type(menu_type)
      assert length(items) == 2
    end

    test "able to insert item", %{food_parameter: food_parameter} do
      {:ok, item} = Store.save_cafe_item(Map.from_struct(food_parameter))
      assert item.item_name == food_parameter.item_name
    end
  end

  describe "cafe addons" do
    setup do
      drink_addon = insert(:drink_addon)
      food_addon = insert(:food_addon)
      no_restriction_addon = insert(:not_restriction_addon)
      add_on_parameter = build(:drink_addon)

      %{
        drink_addon: drink_addon,
        food_addon: food_addon,
        no_restriction_addon: no_restriction_addon,
        add_on_parameter: add_on_parameter
      }
    end

    test "able to insert addon ", %{add_on_parameter: add_on_parameter} do
      {:ok, addon} = Store.save_cafe_addon(Map.from_struct(add_on_parameter))
      assert addon.name == add_on_parameter.name
    end
  end

  describe "cafe item addons" do
    setup do
      drink = insert(:drink)
      food = insert(:food)
      drink_addon = insert(:drink_addon)
      food_addon = insert(:food_addon)
      no_restriction_addon = insert(:not_restriction_addon)

      %{
        drink: drink,
        food: food,
        drink_addon: drink_addon,
        food_addon: food_addon,
        no_restriction_addon: no_restriction_addon
      }
    end

    test "able to link matching addon to item", %{drink: drink, drink_addon: drink_addon} do
      {:ok, _link} = Store.link_addons_to_item(%{cafe_item_id: drink.id, cafe_addons_id: drink_addon.id})
    end

    test "unable to link non-matching addon to item", %{drink: drink, food_addon: food_addon} do
      {:error, _reason} =
        Store.link_addons_to_item(%{cafe_item_id: drink.id, cafe_addons_id: food_addon.id})
    end

    test "able to link non-restriction addon to any item", %{
      food: food,
      no_restriction_addon: no_restriction_addon
    } do
      {:ok, _link} =
        Store.link_addons_to_item(%{cafe_item_id: food.id, cafe_addons_id: no_restriction_addon.id})
    end
  end
end
