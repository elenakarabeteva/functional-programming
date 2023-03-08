main :: IO()
main = do
    print $ sumPrimeDivs 0 == 0
    print $ sumPrimeDivs 6 == 5 -- 2 + 3
    print $ sumPrimeDivs 18 == 5 -- 2 + 3
    print $ sumPrimeDivs 19 == 19
    print $ sumPrimeDivs 45136 == 53

sumPrimeDivs :: Int -> Int
sumPrimeDivs 0 = 0
sumPrimeDivs number = helper 1
 where
    helper d
     | d > number = 0
     | mod number d == 0 && isPrime d = d + helper (d + 1)
     | otherwise = helper (d + 1)

isPrime :: Int -> Bool
isPrime number = number > 1 && helper 2
 where
    helper d
     | d >= number = True
     | mod number d == 0 = False
     | otherwise = helper (d + 1)