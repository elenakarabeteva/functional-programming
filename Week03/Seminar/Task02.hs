main :: IO()
main = do
    print $ calculateSum 5 0 == 1 -- 1 + x + x^2 + x^3 + ... + x^n
    print $ calculateSum 5 1 == 6
    print $ calculateSum 10 1 == 11
    print $ calculateSum 1 11 == 12
    print $ calculateSum 2 11 == 4095

calculateSum :: Int -> Int -> Int
calculateSum x n = helper 1 n
 where 
    helper :: Int -> Int -> Int
    helper result 0 = result
    helper result power = helper (result + x^power) (power - 1)