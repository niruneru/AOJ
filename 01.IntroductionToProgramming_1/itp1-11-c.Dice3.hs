----------------------------------------------------------
-- filename    : itp1-11-c.Dice3.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-19
----------------------------------------------------------

import Control.Applicative

data Dice = Dice [Int] deriving (Show, Ord, Eq)

roll :: Dice -> Char -> Dice
roll (Dice [top, front, right, left, back, bottom]) 'S' = Dice [back, top, right, left, bottom, front]
roll (Dice [top, front, right, left, back, bottom]) 'E' = Dice [left, front, top, bottom, back, right]

-- 時計回りに90度まわす
turn1 :: Dice -> Dice
turn1 (Dice [top, front, right, left, back, bottom]) = Dice [top, right, back, front, left, bottom]
-- 180度, 270度も作っておく
turn2 = turn1 . turn1
turn3 = turn2 . turn1

-- top, bottomはそのままで4つの状態を作って返す
turnAll :: [Dice] -> [Dice]
turnAll dices =  [id, turn1, turn2, turn3] <*> dices

-- 初期状態を受け取って、topがそれぞれ異なるパターンを作る
dices :: Dice -> [Dice]
dices dice = [dice
             , rev dice        -- topとbottomが逆になるように転がす
             , toS dice        -- backがtopになるように転がす -(1)
             , toE dice        -- leftがtopになるように転がす -(2)
             , rev (toS dice)  -- (1)のtopとbottomが逆になるように転がす
             , rev (toE dice)  -- (2)のtopとbottomが逆になるように転がす
             ]

-- 初期状態を転がすモノたち(rollを使いやすく加工)
toS = flip roll 'S'
toE = flip roll 'E'
rev = toS . toS

solve :: Dice -> [Dice] -> String
solve dice dices | dice `elem` dices = "Yes"
                 | otherwise         = "No"

-- main
main :: IO ()
main = do
    dice1 <- Dice . map read . words <$> getLine
    dice2 <- Dice . map read . words <$> getLine
    putStrLn $ solve dice2 (turnAll (dices dice1))
