import Data.List
import Data.Char
main :: IO()
main = do
    print $ sumUnique [[1,2,3,2],[1,-4],[1]] == 2
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45

sumUnique :: [[Int]] -> Int
sumUnique xs = sum $ [ sum $ uniqueNumber x | x <- xs]

uniqueNumber :: [Int] -> [Int]
uniqueNumber [] = []
uniqueNumber (x:xs)
 | elem x xs = [ number | number <- uniqueNumber xs, number /= x ]
 | otherwise = x:(uniqueNumber xs)