----------------------------------------------------------
-- filename    : itp1-03-d.How-Many-Divisors.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= print . solve . map read . words

solve :: [Int] -> Int
solve (x:y:z:[]) = length $ filter (\n -> (z `mod` n) == 0) [x..y]
