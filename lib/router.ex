defmodule ScosNoaaAdapter.Router do
  use Plug.Router
  use Plug.Debugger
  require Logger
  plug(Plug.Logger, log: :debug)

  alias ScosNoaaAdapter.StationClient
  alias ScosNoaaAdapter.XmlParser

  plug(:match)

  plug(:dispatch)

  get "/:station" do
    {:ok, response} = StationClient.get_weather(station)

    weather =
      response.body
      |> IO.inspect()
      |> XmlParser.parse("current_observation")

    send_resp(conn, 200, Jason.encode!(weather))
  end

  match _ do
    send_resp(conn, 404, "not found")
  end
end
