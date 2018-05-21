qsort :: (a -> Bool) -> [a] -> [a]
qsort _ [] = []
qsort _ [a] = [a]
qsort f (cabeza:cola) =  
            (qsort (filter (f cabeza) cola)) 
            ++ 
            [cabeza] 
            ++ 
            (qsort (filter (not.(f cabeza)) cola))


