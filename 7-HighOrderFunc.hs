-- High-order functions -> functin that takes a function as an argument or returns a function as a result

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map' f xs

mapSimple :: (a -> b) -> [a] -> [b]
mapSimple f xs = [f x| x <- xs]

--sremoveMap f xs = [ x | x <- xs, f x]

-- filter -> takes out all the elements from the list that satisfy predicate
filter' :: (a -> Bool) -> [a] -> [a]
filter' p [] = []
filter' p (x:xs)
        | p x = x : filter' p xs
        | otherwise = filter' p xs

-- foldl

my_foldl_1 = foldl (/) 64 [4,2,4]
my_foldl_2 = foldl (+) 0 [3, 5, 2, 1]

{-|
foldl

    64 / 4 = 16
    16 / 2 = 8
    8 / 4 = 2

    0 + 3 = 3
    3 + 5 = 8
    8 + 2 = 10
    10 + 1 = 11

-}

my_foldr_1 = foldr (-) 54 [10, 11]
my_foldr_2 = foldr (/) 2 [8,12,24,4]

{-|
foldr

    11 - 54 = -43
    10 - (-43) = 53

    4 / 2 = 2
    24 / 2 = 12
    12 / 12 = 1
    8 / 1 = 8
-}
