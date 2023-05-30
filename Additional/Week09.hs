import Data.List

main :: IO()
main = do
    print (addMatrices [[1,2],[3,4]] [[4,3],[2,1]])
    print $ distance (Point2D 1 1) (Point2D 2 2)

addMatrices :: (Num a, Eq a) => [[a]] -> [[a]] -> [[a]]
addMatrices [] [] = []
addMatrices (m:ms) (n:ns) = zipWith (+) m n : addMatrices ms ns

data Point2D = Point2D Double Double
 deriving (Read, Show)

distance :: Point2D -> Point2D -> Double
distance (Point2D x1 y1) (Point2D x2 y2) = sqrt ((x1 - x2)^2 + (y1 - y2)^2)