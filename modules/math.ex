defmodule Math do
  def sum(a, b) do
    a + b
  end

  def sub(a, b) do
    do_sub(a, b)
  end

  # defp defines a private function

  defp do_sub(a, b) do
    a - b
  end

  # Function with case pattern

  def divide(a, b) when b != 0 do
    a / b
  end

  def divide(_a, b) when b == 0 do
    nil
  end

  # Function with default argument
  def incr(n, by \\ 1) do
    sum(n, by)
  end

end

