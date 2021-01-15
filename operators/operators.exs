# Math
5 + 6
11 - 5
11 * 3
# Float division
44 / 3
# Integer division
div(44, 3) == 14
rem(44, 3) == 2
# Concat strings
"hello" <> " world!"

# Conditional operators

# Strict boolean checks and boolean operators; when you expect boolean values, use strict operators
true and true == true
1 and true == false
1 && true == true
true && 17 == true
false or 1 == 1
false || 1 == 1

# List operators
[1, 2, 3] ++ [4, 5]
[1, 2, 3] -- [3]

# Pin operator
# NOTE: the pin operator is like accessing by value to a certain variable. It is used to pin the value of a certain variable, preventing any value changing
x = 1
^x = 2 # Error
