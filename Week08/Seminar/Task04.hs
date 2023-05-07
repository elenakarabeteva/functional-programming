main :: IO()
main = do
    print $ myImages (\x -> x * x) (2+) [Point 2 2, Point 1 2, Point 3 7] == [Point 2 2, Point 3 7]

data Point2D a = Point a a
 deriving (Eq)

myImages :: (Num a, Eq a) => (a -> a) -> (a -> a) -> [Point2D a] -> [Point2D a]
myImages f g = filter (\ (Point x y) -> f x == g y)