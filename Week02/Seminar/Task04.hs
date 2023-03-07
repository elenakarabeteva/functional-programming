main :: IO()
main = do
    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 3 == True
    print $ isPrime 6 == False
    print $ isPrime 61 == True

isPrime :: Int -> Bool
isPrime number = number > 1 && helper 2
 where
    helper d
     | d >= number = True
     | mod number d == 0 = False
     | otherwise = helper (d + 1)