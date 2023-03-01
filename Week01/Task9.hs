main :: IO()
main = do 
    print $ rev 1 == 1
    print $ rev 123 == 321
    print $ rev 987654321 == 123456789

rev :: Int -> Int
rev number = helper number 0
 where 
    helper 0 reversed = reversed
    helper number reversed = helper (div number 10) (reversed * 10 + mod number 10)

