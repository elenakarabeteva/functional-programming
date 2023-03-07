main :: IO()
main = do
    print $ isPerfect 1 == False
    print $ isPerfect 6 == True -- 1 + 2 + 3 = 6 = 6
    print $ isPerfect 495 == False
    print $ isPerfect 33550336 == True

sumDivs :: Int -> Int
sumDivs 0 = 0
sumDivs number = helper 1
 where
    helper d
     | d >= number = 0
     | mod number d == 0 = d + helper (d + 1)
     | otherwise = helper (d + 1)

isPerfect :: Int -> Bool
isPerfect number = number > 0 && number == sumDivs number
