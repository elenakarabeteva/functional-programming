main :: IO()
main = do
    print $ p 1 == 1
    print $ p 2 == 5
    print $ p 3 == 12
    print $ p 4 == 22
    print $ p 5 == 35
    print $ p 6 == 51

p :: Int -> Int
p number = helper 0 1 number
 where
    helper :: Int -> Int -> Int -> Int
    helper result previous 0 = result
    helper result previous count = helper (result + previous) (previous + 3) (count - 1)