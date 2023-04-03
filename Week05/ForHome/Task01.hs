main::IO()
main = do
    print $ getPrimesLC 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesLC 100 1 == [7,17,37,47,67,71,73,79,97]

    print $ getPrimesHOF 1 100 == [7,17,37,47,67,71,73,79,97]
    print $ getPrimesHOF 100 1 == [7,17,37,47,67,71,73,79,97]

getPrimesLC :: Int -> Int -> [Int]
getPrimesLC x y = [ number | number <- [min x y .. max x y], number > 1 && null [d | d <- [2 .. number - 1], mod number d == 0] && (elem '7' (show number))]

getPrimesHOF :: Int -> Int -> [Int]
getPrimesHOF x y = filter (\number -> number > 1 && null [d | d <- [2 .. number - 1], mod number d == 0] && (elem '7' (show number))) [min x y .. max x y]