main :: IO()
main = do
    print $ myGcdG 5 13 == 1
    print $ myGcdG 13 1235 == 13

    print $ myGcdPM 5 13 == 1
    print $ myGcdPM 13 1235 == 13

myGcdG :: Int -> Int -> Int
myGcdG x y
 | x == y = x
 | x > y = myGcdG (x - y) y
 | otherwise = myGcdG x (y - x)

myGcdPM :: Int -> Int -> Int
myGcdPM x y = helper x y
 where 
    helper x 0 = x
    helper 0 y = y
    helper x y = myGcdPM y (mod x y)


