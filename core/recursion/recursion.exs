# Since as you might know, functional laanguages have always immutable values, it is not possible to write while/for loops
# Instead recursion must be used

defmodule Recursion do
  def print_n_times(what, n) when n <= 1 do
    IO.puts what
  end

  def print_n_times(what, n) when n > 1 do
    IO.puts what
    print_n_times(what, n - 1)
  end

end

Recursion.print_n_times("Hello world!", 5)

# Map algortithms
# Sum the element of a list
defmodule Math do
  def sum_list([head | tail], accu) do
    # Head is summed to accu, while tail (without the first element, is passed to sum_list)
    sum_list(tail, head + accu)
  end

  # while this piece of code, will be executed when the list is empty
  def sum_list([], accu) do
    accu
  end

  defp calc_fibonacci(seq, cycles, prev, cycle) when cycle < cycles do
    last = Enum.at(seq, -1)
    next = last + prev
    calc_fibonacci(seq ++ [next], cycles, last, cycle + 1)
  end

  defp calc_fibonacci(seq, cycles, _prev, cycle) when cycle >= cycles do
    seq
  end

  # Calculate the first `cycles` number of the fibonacci sequence
  def fibonacci(cycles) do
    calc_fibonacci([1], cycles, 0, 0)
  end

end

IO.puts Math.sum_list([1, 1, 2, 3, 5, 8], 0)
Math.fibonacci(10)
