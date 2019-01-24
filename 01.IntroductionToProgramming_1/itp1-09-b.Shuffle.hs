----------------------------------------------------------
-- filename    : itp1-09-b.Shuffle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-27
----------------------------------------------------------

import System.Exit
import Control.Applicative
import Control.Monad

main = do
    ln <- getLine
    case (head ln) of
        '-' -> exitSuccess
        _   -> solve ln
    main

solve :: String -> IO ()
solve ln = do
    x  <- (read :: String -> Int) <$> getLine
    ns <- replicateM x getLine
    let nss = map read ns :: [Int]
     in putStrLn $ helper ln nss
    where
        helper :: String -> [Int] -> String
        helper ln [] = ln
        helper ln (x:xs) = let (an, bn) = splitAt x ln
                            in helper (bn ++ an) xs
