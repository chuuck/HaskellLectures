-- Evalation -> what value an expression produces under computation

-- Reduction -> individual step of evaluation

-- Reducible expression (redex for short) -> an expression which matches the left-hand-side of some reduction rule or definition

{-|
    For example:
        fac 0 = 1
        fac n = n * fac (n - 1)

    That would mean that "fac 3" is a redex. 

    Another example:
        not (x == 0) is a redex becasue we have the function not applied to the expression x == 0

        (sqrt . negate) 45 is not itself a redex as the left hand side needs to be evaluated to a function first, it
        does, however, contain the redex (sqrt .) where. is the infix composition operator
-}

-- Evaluation strategy -> given that there are multiple redexes in the expression evaluation strategy is used to determine which reduce first
-- For any expression we call a redex innermost if it contains no other redex
-- For any exprexxion w ecall a redex outermost if it is not contained in any redex

{-
    For example:
        mult (add 1 2) (add 3 4)
            (add 1) and (add 3) expressions are innermost redexes
            mult (add 1 2) expression is an outermost redex
-}

-- This leads to two different evaluation strategies - innermost evaluation, in which the 
-- innermost redexes are evaluated first and outermost evaluation in which the outermost redexes are evaluated first

-- We also need to specify leftmost or rightmost also when it comes to giving an evaluation strategy
{-|
    Because in this example (1 + 2) * (3 + 4) we have two innermost redexes
    (Which one to pick?)

    Haskell uses outermost leftmost evaluation

-}

-- BETA REDUCTION : https://wiki.haskell.org/Beta_reduction
-- Beta reduction -> the process of calculating a result from the application of a function to an expression

-- Any redex taht appears withing the scope of a λ expression is not reduced

-- Call-by-Name -> (leftmost) outermost reduction with no reduction under lambda (Haskell)
-- Call-by-Value -> (leftmost) innermost reduction with no reduction under lambda (Java, C, C++, Scheme, Python)
-- Good explanation : https://bambielli.com/til/2016-07-24-CBV-vs-CBN/

{-|
    Example: replicate 10 x = x : replicate 10 x, lets call replicate 10 (π^2)

    Using call-by-value strategy this would produce a list of 10 float values
    Using call-by-name strategy would produce a list of 10 unevaluated expressions (meaning we would have to calculate π^2 times)

    Another example

        inf = 1 + inf
            = 1 + (1 + inf)
            = 1 + (1 + (1 + inf))
            ...
        
        (call-by-value)
        fst (0, inf) = fst (0, 1 + inf)
                     = fst (0, 1 + (1 + inf))
                     = fst (0, 1 + (1 + (1 + inf)))
                     ...
        
        (call-by-name)
        fst (0, inf) = 0

-}

-- Graph reduction - https://en.wikipedia.org/wiki/Graph_reduction

-- Lazy evaluation -> combination of call-by-name reduction and graph reductiion
                -- -> (from wiki) an evaluation strategy which delatys the evaluation of an expresison until its values is needed.

{-|
    For example:
        ones = 1 : ones
            (doesn't evaluate until it's needed)
-}

-- STRICT EVALUATION (NOT FINISHED)