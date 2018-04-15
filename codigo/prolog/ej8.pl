% Los auxiliares de contaduría de una empresa nos presentaron el siguiente problema:
%
%   Diariamente depositan una cantidad variable de cheques. 
%   Oportunamente, el banco informa el monto total acreditado en la cuenta, 
%   sin detallar los importes que lo conforman, dándose la posibilidad de que
%   sólo algunos cheques se hubieran acreditado.
%   
%   1. Dada la necesidad de reconocer qué cheques se acreditaron, 
%      solicitan un programa que les permita conocer todas las posibilidades 
%      a partir de la consulta 
%      acredPosibles(ImportesDeCheques,MontoAcred,ImportesPosibles).


pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

incluido([],_).
incluido([Pa|RestoA],[Pa|RestoB]) :-
    incluido(RestoA, RestoB).

incluido([Pa|RestoA],[_|RestoB]) :-
    incluido([Pa|RestoA],RestoB).


sumatoria([],0).
sumatoria([X|Resto], Suma):- sumatoria(Resto, Aux), Suma is Aux+X.

/* Sin identificar */
acredPosibles(ImportesDeCheques,MontoAcred,ImportesPosibles):-
    incluido(ImportesPosibles,ImportesDeCheques),
    sumatoria(ImportesPosibles,MontoAcred).


% With IDs
%

% incluido IDs
incluidoID([],_).
incluidoID([cheque(ID, Monto)|RestoA], [cheque(ID, Monto)|RestoB]):-
    incluidoID(RestoA,RestoB).

incluidoID([cheque(ID, Monto)|RestoA], [_|RestoB]):-
    incluidoID([cheque(ID, Monto)|RestoA], RestoB).

% Sumatoria IDs
sumatoriaID([],0).
sumatoriaID([cheque(_,Monto)|Resto], Suma):- 
    sumatoriaID(Resto, Aux), 
    Suma is Aux+Monto.

acredPosiblesID(ImportesDeCheques,MontoAcred,ImportesPosibles):-
    incluidoID(ImportesPosibles,ImportesDeCheques),
    sumatoriaID(ImportesPosibles,MontoAcred).
