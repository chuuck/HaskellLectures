abs :: (Ord a, Num a) => a -> a

{-|
    Usage of Guards
        * Otherwise is sugar for Tree
        * Guards are evaluated top-down
        * You are alowed as many guards as you like
-}
 
abs n 
    | n >= 0 = n
    | otherwise = (-n)

----------- Lambda Calculus ---------------

-- NEXT TWO ARE THE SAME

myMapFunc list = map (+3) list
myMapFunc2 list = map (\x -> x + 3) list

-- Another cool way of using lambda

sumPair list = map (\(a,b) -> a + b) list -- Input [(1,2),(3,5),(6,3),(2,6),(2,5)]  