main :: IO()
main = do 
    print $ minDepthGreenNode colorTree
data Color = Red | Green | Blue
 deriving (Show, Eq)
data Tree = Empty | Node Color Tree Tree

minDepthGreenNode :: Tree -> Int
minDepthGreenNode Empty = -1
minDepthGreenNode (Node color left right)
    | color == Green = 0
    | otherwise = 1 + min (minDepthGreenNode left) (minDepthGreenNode right)
   
colorTree :: Tree
colorTree = Node Red (Node Blue (Node Green Empty Empty) Empty) (Node Red (Node Blue Empty Empty) (Node Red Empty (Node Green Empty Empty)))