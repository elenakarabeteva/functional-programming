main :: IO()
main = do
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

    print $ getNthSevenlikeNum 1 -- ➝ 1
    print $ getNthSevenlikeNum 2 -- ➝ 7
    print $ getNthSevenlikeNum 3 -- ➝ 8
    print $ getNthSevenlikeNum 4 -- ➝ 49
    -- more test cases
    -- print $ getNthSevenlikeNum 5 -- ➝ 50
    -- print $ getNthSevenlikeNum 6 -- ➝ 56
    -- print $ getNthSevenlikeNum 7 -- ➝ 57
    -- print $ getNthSevenlikeNum 8 -- ➝ 57

{-
    Task 1
    Algorithm idea - we start from the upper bound and for each number we check whether it is special or not
    until we get to 1
-}
isSpecialNumber :: Int -> Int -> Bool
isSpecialNumber n power = n == helper n power
 where 
    helper :: Int -> Int -> Int
    helper 0 _  = 0
    helper leftover power = (mod leftover 10)^power + helper (div leftover 10) power

eqSumPowDig :: Int -> Int -> Int
eqSumPowDig hMax power
 | hMax < 0 = error "Upper limit should be positive number"
 | power < 0 = error "Power should be positive number"
 | otherwise =  helper hMax 0
 where 
    helper :: Int -> Int -> Int
    helper 1 result = result
    helper hMax result 
     | isSpecialNumber hMax power = helper (hMax - 1) (result + hMax)
     | otherwise = helper (hMax - 1) result


{-
    Task 2
    Algorithm idea - the powers that the resulting number with base 7 should have,
    are obtained from the input number with base 2.  
-}
maxPower :: Int -> Int -> Int
maxPower n power
 | div n (2^power) == 0 = power - 1
 | otherwise = maxPower n (power + 1)

getNthSevenlikeNum :: Int -> Int
getNthSevenlikeNum n 
 | n <= 0 = error "The number should be positive"
 | otherwise = helper n 0 0
 where
    helper :: Int -> Int -> Int -> Int
    helper 0 power result = result
    helper n power result = helper (n - 2^maxPowerOfNumber) maxPowerOfNumber (result + 7^maxPowerOfNumber)
     where 
        maxPowerOfNumber = maxPower n 0