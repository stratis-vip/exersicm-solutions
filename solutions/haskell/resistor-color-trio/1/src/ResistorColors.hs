module ResistorColors (Color(..), Resistor(..), label, ohms) where

data Color =
    Black
  | Brown
  | Red
  | Orange
  | Yellow
  | Green
  | Blue
  | Violet
  | Grey
  | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor { bands :: (Color, Color, Color) }
  deriving Show


label :: Resistor -> String
label resistor = value ++ label
  where 
    _v = ohms resistor
    (v, power ) = toPowerOfTen  _v
    (value, label)
      | power < 3 =  (show $ v*10^power, " ohms")
      | power < 6 = (show $ v*10^(power-3), " kiloohms")
      | power < 9 = (show $ v*10^(power-6), " megaohms")
      | otherwise = (show $ v*10^(power-9), " gigaohms")
      
      

ohms :: Resistor -> Int
ohms (Resistor (x, y, z) )=  ((fromEnum  x) * 10  + (fromEnum y )) * 10 ^ (fromEnum z)

toPowerOfTen :: Int -> (Int, Int)
toPowerOfTen 0 = (0,0)
toPowerOfTen n = (a, b )
  where 
    (a', b) = foldr (\x (c,p) -> if x == '0' then (c, p+1) else (x:c, p)) ([],0) $ show n
    a = read a' :: Int