----------------------------------------------------------
-- filename    : itp1-02-b.Range.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= putStrLn . solve . map read . words

solve :: [Int] -> String
solve (x:y:z:[])
    | x < y && y < z = "Yes"
    | otherwise      = "No"
