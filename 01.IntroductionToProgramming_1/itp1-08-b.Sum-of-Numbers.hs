----------------------------------------------------------
-- filename    : itp1-08-b.Sum-of-Numbers.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-20
----------------------------------------------------------

import System.Exit
import Data.Char

main = do
    cs <- getLine
    if cs == "0" then exitSuccess
                 else solve cs
    main

solve :: [Char] -> IO ()
solve = print . sum . map digitToInt
