----------------------------------------------------------
-- filename    : itp1-05-c.Print-a-Chessboard.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import System.Exit

type Width = Int
type Height = Int
type Pattern = String

getPattern :: Width -> Height -> Pattern
getPattern w h
    | h `mod` 2 /= 0 = take w $ concat (repeat "#.")
    | otherwise      = take w $ concat (repeat ".#")

getPatterns :: Width -> Height -> [Pattern]
getPatterns w h = map (getPattern w) [1..h]

main = do
    line <- getLine
    let (h:w:[]) = map read (words line)
    case (h,w) of
        (0,0) -> exitSuccess
        _     -> mapM_ putStrLn (getPatterns w h)
    putStrLn ""
    main
