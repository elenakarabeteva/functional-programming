import Data.List

main :: IO()
main = do
    print $ cP [Present, Late, Present, Absent, Present, Present, Present, Absent] == False
    print $ cP [Present, Late, Present, Late, Present, Late, Present, Absent, Late, Present] == True
    print $ cP [Present, Late, Present, Late, Late, Late, Present, Present, Absent, Present] == False

cP = canPass (1, 2)

type Misses = Int
type Lates = Int
type Criterion = (Misses, Lates)

data Attendance = Absent | Late | Present
 deriving (Eq)
type StudentRecord = [Attendance]

canPass :: Criterion -> (StudentRecord -> Bool)
canPass (miss, lates) = (\ records -> lessThanMiss records && lessThanLates records)
 where
    lessThanMiss = (<= miss) . length . filter (== Absent)
    lessThanLates = null . filter (\ ys -> elem Late ys && length ys > lates) . group