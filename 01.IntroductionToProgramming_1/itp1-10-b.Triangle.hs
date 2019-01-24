----------------------------------------------------------
-- filename    : itp1-10-b.Triangle.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-07-12
----------------------------------------------------------

main :: IO ()
main = getLine >>= mapM_ print . solve . map read . words

solve :: [Double] -> [Double]
solve [a, b, c] = let x = c * pi / 180
                      s = a * b * sin x / 2
                      l = a + b + sqrt (a ^ 2 + b ^ 2 - 2 * a * b * cos x)
                      h = b * sin x
                   in [s, l, h]
