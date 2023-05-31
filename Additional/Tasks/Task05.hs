-- Week06 -> Task06 (for home)

main :: IO()
main = do
    print $ (getOddCompositionValue [(\x -> x + 1),(\x -> x * 2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2
    print $ (getOddCompositionValue [(+1),(*2),(\x -> x - 1), (\x -> div x 2)]) 2 == 2
    print $ (getOddCompositionValue [id, (5-), (\x -> mod x 2)]) 15 == 1

getOddCompositionValue :: [(Int -> Int)] -> (Int -> Int)
getOddCompositionValue fs = (\ x -> foldr (\ (index, f) acc -> if odd index then f acc else acc) x $ zip [1 ..] fs)