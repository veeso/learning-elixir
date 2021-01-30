# Sigills provide different methods to interact with textual representations.
# A sigill starts with the character '~'

# Regex:

regex = ~r/foo|bar/
"foo" =~ regex # true
"omar" =~ regex # false

# Supports eveything implemented in the PCRE
"HELLO" =~ ~r/hello/i

# Strings without quote issues:
mystring = ~s(this is a string with "double" quotes, not 'single' ones)
# Generate char list with single quotes
mycharlist = ~c(this is a char list containing 'single quotes')
# Word lists
wl = ~w(foo bar bat)
# String escapes:
~s(String with escape codes \x26 #{"inter" <> "polation"})

# Date
d = ~D[2019-10-31]
d.day
# Time
t = ~T[23:00:07.0]
t.hour
# Naive date time
ndt = ~N[2019-10-31 23:00:07]
# Datetime (naivetime + tz)
dt = ~U[2019-10-31 19:59:03Z]

# It is possible to implement custom sigills
defmodule MySigils do
  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: -String.to_integer(string)
end
~i(13)s
~i(42)n
~i(-12)n
