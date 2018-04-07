/* Longitud */
longitud([],0).
longitud([_|Resto],Longitud) :- longitud(Resto,Aux), Longitud is Aux + 1.

% Pertenencia

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

% Agregar a la cabeza

agregar(X,L,[X|L]).

/* devolver i-esimo*/

pos(I,[I|_],0).
pos(I,[_|Resto],Pos) :- pos(I, Resto, Aux), Aux is Pos-1.

/* agregar en posicion determinada */

insertar(E,L,1,[E|L]).
insertar(E,[X|Resto],P,[X|NL] ) :- 
    Aux is P-1, 
    insertar(E,Resto,Aux,NL).

