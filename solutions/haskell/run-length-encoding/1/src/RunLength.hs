module RunLength (decode, encode) where

decode :: String -> String
decode  = readEncoded

encode :: String -> String
encode [] = [] 
encode text = concat. map (\(a,b) -> if a > 1 then show a ++ b else b) . makeTuples $ text

-- Encode helpers 
breakItToLists :: String -> [String]
breakItToLists [] = []
breakItToLists (x:xs) = (takeWhile (==x) (x:xs))  : breakItToLists (dropWhile (==x)  (x:xs))

makeTuples :: String -> [(Int, String)]
makeTuples = map (\x -> (length x, take 1  x)) .  breakItToLists

-- Decode helpers
readEncoded :: String -> String
readEncoded [] = [] 
readEncoded (x:xs) = replicate n c ++ readEncoded rest   
  where 
    (n, c,rest) = getNumber (x:xs)

isDigit :: Char -> Bool 
isDigit n = elem n ['0'..'9']

getNumber :: String -> (Int, Char, String) 
getNumber ls = let stringDigit = takeWhile (isDigit) ls 
                   len         = length stringDigit
                   rest        = if len == 0 then drop 1 ls else dropWhile (isDigit) ls
                   char        = if len == 0 then head ls else head rest
                   n           = if len == 0 then (1, char, rest) else ((read stringDigit :: Int), char, tail rest)
               in n 
                   