defmodule PetStoreWeb.PageController do
  use PetStoreWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
