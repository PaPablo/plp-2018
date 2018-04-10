%   Mejor VUelto
%
%   Definir un programa Prolog que permita determinar el mejor vuelto a dar a una persona que abona una suma de dinero. Se debe tener en cuenta que:
%
%   *   Los montos a abonar son enteros.
%   *   El mejor vuelto es aquél que contiene la menor cantidad de billetes.
%   *   Para dar vuelto se poseen billetes con las siguientes numeraciones:
%                       1, 2, 5, 10, 20, 50, 100, 200, 500 y 1000.
%
%El programa debe responder a consultas del tipo:
%   mejorVuelto(100, 86,Lista)
%   Lista = [10, 2, 2]


% belongs
pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

% lista de billetes
billete([1,2,5,10,20,50,100,200,500,1000]).

% el más cercano en la lista, por debajo
masCercano(_,[X],X) :- !.
masCercano(E,[Primero|Resto],X) :- 
    Mejor is Primero, 
    masMejor(E,[Mejor,Primero|Resto],X).

% dame el más mejor en la lista, el más cercano por debajo
masMejor(E,[_,Primero|Resto],X) :- 
    E >= Primero, 
    masMejor(E,[Primero|Resto],X).

masMejor(E,[Mejor,Primero|_],Mejor) :- 
    E < Primero.

% descomposición en billetes de Vuelto pesos
vuelto(0, []).
vuelto(Vuelto, [Cercano|NL]) :- 
    billete(B),
    masCercano(Vuelto,B,Cercano),
    Aux is Vuelto-Cercano, 
    Aux >=0,
    vuelto(Aux, NL).

% el mejor vuelto
mejorVuelto(Abonado,Monto,Billetes) :- 
    Vuelto is Abonado - Monto, 
    vuelto(Vuelto,Billetes).
