data Tree a = Empty | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

singleton :: a -> Tree a
singleton x = Node x Empty Empty

insert :: (Ord a) => a -> Tree a -> Tree a
insert x EmptyTree = singleton x
insert x (Node a left right)
    | x == a = Node x left right
    | x < a  = Node a (insert x left) right
    | x > a  = Node a left (insert x right)


