import Control.Applicative
import Control.Monad.State

step :: [Int] -> State Int [Int]
step []     = return []
step (x:[]) = return [x]
step (x:xs)
    | minimum xs < x = modify (+1) >> step (lpart ++ (x : rpart)) >>= \ms -> return (m:ms)
    | otherwise      = step xs >>= \rest -> return (x:rest)
        where m     = minimum xs
              lpart = takeWhile (m/=) xs
              rpart = tail (dropWhile (m/=) xs)

sSort :: [Int] -> State Int [Int]
sSort [] = return []
sSort xs = step  xs >>= \(y:ys) ->
           sSort ys >>= \zs ->
           return (y:zs)

main = do
    getLine
    xs <- map read . words <$> getLine
    let (ys, n) = runState(sSort xs) 0
    putStrLn $ unwords $ map show ys
    print n
