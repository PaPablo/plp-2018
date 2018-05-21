compax :: Eq t => (t -> t -> Bool) -> t -> [t] -> Bool
compax f e [] = False
compax f e (x:xs)   | (f) e x = True
                    | otherwise = compax f e xs

esta :: Eq t => t -> [t] -> Bool
esta e l = compax (==) e l

noEsta :: Eq t => t -> [t] -> Bool
noEsta e l = compax (==) e l

enesimo :: Int -> [a] -> [a]
enesimo n = take 1 . drop (n-1)

pot :: Integer -> Integer -> Integer
pot n x = x ^ n

cuadrado :: Integer -> Integer
cuadrado n = pot 2 n

cubo :: Integer -> Integer
cubo n = pot 3 n

cuarta :: Integer -> Integer
cuarta n = pot 4 n

collect :: (a -> b) -> [a] -> [b]
collect _ [] = []
collect f (x:xs)  = (f x: collect f xs)

select :: (a -> Bool) ->[a] -> [a]
select _ [] = []
select f (x:xs) | f x = (x:select f xs)
                | otherwise = select f xs

-- Ejercico
