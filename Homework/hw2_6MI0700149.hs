import Data.List
import Data.Char

main :: IO()
main = do
    --Task 1
    print $ getNameLengthColor db ((== 'Y'), (> 106)) == [("Pretty Woman",119),("The Man Who Wasn't There",116),("Logan's run",120),("Empire Strikes Back",111),("Star Trek",132),("Star Trek: Nemesis",116)]
    print $ getNameLengthColor db ((== 'Y'), (> 237)) == []
    print $ getNameLengthColor db ((== 'Y'), (> 238)) == []
    print $ getNameLengthColor db ((== 'N'), (< 133)) == [("Terms of Endearment",132)]
    print $ getNameLengthColor db ((== 'N'), (< 300)) == [("Terms of Endearment",132)]

    -- Task 2
    print $ (getStudios db) [2001] == [("USA Entertainm.","Stephen Spielberg"),("Buzzfeed Entertainm.","Christian Baesler")]
    print $ (getStudios db) [2002] == [("Buzzfeed Entertainm.","Christian Baesler")]
    print $ (getStudios db) [1990] == [("Disney","Merv Griffin"),("Buzzfeed Entertainm.","Christian Baesler")]
    print $ (getStudios db) [1990, 2001, 1976] == [("Disney","Merv Griffin"),("USA Entertainm.","Stephen Spielberg"),("Buzzfeed Entertainm.","Christian Baesler")]
    print $ (getStudios db) [1979, 2002] == [("Buzzfeed Entertainm.","Christian Baesler")]

--Task 1
getNameLengthColor :: MovieDB -> ((Char -> Bool), (Int -> Bool)) -> [(Title, Length)]
getNameLengthColor (movies, _, _) f = filter (\(_, length) -> length /= longest && length > 0 && snd f length) getMovieTitleAndLengthInColor
 where
    getMovieTitleAndLengthInColor = map (\(title, _, length, _, _) -> (title, length)) $ filter (\(_, _, _, inColor, _) -> fst f inColor) movies
    longest = foldl (\maxLen (_, length) -> if length > maxLen then length else maxLen) 0 getMovieTitleAndLengthInColor

--Task 2
getStudios :: MovieDB -> ([Year] -> [(StudioName, Name)])
getStudios (movies, studios, execs) years = moviesInStudio
 where
    moviesInStudio = [(studioName, producerName) | (studioName, producerName) <- getStudioNameProducerName, 
        let nubYears = nub [year | (_, year, _, _, studio) <- movies, studioName == studio] in length (combineLists years nubYears) > 0 && length nubYears == 1 || 
        not (elem studioName $ map (\(_, _, _, _, studio) -> studio) movies)]
    combineLists xs ys = foldr (\y acc -> if elem y xs then y:acc else acc) [] ys
    getStudioNameProducerName = [(studioName, producerName) | (studioName, sProducerID) <- studios, (producerName, pProducerID, _) <- execs, sProducerID == pProducerID]

type Title = String
type Year = Int
type Length = Int
type InColor = Char
type StudioName = String

type Name = String
type ProducerID = Int
type Networth = Integer

type Movie = (Title, Year, Length, InColor, StudioName)
type Studio = (Name, ProducerID)
type MovieExec = (Name, ProducerID, Networth)

type MovieDB = ([Movie], [Studio], [MovieExec])

studios :: [Studio]
studios = [("Disney", 199),("USA Entertainm.", 222),("Fox", 333),("Paramount", 123),("MGM", 555),("Buzzfeed Entertainm.", 42)]

movieExecs :: [MovieExec]
movieExecs = [("George Lucas", 555, 200000000),("Ted Turner", 333, 125000000),
    ("Stephen Spielberg", 222, 100000000),("Merv Griffin", 199, 112000000),
    ("Calvin Coolidge", 123, 20000000),("Christian Baesler", 42, 420000)]

movies :: [Movie]
movies = [("Pretty Woman", 1990, 119, 'Y', "Disney"),("The Man Who Wasn't There", 2001, 116, 'Y', "USA Entertainm."),
    ("Logan's run", 1976, 120, 'Y', "Fox"),("Star Wars", 1977, -1, 'N', "Fox"),("Star Wars 2", 1977, 238, 'N', "Fox"),
    ("Empire Strikes Back", 1980, 111, 'Y', "Fox"),("Star Trek", 1979, 132, 'Y', "Paramount"),("Star Trek: Nemesis", 2002, 116, 'Y', "Paramount"),
    ("Terms of Endearment", 1983, 132, 'N', "MGM"),("The Usual Suspects", 1995, 106, 'Y', "MGM"),("Gone With the Wind", 1938, 238, 'Y', "MGM"),
    ("Gone With the Wind 2", 1938, 238, 'Y', "MGM"),("The Fellowship of the Ring", 2001, -1, 'Y', "USA Entertainm.")]

db :: MovieDB
db = (movies, studios, movieExecs)