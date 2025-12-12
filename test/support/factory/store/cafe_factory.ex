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
          item_name: "Maow Maow #{juice}",
          menu_type: "Drink",
          add_ons: "Ice, Sugar",
          price: Decimal.new("3.50")
        }

      end
    end
  end

end
