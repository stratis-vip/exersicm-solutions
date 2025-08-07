module Clock (addDelta, fromHourMin, toString) where

data Clock = Clock {hours::Int, minutes::Int}
  deriving Eq

instance Show Clock where 
  show (Clock hours minutes ) = pad hours ++":" ++ pad minutes
    where 
      pad h = if h < 10 then '0':show h else show h
      
fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = Clock clHours clMins
  where 
      clHours = mod (extraHour + hour) 24
      (extraHour, clMins)= divMod min 60

toString :: Clock -> String
toString  = show

addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock 
   | hour == 0 && min == 0 = clock
   | otherwise = Clock h m
    where 
      h = mod (extraHour + hour + hours clock ) 24 
      (extraHour, m) = divMod (min + minutes clock) 60 