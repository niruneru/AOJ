----------------------------------------------------------
-- filename    : itp1-11-d.Dice4.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-19
----------------------------------------------------------

import Control.Applicative
import Control.Monad
import Data.List(sort, group, nub)

data Dice = Dice [Int] deriving (Show, Ord, Eq)

roll :: Dice -> Char -> Dice
roll (Dice [top, front, right, left, back, bottom]) 'S' = Dice [back, top, right, left, bottom, front]
roll (Dice [top, front, right, left, back, bottom]) 'E' = Dice [left, front, top, bottom, back, right]

toS = flip roll 'S'
toE = flip roll 'E'
rev = toS . toS

turn1 :: Dice -> Dice
turn1 (Dice [top, front, right, left, back, bottom]) = Dice [top, right, back, front, left, bottom]
turn2 = turn1 . turn1
turn3 = turn2 . turn1

turnAll :: Dice -> [Dice]
turnAll dice =  nub $ sort $ [id, turn1, turn2, turn3] <*> dices dice
    where dices :: Dice -> [Dice]
          dices dice = [dice
                       , rev dice
                       , toS dice
                       , toE dice
                       , rev (toS dice)
                       , rev (toE dice)
                       ]

allUnique :: Ord a => [a] -> Bool
allUnique = all ((==1) . (length)) . group . sort

solve :: Dice -> [Dice] -> String
solve dice dices | dice `elem` dices = "Yes"
                 | otherwise         = "No"

main :: IO ()
main = do
    n <- readLn
    xs <- map (Dice . map ri . words) <$> replicateM n getLine
    let wl = sort $ concatMap turnAll xs
     in case allUnique wl of
          True -> putStrLn "Yes"
          _    -> putStrLn "No"
    where ri :: String -> Int
          ri = read
