main :: IO()
main = do
    print $ countOccurences 121 1 == 2
    print $ countOccurences 222 1 == 0
    print $ countOccurences 100 0 == 2
    print $ countOccurences 0 0 == 1

countOccurences :: Int -> Int -> Int
countOccurences 0 0 = 1
countOccurences n d = helper n d 1 
 where 
    helper 0 d count = 0
    helper n d count
     | mod n 10 == d = count + helper (div n 10) d count
     | otherwise = helper (div n 10) d count