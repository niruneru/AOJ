----------------------------------------------------------
-- filename    : itp1-07-c.Speadsheet.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-18
----------------------------------------------------------

import Control.Applicative
import Data.List

main = do
    getLine
    cs <- map words . lines <$> getContents
    let is = map (map (read :: String -> Int)) cs
    mapM_ putStrLn $ map rrow is ++ [rcol is]

rrow :: [Int] -> String
rrow is = intercalate " " (map show is) ++ " " ++ show (sum is)

rcol :: [[Int]] -> String
rcol is = let rvn = map sum (transpose is)
           in intercalate " " (map show rvn) ++ " " ++ show (sum rvn)
