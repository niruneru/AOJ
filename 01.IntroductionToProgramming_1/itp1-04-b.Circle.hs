----------------------------------------------------------
-- filename    : itp1-04-b.Circle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import Text.Printf(printf)
main = interact $ solve . read

solve :: Double -> String
solve r = let ens = printf "%.6f" (r   * r * pi)
              mns = printf "%.6f" (2.0 * r * pi)
           in ens ++ " " ++ mns ++ "\n"
