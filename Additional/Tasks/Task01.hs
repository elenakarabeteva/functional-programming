main :: IO()
main = do
    print $ (Node 5 Nil Nil)
    print $ Person 15 "n1" == Person 15 "n1"
    print $ roundTwoDigit 5.34534
    print $ addMatrices [[1,2],[3,4]] [[4,3],[2,1]]
    print $ nullify [[1,2,9,0],[3,6,3,4],[3,9,4,3],[2,0,3,1]]

-- data BTree = Nil | Node Int BTree BTree
-- data Day = Monday | ...

data BTree a = Nil | Node a (BTree a) (BTree a)
 deriving (Show)

type Age = Int
type Name = String

data Person = Person Age Name
 deriving (Eq)

roundTwoDigit :: Double -> Double
roundTwoDigit = (/100) . fromIntegral . round . (*100)

addMatrices :: (Num a, Eq a) => [[a]] -> [[a]] -> [[a]]
addMatrices [] [] = []
addMatrices (m:ms) (n:ns) = zipWith (+) m n : addMatrices ms ns

cleanCol :: (Num a, Eq a) => [a] -> [a]
cleanCol xs = if elem 0 xs then map (*0) xs else xs


nullify :: (Num a , Eq a) => [[a]] -> [[a]]
nullify matrix@([]:_) = matrix
nullify matrix = zipWith (\ x xs -> x:xs) (cleanCol (map head matrix)) (nullify (map tail matrix))