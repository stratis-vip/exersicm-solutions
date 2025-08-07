module SecretHandshake (handshake) where

import Data.Bits 

handshake :: Int -> [String]
handshake n
  | n <= 0  = [] -- empty
  | otherwise = let actions = ["wink","double blink","close your eyes","jump"]
                    bits    = map (\i -> testBit n i) [0..3]
                    result  = [a | (True, a) <- zip bits actions]
                in  if testBit n 4 then reverse result else result
-- testBit n x,  checks if the bit at position x of the number n is set.