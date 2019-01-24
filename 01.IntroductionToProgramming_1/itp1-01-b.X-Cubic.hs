----------------------------------------------------------
-- filename    : itp1-01-b.X-Cubic.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= print . (^3) . (read :: String -> Int)
