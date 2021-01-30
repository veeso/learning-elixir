# Write to stdout
IO.puts "Hello!"
# Read from stdin
username = IO.gets("Username: ")
IO.puts username
# Write to stderr
IO.puts(:stderr, "Hello?")

# Write a file
{:ok, file} = File.open("/tmp/elixir.txt", [:write])
IO.binwrite(file, "I barely know what I'm doing")
File.close(file)

# Read file
File.read("/tmp/elixir.txt")

# File errors works like in Rust (if you know it...)
{:error, :enoent} = File.read("/tmp/unexistingfile.txt")
