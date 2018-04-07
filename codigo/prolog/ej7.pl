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

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

billete([1,2,5,10,20,50,100,200,500,1000]).

masCercano(_,[X],X) :- !.
masCercano(E,[Primero|Resto],X) :- Mejor is Primero, masMejor(E,[Mejor,Primero|Resto],X).

masMejor(E,[_,Primero|Resto],X) :- E >= Primero, masMejor(E,[Primero|Resto],X).
masMejor(E,[Mejor,Primero|_],Mejor) :- E < Primero.

vuelto(0, []).
vuelto(Vuelto, [Cercano|NL]) :- billete(B),masCercano(Vuelto,B,Cercano),Aux is Vuelto-Cercano, vuelto(Aux, NL).

mejorVuelto(Abonado,Monto,Billetes) :- Vuelto is Abonado - Monto, vuelto(Vuelto,Billetes).
