defmodule Servy.Parser do

  alias Servy.Conv

  def parse(request) do
    # IO.inspect(request, label: "original request")

    [top, params_string] = String.split(request, "\n\n")
    IO.inspect(top, label: "top")
    IO.inspect(params_string, label: "params_string")

    [request_line | header_lines] = String.split(top, "\n")
    IO.inspect(request_line, label: "request_line")
    IO.inspect(header_lines, label: "header_lines")

    [method, path, _] = String.split(request_line, " ")
    IO.inspect(method, label: "method")
    IO.inspect(path, label: "path")

    headers = parse_headers(header_lines, %{})

    params = parse_params(headers["Content-Type"], params_string)

    IO.inspect(params, label: "params")

    %Conv{
       method: method,
       path: path,
       params: params
     }
  end

  def parse_headers([head | tail], headers) do
    [key, value] = String.split(head, ": ")
    headers = Map.put(headers, key, value)
    parse_headers(tail, headers)
  end

  def parse_headers([], headers), do: headers

  @doc """
  Parses the given param string of the form `key1=value1&key2=value2`
  into a map with corresponding keys and values.

  ## Examples
      iex> params_string = "name=Baloo&type=Brown"
      iex> Servy.Parser.parse_params("application/x-www-form-urlencoded", params_string)
      %{"name" => "Baloo", "type" => "Brown"}
      iex> Servy.Parser.parse_params("multipart/form-data", params_string)
      %{}
  """
  def parse_params("application/x-www-form-urlencoded", params_string) do
    params_string |> String.trim |> URI.decode_query
  end

  def parse_params(_, _), do: %{}

end
