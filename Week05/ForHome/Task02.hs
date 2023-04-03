main :: IO()
main = do
    print $ getPalindromes 132465 == 8
    print $ getPalindromes 654546 == 8
    print $ getPalindromes 100001 == 100012
    print $ getPalindromes 21612 == 21614
    print $ getPalindromes 26362 == 26364

    
isPalindrome :: Int -> Bool
isPalindrome n = n == (read . reverse . show) n

getPalindromes :: Int -> Int
getPalindromes number
 | null list = 0
 | otherwise = head list + last list
 where
    divisors = filter (\x -> x > 1 && mod number x == 0) [2 .. number]
    list = filter isPalindrome divisors

