-- Curried Functions -> functions that return functions

-- Can accept Int, Integer, Float, Double
add :: Num a => a -> a -> a

-- The Eq and Ord classes

-- (==) :: a -> a -> Bool -- Eq
-- (/=) :: a -> a -> Bool -- Eq

-- add :: Num a => a -> a -> a
-- Num is a type class, add accepts arguments of any type a that is an instance of the num class

-- Ord represents types that support order comparisons.

-- Eq represents types that support == comparison operation.