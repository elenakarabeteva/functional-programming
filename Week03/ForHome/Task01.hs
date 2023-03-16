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

addZerosAtEnd :: Int -> Int -> Int
addZerosAtEnd number result = (reversed result) * 10^(countDigits number - countDigits (reversed result) - 1)

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
removeFistOccurrence number digit = helper number 0 0
 where
    helper :: Int -> Int -> Int -> Int
    helper 0 result count = addZerosAtEnd number result
    helper number result count
     | mod number 10 == digit && count == 0 = helper (div number 10) result (count + 1)
     | otherwise = helper (div number 10) (result * 10 + mod number 10) count