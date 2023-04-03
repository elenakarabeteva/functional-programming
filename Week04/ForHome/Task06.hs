main :: IO()
main = do
    print $ sumSpecialPrimes 5 2 == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462

sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = sum $ take n $ filter (\x -> (x > 1 && null [num | num <- [2 .. x - 1], mod x num == 0]) && (elem (head $ show d) (show x))) [1..]
