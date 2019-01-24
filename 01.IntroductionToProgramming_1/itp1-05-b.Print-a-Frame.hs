----------------------------------------------------------
-- filename    : itp1-05-b.Print-a-Frame.hs
-- description : [Omission]
-- param       : N/A
-- author      : Toshiro Shimauchi(niruneru@outlook.com)
-- last modify : 2018-06-13
----------------------------------------------------------

import System.Exit

-- H W をうけて枠を返す
type Height = Int
type Width = Int
type Frame = [String] -- ["####", "#..#", .. , "####"]
getFrame :: Height -> Width -> Frame
getFrame h w = let hf = replicate w '#'
                   ii = '#' : (replicate (w-2) '.') ++ "#"
                in hf : (replicate (h-2) ii) ++ [hf]

main = do
    line <- getLine
    let (h:w:[]) = map read (words line)
    case (h, w) of
        (0, 0) -> exitSuccess
        _      -> let frame = getFrame h w
                   in mapM_ putStrLn frame
    putStrLn ""
    main
