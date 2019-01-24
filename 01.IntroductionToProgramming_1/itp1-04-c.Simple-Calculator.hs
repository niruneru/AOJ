----------------------------------------------------------
-- filename    : itp1-04-c.Simple-Calculator.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import Text.Printf(printf)
import System.Exit

main = do
    cs <- getLine
    let (x:y:z:_) = words cs
    case y of "+" -> printf "%d\n" $ (ri x) + (ri z)
              "-" -> printf "%d\n" $ (ri x) - (ri z)
              "*" -> printf "%d\n" $ (ri x) * (ri z)
              "/" -> printf "%d\n" $ (ri x) `div` (ri z)
              "?" -> exitSuccess
              -- _   -> die "UNKNOWN PATTERN"
    main
    where ri = read :: String -> Int
          halfup x = let (m,d) = properFraction x
                      in if d < 0.5 then m else m + 1
          -- halfdownはround
          -- 切捨てはfloor
