defmodule Dagurl.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Dagurl.Repo,
      # Start the Telemetry supervisor
      DagurlWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Dagurl.PubSub},
      # Start the Endpoint (http/https)
      DagurlWeb.Endpoint
      # Start a worker by calling: Dagurl.Worker.start_link(arg)
      # {Dagurl.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Dagurl.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DagurlWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
