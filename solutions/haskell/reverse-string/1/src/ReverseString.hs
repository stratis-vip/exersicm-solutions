module ReverseString (reverseString) where

reverseString :: String -> String
reverseString [] = []
reverseString (x:xs)
          | xs == [] = x:[]
          | otherwise = (reverseString xs) ++  [x]