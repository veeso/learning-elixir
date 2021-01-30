# Define a custom type

defmodule Person do
  @typedoc """
  A 4 digit year, e.g. 1984
  """
  @type year :: integer

  @typedoc """
  Describes Person address
  """
  @type address :: %{
    street: String.t,
    number: integer
  }

  @spec current_age(year) :: integer
  def current_age(year_of_birth) do
    date = Date.utc_today()
    date.year - year_of_birth
  end
end

# Behaviours
# Provide a way to define a set of functions that have to be implemented by a module
# ensure that a module implements all the functions in that set
# Behaviours are basically interfaces in OOP

defmodule Parser do
  @doc """
  Parses a string.
  """
  @callback parse(String.t) :: {:ok, term} | {:error, String.t}
  
  @doc """
  Lists all supported file extensions.
  """
  @callback extensions() :: [String.t]

  # NOTE: dynamic dispatch: dispatch to the correct Parser implementation
  def parse!(implementation, contents) do
    case implementation.parse(contents) do
      {:ok, data} -> data
      {:error, error} -> raise ArgumentError, "parsing error: #{error}"
    end
  end

end

# Adopting behaviours
defmodule JSONParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some json " <> str} # ... parse JSON
  
  @impl Parser
  def extensions, do: ["json"]
end

defmodule YAMLParser do
  @behaviour Parser

  @impl Parser
  def parse(str), do: {:ok, "some yaml " <> str} # ... parse YAML
  
  @impl Parser
  def extensions, do: ["yml"]
end
