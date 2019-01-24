import Control.Applicative

main = do
    [x, y] <- map read . words <$> getLine
    if x > y then print (solve x y) else print (solve y x)

solve :: Int -> Int -> Int
solve x 0 = x
solve x y = solve y (x `mod` y)
