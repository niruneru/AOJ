----------------------------------------------------------
-- filename    : itp1-10-d.Distance2.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-13
----------------------------------------------------------

import Control.Applicative

solve :: Floating a => [a] -> [a] -> a -> a
solve as bs p = (**(1/p)) . sum . map ((**p) . abs) $ zipWith (-) as bs

solve' :: (Ord a, Num a) => [a] -> [a] -> a
solve' as bs = maximum . map abs $ zipWith (-) as bs

main = do
    getLine
    as <- map read . words <$> getLine
    bs <- map read . words <$> getLine
    mapM_ print $ map (solve as bs) [1..3]
    print $ solve' as bs
