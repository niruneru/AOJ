----------------------------------------------------------
-- filename    : itp1-03-b.Print-Test-Cases.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getContents >>= putStr . solve . lines

solve :: [String] -> String
solve = unlines . init . zipWith (\n x -> "Case " ++ show n ++ ": " ++  x) [1..]
