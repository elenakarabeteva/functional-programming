main :: IO()
main = do
    print $ everyOther 12 == 1
    print $ everyOther 852369 == 628
    print $ everyOther 1714 == 11
    print $ everyOther 12345 == 42
    print $ everyOther 891 == 9
    print $ everyOther 123 == 2
    print $ everyOther 2121 == 22
    print $ everyOther 4736778 == 767
    print $ everyOther 448575 == 784
    print $ everyOther 4214 == 14

everyOther :: Int -> Int
everyOther number = helper number 0 0
 where
    helper 0 position result = result 
    helper number position result
     | mod position 2 /= 0 = helper (div number 10) (position + 1) (result * 10 + mod number 10)
     | otherwise = helper (div number 10) (position + 1) result