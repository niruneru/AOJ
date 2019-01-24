----------------------------------------------------------
-- filename    : itp1-08-c.Counting-Characters.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-26
----------------------------------------------------------

import Data.Char
import Data.List

main = getContents >>= putStr . solve

solve :: String -> String
solve cs = unlines $ getall (getex cs) (zip ['a'..'z'] (repeat 0))

getex :: String -> [(Char, Int)]
getex cs = let ex = group . sort $ filter (`elem` ['a'..'z']) (map toLower cs)
            in zipWith (\x y -> (head x, y)) ex (map length ex)

getall :: [(Char, Int)] -> [(Char, Int)] -> [String]
getall ((c, n):exs) [] = (c : " : " ++ show n) : getall exs []
getall [] ((d, m):als) = (d : " : " ++ show m) : getall [] als
getall ((c, n):exs) ((d, m):als)
    | c <= d    = (c : " : " ++ show n) : getall exs als
    | otherwise = (d : " : " ++ show m) : getall ((c,n):exs) als
getall _ _ = []
