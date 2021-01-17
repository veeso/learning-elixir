# Protocols are basically interfaces in Elixir
# or trait in Rust

# defmodule Type do
#   def type(value) when is_binary(value), do: "string"
#   def type(value) when is_integer(value), do: "integer"
#   # ... other implementations ...
# end

# The same might be reimplemented using a Protocol:

defprotocol Type do
  @spec type(t) :: String.t()
  def type(value)
end

# Define a generic implementation for the protocol (default)
defimpl Type, for: Any do
  def type(_value), do: "generic"
end

defimpl Type, for: BitString do
  def type(_value), do: "string"
end

defimpl Type, for: Integer do
  def type(_value), do: "integer"
end

# It’s possible to implement protocols for all Elixir data types:
#
# Atom
# BitString
# Float
# Function
# Integer
# List
# Map
# PID
# Port
# Reference
# Tuple

# it's then obviously possible to implement protocol for Structs too!

defmodule User do
  defstruct [:name, :age]
end

defimpl Type, for: User do
  def type(_value), do: "User"
end


defmodule OtherUser do
  @derive [Type] # Use default implementation
  defstruct [:name, :age]
end
