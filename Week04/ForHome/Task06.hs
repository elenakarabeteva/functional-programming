main :: IO()
main = do
    print $ sumSpecialPrimes 5 2 -- == 392 -- n = 5, d = 2
    print $ sumSpecialPrimes 5 3 == 107
    print $ sumSpecialPrimes 10 3 == 462
