defmodule Coreproject.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CoreprojectWeb.Telemetry,
      # Start the Ecto repository
      Coreproject.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Coreproject.PubSub},
      # Start Finch
      {Finch, name: Coreproject.Finch},
      # Start the Endpoint (http/https)
      CoreprojectWeb.Endpoint
      # Start a worker by calling: Coreproject.Worker.start_link(arg)
      # {Coreproject.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Coreproject.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CoreprojectWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
