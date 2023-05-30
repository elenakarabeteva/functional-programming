import Data.List

main :: IO()
main = do
    print (addMatrices [[1,2],[3,4]] [[4,3],[2,1]])

addMatrices :: (Num a, Eq a) => [[a]] -> [[a]] -> [[a]]
addMatrices [] [] = []
addMatrices (m:ms) (n:ns) = zipWith (+) m n : addMatrices ms ns