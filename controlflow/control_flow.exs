# Case statement matches different values against many patterns until the matching one is found
case {1, 2, 3} do
  {4, 5, 6} ->
    "This won't match"
  {1, x, 3} ->
    "matches, and now x has value 2"
    x # NOTE: but only inside the case
  _ ->
    "Fallback case"
end

x = 11
case 11 do
  ^x  ->
    "This matches 11; value of x won't change"
  _ ->
    "This won't match"
end

# What happens if we mix the values in a match? Goes to fallback, all values must match
case {1, 4, 3} do
  {4, 5, 6} ->
    "4, 5, 6 match"
  {1, 2, 3} ->
    "1, 2, 3 match"
  _ ->
    "Fallback case"
end

# Can we assign values? Of course
x = 3
y = case x do
  1 ->
    0
  2 ->
    1
  3 -> 2
end
y

# Cond is used instead to match boolean or nil expression only
cond do
  y == 2 ->
    "This matches"
  y == 4 ->
    "This won't"
end

# If
if true do
  IO.puts("Is true")
end

unless false do
  IO.puts("This is false") # Will be shown
end

# If else
if nil do
  "This won't be shown"
else
  "This will be shown"
end
