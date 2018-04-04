/* Longitud */
longitud([],0).
longitud([_|Resto],Longitud) :- longitud(Resto,Aux), Longitud is Aux + 1.

% Pertenencia

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

% Agregar

agregar(X,L,[X|L]).
