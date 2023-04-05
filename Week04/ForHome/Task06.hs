main :: IO()
main = do
    print $ sumSpecialPrimes 5 2 == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462

isPrime :: Int -> Bool
isPrime number = (number > 1 && null [n | n <- [2 .. number - 1], mod number n == 0])

containsDigit :: Int -> Int -> Bool
containsDigit d number = elem (head $ show d) (show number)

sumSpecialPrimes :: Int -> Int -> Int
sumSpecialPrimes n d = sum $ take n $ filter (\x -> isPrime x && containsDigit d x) [1..]
