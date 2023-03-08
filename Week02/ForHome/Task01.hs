main :: IO()
main = do
    --print $ countDigitsIter (-13) -- error "n was negative"
    print $ countDigitsIter 12345 == 5
    print $ countDigitsIter 123 == 3

    --print $ countDigitsRec (-13) -- error "n was negative"
    print $ countDigitsRec 12345 == 5
    print $ countDigitsRec 123 == 3

countDigitsRec :: Int -> Int
countDigitsRec 0 = 0
countDigitsRec number
 | number < 0 = error "n was negative"
 | otherwise = 1 + countDigitsRec (div number 10)

countDigitsIter :: Int -> Int
countDigitsIter number 
 | number < 0 = error "n was negative"
 | otherwise = helper number 0
 where
    helper 0 result = result
    helper number result = helper (div number 10) (result + 1)