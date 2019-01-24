import Control.Applicative
import Control.Monad.State

step :: [Int] -> State Int [Int]
step [x]    = return [x]
step (x:xs) = step xs >>= \(y:ys) ->
              if (x > y)
              then modify (+1) >> return (y:x:ys)
              else return (x:y:ys)

bsort :: [Int] -> State Int [Int]
bsort [] = return []
bsort xs = step xs >>= \(y:ys) ->
           bsort ys >>= \zs ->
           return (y:zs)

main = do
    getLine
    xs <- map read . words <$> getLine
    let (ys, n) = runState (bsort xs) 0
    putStrLn $ unwords $ map show ys
    print n
