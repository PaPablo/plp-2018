% Menor
menor([],M,M):-!.
menor([C|_], Pm, S):- 
    C < Pm, 
    !, % CUT
    menor(Cola, C,S).

menor([_|Cola],Pm,S) :- menor(Cola, Pm,S).


menor([E],E).
menor([C|Cola],M):- menor(Cola,C,M).


%% quitar

quitar(_,[],[]):-!.
quitar(E,[E|Cola],Cola):-!.
quitar(E,[X|Cola], [X|S]) :-quitar(E,Cola,S).

menorysinmenor(L,M,L2) :- menor(L,M), quitar(M,L,L2).

% Ordenar Selection

ordenarSel([],[]):-!.
ordenarSel(L,[M|S]):- menorysinmenor(L,M,Aux),ordenarSel(Aux,S).


insertarOrdenado(E, [],[E]):-!.
insertarOrdenado(E,[C|Resto], S):-
    E > C, 
    !,
    insertarOrdenado(E, Resto, S).
insertarOrdenado(E,L,[E|L]).

% baraja

ordenarBaraja([],[]).
ordenarBaraja([C|Resto], S):- ordenarBaraja(Resto,Aux), insertarOrdenado(C,Aux,S).

vertice(a,b,1).
vertice(a,b,3).
vertice(a,b,2).

conectado(X,Y,R):- vertice(Y,X,R).
