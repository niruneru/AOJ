----------------------------------------------------------
-- filename    : itp1-08-d.Ring.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-27
----------------------------------------------------------

import Data.List

main = do
    as <- getLine
    bs <- getLine
    let n = 100 `div` (length as)
        ass = concat $ replicate n as
     in case (bs `isInfixOf` ass) of
        True  -> putStrLn "Yes"
        False -> putStrLn "No"
