# Task 1
Define a recursive and an iterative function for calculating the number of digits of a non-negative number.

> **Implementation detail**: Use guards!


# Task 2
Define **an iterative** function for calculating the sum of the digits of a non-negative number.


# Task 3
Define a function that returns the sum of all prime divisors of a given number.


# Task 4
Define a function that returns the number of occurrences of a given digit in a given positive number.


# Task 5
Two numbers are amicable if the sum of the divisors of one of them is equal to the other. Define a predicate that checks whether two numbers are amicable.


# Task 6
A number is interesting if and only if it is evenly divided by the sum of its digits. Define a predicate that checks whether a number is interesting.


# Task 7
Given a divisor `d` and a bound `b`, find the largest integer `N`, such that:

    N is divisible by d
    and N is less than or equal to b
    and N is greater than 0.


# Task 8
Write a function that removes the digit `d` from the number `n`.


# Task 9
Write a function that forms a number from every other digit starting from the right of an integer `n` (assume `n >= 10`).


# Task 10
Define a function that takes two numbers and returns the number of palindromes in the open interval between them.


# Task 11
Define a predicate that accepts a number and returns if and only if the number is prime **and** every number that is produced by removing digits from right to left is prime.


# Task 12
Write a function that accepts three whole numbers - `a`, `b` and `n` (assume `n > 3`) and returns the **sum** of the **last three** numbers from the following sequence.


Explanations:

First example: a = 0, b = 2, n = 10. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 0 + 1 * 2 = 2
- s1 = 0 + 1 *2 + 2* 2 = 6
- s2 = 0 + 1 *2 + 2* 2   + 4 * 2 = 14
 and so on.

Second example: a = 5, b = 3, n = 5. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 5 + 1 * 3 = 8
- s1 = 5 + 1 *3 + 2* 3 = 14
- s2 = 5 + 1 *3 + 2* 3 + 4 * 3 = 26
 and so on.
