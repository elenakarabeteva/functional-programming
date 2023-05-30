main :: IO()
main = do
    print $ makeList [1, 2, 3]
    print $ unList (1 `Cons` (2 `Cons` (3 `Cons` Nil)))
    print $ listEmpty (1 `Cons` (2 `Cons` (3 `Cons` Nil)))
    print $ listHead (1 `Cons` (2 `Cons` (3 `Cons` Nil)))
    print $ listTail (1 `Cons` (2 `Cons` (3 `Cons` Nil))) 
    print $ listMap (+1) (1 `Cons` (2 `Cons` (3 `Cons` Nil)))
    print $ listFilter even (1 `Cons` (2 `Cons` (3 `Cons` Nil)))

data List a = Nil | Cons a (List a)
 deriving (Read, Show)

makeList :: [a] -> List a
makeList [] = Nil
makeList (x:xs) = Cons x (makeList xs)

unList :: List a -> [a]
unList Nil = []
unList (Cons x xs) = x : unList xs

listEmpty :: List a -> Bool
listEmpty Nil = True
listEmpty _ = False

listHead :: List a -> a
listHead (Cons x xs) = x

listTail :: List a -> List a
listTail (Cons _ xs) = xs

listMap :: (a -> a) -> List a -> List a
listMap f Nil = Nil
listMap f (Cons x xs) = Cons (f x) (listMap f xs)

listFilter :: (a -> Bool) -> List a -> List a
listFilter _ Nil = Nil
listFilter f (Cons x xs) = if (f x) then Cons x (listFilter f xs) else listFilter f xs