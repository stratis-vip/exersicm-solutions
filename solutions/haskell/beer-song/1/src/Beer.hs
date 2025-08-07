module Beer (song) where

bottles :: Int -> String 
bottles 1 = "1 bottle of beer"
bottles n = show n ++ " bottles of beer"

-- on the wall
otw :: String
otw = " on the wall"

--more bottles of beer
mb :: String 
mb = "more bottles of beer"

-- down and pass it around, 
td::String
td = "down and pass it around, "
verse :: Int -> [String ]
verse x = [bottles x, otw,", ", bottles x, ".\nTake one ", td, bottles (x-1), otw, ".\n\n"]

lyricsTo2beers:: String 
lyricsTo2beers = concat $  foldl (\acc x -> acc ++ verse x ) [] $ [99,98..2]

lastVerses :: [String]
lastVerses = [bottles 1, otw, ", ", bottles 1,".\nTake it ",td,"no ", mb, otw,".\n\n", "No ", mb, otw, ", no ",mb,".\nGo to the store and buy some more, ", bottles 99, otw, ".\n"]

song ::String
song = lyricsTo2beers ++ (concat  lastVerses )
