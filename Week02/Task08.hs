main :: IO()
main = do
    print $ removeD 1 656 == 656
    --print $ removeD 5 656 == 66
    -- print $ removeD 6 656 == 5
    -- print $ removeD 0 606 == 66
    -- print $ removeD 0 600 == 6
    -- print $ removeD 6 600 == 0
    -- print $ removeD 2 1234 == 134

rev :: Int -> Int
rev number = helper number 0
 where 
    helper 0 reversed = reversed
    helper number reversed = helper (div number 10) (reversed * 10 + mod number 10)

removeD :: Int -> Int -> Int
removeD d n = helper n 0 
 where 
    helper n result
     | n == 0 = 0
     | d /= mod n 10 = helper (mod n 10) (result * 10 + mod n 10)
     | otherwise = helper (mod n 10) result 
