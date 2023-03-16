# Task 1
A narcissistic number is a number which is the sum of its own digits, each raised to the power of the number of digits. Define a predicate that checks whether a given whole number is a narcissistic number.

> **Implementation detail**: Use only linearly recursive procedures.

For example, take 153 (3 digits):

    1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

and 1634 (4 digits):

    1^4 + 6^4 + 3^4 + 4^4 = 1 + 1296 + 81 + 256 = 1634


# Task 2
Define a function that accepts two whole numbers `x` and `n` and calculates the following sum **via a linearly iterative process**:

    1 + x + x^2 + x^3 + ... + x^n


# Task 3
Write a function that finds the maximum digit in a number.


# Task 4
Define a function `sumNumbers start finish` that returns the sum of all numbers in the interval `[start, finish]` whose digits are ordered in descending order **via a linearly recursive process**.


# Task 5
Define a predicate that accepts two non-negative inputs - `x` and `y` and checks whether `x` is a sub-number of `y`.


# Task 6
A digital root is the recursive sum of all the digits in a number. Given `n`, take the sum of the digits of `n`. If that value has more than one digit, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.


# Task 7
Define the function sine, that accepts a whole number and a real number (representing radians) and returns the `n`-th partial sum of `sin(x)`.
