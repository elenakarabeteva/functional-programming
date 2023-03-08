main :: IO()
main = do
    print $ removeD 1 656 == 656
    print $ removeD 5 656 == 66
    print $ removeD 6 656 == 5
    print $ removeD 0 606 == 66
    print $ removeD 0 600 == 6
    print $ removeD 6 600 == 0
    print $ removeD 2 1234 == 134

removeD :: Int -> Int -> Int
removeD _ 0 = 0
removeD d n
 | mod n 10 /= d = removeD d (div n 10) * 10 + mod n 10
 | otherwise = removeD d (div n 10)