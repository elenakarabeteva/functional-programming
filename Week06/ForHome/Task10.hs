import Data.Char
import Data.List

main :: IO()
main = do
    print $ checkNumber 2728 == (4,15)
    print $ checkNumber 31415 == (12,2)
    print $ checkNumber 121 == (2,2)

checkNumber :: Int -> (Int, Int)
checkNumber n = foldr (\(index, x) (evenSum, oddSum) -> if odd index then (evenSum, oddSum + digitToInt x) else (evenSum + digitToInt x, oddSum)) (0, 0) (zip [0..] (show n))