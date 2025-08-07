module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA list =
  if all isValidDna list
    then Right $ concat $ map findComplement list
    else Left $ safeHead $ filter (\x -> not $ isValidDna x) list

validDna :: [Char]
validDna = "GCTA"

validRna :: [Char]
validRna = "CGAU"

lookupTable :: [(Char, Char)]
lookupTable = zip validDna validRna

isValidDna :: Char -> Bool
isValidDna c = elem c validDna

findComplement :: Char -> String
findComplement x =
  case lookup x lookupTable of
    Just c -> [c]
    Nothing -> [x]

safeHead :: [Char] -> Char
safeHead [] = ' '
safeHead (x:_) = x
