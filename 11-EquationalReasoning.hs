-- Proving not (not b) = b for any boolean value b

not :: Bool -> Bool
not True = False
not False = True

-- We must be wary when reasoning with cases though 
-- as Haskell’s semantics for defining functions are such that the order in which we write down the cases is significant.
isZero :: Int -> Bool
isZero 0 
    | True = True

isZero n
    | n /= 0 = False


data Nat = Zero | Succ Nat

add :: Nat -> Nat -> Nat
add Zero m = m
add (Succ n) m = Succ (add n m)

