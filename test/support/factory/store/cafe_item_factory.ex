defmodule PetStore.Store.CafeItemFactory do
  # with Ecto
  use ExMachina.Ecto, repo: PetStore.Repo
  alias PetStore.Store.CafeItem

  defmacro __using__(_opts) do
    quote location: :keep do
      def drink_factory do
        juice = "#{Faker.Fruit.En.fruit()} Juice"

        %CafeItem{
          item: "#{juice}",
          item_name: "#{Faker.Cat.breed()} #{juice}",
          menu_type: "Drink",
          price: Decimal.new("3.50")
        }
      end

      def food_factory do
        juice = "#{Faker.Food.En.dish()}"

        %CafeItem{
          item: "#{juice}",
          item_name: "#{Faker.Cat.breed()} #{juice}",
          menu_type: "Food",
          price: Decimal.new("3.50")
        }
      end
    end
  end
end
