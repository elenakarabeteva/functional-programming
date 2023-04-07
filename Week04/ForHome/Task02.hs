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
isPresentRecNonPM number list
 | null list = False
 | otherwise = number == head list || isPresentRecNonPM number (tail list)

isPresentRecPM :: Int -> [Int] -> Bool
isPresentRecPM _ [] = False
isPresentRecPM number (x:xs) = number == x || isPresentRecPM number xs

isPresentFunc :: Int -> [Int] -> Bool
isPresentFunc number xs = elem number xs