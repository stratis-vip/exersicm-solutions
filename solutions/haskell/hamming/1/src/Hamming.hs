module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance [] [] = Just 0
distance [] _ = Nothing
distance _ [] = Nothing
distance xs ys 
  | length xs  /= length ys = Nothing
  | otherwise  = Just (length . filter (\(a,b) -> a/=b) . zip xs $ ys )