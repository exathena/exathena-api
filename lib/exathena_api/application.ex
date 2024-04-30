defmodule ExAthenaApi.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ExAthenaApi.CharRepo,
      ExAthenaApi.LoginRepo,
      ExAthenaApi.MapRepo,
      {Phoenix.PubSub, name: ExAthenaApi.PubSub},
      ExAthenaApiWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: ExAthenaApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    ExAthenaApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
