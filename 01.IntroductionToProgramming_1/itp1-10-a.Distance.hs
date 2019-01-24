----------------------------------------------------------
-- filename    : itp1-10-a.Distance.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-12
----------------------------------------------------------

main :: IO ()
main = getLine >>= print . solve . map read . words

solve :: [Double] -> Double
solve [x1, y1, x2, y2] = sqrt ((y2 - y1) ^ 2 + (x2 - x1) ^ 2)
