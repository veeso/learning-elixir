# The path module is actually very similiar to the Rust module
# Which makes me think that Rust is extremely similiar to this language.

home = Path.join("/home/", "cvisintin/")
IO.puts home
# This also resolves the aliases
IO.puts Path.expand("~/hello")
