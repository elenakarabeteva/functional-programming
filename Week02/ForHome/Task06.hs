main :: IO()
main = do
    print $ isInteresting 410 == True
    print $ isInteresting 212 == False
    print $ isInteresting 567 == False
    print $ isInteresting 70 == True 
    print $ isInteresting 5 == True 
    print $ isInteresting 4 == True 

sumDigits :: Int -> Int
sumDigits 0 = 0
sumDigits number = mod number 10 + sumDigits (div number 10)

isInteresting :: Int -> Bool
isInteresting number
 | sumDigits number == 0 = error "can not divide with 0"
 | otherwise = mod number (sumDigits number) == 0