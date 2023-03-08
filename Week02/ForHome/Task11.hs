main :: IO()
main = do
    print $ truncatablePrime 3797 == True -- 3797, 379, 37 and 3 are all prime
    print $ truncatablePrime 47 == False -- 47 is prime, but 4 is not

isPrime :: Int -> Bool
isPrime number = number > 1 && helper 2
 where
    helper d
     | d >= number = True
     | mod number d == 0 = False
     | otherwise = helper (d + 1)

truncatablePrime :: Int -> Bool
truncatablePrime 0 = True
truncatablePrime number = isPrime number && truncatablePrime (div number 10)