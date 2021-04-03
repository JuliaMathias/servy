defmodule Servy.Parser do

  alias Servy.Conv

  def parse(request) do
    [method, path, _] =
      request
      |> IO.inspect(label: "original request")
      |> String.split("\n")
      |> IO.inspect(label: "after string split")
      |> List.first
      |> IO.inspect(label: "after selecting first")
      |> String.split(" ")
      |> IO.inspect(label: "after second string split")

      %Conv{
        method: method,
        path: path
      }
  end
end
