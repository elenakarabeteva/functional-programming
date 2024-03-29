main :: IO()
main = do
    print $ maxSumSubT t1 == 5
    print $ maxSumSubT t2 == 2

data BTree a = Nil | Node a (BTree a) (BTree a)

maxSumSubT :: (Num a, Ord a) => BTree a -> a
maxSumSubT Nil = 0
maxSumSubT t@(Node _ left right) = maximum [sumTree t, sumTree left, sumTree right]

sumTree :: (Num a) => BTree a -> a
sumTree Nil = 0
sumTree (Node value left right) = value + sumTree left + sumTree right

t1 :: (Num a) => BTree a
t1 = Node 3 (Node 0 Nil Nil) (Node 2 (Node 0 Nil Nil) Nil)

t2 :: (Num a) => BTree a
t2 = Node (-3) (Node 0 Nil Nil) (Node 2 (Node 0 Nil Nil) Nil)