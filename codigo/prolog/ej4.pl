/* 
* Listas en Prolog 
* 
* - Son homogéneas: todos los miembros son del mismo tipo
* - Son recursivas: o sea.
*                       lista = []
*                       lista = [E|lista]
*
*                       */

%cifra(0).
%cifra(1).
%cifra(2).
%cifra(3).
%cifra(4).
%cifra(5).
%cifra(6).
%cifra(7).
%cifra(8).
%cifra(9).
% this is kinda awful

%cifra(X):- miembro(X,[1,2,3,4,5,6,7,8,9,0]).
cifras([1,2,3,4,5,6,7,8,9,0]).


pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).


/* Probemos con la alternativa de arriba*/
resultado(A1,A2,A3,B1,B3,C1,C2,C3):-
    %cifra(A1),
    %cifra(A2),
    %cifra(A3),
    %cifra(B1),
    %cifra(B3),
    %cifra(C1),
    %cifra(C2),
    %cifra(C3),
    cifras(Lista),
    pertenece(A1,Lista),
    pertenece(A2,Lista),
    pertenece(A3,Lista),
    pertenece(B1,Lista),
    pertenece(B3,Lista),
    pertenece(C1,Lista),
    pertenece(C2,Lista),
    pertenece(C3,Lista),
    6 is (A1 * A2) * A3,
    1 is (B1 * 5) - B3,
    4 is (C1 - C2) * C3,
    7 is (A1 - B1) * C1,
    1 is (A2 + 5) / C2,
    7 is (A3 + B3) - C3.


