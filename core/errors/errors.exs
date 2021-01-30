# Raise an exception (this will raise a default RuntimeError)
raise "It's all broken"
# To raise a certain error:
# Raise <ERROR>, <args..>
raise ArgumentError, message: "invalid argument foo"

# Define a new kind of error
defmodule YoloError do
  defexception [:message "yolo"]
end

raise YoloError
raise YoloError "Non va una mazza!"

# To handle errors use try/rescue
try do
  raise YoloError
rescue
  IO.puts "Recovered from yolo error!"
end

# In practice errors are not used that much, as happened for Rust, returning a tuple
# with the Result is preferred; as happens with File.read.

case File.read "hello" do
  {:ok, body}      -> IO.puts "Success: #{body}"
  {:error, reason} -> IO.puts "Error: #{reason}"
end

# Try catch is used to catch values thrown in the expression
# This construct is unlikely to be used
try do
  Enum.each -50..50, fn(x) ->
    if rem(x, 13) == 0, do: throw(x)
  end
  "Got nothing"
catch
  x -> "Got #{x}"
end

# The after statements works like the 'finally' in other languages such as Python or java
{:ok, file} = File.open "sample", [:utf8, :write]
try do
  IO.write file, "olá"
  raise "oops, something went wrong"
after
  File.close(file)
end

# While **else** is executed only if no error was raised, but errors inside it, won't be caught.
