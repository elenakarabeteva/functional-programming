main :: IO()
main = do
    print $ isPresentRecNonPM 0 [] == False
    print $ isPresentRecNonPM 0 [1, 2, 3] == False
    print $ isPresentRecNonPM 0 [0, -1, 2] == True

    print $ isPresentRecPM 0 [] == False
    print $ isPresentRecPM 0 [1, 2, 3] == False
    print $ isPresentRecPM 0 [0, -1, 2] == True

    print $ isPresentFunc 0 [] == False
    print $ isPresentFunc 0 [1, 2, 3] == False
    print $ isPresentFunc 0 [0, -1, 2] == True

isPresentRecNonPM :: Int -> [Int] -> Bool
isPresentRecNonPM number xs
 | null xs = False
 | number == head xs = True
 | otherwise = isPresentRecNonPM number (tail xs)

isPresentRecPM :: Int -> [Int] -> Bool
isPresentRecPM _ [] = False
isPresentRecPM number xs = number == head xs || isPresentRecPM number (tail xs)

isPresentFunc :: Int -> [Int] -> Bool
isPresentFunc number xs = elem number xs