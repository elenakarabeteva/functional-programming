main :: IO()
main = do 
    print $ (speak "gate") 't' == "ga1e"
    print $ (speak "This is a test") 'i' == "Th11s 8s a test"
    print $ (speak "iiiiiii") 'i' == "6543210"
    print $ (speak "This is another test that has more words") 'a' == "This is 31nother test th16t h12s more words"

speak :: String -> (Char -> String)
speak str = (\ c -> foldl (\ acc (symb, i) -> if symb == c then acc ++ show i else acc ++ [symb]) [] (zip str [length str - 1, length str - 2 ..]))