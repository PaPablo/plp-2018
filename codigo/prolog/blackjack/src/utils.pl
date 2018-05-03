% Longitud(Lista, LongitudLista).
%
% Lista es una lista de elementos, 
% LongitudLista es donde se devolverá la longitud de Lista.

longitud([],0):-!.
longitud([_|Resto],Longitud):- 
    longitud(Resto, Aux), 
    Longitud is Aux +1.

% remove(E,L,LmenosE).
%
% E es el elemento a retirar
% L es la lista de donde retirar
% LmenosE es L menos el elmentoE
% nota: retira la primera ocurrencia de E que encutra
remove(_,[],[]).
remove(E,[E|Resto],Resto).
remove(E,[Cabeza|Resto], [Cabeza|NL]) :- remove(E,Resto,NL).

