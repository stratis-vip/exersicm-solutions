module Phone (number) where

number :: String -> Maybe String
number [] = Nothing
number xs 
  | len < 10 || len > 10 = Nothing 
  | elem first ['2'..'9'] /= True = Nothing
  | elem fourth ['2'..'9'] /= True = Nothing
  | otherwise = Just newXS
  where 
    newXS = dropWhile (=='1').  filter (/=' ') . removeInvalidChars $ xs
    len = length newXS
    first = if len >0 then head newXS else '0'
    fourth = if len > 4 then head . drop 3 $ newXS else '0'

removeInvalidChars :: String -> String
removeInvalidChars = map (\x -> if elem x ['(',')',  '-', '+', '.'] then ' ' else x )
