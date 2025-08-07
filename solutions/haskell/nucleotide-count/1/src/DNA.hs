module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map (Map, fromList)


data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

-- | Returns counts of each nucleotide in the input string
nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs
  | not (all isNucleotide xs) = Left "error"
  | otherwise = Right (fromList [(n, countNuc n xs) | n <- [A, C, G, T]])
  where
    countNuc n = length . filter (== n) . map toNucleotide

isNucleotide :: Char -> Bool
isNucleotide x = x `elem` "ACGT"

toNucleotide :: Char -> Nucleotide
toNucleotide x = case x of
  'A' -> A
  'C' -> C
  'G' -> G
  'T' -> T
  _   -> error "Invalid nucleotide"
  