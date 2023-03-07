main :: IO()
main = do
    print $ powRec 2 5 == 32
    print $ powRec 15 3 == 3375

    print $ powIter 2 5 == 32
    print $ powIter 15 3 == 3375

    --print $ powRec 2 0 == 1 -- should return an error (according to the task description)

powRec :: Double -> Int -> Double
powRec _ 0 = error "must be greater than 0" 
powRec x 1 = x 
powRec x n = x * powRec x (n - 1)

powIter :: Double -> Int -> Double
powIter _ 0 = error "must be greater than 0" 
powIter x n = helper x n
 where
    helper result 1 = result
    helper result n = helper (x * result) (n - 1) 
