main :: IO()
main = do
    --print $ removeFistOccurrence 10230 5 
    print $ removeFistOccurrence 110 1 -- == 10
    print $ removeFistOccurrence 15365 5 == 1536
    print $ removeFistOccurrence 15360 0 == 1536
    print $ removeFistOccurrence 15300 0 -- == 1530
    print $ removeFistOccurrence 15365 1 == 5365
    print $ removeFistOccurrence 35365 3 == 3565
    print $ removeFistOccurrence 1212 1 == 122
    print $ removeFistOccurrence 1212 2 == 121
    print $ removeFistOccurrence (removeFistOccurrence 1212 1) 1 == 22

--to do: count zeros at the end

reversed :: Int -> Int
reversed number = helper number 0
 where 
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result = helper (div leftover 10) (result * 10 + mod leftover 10)

removeFistOccurrence :: Int -> Int -> Int
removeFistOccurrence number digit = helper number 0 0
 where
    helper 0 result count = reversed result
    helper number result count
     | mod number 10 == digit && count == 0 = helper (div number 10) result (count + 1)
     | otherwise = helper (div number 10) (result * 10 + (mod number 10)) count