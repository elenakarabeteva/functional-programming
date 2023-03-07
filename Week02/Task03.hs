main :: IO()
main = do
    print $ sumPrimeDivs 0 == 0
    print $ sumPrimeDivs 6 == 5 -- 2 + 3
    print $ sumPrimeDivs 18 == 5 -- 2 + 3
    print $ sumPrimeDivs 19 == 19
    print $ sumPrimeDivs 45136 == 53

sumPrimeDivs :: Int -> Int
sumPrimeDivs 0 = 0
sumPrimeDivs number = helper 2
 where
    helper d
     | d >= number && number > 1 = 0
     | mod number d == 0 = 0
     | otherwise = d + helper (d + 1)

