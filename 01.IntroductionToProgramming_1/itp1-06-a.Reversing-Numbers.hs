----------------------------------------------------------
-- filename    : itp1-06-a.Reversing-Numbers.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >> getLine >>= putStrLn . unwords . reverse . words
