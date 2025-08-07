module Anagram (anagramsFor) where

anagramsFor :: String -> [String] -> [String]
anagramsFor [] _ = []                                       -- empty string
anagramsFor _ [] = []                                       --empty anagrams
anagramsFor xs xss 
  | areLeftWithEqualLen == 0 = []                           -- no words has the same length = no anagrams 
  | lookup sortedSubject lowLookup == Nothing = []          -- No anagrams
  | filter (\x -> toLower x /= toLower xs) xss == [] = []   -- all candidates are exactly the subject
  | otherwise = map (snd) . filter (\(a,b) -> a == sortedSubject) $ lowLookup
    where 
      sortedSubject = qSort (toLower xs)
      len = length xs
      areLeftWithEqualLen = length . filter (\x -> length x == len) $ xss
      lowLookup = zip  (map (qSort . toLower) xss) xss -- create a dict with lookup the sorted to lower xss

-- my toUpper 
lowToUp :: [(Char, Char)]
lowToUp = zip ['A'..'Z'] ['a'..'z']

-- chck only lowercase words
toLower :: String -> String
toLower  = map (\(Just x) -> x) . map (\x ->  let lk = lookup x lowToUp
                                                  c  = if lk == Nothing then Just x else lk 
                                              in  c )  

qSort :: Ord a => [a] -> [a]
qSort [] = [] 
qSort (x:xs) = qSort left ++ [x] ++ qSort right
  where 
    left = [y| y <-xs, y <= x]
    right = [y| y <-xs, y > x]