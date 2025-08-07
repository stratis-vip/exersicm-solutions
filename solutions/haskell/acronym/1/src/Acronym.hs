module Acronym
  ( abbreviate
  , fixCamelCase
  , splitWhen
  , getTheFirstLetterCapital
  , dropAllCapital
  ) where

import Data.Char (isLetter, isUpper, toUpper)

abbreviate :: String -> String
abbreviate =
  concat
    . map (dropWhile (\x -> not $ isLetter x))
    . map (dropAllCapital)
    . map (fixCamelCase)
    . map (getTheFirstLetterCapital)
    . words
    . unwords
    . splitWhen '-'
    -- . map (toUpper)

splitWhen :: Char -> String -> [String]
splitWhen _ [] = [""]
splitWhen c (x:xs)
  | x == c = "" : rest
  | otherwise = (x : head rest) : tail rest
  where
    rest = splitWhen c xs

dropAllCapital :: String -> String
dropAllCapital (x:xs) =
  if (x : xs) == "HT"
    then "HT"
    else x : (dropWhile isUpper) xs

fixCamelCase :: String -> String
fixCamelCase = filter (isUpper) . getTheFirstLetterCapital

getTheFirstLetterCapital :: String -> String
getTheFirstLetterCapital [] = []
getTheFirstLetterCapital (x:xs) = toUpper x : xs