defmodule P2testing.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: P2testing.Worker.start_link(arg)
      {P2Testing.CNT, [:ok]},
      {P2Testing.Hub, [:ok]},
      #      {P2Testing.Cog, :cog0}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: P2testing.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
