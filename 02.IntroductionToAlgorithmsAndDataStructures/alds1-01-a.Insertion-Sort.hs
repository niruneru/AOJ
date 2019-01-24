import Control.Applicative
import Data.List(tails, intersperse)

type Sorted    = [Int]
type NotSorted = [Int]

insert :: Int -> Sorted -> Sorted
insert x [] = [x]
insert x (y:ys) | x < y     = x : y : ys
                | otherwise = y : (insert x ys)

step :: ([String], Sorted) -> NotSorted -> ([String], Sorted)
step pair []         = pair
step (ss, ys) (x:xs) = let ns = insert x ys
                        in ((cat (toS ns) (toS xs)) : ss, ns)

toS :: Sorted -> String
toS = concat . intersperse " " . map show

cat :: String -> String -> String
cat left [] = left
cat left right = left ++ " " ++ right

main = do
    getLine
    qs <- map read . words <$> getLine
    let st = fst (foldl step ([], []) (tails qs))
    mapM_ putStrLn (reverse st)
