main :: IO()
main = do
    print $ (switchsum (\x -> x + 1) (\x -> x * 2) 1) 2 == 3
    print $ (switchsum (\x -> x + 1) (\x -> x * 2) 2) 2 == 9
    print $ (switchsum (\x -> x + 1) (\x -> x * 2) 3) 2 == 16
    print $ (switchsum (\x -> x + 1) (\x -> x * 2) 4) 2 == 30

switchsum :: (Int -> Int) -> (Int -> Int) -> Int -> (Int -> Int)
switchsum f g 0 x = 0
switchsum f g 1 x = f x
switchsum f g n x = (currentFunction f g n x) + switchsum f g (n - 1) x
 where 
    currentFunction f g 1 x = f x
    currentFunction f g n x
     | even n = g ((currentFunction f g (n - 1)) x)
     | otherwise = f ((currentFunction f g (n - 1)) x)