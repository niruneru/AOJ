main = getLine >> getContents >>= print . length . filter isPrime . map read . lines

isPrime :: Integer -> Bool
isPrime x = not $ any (\n -> (x `mod` n) == 0) (takeWhile ((sfloor x) >=) [2..])
    where sfloor :: Integer -> Integer
          sfloor x = round (sqrt (fromIntegral x :: Double))
