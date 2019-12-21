{-|
-- Three approaches to Graphs
    1) Using indexed collections of Nodes, Edges
    2) Using a structured data type with cyclic dependecies
    3) An inductive approach using graph contructors
-}

-- 1. Using indexed collections of Nodes, Edges.
{-|
    Haskell has a stable Data.Graph package that is stable and dates from 20 years ago
        type Table a = Array Vertex a
        type Graph = Table [Vertex]
    
    The graphs are intended to be immutable (unchanging)
    Type types don't allow for weighted graphs
    The performance is very slow compared to C
    The graphs are not structural so all algorithms are implemented
        essentially as traversal across Arrays.
-}

-- 2. Using a structured data type with cyclic dependencies
-- Doubly Linked Lists

data DLList a = Empty | Node a (DLList a) (DLList a)

mkDLList :: [a] -> DLList a
mkDLList [] = Empty
mkDLList [x] = Node x Empty Empty
mkDLList [x1, x2] = let node1 = Node x1 Empty node2
                        node2 = Node x2 node1 Empty
                    in node1
mkList [x1, x2, x3] = let node1 = Node x1 Empty node2
                          node2 = Node x2 node1 node3
                          node3 = Node x3 node2 Empty
                    in node1

-- Cyclic Definitions of Graphs
-- Idea: to get started we'll restrict ourselves to graphs where each node has a single outgoing edge and generalise from this later 
-- (see graph table in slide 15)

data Graph a = GNode a (Graph a)
mkGraph :: [(a, Int)] -> Graph a
mkGraph table = table' !! 0
    where table' = map (\(x,ns)) -> GNode x (map (table' !!) ns) table

-- 3. Inductive Graphs

