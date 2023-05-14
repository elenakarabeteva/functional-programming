main :: IO()
main = do
    print $ grandchildrenIncreased t1 == False
    print $ grandchildrenIncreased t2 == True

data BTree = Empty | Node Int BTree BTree

getLevel :: BTree -> Int -> [Int]
getLevel Empty _ = []
getLevel (Node value _ _) 0 = [value]
getLevel (Node value left right) k = getLevel left (k - 1) ++ getLevel right (k - 1)

grandchildrenIncreased :: BTree -> Bool
grandchildrenIncreased Empty = True
grandchildrenIncreased t@(Node value left right) = 
    all (> value) (getLevel t 2)
    && grandchildrenIncreased left 
    && grandchildrenIncreased right

t1 = Node 8 (Node 3 (Node 1 Empty Empty) (Node 4 Empty Empty)) (Node 10 (Node 9 Empty Empty) (Node 14 Empty Empty))

t2 = Node 8 (Node 3 (Node 9 Empty Empty) (Node 10 Empty Empty)) (Node 10 (Node 11 Empty Empty) (Node 14 Empty Empty))