----------------------------------------------------------
-- filename    : itp1-03-c.Swapping-Two-Numbers.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getContents >>= putStr . unlines . map solve . init . map (rl . words) . lines

rl :: [String] -> [Int]
rl = map read

solve :: [Int] -> String
solve [] = []
solve (x:y:[]) = if x > y then (show y) ++ " " ++ (show x)
                          else (show x) ++ " " ++ (show y)
