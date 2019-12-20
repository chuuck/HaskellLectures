-- Factorial of an int

fac 0 = 1
fac x = x * fac (x-1)

-- Product of all elements in a list
product' :: Num a => [a] -> a 
product' [] = 1
product' (x:xs) = x * product' xs

-- Reversing a list
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- Drops the first nth elements
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop (n-1) xs

-- Returns even place elements from the list
evens :: [a] -> [a]
evens [] = []
evens (x:xs) = x : odds xs

-- Returns odd place elements from the list
odds :: [a] -> [a]
odds [] = []
odds (x:xs) = evens xs

-- 5 Steps to make better recursion (IMPORTANT!!!!)
{-|
    1) Define the Type
    2) Enumerate the Cases
    3) Define the simple (base) cases
    4) Define the other (inductive) cases
    5) Generalise and Simplify

    * Look at slide to see examples of every step
-}

-- Tail recursion (Need more trainging to better better write tail recursion)
fac' :: Int -> Int -> Int
fac' acc 0 = acc
fac' acc n = fac' (n*acc) (n-1)

