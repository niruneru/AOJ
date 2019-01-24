----------------------------------------------------------
-- filename    : itp1-02-d.Circle-in-a-Rectangle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= putStrLn . solve . map read . words

solve :: [Int] -> String
solve (w:h:x:y:r:[])
    | (x + r) <= w && (x - r) >=0 &&
      (y + r) <= h && (y - r) >=0 = "Yes"
    | otherwise = "No"
