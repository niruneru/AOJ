----------------------------------------------------------
-- filename    : itp1-01-d.Watch.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = getLine >>= putStrLn . solve . read

solve :: Int -> String
solve x = let h = x `div` 3600
              m = (x - h * 3600) `div` 60
              s = x - (h * 3600) - (m * 60)
           in (show h) ++ ":" ++ (show m) ++ ":" ++ (show s)
