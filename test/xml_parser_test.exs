defmodule ScosNoaaAdapter.XmlParserTest do
  use ExUnit.Case
  doctest ScosNoaaAdapter

  test "parses a noaa weather xml" do
    xml = File.read!("test/test.xml")

    expected_map = %{
      pressure_in: "30.15",
      weather: "Fair",
      dewpoint_string: "48.0 F (8.9 C)",
      temp_c: "17.8",
      wind_dir: "West",
      wind_mph: "12.7",
      observation_time: "Last Updated on Jun 14 2019, 9:53 am EDT",
      location: "Columbus, Ohio State University Airport, OH",
      temp_f: "64.0",
      dewpoint_c: "8.9",
      pressure_string: "1020.7 mb",
      dewpoint_f: "48.0",
      suggested_pickup_period: "60",
      latitude: "40.07806",
      longitude: "-83.07806",
      wind_degrees: "260",
      observation_time_rfc822: "Fri, 14 Jun 2019 09:53:00 -0400",
      credit: "NOAA\'s National Weather Service",
      temperature_string: "64.0 F (17.8 C)",
      relative_humidity: "56",
      suggested_pickup: "15 minutes after the hour",
      station_id: "KOSU",
      visibility_mi: "10.00",
      wind_kt: "11",
      wind_string: "West at 12.7 MPH (11 KT)",
      pressure_mb: "1020.7"
    }

    actual_map = ScosNoaaAdapter.XmlParser.parse(xml, "current_observation")

    assert actual_map == expected_map
  end
end
