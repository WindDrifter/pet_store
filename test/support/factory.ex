defmodule PetStore.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: PetStore.Repo
  use PetStore.Store.CafeFactory
end
