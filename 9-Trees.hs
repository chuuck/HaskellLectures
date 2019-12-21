{-|
    Red black tree:
        1) The root is Black
        2) All leaves are Black
        3) If a node is Red its children are Black
        4) Every path from any node to a leaf contains the same number of Black nodes
-}

-- Abstract Syntax Trees -> trees that represent the structure of a program expression and remove unnecessary
--                             syntatic information (e.g. parentheses)

data Expr = Val Int | Add Expr Expr | Sub Expr Expr

eval :: Expr -> Int
eval (Val n) = n
eval (Add e1 e2) = eval e1 + eval e2 
eval (Sub e1 e2) = eval e1 - eval e2

-- AST of propositional logic formula
data Prop = Const Bool 
        | Var Char 
        | Not Prop
        | And Prop Prop
        | Imply Prop Prop

-- $ is infix "aplication". It is useful for avoiding extra parentheses

data Subst = Assoc Char Bool

-- I DIDN'T UNDERSTAND EVALUATING PROPOSITIONS SLIDES

{-|
eval' :: Subst -> Prop -> Bool
eval' (Const b) = b
eval' (Var c) = find c s
eval' (Not p) = not $ eval' s p
eval' (And p q) = eval' s p && eval' s q
eval' (Imply p q) = eval' s p <= eval' s q
-}

-- map the function upper that converts a string to upper case across all nodes in the tree
data LTree a = Leaf a | Node (LTree a) (LTree a)

lTMap :: (a -> b) -> LTree a -> LTree b
lTMap g (Leaf x) = Leaf (g x)
lTMap g (Node l r) = Node (lTMap g l) (lTMap g r)


-- Same principle with different data types
--data ITree a = Leaf | Node a (ITree a) (ITree a)

{-|
iTMap :: (a -> b) -> ITree a | ITree b 
iTMap g (Leaf) = Leaf
iTMap g (Node x l r) = Node (g x) (iTMap g l) (iTMap g r)
-}


-- Same principle with different data types
--data MTree a = Node a [MTree a]
{-|
mTMap :: (a -> b) -> MTree a -> MTree b
mTMap g (Node x ts) = Node (g x) (map (mTMap g) ts)
-}

-- Functors ---

-- Functor typeclass represents the mathematical functor: a mapping between categories in the context of category theory. 
-- In practice a functor represents a type that can be mapped over

class Functor' f where  
        fmap :: (a -> b) -> f a -> f b

instance Functor' [] where  
        fmap = map

instance Functor' Maybe where  
        fmap f (Just x) = Just (f x)  
        fmap f Nothing = Nothing  

-- Haskell defines functor for Maybe, Either, Lists

data Tree a = Tip a | Branch (Tree a) (Tree a) deriving Show

-- On input 
--      x = Branch (Tip 4) (Branch (Tip 5) (Tip 6))
--      Main.fmap (+3) x

-- Output : Branch (Tip 7) (Branch (Tip 8) (Tip 9))

-- In my own words Functors are a way to change wrapped values. Good source: https://www.youtube.com/watch?v=xCut-QT2cpI

-- Useful link that explains what "." operator is https://mail.haskell.org/pipermail/beginners/2012-February/009457.html

instance Functor' Tree where
        fmap func (Tip a) = Tip (func a)
        fmap func (Branch left right) =  Branch (Main.fmap func left) (Main.fmap func right)

{-|
        Functor Laws
                fmap id = id (When performing the mapping operation, if the values in the functor are mapped to themselves the result
                        will be an unmodified functor)
                
                fmap (f.g) == fmap f . fmap g (If two sequential mapping operations are perfomred one after the other using two functions,
                        the resilt should be the same as a single mapping operation with one function that is equivalent to 
                        applying the first function to the result of the second)
-}


-- Moving around Tree (Idea: suppose we have a Tree structure and want to modify some part of it)
data Tree_D a = Leaf_D | Node_D a (Tree_D a) (Tree_D a)

data Direction = L | R
type Directions = [Direction]

elemAt :: Directions -> Tree_D a -> a
elemAt (L:ds) (Node_D _ l _) = elemAt ds l -- ds list of directions
elemAt (R:ds) (Node_D _ _ r) = elemAt ds r
elemAt [] (Node_D x _ _) = x


-- Following a path is all well and good but it doesn't tell us where we are in the structure
-- Let's call our Directions type a Trail instead and write function that let us follow directions and record the trail we have traversed

type Trail = [Direction]

goLeft :: (Tree_D a, Trail) -> (Tree_D a, Trail)
goLeft (Node_D _ l _ , ts) = (l, L:ts)

goRight :: (Tree_D a, Trail) -> (Tree_D a, Trail)
goRight (Node_D _ _ r, ts) = (r, R:ts)
-- This means we can specify a path by using a sequence of goLeft/goRight function calls

