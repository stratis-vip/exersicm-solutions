module PerfectNumbers (classify, Classification(..)) where

data Classification = Deficient | Perfect | Abundant deriving (Eq, Show)

sumOfDivisors :: Int -> Int
sumOfDivisors x = sum [y | y <- [1..(div x 2)], mod x y == 0]

classify :: Int -> Maybe Classification
classify n 
  | n <=0 = Nothing
  | s == n = Just Perfect
  | n > s = Just Deficient
  | otherwise = Just Abundant
  where s = sumOfDivisors n

