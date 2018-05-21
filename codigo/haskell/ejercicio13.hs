compax :: Eq t => (t -> t -> Bool) -> [t] -> t -> Bool
compax f [] e = False
compax f (x:xs) e | (f) e x = True
                  | otherwise = compax f xs e

noEsta :: Eq t => [t] -> t -> Bool
noEsta l e = compax (/=) l e

consonante = noEsta "aeiou"

f :: [[Char]] -> [[Char]]
f [] = []
f (x:xs) = (filter (not(`elem` "aeiou")) x: f xs)


