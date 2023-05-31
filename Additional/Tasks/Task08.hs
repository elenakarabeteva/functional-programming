-- Week10 -> Task02 (for home)

main :: IO()
main = do
    print $ coldestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Germany"
    print $ coldestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 (-16)), (City "Plovdiv" 120 34), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 (-15)), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Germany"

average xs = sum xs / (fromIntegral $ length xs)

coldestCapital :: [Country] -> Name
coldestCapital cs = fst $ foldr1 (\ c1@(n1, t1) c2@(n2, t2) -> if t1 <= t2 then c1 else c2) avgCountires
 where
    avgCountires = [(name, average [tCity | (City _ _ tCity) <- cities]) | (Country name _ cities) <- cs]

type Name = String
type Capital = Name 
type AvgYearlyTemperature = Double
type Elevation = Int

data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]