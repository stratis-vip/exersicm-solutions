module Bob (responseFor) where

isLastChar :: Char -> [Char] -> Bool
isLastChar _ [] = False
isLastChar x xs  = last xs  ==  x

isAQuestion :: [Char] -> Bool
isAQuestion xs
   | null xs = False
   |otherwise =  isLastChar '?'  (trim xs)

allChars :: [Char]
allChars = ['A'..'Z'] ++ ['a'..'z'] ++ ['0'..'9'] 

trim :: [Char] -> [Char]
trim xs = dropWhile (==' ')   $ reverse (dropWhile (==' ') (reverse xs))

clearSentence :: [Char] -> [Char]
clearSentence  xs = trim $ filter (\x -> x `elem` allChars) xs

clearSentenceX :: [Char] -> [Char]
clearSentenceX  xs = trim $ filter (\x -> x `elem` (allChars ++ nonLetters)) xs

allCaps :: [Char] -> Bool
allCaps xs = not . any (\x ->  x `elem` ['a'..'z']) $ clearSentence xs

onlyNumbers :: [Char] -> Bool
onlyNumbers xs = all (\x -> x `elem` ['0'..'9']) $ clearSentence xs

allCapsQuestion :: [Char] -> Bool
allCapsQuestion xs = isAQuestion xs  &&  allCaps xs

nonLetters :: [Char]
nonLetters = [' '..'/'] ++ [':' .. '@'] ++ ['['..'`'] ++ ['{'..'~']

onlyNonLetters:: [Char] -> Bool
onlyNonLetters xs = all (\x -> x `elem` nonLetters) $ clearSentenceX xs

responseFor :: String -> String
responseFor xs

  |    (onlyNonLetters xs && isAQuestion xs) 
    || ( onlyNumbers xs && isAQuestion xs)   = "Sure."
  | null (clearSentence xs)                  = "Fine. Be that way!"
  | onlyNumbers xs                           = "Whatever."
  | onlyNonLetters xs                        = "Sure."  
  | allCapsQuestion xs                       = "Calm down, I know what I'm doing!"
  | allCaps xs                               = "Whoa, chill out!"
  | isAQuestion xs                           = "Sure."
  | otherwise                                = "Whatever."