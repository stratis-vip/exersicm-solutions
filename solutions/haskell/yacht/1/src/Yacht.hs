module Yacht
  ( yacht
  , Category(..)
  ) where

import Data.List (nub, sort)
import Data.Maybe (listToMaybe)

data Category
  = Ones
  | Twos
  | Threes
  | Fours
  | Fives
  | Sixes
  | FullHouse
  | FourOfAKind
  | LittleStraight
  | BigStraight
  | Choice
  | Yacht
  deriving (Enum, Eq)

yacht :: Category -> [Int] -> Int
yacht category dice
  | isAllSame dice && category == Yacht = 50
  | fromEnum category < 6 =
    let v = 1 + fromEnum category
     in sum . filter (== v) $ dice
  | otherwise =
    case category of
      FullHouse ->
        if isFullHouseTwoOrThree dice
          then sum dice
          else 0
      FourOfAKind ->
        if isFullHouseTwoOrThree dice
          then 0
          else case listToMaybe (filter (\x -> fst x >= 4) . mapOfDice $ dice) of
                 Just (_, val) -> 4 * val
                 Nothing -> 0
      LittleStraight ->
        let (sorted, isStraigth) = getSortedAndStraight dice
         in if length sorted < 5 || not isStraigth
              then 0
              else case sorted of
                     (1:_) -> 30
                     _ -> 0
      BigStraight ->
        let (sorted, isStraigth) = getSortedAndStraight dice
         in if length sorted < 5 || not isStraigth
              then 0
              else case sorted of
                     (1:_) -> 0
                     _ -> 30
      Choice -> sum dice
      _ -> 0

--Helpers functions 
--
--returns a tuple with sorted dice roll and if it is straigth
getSortedAndStraight :: [Int] -> ([Int], Bool)
getSortedAndStraight dice =
  let sorted = sort . nub $ dice
      sumOfDice = sum sorted
      isStraigth = sumOfDice == 15 || sumOfDice == 20
   in (sorted, isStraigth)

-- check if all dice are the same 
isAllSame :: [Int] -> Bool
isAllSame [] = True
isAllSame (x:xs) =
  let len = length . filter (/= x) $ (x : xs)
   in len == 0

-- check if it is full house 
isFullHouseTwoOrThree :: [Int] -> Bool
isFullHouseTwoOrThree ls = (sort . count $ ls) == [2, 3]

count :: [Int] -> [Int]
count [] = []
count ls =
  case sort ls of
    [] -> []
    (x:xs) ->
      (length . takeWhile (== x) $ (x : xs)) : count (dropWhile (== x) xs)

mapOfDice :: [Int] -> [(Int, Int)]
mapOfDice [] = []
mapOfDice ls =
  case sort ls of
    [] -> []
    (x:xs) ->
      (length . takeWhile (== x) $ (x : xs), x)
        : mapOfDice (dropWhile (== x) xs)
