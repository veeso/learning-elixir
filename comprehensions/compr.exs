# Comprehensions: syntactic sugar for loops/filter/collectables...

for n <- [1, 2, 3, 4], do: n * n

multiple_of_3? = fn n -> rem(n, 3) == 0 end
for n <- 0..5, multiple_of_3?.(n), do: n * n

# They are made by 3 constructs:
# - generator
# - filters
# - collectables

# In this case n <- [1, 2, 3, 4] is the generator
# multiple_of_3?.(n) is the filter
# do: n * n is the collectable

# Comprehensions can also have multiple generators
dirs = ['/usr', '/tmp']

for dir <- dirs,
    file <- File.ls!(dir),
    path = Path.join(dir, file),
    File.regular?(path) do
  File.stat!(path).size
end
