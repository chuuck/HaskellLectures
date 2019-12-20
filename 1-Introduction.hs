------------------- Terminology --------------------------
{-|
    Functional Content -> Carry gramatical content of the syntax
    Implementational Content -> How the action should be achieved. 

    Functional Programming, programs contain two aspects in the specification:
        * High Level behaviour and low-level implementation
        * Humans tend to be better at the former, not not the latter

    Key Idea of Functional Programming
        * Concentrate on the high-level "Functional" behaviour when writing programs
        * Leave the memory management and implementation details to the compiler    

-}

sumsq :: Int -> Int
sumsq n = sum[ x^2 | x <- [0..n]]


quicksort :: [Int] -> [Int]
quicksort [] = []
quicksort (x:xs) = quicksort ls ++ [x] ++ quicksort rs
        where ls = [ a | a <- xs, a <= x]
              rs = [ a | a <- xs, a > x]
