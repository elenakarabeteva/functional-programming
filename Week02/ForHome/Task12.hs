main :: IO()
main = do 
    print $ findSum 0 2 10 == 3578 -- 510 + 1022 + 2046
    print $ findSum 5 3 5 == 174 -- 26 + 50 + 98
    
findSum :: Int -> Int -> Int -> Int
findSum a b n = helper 0 b n + helper 0 b (n - 1) + helper 0 b (n - 2) + 3 * a
 where 
    helper power b n
     | power == n = 0 
     | otherwise = 2^power * b + helper (power + 1) b n