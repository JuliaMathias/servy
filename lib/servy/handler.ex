defmodule Servy.Handler do

  @moduledoc """
  This module handles Servy
  """

  request = """
  GET /wildthings HTTP/1.1
  Host: example.com
  User-Agent: ExampleBrowser/1.0
  Accept: */*

  """

  expected_response = """
  HTTP/1.1 200 OK
  Content-Type: text/html
  Content-Length: 20

  Bears, Lions, Tigers
  """
end
