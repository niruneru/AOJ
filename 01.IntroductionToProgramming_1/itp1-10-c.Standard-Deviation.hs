----------------------------------------------------------
-- filename    : itp1-10-c.Standard-Deviation.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-12
----------------------------------------------------------

import System.Exit
import Data.List
import Control.Applicative

main = do
    n <- rd <$> getLine
    case n of
        0.0 -> exitSuccess
        _   -> getLine >>= return . map rd . words >>= (\ds -> print $ solve ds n)
    main

solve :: [Double] -> Double -> Double
solve ds n = let m = (sum ds) / n
              in sqrt $ (sum (map (\d -> (d - m) ^ 2) ds)) / n

rd :: String -> Double
rd = read
