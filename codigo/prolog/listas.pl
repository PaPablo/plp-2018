/* Longitud */
longitud([],0).
longitud([_|Resto],Longitud) :- longitud(Resto,Aux), Longitud is Aux + 1.

% Pertenencia

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

% Agregar a la cabeza

agregar(X,L,[X|L]).

/* agregar en posicion determinada */

insertar(E,L,1,[E|L]).
insertar(E,[X|Resto],P,[X|NL] ) :- 
    Aux is P-1, 
    insertar(E,Resto,Aux,NL).


concatenar([],L,L).
concatenar([X|Resto],L,[X|NL]) :- concatenar(Resto, L, NL).
