defmodule Servy.Parser do

  alias Servy.Conv

  def parse(request) do
    IO.inspect(label: "original request")

    [top, params_string] = String.split(request, "\n\n")
    IO.inspect(top, label: "top")
    IO.inspect(params_string, label: "params_string")

    [request_line | header_lines] = String.split(top, "\n")
    IO.inspect(request_line, label: "request_line")
    IO.inspect(header_lines, label: "header_lines")

    [method, path, _] = String.split(request_line, " ")
    IO.inspect(method, label: "method")
    IO.inspect(path, label: "path")

    params = parse_params(params_string)

    IO.inspect(params, label: "params")

    %Conv{
       method: method,
       path: path,
       params: params
     }
  end

  def parse_params(params_string) do
    params_string |> String.trim |> URI.decode_query
  end

end
