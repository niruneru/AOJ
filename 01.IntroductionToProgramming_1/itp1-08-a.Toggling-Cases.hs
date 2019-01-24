----------------------------------------------------------
-- filename    : itp1-08-a.Toggling-Cases.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-20
----------------------------------------------------------

import Data.Char

main = getLine >>= putStrLn . solve

solve :: String -> String
solve [] = []
solve (c:cs)
    | c `elem` ['a'..'z'] = toUpper c : solve cs
    | c `elem` ['A'..'Z'] = toLower c : solve cs
    | otherwise           = c : solve cs
