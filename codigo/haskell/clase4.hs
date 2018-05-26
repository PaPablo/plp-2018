{-superanProm :: [String] -> [(String, String, Int, Int)] -> Int -> [(String, [String])]-}

promediarNotas :: (String, String, Int, Int) -> (String, String, Int)
promediarNotas (nombre,materia,a,b) = (nombre, materia, div (a+b) 2)

promedioNotas :: [(String, String, Int, Int)] -> [(String, String, Int)]
promedioNotas notas = map promediarNotas notas

superaPromedio :: Int -> (String, String, Int) -> Bool
superaPromedio promedio (_,_,nota) = nota >= promedio

materiasElegidas :: [String] -> (String, String, Int) -> Bool
materiasElegidas materias (_,materia,_) = elem materia materias 

armarListaPromocionados :: [(String, String, Int)] -> [(String, [String])]
armarListaPromocionados notas = 

superanProm materias notas promedio = ( armarListaPromocionados . (filter (materiasElegidas materias)) . (filter (superaPromedio promedio)) . promedioNotas) notas
