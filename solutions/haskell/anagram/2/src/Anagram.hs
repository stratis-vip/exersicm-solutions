module Anagram (anagramsFor) where

import Data.Char (toLower)
import Data.List (sort)

anagramsFor :: String -> [String] -> [String]
anagramsFor subject candidates = 
  [word 
    | word <- candidates
    , canonical word == canonical subject
    , map toLower word /= map toLower subject 
    ]

canonical :: String -> String 
canonical = sort . map toLower

