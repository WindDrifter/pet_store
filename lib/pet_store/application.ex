defmodule PetStore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PetStoreWeb.Telemetry,
      PetStore.Repo,
      {DNSCluster, query: Application.get_env(:pet_store, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PetStore.PubSub},
      # Start a worker by calling: PetStore.Worker.start_link(arg)
      # {PetStore.Worker, arg},
      # Start to serve requests, typically the last entry
      PetStoreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PetStore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PetStoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
