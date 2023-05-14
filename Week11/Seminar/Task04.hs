main :: IO()
main = do
    print $ insert (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))) 13 == (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil)))

    print $ (numberTreeAfter == numberTreeBefore) == True

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Eq, Show)

insert :: (Ord a) => BTree a -> a -> BTree a
insert Nil newValue = Node newValue Nil Nil
insert (Node value left right) newValue
 | value < newValue = Node value left (insert right newValue)
 | otherwise = Node value (insert left newValue) right

numberTreeBefore = Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))

numberTreeAfter = foldl insert Nil [10, 5, 3, 7, 15, 18]