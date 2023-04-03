import Data.Char

main :: IO()
main = do
    print $ isAscending 0 == True
    print $ isAscending 10 == False
    print $ isAscending 123 == True
    print $ isAscending 1233 == True
    print $ isAscending 12332 == False    

isAscending :: Int -> Bool
isAscending number = and [x <= y | (x, y) <- (zip (show number) (tail $ show number))]