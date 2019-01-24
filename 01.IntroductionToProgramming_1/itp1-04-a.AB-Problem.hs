----------------------------------------------------------
-- filename    : itp1-04-a.AB-Problem.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import Text.Printf(printf)
main = getLine >>= solve . map read . words

solve :: [Int] -> IO ()
solve (x:y:[]) = do
    printf "%d " (x `div` y)
    printf "%d " (x `mod` y)
    printf "%.5f\n" $ (fi x) / (fi y)
    where fi :: Int -> Double
          fi = fromIntegral
