defmodule PetStore.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: PetStore.Repo
  use PetStore.Store.CafeItemFactory
  use PetStore.Store.CafeAddonsFactory
end
