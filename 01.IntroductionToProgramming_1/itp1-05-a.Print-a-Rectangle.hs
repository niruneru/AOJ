----------------------------------------------------------
-- filename    : itp1-05-a.Print-a-Rectangle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import System.Exit

main = do
    xs <- getLine
    let (w:h:[]) = map read $ words xs
    case (w,h) of
        (0, 0) -> exitSuccess
        _      -> mapM_ putStrLn $ replicate w $ replicate h '#'
    putStrLn ""
    main
