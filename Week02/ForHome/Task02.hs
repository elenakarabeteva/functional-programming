main :: IO()
main = do
    -- print $ sumDigitsIter (-13) -- error "n was negative"
    print $ sumDigitsIter 12345 == 15
    print $ sumDigitsIter 123 == 6

sumDigitsIter :: Int -> Int
sumDigitsIter number 
 | number < 0 = error "n was negative"
 | otherwise = helper number 0
 where
    helper 0 result = result
    helper number result = helper (div number 10) (result + mod number 10)