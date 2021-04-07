defmodule Recurse do
  def sum([head | tail], total) do
    IO.puts "Total: #{total} Head: #{head} Tail: #{inspect(tail)}"
    sum(tail, total + head)
  end

  def sum([], total), do: total

  def triple(list) do
    IO.puts "Normal function | #{inspect(list)}"
    triple(list, [])
  end

  defp triple([head|tail], current_list) do
    IO.puts "Private funtion| Head: #{head} Tail: #{inspect(tail)} Current list: #{inspect(current_list)}"
    triple(tail, [head*3 | current_list])
  end

  defp triple([], current_list) do
    current_list |> Enum.reverse() |> IO.inspect
  end

  def my_map([head|tail], fun) do
    [fun.(head) | my_map(tail, fun)]
  end

  def my_map([], _fun), do: []

end

IO.puts Recurse.sum([1, 2, 3, 4, 5], 0)
IO.puts Recurse.triple([1, 2, 3, 4, 5])
