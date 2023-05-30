main :: IO()
main = do
    print $ onlyArithmentic [[3], [1, 2, 3, 4, 5], [3, 5, 8, 9, 11]]  == [[3], [1, 2, 3, 4, 5]]

onlyArithmentic :: [[Int]] -> [[Int]]
onlyArithmentic xss = filter arithmentic xss

arithmentic :: [Int] -> Bool
arithmentic [] = True
arithmentic [_] = True
arithmentic [x, y] = True
arithmentic (x:y:z:list) = (x - y) == (y - z) && arithmentic (y:z:list)