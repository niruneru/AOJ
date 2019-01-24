----------------------------------------------------------
-- filename    : itp1-01-c.Rectangle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>=  putStrLn . solve . map read . words

solve :: [Int] -> String
solve (x:y:[]) = (getRect x y) ++ " " ++ (getLong x y)
    where getRect x y = show $ x * y
          getLong x y = show $ (x + y) * 2
