defmodule Recurse do
  def sum([head | tail], total) do
    IO.puts "Total: #{total} Head: #{head} Tail: #{inspect(tail)}"
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple([head|tail]) do
    [head*3 | triple(tail)]
  end

  def triple([]), do: []


end

IO.puts Recurse.sum([1, 2, 3, 4, 5], 0)
IO.puts Recurse.triple([1, 2, 3, 4, 5])
