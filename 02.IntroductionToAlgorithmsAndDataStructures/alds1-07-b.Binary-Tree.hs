import Control.Monad
import Data.List
import Data.Ord
 
inputList 0 _ = []
inputList n (a:b:c:rest) =
    [a, b, c] : inputList (n-1) rest
 
parent [] n = -1
parent ([x, y, z]:xs) n =
    if y == n || z == n then x
    else parent xs n
     
findNode [] n = [-1, -1, -1] -- fxxking node
findNode ([x, y, z]:xs) n
    | x == n = [x, y, z]
    | otherwise = findNode xs n
 
sibling xs n = sibling_ xs n (parent xs n)
sibling_ xs n p
    | p == -1 = -1
    | otherwise = sibling__ xs n (findNode xs p)
sibling__ xs n [_, q, r]
    | q == n = r
    | otherwise = q
 
degree [x, y, z] = (zeroOrOne (y /= -1)) + (zeroOrOne (z /= -1))
    where zeroOrOne bl = if bl then 1 else 0
 
depth xs n = depth_ $ parent xs n
    where depth_ p = if p == -1 then 0 else (depth xs p) + 1
 
height xs (-1) = -1
height xs n = (max (height xs y) (height xs z)) + 1
    where [x, y, z] = findNode xs n
     
printType xs [x, y, z]
    | parent xs x == -1 = "root"
    | degree [x, y, z] == 0 = "leaf"
    | otherwise = "internal node"
 
printNode xs node =
    "node " ++ (show id) ++ ": parent = " ++ (show $ parent xs id)
    ++ ", sibling = " ++ (show $ sibling xs id)
    ++ ", degree = " ++ (show $ degree node)
    ++ ", depth = " ++ (show $ depth xs id)
    ++ ", height = " ++ (show $ height xs id)
    ++ ", " ++ (printType xs node)
    where [id, left, right] = node
 
main = do
    str <- getContents
    let xs1 = map (\x -> read x :: Int) (words str)
    let xs2 = inputList (head xs1) (tail xs1)
    let xs3 = sortBy (comparing head) xs2
    let res = foldl (\acc x -> acc ++ (printNode xs3 x) ++ "\n") "" xs3
    putStr res

