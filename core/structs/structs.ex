import User

default = %User{}
IO.puts default.name
IO.puts default.age
# Create a struct User
pippo = %User{name: "Pippo", age: 32}

IO.puts pippo.name
IO.puts pippo.age

# Create a user from an existing one
pluto = %{pippo | name: "Pluto"}
IO.puts pluto.name
IO.puts pluto.age
pluto = %{pluto | age: 12}
IO.puts pluto.age
