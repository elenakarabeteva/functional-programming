main :: IO()
main = do
    print $ cook [ApplePie, ApplePie, Burger, Chicken, Chicken, ApplePie]  == [Sunny, Rainy, Rainy, Sunny, Rainy]
    print $ cook [ApplePie, Burger, Chicken, Chicken, ApplePie, Burger] == [Rainy,Rainy,Sunny,Rainy,Rainy]

data Food = ApplePie | Burger | Chicken
 deriving (Show, Eq)

data Weather = Sunny | Rainy 
 deriving (Show, Eq)

cook :: [Food] -> [Weather]
cook fs = map (\ (food1, food2) -> if food1 == food2 then Sunny else Rainy) $ zip fs (tail fs)