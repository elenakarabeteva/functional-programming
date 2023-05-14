import Data.List
main :: IO()
main = do
    -- you may get slightly different results eg. [3, 4, 5] on test 1 <- not a problem
    print $ listLeaves [(1, 2, 3), (2, 4, 5)] == [3, 4, 5]
    print $ listLeaves [(2, 4, 5), (1, 2, 3)] == [4, 5, 3]
    print $ listLeaves [(1, 2, 3), (3, 4, 5), (5, 6, 9)] == [2, 4, 6, 9]

listLeaves :: (Eq a) => [(a, a, a)] -> [a]
listLeaves [] = []
listLeaves nodes = filter (not . (`elem` innerNodes)) leaves
 where
    leaves = tupleToList (map secondAndThirdNode nodes)
     where
        tupleToList ((a, b):xs) = a : b : tupleToList xs
        tupleToList _ = []
    innerNodes = map currentNode nodes
    secondAndThirdNode (_, second, third) = (second, third)
    currentNode (current, _, _) = (current)