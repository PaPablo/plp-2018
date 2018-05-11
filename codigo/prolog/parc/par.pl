borrar([C|Resto], 1, Resto):-!.
borrar([C|Resto],N, [C|LRemovida]) :-
    Aux is N-1,
    borrar(Resto,Aux, LRemovida).
