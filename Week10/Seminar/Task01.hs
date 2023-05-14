main :: IO()
main = do
    print $ (TwoD 5 6) /= TwoD 6 7
    print $ ThreeD 5 6 7 /= TwoD 6 7
    print $ f "TwoD 5.2 6"

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Read)

f :: String -> Point Double
f str = read str