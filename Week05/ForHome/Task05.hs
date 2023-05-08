main :: IO()
main = do
    print $ (applyN (\x -> 2 * x) 5) 2 == 64
    print $ (applyN (\x -> div x 10) 2) 100 == 1

applyN :: (Num a) => (a -> a) -> Int -> a -> a
applyN _ 0 number = number
applyN f count number = applyN f (count - 1) (f number)