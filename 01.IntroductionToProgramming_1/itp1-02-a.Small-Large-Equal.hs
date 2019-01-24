----------------------------------------------------------
-- filename    : itp1-02-a.Small-Large-Equal.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= putStrLn . solve . map read . words

solve :: [Int] -> String
solve (x:y:[])
    | x > y     = "a > b"
    | x < y     = "a < b"
    | otherwise = "a == b"
