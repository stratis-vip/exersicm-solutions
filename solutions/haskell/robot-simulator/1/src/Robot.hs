module Robot
    ( Bearing(East,North,South,West)
    , bearing
    , coordinates
    , mkRobot
    , move
    ) where

data Bearing = North
             | East
             | South
             | West
             deriving (Eq, Show )

instance Enum Bearing where 
  succ West = North 
  succ North = East
  succ East = South
  succ South = West
  pred North = West
  pred West = South
  pred South = East 
  pred East = North
  
  toEnum n = case n `mod` 4 of  
    0 -> North
    1 -> East
    2 -> South 
    3 ->  West 
    
  fromEnum b = case b of 
    West  -> 3
    South -> 2 
    East  -> 1 
    North -> 0
  
data Robot = Robot Bearing Coordinates deriving Show

type Coordinates = (Integer, Integer)

bearing :: Robot -> Bearing
bearing (Robot x _) = x

coordinates :: Robot -> Coordinates
coordinates (Robot _ x ) = x 

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot direction coordinates = Robot direction coordinates

move :: Robot -> String -> Robot
move robot instructions = foldl (makeTheMove) robot instructions 


makeTheMove :: Robot -> Char -> Robot
makeTheMove (Robot b (x,y)) i = case i of 
  'R' -> Robot (succ b) (x,y)
  'L' -> Robot (pred b) (x,y)
  'A' -> case b of 
    North -> Robot b (x, y+1)
    West -> Robot b (x-1, y)
    South -> Robot b (x, y-1)
    East -> Robot b (x+1, y)