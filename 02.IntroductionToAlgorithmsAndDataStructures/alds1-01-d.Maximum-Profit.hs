import Control.Applicative

main = do
    getLine
    xs <- map read . lines <$> getContents
    let (_, n, _) = solve (head xs, (-1) * (10 ^ 9), tail xs)
    print n

-- (min, max, rest)
solve :: (Integer, Integer, [Integer]) -> (Integer, Integer, [Integer])
solve (min, max, [])     = (min, max, [])
solve (min, max, (x:xs)) | x < min   = if x - min > max
                                         then solve (x, x - min, xs)
                                         else solve (x, max,     xs)
                         | otherwise = if x - min > max
                                         then solve (min, x - min, xs)
                                         else solve (min, max,     xs)
