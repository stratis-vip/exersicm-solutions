module IsbnVerifier (isbn) where


isbn :: String -> Bool
isbn [] = False
isbn  s
  |  length clearISBN /= 10 = False      -- ISBN must be 10 digits long
  |  not (all (`elem` numbers) clearBody) = False 
  |  isValidChkDgt == False = False      --invalid check digit
  |  isValidSum ==False = False
  |  otherwise =True
  where 
     checkDigit = last s                            
     isValidChkDgt = elem checkDigit validCheckDigits
     clearBody =  filter (/= '-') $ init s
     clearISBN  = clearBody  ++ [checkDigit]
     digitValues = map (\x -> read [x] :: Int) clearBody
     totalSum = valueOfCheckDigit + (sum $ zipWith (*) [10,9..2] digitValues)
     isValidSum = mod totalSum 11 == 0
     valueOfCheckDigit = if checkDigit == 'X' then 10 else read [checkDigit]::Int
     

-- check digit "d" must: 
-- elem d validCheckDigits = True
validCheckDigits :: String 
validCheckDigits = 'X': numbers

numbers :: String
numbers = ['0'..'9']
