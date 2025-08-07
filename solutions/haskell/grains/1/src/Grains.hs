module Grains (square, total) where

square :: Integer -> Maybe Integer
square n 
  | n < 1 || n> 64 = Nothing
  | otherwise = Just (go 1 1 )
    where 
      go :: Integer -> Integer -> Integer 
      go x acc 
        | x == n = acc
        | x < n = go (x+1) (2*acc)
        | x > n = error ""

total :: Integer
total = totalSum 
  where 
    totalSum = sum . map (\(Just x) ->x ). map (square) $ [1..64]