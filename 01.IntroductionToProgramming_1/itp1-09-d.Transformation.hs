----------------------------------------------------------
-- filename    : itp1-09-d.Transformation.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-27
----------------------------------------------------------

import System.Exit
import Control.Applicative

extra :: String -> Int -> Int -> [String]
extra cs a b = [(take (a) cs), (take (b - a + 1) (drop (a) cs)), (drop (b + 1) cs)]

rev :: String -> Int -> Int -> String
rev cs a b = let [pre, mid, pos] = extra cs a b
              in pre ++ (reverse mid) ++ pos

rpl :: String -> Int -> Int -> String -> String
rpl cs a b ns = let [pre, _, pos] = extra cs a b
                 in pre ++ ns ++ pos

prt :: String -> Int -> Int -> String
prt cs a b = let [pre, mid, pos] = extra cs a b
              in mid

main = do
    cs <- getLine
    getLine
    ops <- map words . lines <$> getContents
    solve ops cs

solve :: [[String]] -> String -> IO ()
solve [] _ = exitSuccess
solve ((op:a:b:rest):ops) cs = do
    case op of
        "reverse" -> solve ops (rev cs (read a) (read b))
        "replace" -> solve ops (rpl cs (read a) (read b) (head rest))
        "print"   -> putStrLn (prt cs (read a) (read b)) >> solve ops cs
