# Numbers
n = 5
# Float
n = 3.33
# Booleans
b = true
b = false
# Null
o = nil
# Atoms, constants with value equal to own name
myc = :apple
:appled == myc
# String
h = "Hello"
h = h <> " world!"
IO.puts(h)
# String module
String.length(h)
# Charlists
h2 = 'hello'
h2 != h

# Anonymous functions
sum = fn a, b -> a + b end
sum.(1, 9)
# Functions always have a name and an `arity` attribute, which defines the number of arguments
is_function(sum, 2)
is_function(sum, 1)

# Linked lists
lst = [1, 2, "hello", true, :omar]
length(lst)
# Concat
lst = lst ++ [4, 5, 6]
# Remove from list
lst = lst -- [5, 6]
# Head and tail
hd(lst)
tl(lst)
Enum.at(lst, 1)
# Tuples
t = {1, :ok, 3}
tuple_size(t)
elem(t, 1)
put_elem(t, 88)
tuple_size(t) == 4

# Keyword lists
user = [name: "john", surname: "doe"]
# this actually is the same that writing
user = [{:name, "john"}, {:surname, "doe"}]
# Get name
user[:name] # Name is actually an atom

# Maps
map = %{:name => "john", :surname => "doe", 3 => "foobar"}
map[:name]
map[3]
# Nested maps
users = [
  john: %{name: "John", age: 27, languages: ["Erlang", "Ruby", "Elixir"]},
  mary: %{name: "Mary", age: 29, languages: ["Elixir", "F#", "Clojure"]}
]
users[:john].age
# or also
users[:john][:age]
