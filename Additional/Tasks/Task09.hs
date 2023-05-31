-- Week12 -> Task02 (for home)

main :: IO()
main = do
    print $ highestCapital [(Country "Bulgaria" "Sofia" [(City "Varna" 0 16), (City "Plovdiv" 120 14), (City "Sofia" 420 13)]), (Country "Germany" "Berlin" [(City "Munchen" 200 15), (City "Berlin" 150 12), (City "Ulm" 210 15)]), (Country "France" "Paris" [(City "Paris" 180 15), (City "Nice" 0 14), (City "Lyon" 500 13)])] == "Bulgaria"

highestCapital :: [Country] -> Name 
highestCapital cs = fst $ foldl1 (\ c1@(n1, h1) c2@(n2, h2) -> if h1 > h2 then c1 else c2) highest
 where
    highest = [(name, elevation) | (Country name capitalName cities) <- cs, (City cityName elevation _) <- cities, capitalName == cityName ]

type Name = String
type Capital = Name
type AvgYearlyTemperature = Double
type Elevation = Int
data City = City Name Elevation AvgYearlyTemperature
data Country = Country Name Capital [City]