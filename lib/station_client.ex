defmodule ScosNoaaAdapter.StationClient do
  use Tesla

  plug Tesla.Middleware.BaseUrl, "https://w1.weather.gov/xml/current_obs"
  plug Tesla.Middleware.Headers, [{"User-Agent", "scos adapter"}]
  plug Tesla.Middleware.JSON

  @spec get_weather(binary) :: {:error, any} | {:ok, Tesla.Env.t()}
  def get_weather(station) do
    IO.puts("https://w1.weather.gov/xml/current_obs/" <> station <> ".xml")
    get("/" <> station <> ".xml")
  end
end
