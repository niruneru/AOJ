----------------------------------------------------------
-- filename    : itp1-04-d.Min-Max-Sum.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >> getLine >>= putStrLn . solve . map read . words

solve :: [Int] -> String
solve is = show (minimum is) ++ " " ++ show (maximum is) ++ " " ++ show (sum is)
