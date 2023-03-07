main :: IO()
main = do
    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False

hasIncDigits :: Int -> Bool
hasIncDigits 0 = True
hasIncDigits number
 | mod number 10 >= mod (div number 10) 10 = hasIncDigits $ div number 10
 | otherwise = False