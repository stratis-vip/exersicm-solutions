module IsbnVerifier (isbn) where

isbn :: String -> Bool
isbn [] = False
isbn  s
  |  length clearISBN /= 10               = False      -- ISBN must be 10 digits long
  |  not (all (`elem` numbers) clearBody) = False      -- Must have only digits
  |  isValidChkDgt == False               = False      -- Invalid check digit
  |  isValidSum ==False                   = False      -- |Sum mod 11 /= 0 
  |  otherwise                            = True
  where 
     -- checkdigit
     checkDigit = last s                            
     isValidChkDgt = elem checkDigit validCheckDigits
     valueOfCheckDigit = if checkDigit == 'X' then 10 else read [checkDigit]::Int

     -- clear the body and prepare ISBN string 
     clearBody =  filter (/= '-') $ init s
     clearISBN  = clearBody  ++ [checkDigit]

     -- conver chars to [Int]
     digitValues = map (\x -> read [x] :: Int) clearBody
     totalSum = valueOfCheckDigit + (sum $ zipWith (*) [10,9..2] digitValues)
     isValidSum = mod totalSum 11 == 0
     
-- check digit "d" must: 
-- elem d validCheckDigits = True
validCheckDigits :: String 
validCheckDigits = 'X': numbers

numbers :: String
numbers = ['0'..'9']
