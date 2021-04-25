defmodule HttpServerTest do
  use ExUnit.Case

  alias Servy.HttpServer

  test "accepts a request on a socket and sends back a response" do
    spawn(HttpServer, :start, [4000])

    urls = [
      "http://localhost:4000/wildthings",
      "http://localhost:4000/sensors",
      "http://localhost:4000/kaboom",
      "http://localhost:4000/hibernate",
      "http://localhost:4000/api/bears",
      "http://localhost:4000/about"
    ]

    urls
    |> Enum.map(fn _ -> Task.async(fn -> HTTPoison.get(&1) end) end)
    |> Enum.map(&Task.await/1)
    |> Enum.map(&assert_successful_response/1)
  end

  defp assert_successful_response({:ok, response}) do
    assert response.status_code == 200
    assert response.body == "Bears, Lions, Tigers"
  end
end
