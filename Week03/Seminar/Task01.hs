main :: IO()
main = do
    print $ isNarcissistic 7 == True
    print $ isNarcissistic 12 == False
    print $ isNarcissistic 370 == True
    print $ isNarcissistic 371 == True
    print $ isNarcissistic 1634 == True

countDigits :: Int -> Int
countDigits 0 = 0
countDigits number = 1 + countDigits (div number 10)

isNarcissistic :: Int -> Bool
isNarcissistic n = n == helper (countDigits n) n
 where 
    helper :: Int -> Int -> Int
    helper _ 0 = 0
    helper power leftover = (mod leftover 10)^power + helper power (div leftover 10)