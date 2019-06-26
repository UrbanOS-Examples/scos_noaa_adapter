defmodule ScosNoaaAdapter.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children =
      [
        Plug.Adapters.Cowboy.child_spec(scheme: :http, plug: ScosNoaaAdapter.Router, options: [port: 8085])
      ]
      |> List.flatten()

    opts = [strategy: :one_for_one, name: ScosNoaaAdapter.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
