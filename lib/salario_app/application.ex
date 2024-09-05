defmodule SalarioApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SalarioAppWeb.Telemetry,
      SalarioApp.Repo,
      {DNSCluster, query: Application.get_env(:salario_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SalarioApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: SalarioApp.Finch},
      # Start a worker by calling: SalarioApp.Worker.start_link(arg)
      # {SalarioApp.Worker, arg},
      # Start to serve requests, typically the last entry
      SalarioAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: SalarioApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SalarioAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
