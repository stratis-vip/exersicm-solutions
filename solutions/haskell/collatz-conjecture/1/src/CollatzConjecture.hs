module CollatzConjecture (collatz) where

collatz :: Integer -> Maybe Integer
collatz n 
 |n < 1 = Nothing
collatz n = start n 0
  where
        start:: Integer -> Integer -> Maybe Integer
        start 1 x = Just x
        start n x
          | even n  = start ( n `div` 2) (x + 1)
          | odd n   = start ( n * 3 + 1)  (x + 1)