module Darts (score) where

inner = 1.0
middle = 5.0
outer = 10.0

distance :: Floating a => a -> a -> a
distance x y = sqrt ( (x ^ 2) + (y ^ 2))

score :: Float -> Float -> Int
score x y
  | d <= inner = 10
  | d <= middle = 5
  | d <= outer = 1
  | otherwise = 0
  where d = distance x y