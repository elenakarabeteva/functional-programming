# Task 1
Define two predicates that return whether a number is even:

- using if-else;
- using guards. <- The preferred way!


# Task 2
Define two functions that return the sum of the cubes of two **whole** numbers:

- using a power operator;
- **without** using a power operator.


# Task 3
Define a function that returns the average of the sum of the squares of two **whole** numbers.


# Task 4
Define a function for calculating the GCD of two whole numbers.

> **Note**: Normally, you would use the built-in function `gcd`.

- solve using guards;
- solve using pattern matching; <- The preferred way!

Recap:

```text
The Euclidean Algorithm for finding GCD(x,y) is as follows:
If x = 0 then GCD(x,y)=y.
If y = 0 then GCD(x,y)=x.
Write x in quotient remainder form (x = A⋅y + R). Find GCD(y,R) (since GCD(x,y)=GCD(y,R)).
```


# Task 5
Define two predicates that check whether a year is a leap year.

The first should be called *isLeapYearOneLine*. It should implement *Method I* using **boolean logical operators** <- the preferred way.

The second should be called *isLeapYearGuards*. It should implement *Method II* using **guards**.

Recap:

```text
Method I: A year is leap year if it is a multiple of 400 or it is a multiple of 4 but not of 100.

Method II:
    if year is divisible by 400 then is_leap_year
    else if year is divisible by 100 then not_leap_year
    else if year is divisible by 4 then is_leap_year
    else not_leap_year 
```


# Task 6
John has a backpack. With it he can carry `k` kilograms. An item from the supermarket weighs `w` kilograms.

Define a predicate that accepts three numbers - `c` (number of products), `k` and `w` and returns whether John is capable of buying all the products in one trip to the supermarket.

> **Implementation detail**: Use guards!


# Task 7
Each **day** a plant is growing by *upSpeed* meters. Each **night** that plants height decreases by *downSpeed* meters due to the lack of sun light. Initially, plant is 0 meters tall. We plant the seed at the beginning of a day. We want to know when the height of the plant will reach a certain level.

Explanations:

- for `upSpeed = 100`, `downSpeed = 10` and `desiredHeight = 910`, the output should be `10`.

```text
After day 1   --> 100
After night 1 --> 90
After day 2   --> 190
After night 2 --> 180
After day 3   --> 280
After night 3 --> 270
After day 4   --> 370
After night 4 --> 360
After day 5   --> 460
After night 5 --> 450
After day 6   --> 550
After night 6 --> 540
After day 7   --> 640
After night 7 --> 630
After day 8   --> 730
After night 8 --> 720
After day 9   --> 820
After night 9 --> 810
After day 10  --> 910
```


# Task 8
A snail crawls up a column. During the day it crawls up some distance. During the night it sleeps, so it slides down for some distance (less than it crawls up during the day).

Your function accepts three arguments:

- The height of the column (meters);
- The distance that the snail crawls during the day (meters);
- The distance that the snail slides down during the night (meters).

Calculate the number of days the snail will need to reach the top of the column.


# Task 9
Define a function that reverses a **non-negative** number by implementing a **linearly iterative process**.


# Task 10
Define a function that takes as inputs your potential grades on homeworks and exams and outputs your final grade for this subject **rounded** to the second digit after the `.`. If the final grade is less than `2`, return `2`.

Here is the formula:

```text
O = 1/2 TK + 1/4 IT + 1/4 IZ
```

where

```text
TK = 1/4 D + 3/8 KT + 3/8 KZ

and

D is the average grade from 3 homeworks
KT is the average grade from 2 theory exams
KZ is the average grade from 2 practice exams
IT is the grade from the theory final
IZ is the grade from the practice final
```

Additional notes:

- **You'll pass the course if: D >= 3 and IZ >= 3 and IT >= 3 and O >= 3!**
- If you get KZ >= 4,50 and **on each** practical exam you get KZ<sub>i</sub> >= 4,00, then you don't have to go to the final on the practice part. That would mean that IZ = KZ.
- If you get KT >= 4,50 and **on each** theory exam you get KT<sub>i</sub> >= 4,00, then you don't have to go to the final on the theory part. That would mean that IT = KT.
- `0` is a possible grade!

Assume the order of the inputs is the following:

`D1 D2 D3 KZ1 KZ2 KT1 KT2 IZ IT`
