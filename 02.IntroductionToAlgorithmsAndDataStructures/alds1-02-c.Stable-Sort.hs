import Data.Ord(comparing)
import Data.List(unfoldr, sortBy)
import Control.Applicative

-- bubble sort
-- bubble :: Ord a => [a] -> Maybe (a, [a])
-- Ord a だとlastが対応してない([]のみ対応)なのでコンパイル通らない
bubble :: [String] -> Maybe (String, [String])
bubble = foldr step Nothing
  where
    x `step` Nothing = Just (x, [])
    x `step` Just (y, ys)
      | (comparing last y x) == LT = Just (y, x:ys)
      | otherwise                  = Just (x, y:ys)

-- bSort :: Ord a => [a] -> [a]
bSort :: [String] -> [String]
bSort = unfoldr bubble

-- select sort
select :: [String] -> Maybe (String, [String])
select []     = Nothing
select (x:[]) = Just (x, [])
select (x:xs) = let min = head (sortBy (comparing last) xs)
                in if (comparing last min x) == LT
                   then Just (min, (takeWhile (/=min) xs) ++ x : (tail (dropWhile (/=min) xs)))
                   else Just (x, xs)

sSort :: [String] -> [String]
sSort = unfoldr select

--main
main = do
    getLine
    cs <- getLine
    let bs = unwords . bSort . words $ cs
    let ss = unwords . sSort . words $ cs
    putStrLn bs
    putStrLn "Stable"
    putStrLn ss
    if bs == ss then putStrLn "Stable" else putStrLn "Not stable"

{-
-- main
main = getLine >> getLine >>= 
       return . unwords . bSort . words >>= \br -> 
       getLine >> getLine >>=
       return . unwords . sSort . words >>= \sr ->
       print br >> putStrLn "Stable" >>
       print sr >> if br == sr then putStrLn "Stable" else putStrLn "Not stable"
-}
