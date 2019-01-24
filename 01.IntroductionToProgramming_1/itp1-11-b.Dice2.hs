----------------------------------------------------------
-- filename    : itp1-11-b.Dice2.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-19
----------------------------------------------------------

import Control.Applicative

data Dice = Dice [Int] deriving (Show)

roll :: Dice -> Char -> Dice
roll (Dice [top, front, right, left, back, bottom]) 'S' = Dice [back, top, right, left, bottom, front]
roll (Dice [top, front, right, left, back, bottom]) 'E' = Dice [left, front, top, bottom, back, right]

-- 時計回りに90度まわす(180度, 270度も作っておく)
turn1 :: Dice -> Dice
turn1 (Dice [top, front, right, left, back, bottom]) = Dice [top, right, back, front, left, bottom]
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

-- top, frontが一致するrightを返す
solve :: [Dice] -> [Int] -> Maybe Int
solve [] _                     = Nothing
solve ((Dice (x:y:z:_)):rest) [top, front]
    | top == x && front == y = Just z
    | otherwise              = solve rest [top, front]

-- main
main :: IO ()
main = do
    init <- Dice . map read . words <$> getLine
    getLine
    let diceall = turnAll . dices $ init
--  qs <- map ((map (read :: String -> Int)) . words) . lines <$> getContents
    qs <- map (map ri . words) . lines <$> getContents
    mapM_ putStrLn $ map pmaybe $ map (solve diceall) qs
        where ri :: String -> Int
              ri = read
              pmaybe :: Maybe Int -> String
              pmaybe Nothing  = "Nothing"
              pmaybe (Just n) = show n
