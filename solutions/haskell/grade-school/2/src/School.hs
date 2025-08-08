module School
  ( School
  , add
  , empty
  , grade
  , sorted
  ) where

import Data.List (sort, sortBy)
import qualified Data.Map.Strict as M
import Data.Maybe (fromMaybe)

-- import Data.Ord (comparing)
data School =
  School (M.Map Int [String])
  deriving (Show)

add :: Int -> String -> School -> School
add gradeNum student (School db) =
  School (M.insertWith (++) gradeNum [student] db)

empty :: School
empty = School M.empty

grade :: Int -> School -> [String]
grade gradeNum (School db) = sort $ fromMaybe [] (M.lookup gradeNum db)

sorted :: School -> [(Int, [String])]
sorted (School db) = map (\(k, v) -> (k, sort v)) $ M.toAscList db
{-
getGrades :: [(Int, [String])] -> [(Int, [String])]
getGrades [] = []
getGrades (x:xs) =
  (fst x, (snd x) : [snd n | n <- xs, fst n == fst x])
    : getGrades (filter (\(a, _) -> a /= fst x) xs)

sortDB :: [(Int, [String])] -> [(Int, [String])]
sortDB db =
  map (\(gradeNum, students) -> (gradeNum, sort students))
    . sortBy (comparing fst)
    $ db
-}
