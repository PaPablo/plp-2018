/* Contraseña */
% Primer dígito: factorial del primer dígito del número de usuario.
% Segundo dígito: longitud del número de usuario.
% Tercer dígito: suma de los dígitos de las posiciones pares del número de usuario.

factorial(0,1).
factorial(N,F):- N>0,Aux is N-1, factorial(Aux, AuxFact), F is AuxFact*N.

/* Longitud */
longitud([],0).
longitud([_|Resto],Longitud) :- longitud(Resto,Aux), Longitud is Aux + 1.

acceder([X|_],1,X).
acceder([_|Resto],P,E) :- acceder(Resto,Aux, E),P is Aux+1.

sumatoria([],0).
sumatoria([X|Resto], Suma):- sumatoria(Resto, Aux), Suma is Aux+X.

listaPosPares([],[]).
listaPosPares([_],[]).
listaPosPares([_,B|Resto],[B|NL]):- listaPosPares(Resto,NL).

sumaPosPares(L,SLP):- listaPosPares(L,LP), sumatoria(LP,SLP).

contrasenia([Primero|Resto],[P,S,T]):- 
    factorial(Primero,P),
    longitud([Primero|Resto], S),
    sumaPosPares([Primero|Resto],T).
