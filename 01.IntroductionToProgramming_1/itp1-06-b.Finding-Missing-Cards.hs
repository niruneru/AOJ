----------------------------------------------------------
-- filename    : itp1-06-b.Finding-Missing-Cards.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-14
----------------------------------------------------------

import Data.List(sort, (\\))
import Data.Functor((<$>))
import Control.Applicative((<*>))

data Mark = S | H | C | D deriving (Show, Eq, Ord, Enum)
type Card = (Mark, Int)

main = do
    getLine
    cs <- getContents
    let inputs = sort $ map (convCard . words) (lines cs)
    let allpair = sort $ makeCard <$> "SHCD" <*> [1..13]
    mapM_ putStrLn $ map (\(x,y) -> show x ++ " " ++ show y) (allpair \\ inputs)

convCard :: [String] -> Card
convCard (x:y:_) = makeCard (head x) (read y)

makeCard :: Char -> Int -> Card
makeCard m i
    | m == 'S' = (S, i)
    | m == 'H' = (H, i)
    | m == 'C' = (C, i)
    | m == 'D' = (D, i)
