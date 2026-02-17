module SecretHandshake (handshake) where

handshake :: Int -> [String]
handshake n
  | n ==16 || n == 0  = [] -- reverse empty or empty
  |otherwise = let result = map (snd) . filter (\x -> fst x == '1') $ zip (reverse (toBinary n)) (reverse actions)
                   actions = ["jump","close your eyes","double blink","wink"]
                   rvrs = n > 16
               in if rvrs then reverse result else result



toBinary:: Int -> String
toBinary number = let big = biggest number 
                      biggest :: Int -> Int 
                      biggest 0 = 0 
                      biggest x = start 0
                        where 
                          start n 
                            | 2 ^ n == x = n
                            | 2^ n > x = n-1
                            | otherwise = start (n+1)
                  in snd $ foldl (\(dc,s) x -> if 2^x <= dc then (dc - 2^x, s ++ "1") else (dc, s ++ "0")) (number, [])  [big, big-1.. 0]