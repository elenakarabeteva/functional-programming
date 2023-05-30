main :: IO()
main = 
    let
        tree = (Node 3 (Node 1 (Node 0 Empty Empty) (Node 2 Empty Empty)) (Node 4 Empty (Node 5 Empty (Node 6 Empty Empty))))
    in do
    print $ treeDepth Empty
    print $ treeDepth tree
    print $ treeCountLeaves Empty
    print $ treeCountLeaves tree
    print $ treeSum Empty
    print $ treeSum tree
    print $ 2 `treeElem` Empty
    print $ 2 `treeElem` tree
    print $ 7 `treeElem` tree
    print $ treeNodes tree
    print $ tree `treeNodesAtLevel` 0
    print $ tree `treeNodesAtLevel` 1
    print $ tree `treeNodesAtLevel` 2
    print $ tree `treeNodesAtLevel` 3
    print $ tree `treeNodesAtLevel` 4

data BTree a = Empty | Node a (BTree a) (BTree a)
 deriving (Read, Show)

treeDepth :: (Num a, Ord a) => BTree a -> a
treeDepth Empty = 0
treeDepth (Node value left right) = 1 + max (treeDepth left) (treeDepth right)

treeCountLeaves :: (Num a) => BTree a -> a
treeCountLeaves Empty = 0
treeCountLeaves (Node value Empty Empty) = 1
treeCountLeaves (Node value left right) = treeCountLeaves left + treeCountLeaves right 

treeSum :: (Num a) => BTree a -> a
treeSum Empty = 0
treeSum (Node value left right) = value + treeSum left + treeSum right

treeElem :: (Eq a) => a -> BTree a -> Bool
treeElem _ Empty = False
treeElem x (Node value left right) = (x == value) || treeElem x left || treeElem x right

treeNodes :: BTree a -> [a]
treeNodes Empty = []
treeNodes (Node value left right) = treeNodes left ++ [value] ++ treeNodes right

treeNodesAtLevel :: (Num a, Eq a) => BTree a -> Int -> [a]
treeNodesAtLevel Empty _ = []
treeNodesAtLevel (Node value _ _) 0 = [value]
treeNodesAtLevel (Node value left right) k = treeNodesAtLevel left (k - 1) ++ treeNodesAtLevel right (k - 1)