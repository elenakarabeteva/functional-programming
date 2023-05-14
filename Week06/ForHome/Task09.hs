import Data.Char

main :: IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD" -- dabAcCaCBAcCcaDD -> dabAaCBAcCcaDD -> dabCBAcCcaDD -> dabCBAcaDD

reduceStr :: String -> String
reduceStr [] = []
reduceStr (x:xs) = reverse $ helper [x] xs
 where
    helper :: String -> String -> String
    helper yy [] = yy
    helper (y:yy) (z:zz)
     | areDuplicate y z = helper yy zz
     | otherwise = helper (z:y:yy) zz

areDuplicate :: Char -> Char -> Bool
areDuplicate x y = toLower x == toLower y && (isLower x && isUpper y || isUpper x && isLower y)  