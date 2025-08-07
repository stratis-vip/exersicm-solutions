module Diamond (diamond) where



diamond :: Char -> Maybe [String]
diamond = buildDiamond

{- distance':: Char -> Maybe Int
distance' c 
  | not (isLetter c) = Nothing  
  | otherwise = Just (fromEnum c - fromEnum 'A')
-}

-- Helpers

-- calculate the "distance of Character to 'A'
distance:: Char -> Int
distance c = fromEnum c - fromEnum 'A'

-- make the initial triangle with letters 
makeLettersTriangle :: String -> [String]
makeLettersTriangle (y:ys) = [y] : (map (\x -> let d = distance x 
                                               in  x : replicate (2 * d -1) ' ' ++ [x]) ys)
--adds the epmty spaces in the front and back of letters
addPadding :: [String] -> [String]
addPadding xs = fst $ foldr (\x (a,b) -> ((replicate b ' ' ++ x ++ replicate b ' ') : a, b + 1)) ([], 0) xs

--combile front - triangle - back to the upper part of the Rhomb
up :: String -> [String]
up =  addPadding  . makeLettersTriangle 

-- create the lower part of Rhomb. Last line of uppper-part is the symmetry so it removed
down :: String -> [String]
down xs = reverse $ init  (up xs)

-- combine upper and lower part 
buildDiamond::Char -> Maybe [String]
buildDiamond c 
  | not (elem c ['A'..'Z']) = Nothing 
  | otherwise               = let xs = ['A' ..c] 
                              in Just (up xs ++ down xs)