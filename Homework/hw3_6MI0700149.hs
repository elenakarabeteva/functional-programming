main :: IO()
main = do
    -- Task 1
    print $ prune (T 1 [T 2 [T 3 []], T 4 [T 5 [T 6 []]], T 7 [T 8 [], T 9 [T 10 [T 11 []]]]]) == T 1 [T 2 [T 3 []], T 4 [T 5 []], T 7 [T 8 [], T 9 [T 10 []]]]

    -- Task 2

data NTree a = T a [(NTree a)]
 deriving (Show, Eq)

prune :: (Eq a) => NTree a -> NTree a
prune tree = pruneTree tree (concatMap (\ (x:xs) -> tail xs) (filter (\ xs -> length xs > 2) (getPathsFromParentsToChildren tree)))
 where
    getPathsFromParentsToChildren (T parent []) = [[parent]]
    getPathsFromParentsToChildren (T parent [child]) = map (parent :) (getPathsFromParentsToChildren child)
    getPathsFromParentsToChildren (T parent children) = concatMap getPathsFromParentsToChildren children
    pruneTree (T parent children) nodes
     | elem parent nodes = T parent (map (\ child -> pruneTree child nodes) children)
     | otherwise = T parent (map (\ child -> pruneTree child nodes) (filter (\ (T ch _) -> notElem ch nodes) children)) 