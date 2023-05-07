main :: IO()
main = do
    print $ Circle 5
    print $ Rectangle 5 10
    print $ Triangle 1 2 3
    print $ Triangle 1.42 2.55 6.66
    print $ f $ Circle 5

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show)

f :: (Num a) => Shape a -> a
f (Circle n) = n * 40