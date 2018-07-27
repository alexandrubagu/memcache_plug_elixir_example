defmodule PlugMemcacheExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [{
      Plug.Adapters.Cowboy,
      scheme: :http,
      plug: PlugMemcacheExample.Web,
      options: [port: 8080, max_connections: :infinity]
    },
    {
      Server, []
    }]

    opts = [strategy: :one_for_one, name: PlugMemcacheExample.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
