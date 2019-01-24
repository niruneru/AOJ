----------------------------------------------------------
-- filename    : itp1-06-d.Matrix-Vector-Multiplication.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-18
----------------------------------------------------------

import Control.Monad
import Control.Applicative

main = do
    [n, m] <- map (read :: String -> Int) . words <$> getLine
    tmpa   <- map words <$> (replicateM n getLine)
    let a   = map (map read) tmpa :: [[Int]]
    b      <- map (read :: String -> Int) . lines <$> getContents
    mapM_ print $ map sum $ map (zipWith (*) b) a
