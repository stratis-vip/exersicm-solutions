module DND
  ( Character(..)
  , ability
  , modifier
  , character
  ) where

import Data.List (sort)
import Test.QuickCheck (Gen, choose, vectorOf)

data Character = Character
  { strength :: Int
  , dexterity :: Int
  , constitution :: Int
  , intelligence :: Int
  , wisdom :: Int
  , charisma :: Int
  , hitpoints :: Int
  } deriving (Show, Eq)

modifier :: Int -> Int
modifier score = (score - 10) `div` 2

ability :: Gen Int
ability = do
  rolls <- fourDiceGen
  return $ sum (drop 1 (sort rolls))

character :: Gen Character
character = do
  str <- ability
  dex <- ability
  con <- ability
  int <- ability
  wis <- ability
  cha <- ability
  let hp = 10 + modifier con
  return $ Character str dex con int wis cha hp

fourDiceGen :: Gen [Int]
fourDiceGen = vectorOf 4 $ (choose (1, 6) :: Gen Int)
