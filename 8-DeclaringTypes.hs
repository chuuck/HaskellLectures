-- 8th lecture Declaring Types and Classes

-- Remember that String and [Char] are excatly the same thing, String provides better documentation

-- When creating your own type use the keyword "type" like this "type Pos = (Int, Int)"

type Pos = (Int, Int)
origin :: Pos
origin = (0, 0)

-- association -> list of pairs of some key type and some value type

type Assoc k v = [(k,v)]
find :: Eq k => k -> Assoc k v -> [v]
find k t = [v | (k', v) <- t, k == k'] -- like HashMaps in Java

-- Nested type synonyms are allowed!

type Translsation = Pos -> Pos

-- Making new types where specific Int is not accepted (to solve this we need to use Constructors!)
-- Constructor is a name tag that identifies the values in a type, always must begin with an upper case letter

data Foo = F Int
-- >:type F 5 will return F 5 :: Foo

-- Type Safety property -> functions do not accept values that they are not designed to accept

data Day = Mon | Tue | Wed | Thu | Fri | Sat | Sun -- "or" seperatir | that allows us to write the possible different values that live in the type

isWeekend :: Day -> Bool
isWeekend Sat = True
isWeekend Sun = True
isWeekend _ = False

-- The constructors in a new type may take multiple parameters (WORTH RE-READING THIS BEFORE EXAM!)
data Shape = Circle Float | Rect Float Float

{-|
    You could also rewrite the previous constructor like this
        Circle :: Float -> Shape
        Rect :: Float -> Float -> Shape

-}

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y -- Input area (Rect 2 1) will return 2, or Input area (sqaure 1) will return 1

-- Maybe value can eith be Just something or Nothing
-- e.g. if something is not returned then return Nothing, if it is found then return Just something

-- Example from learnyouahaskell.com
findKey :: (Eq k) => k -> [(k,v)] -> Maybe v  
findKey key [] = Nothing  
findKey key ((k,v):xs) = if key == k  
                            then Just v  
                            else findKey key xs

-- Modified example to understand Maybe, Just and Nothing
find' :: Eq k => k -> Assoc k v -> Maybe [v]
find' k [] = Nothing -- Catches error if list is empty, previous exmaple didn't
find' k t = Just [v | (k', v) <- t, k == k'] 

{-|
Take from reddit: 
    data : zero or more constructors, each can contain zero or more values
    newtype: similar to above but exactly one constructor and one value in that constuctor, and has the exact same runtime representation as the value that it stores
    type: type synonym, compiler more or less forgets about it once it is expanded
-}

-- Dont fully understand newtype yet

-- $ operator is for avoid pantheses. Anyting appearing after it will take precedence

-- Recursive Types
-- This indicates that a list of a's is either an empty list or a cons cell containing an 'a' (the "head" of the list) and another list (the "tail")
{-|
    Cons is another word for : (learnyouahaskell.com)

    We called our Cons constructor in an infix manner so you can see how it's just like :. 
    Empty is like [] and 4 `Cons` (5 `Cons` Empty) is like 4:(5:[]).

-} 

data List a = Empty | Cons a (List a)

-- A tree is either an empty tree or it's an element that contains some value and two trees
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)  

-- function to make a node that has something and then two empty sub-trees
singleton :: a -> Tree a  
singleton x = Node x EmptyTree EmptyTree  
  
treeInsert :: (Ord a) => a -> Tree a -> Tree a  
treeInsert x EmptyTree = singleton x  
treeInsert x (Node a left right)   
    | x == a = Node x left right  
    | x < a  = Node a (treeInsert x left) right  
    | x > a  = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool  
treeElem x EmptyTree = False  
treeElem x (Node a left right)  
        | x == a = True  
        | x < a  = treeElem x left  
        | x > a  = treeElem x right

-- Remember different classes!! Ord, Eq, etc..
--https://www.haskell.org/onlinereport/basic.html










