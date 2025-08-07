module Isogram (isIsogram) where
import Data.Char (toLower)

isIsogram :: String -> Bool
isIsogram [] = True
isIsogram xs = lengthBefore == lengthAfter
  where 
    clear = clearIsogram xs
    lengthBefore = length clear
    lengthAfter = length. nub' $ clear

nub' :: Eq a => [a] -> [a]
nub' [] = [] 
nub' [x] = [x]
nub' (x:xs )  = x: (nub' $ filter (/=x) xs)

clearIsogram ::  String-> String
clearIsogram =  filter (/= ' ') . filter (/= '-') . map  toLower