main :: IO()
main = do
    print $ isArithmentic [3] == True
    print $ isArithmentic [3, 5] == True
    print $ isArithmentic [1, 2, 3, 4, 5] == True
    print $ isArithmentic [3, 5, 7, 9, 11] == True
    print $ isArithmentic [3, 5, 8, 9, 11] == False
    print $ isArithmentic [3, 5, 9, 9, 11] == False

isArithmentic :: [Int] -> Bool
isArithmentic [] = True
isArithmentic xs = all (== head difference) difference
 where
    difference = zipWith (-) (tail xs) xs