main :: IO()
main = do
    print $ specialSum 1 100 == 195 -- 61, 65, 69
    
specialSum :: Int -> Int -> Int
specialSum x y = sum $ filter (\number -> elem '6' (show number) && mod number 4 == 1) [x .. y]