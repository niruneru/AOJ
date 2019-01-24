----------------------------------------------------------
-- filename    : itp1-06-c.Official-House.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-17
----------------------------------------------------------

import Data.List
import qualified Data.Vector as V

type Floor = V.Vector Int
type Tower = V.Vector Floor
type Estate = V.Vector Tower

estini :: Estate
estini = V.replicate 4 (V.replicate 3 (V.replicate 10 0))

vunwords :: V.Vector String -> String
vunwords vs = ' ' : (V.foldl1 (\n m -> n ++ " " ++ m) vs)

vunlines :: V.Vector String -> String
vunlines vs = (V.foldl1 (\n m -> n ++ "\n" ++ m) vs) ++ "\n"

vrt :: V.Vector Int -> V.Vector String
vrt = V.map show

strTower :: Tower -> String
strTower tw = vunlines (V.map vunwords (V.map vrt tw))

strEstate :: Estate -> [String]
strEstate est = map (\n -> strTower (est V.! n)) [0..3]

sepa :: String
sepa = replicate 20 '#' ++ "\n"

solve :: [Int] -> Estate -> Estate
solve (tw:fl:rm:new:[]) est = 
    let old  = (est V.! (tw - 1) V.! (fl - 1)) V.! (rm - 1)
        nfl  = (est V.! (tw - 1) V.! (fl - 1)) V.// [(rm - 1, new + old)]
        ntw  = est V.! (tw - 1) V.// [(fl - 1, nfl)]
     in est V.// [(tw - 1, ntw)]

main = do
    getLine
    cs <- getContents
    let xs = map ((map read) . words) (lines cs) :: [[Int]]
    mapM_ putStr $ intersperse sepa (strEstate (foldr solve estini xs))
