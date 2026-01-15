defmodule PetStore.Store.CafeAddonsFactory do
  # with Ecto
  use ExMachina.Ecto, repo: PetStore.Repo
  alias PetStore.Store.CafeAddons

  defmacro __using__(_opts) do
    quote location: :keep do
      def drink_addon_factory do
        juice = "#{Faker.Fruit.En.fruit()} Bubble"

        %CafeAddons{
          name: "#{juice}",
          price: Decimal.new("3.50"),
          limit_to: "Drink"
        }
      end

      def food_addon_factory do
        juice_addon_name = "#{Faker.Food.En.dish()}"

        %CafeAddons{
          name: "#{juice_addon_name}",
          price: Decimal.new("3.50"),
          limit_to: "Food"
        }
      end

      def not_restriction_addon_factory do
        add_on_name = "#{Faker.Fruit.En.fruit()} Brown Sugar"

        %CafeAddons{
          name: "#{add_on_name}",
          price: Decimal.new("1.00"),
          limit_to: "NONE"
        }
      end
    end
  end
end
