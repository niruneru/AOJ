----------------------------------------------------------
-- filename    : itp1-05-d.Structured-Programming.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = do
    n <- readLn
    let xs = [x | x <- [1..n], x `mod` 3 == 0 || rdiv x ]
     in putStrLn $ concatMap ((' ' :) . show) xs
    where
        rdiv :: Int -> Bool
        rdiv x
            | x `mod` 10 == 3 = True
            | x `div` 10 /= 0 = rdiv (x `div` 10)
            | otherwise       = False
