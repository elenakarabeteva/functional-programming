main :: IO()
main = do
    print $ deepestNodesSum odd t1 == 7
    print $ deepestNodesSum even t2 == 4

data BTree = Empty | Node Int BTree BTree

t1 :: BTree
t1 = Node 1 (Node 2 (Node 4 (Node 7 Empty Empty) Empty) (Node 5 Empty Empty)) (Node 3 Empty (Node 6 Empty (Node 8 Empty Empty)))

t2 :: BTree
t2 = Node 1 (Node 2 (Node 4 Empty Empty) Empty) (Node 3 Empty Empty)

deepestNodesSum :: (Int -> Bool) -> BTree -> Int
deepestNodesSum p tree = sum $ filter p $ getLevel tree $ height tree - 1

getLevel :: BTree -> Int -> [Int]
getLevel Empty _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node value left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)

height :: BTree -> Int
height Empty = 0
height (Node _ left right) = 1 + max (height left) (height right)