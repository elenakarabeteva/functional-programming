main :: IO()
main = do
    print $ sumDivisibleNumbers 0 10 5 == 5
    print $ sumDivisibleNumbers 0 100 5 == 990
    print $ sumDivisibleNumbers 100 0 5 == 990

sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits number = mod number 10 + sumDigits (div number 10)

sumDivisibleNumbers :: Int -> Int -> Int -> Int
sumDivisibleNumbers start finish k = helper (min start finish) 0
 where
    helper realStart result
     | realStart == realEnd = result
     | mod (sumDigits realStart) k == 0 = helper (realStart + 1) (result + realStart)
     | otherwise = helper (realStart + 1) result 
    realEnd = max start finish