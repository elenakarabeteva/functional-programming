main :: IO()
main = do
    print $ sortN 1714 == 7411
    print $ sortN 123450 == 543210
    print $ sortN 123405 == 543210
    print $ sortN 123045 == 543210
    print $ sortN 120345 == 543210
    print $ sortN 102345 == 543210
    print $ sortN 8910 == 9810
    print $ sortN 321 == 321
    print $ sortN 29210 == 92210
    print $ sortN 1230 == 3210
    print $ sortN 55345 == 55543
    print $ sortN 14752  == 75421
    print $ sortN 329450 == 954320
    print $ sortN 9125 == 9521

countDigits :: Int -> Int
countDigits 0 = 0
countDigits number = 1 + countDigits (div number 10)

removeMax :: Int -> Int -> Int
removeMax number digit = helper number 0 0
 where
    helper :: Int -> Int -> Int -> Int
    helper 0 result count = result -- adding zeros at the end
    helper number result count 
     | mod number 10 == digit && count == 0 = helper (div number 10) result (count + 1) -- remove first occurrance
     | otherwise = helper (div number 10) (result * 10 + mod number 10) count

findMax :: Int -> Int
findMax number = helper (div number 10) (mod number 10)
 where
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result
     | mod leftover 10 > result = helper (div leftover 10) (mod leftover 10)
     | otherwise = helper (div leftover 10) result

sortN :: Int -> Int
sortN number = helper number 0 0 
 where
    helper :: Int -> Int -> Int -> Int
    helper 0 result max = result * 10^(countDigits number - countDigits result)
    helper number result max = helper (removeMax number maxNumber) (result * 10 + maxNumber) maxNumber
     where
         maxNumber = findMax number