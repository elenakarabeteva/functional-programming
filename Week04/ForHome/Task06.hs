main :: IO()
main = do
    print $ sumSpecialPrimes 5 2 -- == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462

primes :: [Int]
primes = sieve [2..]
  where
    sieve (x:xs) = x : sieve [n | n <- xs, n `mod` x /= 0]

containsDigit :: Int -> Int -> Bool
containsDigit digit num = elem digit (map (\x -> read [x] :: Int) (show num))

