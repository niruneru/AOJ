----------------------------------------------------------
-- filename    : itp1-07-b.How-many-ways.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-18
----------------------------------------------------------

import Control.Applicative
import Data.List
import System.Exit

comb :: Int -> [a] -> [[a]]
comb 0 _ = [[]]
comb _ [] = []
comb n (x:xs) = [x:y | y <- comb (n-1) xs] ++ comb n xs

solve :: Int -> Int -> Int
solve x y = length $ filter (==y) $ map sum $ comb 3 [1..x]

main = do
    [x, y] <- map (read :: String -> Int) . words <$> getLine
    if x == 0 && y == 0 then exitSuccess
                        else print $ solve x y
    main
