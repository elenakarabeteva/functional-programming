main :: IO()
main = do
    print $ removeFistOccurrence 110 1 == 10
    print $ removeFistOccurrence 15365 5 == 1536
    print $ removeFistOccurrence 15360 0 == 1536
    print $ removeFistOccurrence 15300 0 == 1530
    print $ removeFistOccurrence 15365 1 == 5365
    print $ removeFistOccurrence 35365 3 == 3565
    print $ removeFistOccurrence 1212 1 == 122
    print $ removeFistOccurrence 1212 2 == 121
    print $ removeFistOccurrence (removeFistOccurrence 1212 1) 1 == 22

countDigits :: Int -> Int
countDigits 0 = 0
countDigits number = 1 + countDigits (div number 10)

reversed :: Int -> Int
reversed number = helper number 0
 where 
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result = helper (div leftover 10) (result * 10 + mod leftover 10)

removeFistOccurrence :: Int -> Int -> Int
removeFistOccurrence number digit = helper number 0 0 (countDigits number)
 where
    helper 0 result count digitCount = (reversed result) * 10^(digitCount - countDigits(reversed result)) -- adding zeros at the end
    helper number result count digitCount
     | mod number 10 == digit && count == 0 = helper (div number 10) result (count + 1) (digitCount - 1)
     | otherwise = helper (div number 10) (result * 10 + (mod number 10)) count digitCount