import Data.List

main :: IO()
main = do
    print $ nodes [(1, 2), (1, 3), (2, 3), (2, 4)] == [1, 2, 3, 4]

    print $ neighbours 2 [(1, 2), (1, 3), (2, 3), (2, 4)] == [3, 4]
    print $ neighbours 4 [(1, 2), (1, 3), (2, 3), (2, 4)] == []

    print $ adjacencyList [(1, 2), (1, 3), (2, 3), (2, 4)] == [(1, [2, 3]), (2, [3, 4]), (3, []), (4, [])]

type Graph = [Edge]
type Edge = (Int, Int)
type Node = Int

nodes :: Graph -> [Node]
nodes g = nub $ concat [ [x, y] | (x, y) <- g]

neighbours :: Node -> Graph -> [Node]
neighbours n g = [ y | (x, y) <- g, x == n]

adjacencyList :: Graph -> [(Node, [Node])]
adjacencyList g = [ (n, neighbours n g) | n <- nodes g]