main :: IO()
main = do
    print $ countPalindromes 5 13 == 5 -- 6 7 8 9 11
    print $ countPalindromes 13 5 == 5 -- 6 7 8 9 11

isPalindrome :: Int -> Bool
isPalindrome number = reversed number == number

reversed :: Int -> Int
reversed number = helper number 0
 where 
    helper :: Int -> Int -> Int
    helper 0 result = result
    helper leftover result = helper (div leftover 10) (result * 10 + mod leftover 10)

countPalindromes :: Int -> Int -> Int
countPalindromes start finish = helper 0 (min start finish + 1)
 where 
    helper count number 
     | number == realEnd = count
     | isPalindrome number = helper (count + 1) (number + 1)
     | otherwise = helper count (number + 1)
    realEnd = max start finish 