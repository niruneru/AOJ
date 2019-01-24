----------------------------------------------------------
-- filename    : itp1-11-a.Dice1.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-13
----------------------------------------------------------

import Control.Applicative
import Data.List (foldl')

data Dice = Dice [Int] deriving (Show)

roll :: Dice -> Char -> Dice
roll (Dice [top, front, right, left, back, bottom]) 'N' = Dice [front, bottom, right, left, top, back]
roll (Dice [top, front, right, left, back, bottom]) 'S' = Dice [back, top, right, left, bottom, front]
roll (Dice [top, front, right, left, back, bottom]) 'E' = Dice [left, front, top, bottom, back, right]
roll (Dice [top, front, right, left, back, bottom]) 'W' = Dice [right, front, bottom, top, back, left]

getTop :: Dice -> Int
getTop (Dice (x:_)) = x

main = do
    xs <- map read . words <$> getLine
    getLine >>= print . getTop . foldl' roll (Dice xs)
