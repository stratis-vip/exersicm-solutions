module Pangram (isPangram) where
import Data.Char (toLower)
import Data.List (sort)

getLen :: String -> Int
getLen list = length . foldr (\x -> \y -> if null y || x /= head y then x:y else y) [] .  sort . filter (\x->elem x ['a'..'z']) .  map toLower $ list

isPangram :: String -> Bool
isPangram text =  getLen text == 26
