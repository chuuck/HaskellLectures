squareList list = [ x^2 | x <- list]

makeTuple list_x list_y = [ (x,y) | x <- list_x, y <- list_y] -- combines all possible variations of tuples from list_x and list_y (REMEMBER ORDER MATTERS!)

flatten :: [[a]] -> [a]
flatten xss = [ x | xs <- xss, x <- xs] -- flattens a list

zip' :: [a] -> [b] -> [(a,b)] -- iterates through two lists simultaneously and combines them, if one list reaches the end stops
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

pairs :: [a] -> [(a,a)] -- creates list of tuples, xs - input list, tails xs - list without head
pairs xs = zip xs (tail xs)

sorted :: Ord a => [a] -> Bool -- checks if list is sorted
sorted xs = and [ x<= y | (x,y) <- pairs xs] -- and returns true if [True, True, True], returns false if [True, True, True, False]

positions :: Eq a => a -> [a] -> [Int] -- returns positions of the element that we are looking for
positions x xs = [ index | (x', index) <- zip' xs [0..], x==x'] -- pairs every element in the list with their position and then we check if tuple element is equal to what we are looking for