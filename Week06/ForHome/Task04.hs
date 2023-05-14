import Data.List
main :: IO()
main = do
    print $ getAverageBalance (accounts1, people1) (\(_,_,city) -> city == "Burgas") == 24.95
    print $ getAverageBalance (accounts1, people1) (\(_,(n:_),_) -> n == 'P') == 18.85
    print $ getAverageBalance (accounts1, people1) (\ (n,_,_) -> n == 2) == 26.8

    print $ averageBalanceOfCities (accounts1,people1) ["Sofia","Gabrovo","Stara Zagora"] == 67.85
    print $ averageBalanceOfCities (accounts1, people1) ["Sofia"] == 67.85
    print $ averageBalanceOfCities (accounts1, people1) ["Burgas","Plovdiv"] == 23.62
    print $ averageBalanceOfCities (accounts1,people1) ["Pleven", "Burgas", "Sofia","Gabrovo","Stara Zagora"] == 39.25
    print $ averageBalanceOfCities (accounts1, people1) ["Sofia", "Gabrovo", "Burgas"] == 39.25

type Account = (Int, Int, Double)
type Person = (Int, String, String)

getAverageBalance :: ([Account],[Person]) -> (Person -> Bool) -> Double
getAverageBalance (accounts, people) f = roundTwoDigButWithMagic ((sum listOfBalance) / fromIntegral count)
 where
    getPairs = [(personId, balance) | (personId, _, _) <- filter (\x -> f x) people, (_, id, balance) <- accounts, personId == id]
    listOfBalance = [balance | (_, balance) <- getPairs]
    count = length listOfBalance

averageBalanceOfCities :: ([Account],[Person]) -> [String] -> Double
averageBalanceOfCities (accounts, people) cities = roundTwoDigButWithMagic ((sum listOfBalance) / fromIntegral count)
 where
    getPairs = [(personId, balance) | (personId, _, _) <- peopleFromCities, (_, id, balance) <- accounts, personId == id] 
    peopleFromCities = filter (\(_, _, city) -> elem city cities) people
    listOfBalance = [balance | (_, balance) <- getPairs]
    count = length listOfBalance

roundTwoDigButWithMagic :: Double -> Double
roundTwoDigButWithMagic = (/ 100) . fromIntegral . round . (* 100)

people1 :: [Person]
people1 = [(1, "Ivan", "Sofia"),(2, "Georgi", "Burgas"), (3, "Petar", "Plovdiv"),(4, "Petya", "Burgas")]

accounts1 :: [Account]
accounts1 = [(1, 1, 12.5),(2, 1, 123.2),(3, 2, 13.0),(4, 2, 50.2),(5, 2, 17.2),(6, 3, 18.3),(7, 4, 19.4)]
