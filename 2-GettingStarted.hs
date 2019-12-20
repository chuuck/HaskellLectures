---------------- The Standard Prelude -------------------------

a1 = 3 * 7
a2 = (*) 3 7

b1 = mod 10 2
b2 = 10 `mod` 2

------------- The Standard List Functions ---------------------

head' = head[1,2,3,4,5] -- output : 1
tail' = tail[1,2,3,4,5] -- output [2,3,4,5]
length' = length[1,2,3,4,5] -- output : 5
select_element = [1,2,3,4,5] !! 2 -- output : 3
take' = take 3 [1,2,3,4,5] -- output : [1,2,3]
drop' = drop 3 [1,2,3,4,5] -- output : [4,5]
append = [1,2,3] ++ [4,5] -- output : [1,2,3,4,5]
sum' = sum[1,2,3,4,5] -- output : 15
product' = product[1,2,3,4,5] -- output : 120
reverse' = reverse[1,2,3,4,5] -- output : [5,4,3,2,1]
repeat' = repeat 1 -- output [1,1,1,1,... ????]

------------------------ My First Script ----------------------

double x = x + x
quadruple x = double (double x)


