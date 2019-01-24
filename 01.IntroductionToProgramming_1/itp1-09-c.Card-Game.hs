----------------------------------------------------------
-- filename    : itp1-09-c.Card-Game.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-27
----------------------------------------------------------

import Control.Applicative

main = do
    getLine
    tx <- map words . lines <$> getContents
    let (n, m) = foldr step (0, 0) tx
    putStrLn $ (show n) ++ " " ++ (show m)

step :: [String] -> (Int, Int) -> (Int, Int)
step [l, r] (n, m)
    | l < r     = (n, m + 3)
    | l > r     = (n + 3, m)
    | otherwise = (n + 1, m + 1)
