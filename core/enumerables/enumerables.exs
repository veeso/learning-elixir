# The enum module provides functionality to work with list and maps
# It also provides many functions for sorting, filtering etc

# two times table
Enum.map(0..10, fn x -> x * 2 end)
# Sum to 0 the sequence (1..10)
Enum.reduce(1..10, 0, &+/2)
# An alternative to enum are Streams
# The difference is that Enums are eagers, which means that
# the expression is evaluated at each call, and a value is returned at each call
# This makes Enum very expensive as memory usage, when working with huge data sets, while streams, returns
# a pseudo-function call, which makes lightweight, but slower, since they're executed on the run and
# only when needed

stream = Stream.cycle([1, 2, 3, 4, 5])
IO.puts Enum.take(stream, 15)

# Let's see the difference in execution time...
odd? = &(rem(&1, 2) != 0)
# Calculate the sum of the first 1.000.000 odd numbers
1..5_000_000 |> Enum.map(&(&1 * 3)) |> Enum.filter(odd?) |> Enum.sum
1..5_000_000 |> Stream.map(&(&1 * 3)) |> Stream.filter(odd?) |> Enum.sum

# Generate values with unfold
stream = Stream.unfold("hełło", &String.next_codepoint/1)
Enum.take(stream, 3)

# Stream can also be used to work with files (since they are evaluated on call, this makes them perfect)
File.stream!("/tmp/myfile.txt")
# Read 10 bytes
IO.puts Enum.take(stream, 10)
