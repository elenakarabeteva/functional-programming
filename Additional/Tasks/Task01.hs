main :: IO()
main = do
    print $ (Node 5 Nil Nil)
    print $ Person 15 "n1" == Person 15 "n1"
    print $ roundTwoDigit 5.34534

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