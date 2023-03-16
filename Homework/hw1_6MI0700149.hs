main :: IO()
main = do
    -- print $ getNthSevenlikeNum 1 -- ➝ 1
    -- print $ getNthSevenlikeNum 2 -- ➝ 7
    -- print $ getNthSevenlikeNum 3 -- ➝ 8
    -- print $ getNthSevenlikeNum 4 -- ➝ 49


   print $ eqSumPowDig 100 2 -- ➝ 0
   print $ eqSumPowDig 1000 2 -- ➝ 0
   print $ eqSumPowDig 2000 2 -- ➝ 0
   print $ eqSumPowDig 200 3 -- ➝ 153
   print $ eqSumPowDig 370 3 -- ➝ 523
   print $ eqSumPowDig 370 3 -- ➝ 523
   print $ eqSumPowDig 400 3 -- ➝ 894
   print $ eqSumPowDig 500 3 -- ➝ 1301
   print $ eqSumPowDig 1000 3 -- ➝ 1301
   print $ eqSumPowDig 1500 3 -- ➝ 1301

{-
    Задача 1
-}
isSpecialNumber :: Int -> Int -> Bool
isSpecialNumber n power = n == helper power n
 where 
    helper :: Int -> Int -> Int
    helper _ 0 = 0
    helper power leftover = (mod leftover 10)^power + helper power (div leftover 10)

-- add error messages
-- for power think
eqSumPowDig :: Int -> Int -> Int
eqSumPowDig hMax power
 | hMax < 0 = error "Upper limit should be positive number"
 | otherwise =  helper hMax 0
 where 
    helper 1 result = result
    helper hMax result 
     | isSpecialNumber hMax power = helper (hMax - 1) (result + hMax)
     | otherwise = helper (hMax - 1) result