defmodule PetStore.Store.CafeFactory do
  # with Ecto
  use ExMachina.Ecto, repo: PetStore.Repo
  alias PetStore.Store.Cafe

  defmacro __using__(_opts) do
    quote location: :keep do
     def drink_factory do
        juice = "#{Faker.Fruit.En.fruit()} Juice"
        %Cafe{
          item: "#{juice}",
          item_name: "#{Faker.Cat.breed()} #{juice}",
          menu_type: "Drink",
          add_ons: "Ice, Sugar, bubble, hot, cold",
          price: Decimal.new("3.50")
        }
      end

      def food_factory do
        juice = "#{Faker.Food.En.dish()}"
        %Cafe{
          item: "#{juice}",
          item_name: "#{Faker.Cat.breed()} #{juice}",
          menu_type: "Food",
          add_ons: "Meal, Spicy, Soup, Salad",
          price: Decimal.new("3.50")
        }
      end
    end
  end

end
