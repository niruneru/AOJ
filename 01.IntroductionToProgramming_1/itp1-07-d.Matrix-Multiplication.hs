----------------------------------------------------------
-- filename    : itp1-07-d.Matrix-Multiplication.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-20
----------------------------------------------------------

import Control.Monad
import Control.Applicative
import Data.List

main = do
  [n, m, o] <- map (read :: String -> Int) . words <$> getLine
  a <- (map ((map (read :: String -> Int)) . words)) <$> (replicateM n getLine)
  b <- (transpose . (map ((map (read :: String -> Int)) . words))) <$> (replicateM m getLine)
  putStr $ showm $ xn a b

nn :: [Int] -> [Int] -> Int
nn [] _ = 0
nn _ [] = 0
nn (x:xs) (y:ys) = x * y + (nn xs ys)

xn :: [[Int]] -> [[Int]] -> [[Int]]
xn [] _         = []
xn _ []         = []
xn (xs:xss) yss = map (nn xs) yss : (xn xss yss)

showm :: [[Int]] -> String
showm = unlines . map (unwords . map show)
