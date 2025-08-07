module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum . nub .concat. map (\x -> takeWhile (<limit)  [x, 2*x ..]) $ validFactors  
 where
    validFactors = filter (/= 0) factors
    
nub:: Eq a => [a] -> [a]
nub [] = [] 
nub (x:xs) = x: nub (filter (/=x)  xs)