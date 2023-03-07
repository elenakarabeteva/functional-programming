main :: IO()
main = do
    print $ sumDivs 0 == 0
    print $ sumDivs 1 == 1
    print $ sumDivs 6 == 12 -- 1 + 2 + 3 + 6
    print $ sumDivs 12345 == 19776

sumDivs :: Int -> Int
sumDivs 0 = 0
sumDivs number = helper 1
 where
    helper d
     | d > number = 0
     | mod number d == 0 = d + helper (d + 1)
     | otherwise = helper (d + 1)