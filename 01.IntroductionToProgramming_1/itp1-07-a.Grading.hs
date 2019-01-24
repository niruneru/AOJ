----------------------------------------------------------
-- filename    : itp1-07-a.Grading.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-18
----------------------------------------------------------

import System.Exit
import Control.Applicative

judge :: Int -> Int -> Int -> String
judge x y z
    | x == -1 || y == -1 = "F"
    | x + y >= 80        = "A"
    | x + y >= 65        = "B"
    | x + y >= 50        = "C"
    | x + y <  30        = "F"
    | z >= 50            = "C"
    | otherwise          = "D"

main = do
    [x, y, z] <- map (read :: String -> Int) . words <$> getLine
    if x == -1 && y == -1 && z == -1 then exitSuccess
    else putStrLn $ judge x y z
    main
