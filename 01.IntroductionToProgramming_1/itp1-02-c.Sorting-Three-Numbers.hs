----------------------------------------------------------
-- filename    : itp1-02-c.Sorting-Three-Numbers.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import Data.List(sort)

main = getLine >>= putStrLn . unwords . sort . words
