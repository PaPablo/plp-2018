% functor: es como un registro
%

costos([c(tabla1, 80), c(tabla2, 70), c(liston1, 20), c(liston2, 5),c(tornillo, 1), c(clavo, 1)]).

requerimientos(mesa, [r(liston1, 4), r(tabla1, 10), r(liston2, 4), r(tornillo, 50)]).

suma([],0).

suma([N|Resto],Suma) :- suma(Resto,Aux), Suma is Aux+N.

costoRequerimiento(Nombre, Costo):-
    costos(Costos),
    member(c(Nombre, Costo), Costos),!.

calcularCostoRequerimiento([],[]) :- !.
calcularCostoRequerimiento([r(Requerimiento, Cantidad)|RRequerimientos],[CostoTotal|RCostos]):-
    costoRequerimiento(Requerimiento, CostoRequerimiento),
    CostoTotal is CostoRequerimiento * Cantidad,
    calcularCostoRequerimiento(RRequerimientos, RCostos).

calcularCosto(Producto, Costo) :-
    requerimientos(Producto,Requerimientos),
    calcularCostoRequerimiento(Requerimientos, ListaCostos),
    suma(ListaCostos, Costo).
