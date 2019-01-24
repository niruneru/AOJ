----------------------------------------------------------
-- filename    : itp1-03-a.Print-Many-Hello-World.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

main = mapM_ putStrLn $ replicate 1000 "Hello World"
