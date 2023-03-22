import Data.Char

main :: IO()
main = do
    print $ isAscending 0 == True
    print $ isAscending 10 == False
    print $ isAscending 123 == True
    print $ isAscending 1233 == True
    print $ isAscending 12332 == False    

isAscending :: Integer -> Bool
isAscending ds = and [a <= b | (a, b) <- zip [ord d - ord '0' | d <- show ds] (tail [ord d - ord '0' | d <- show ds])]