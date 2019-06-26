defmodule ScosNoaaAdapter.XmlParser do
  import SweetXml

  def parse(xml, parent_element) do
    xml
    |> xpath(~x"//#{parent_element}"e)
    |> extract_children()
    |> Enum.reject(&is_tuple/1)
    |> List.flatten()
    |> Enum.filter(fn {key, _value} -> useful_key?(key) end)
    |> Enum.into(%{})
  end

  defp extract_children({:xmlElement, _, _, _, {_, _, _}, _, _, _, children, _, _, _}) do
    children
    |> Enum.map(&extract_children/1)
  end

  defp extract_children({:xmlText, path, _, _, value, _}) do
    element = path |> hd() |> elem(0)
    {element, List.to_string(value)}
  end

  defp useful_key?(key) do
    key in [
      :pressure_in,
      :weather,
      :dewpoint_string,
      :temp_c,
      :wind_dir,
      :wind_mph,
      :observation_time,
      :location,
      :temp_f,
      :dewpoint_c,
      :pressure_string,
      :dewpoint_f,
      :suggested_pickup_period,
      :latitude,
      :longitude,
      :wind_degrees,
      :observation_time_rfc822,
      :credit,
      :temperature_string,
      :relative_humidity,
      :suggested_pickup,
      :station_id,
      :visibility_mi,
      :wind_kt,
      :wind_string,
      :pressure_mb
    ]
  end
end
