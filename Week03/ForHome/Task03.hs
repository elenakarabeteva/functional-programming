main :: IO()
main = do
    print $ calcSeriesSum 1 0 == -2.0 -- x = 1, n = 0
    print $ calcSeriesSum 1 1 == -0.6666666666666667
    print $ calcSeriesSum 1 2 == -1.2000000000000002
    print $ calcSeriesSum 1 3 == -1.047619047619048
    print $ calcSeriesSum 1 4 == -1.0814814814814817
    print $ calcSeriesSum 1 5 == -1.0753246753246755
    print $ calcSeriesSum 1 6 == -1.0762718762718764

multiplication :: Int -> Int
multiplication number = helper 1 0
 where 
    helper :: Int -> Int -> Int
    helper result count 
     | count == number + 1 = result
     | otherwise = helper (result * (2 * count + 1)) (count + 1)

calcSeriesSum :: Int -> Int -> Double
calcSeriesSum x 0 = -2.0
calcSeriesSum x n = ((-2)^(n + 1) * fromIntegral x^n) / (fromIntegral $ multiplication n) + calcSeriesSum x (n - 1)