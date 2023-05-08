main :: IO()
main = do
    print $ (pairCompose [(+1), (+2)]) 1 == 5 -- ((1 + 2) + 1) + 1
    print $ (pairCompose [(+1), (+2), (+3)]) 1 == 8

pairCompose :: [Int -> Int] -> (Int -> Int)
pairCompose [] number = number
pairCompose (f:g:xs) number = (f . g) number + pairCompose xs number
pairCompose (f:xs) number = f number 