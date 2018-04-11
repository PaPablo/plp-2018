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


removed(_,[],[]).
removed(X,[X|Resto],Resto).
removed(X, [Primero|Resto], [Primero|NL]) :- X \= Primero, removed(X, Resto, NL).

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

incluido([],[]).
incluido([],_).
incluido([Pa|RestoA],[Pb|RestoB]) :- 
    pertenece(Pa,[Pb|RestoB]), 
    removed(Pa, [Pb|RestoB], MenosA), 
    incluido(RestoA,MenosA).

sumatoria([],0).
sumatoria([X|Resto], Suma):- sumatoria(Resto, Aux), Suma is Aux+X.

/* Sin identificar */
acredPosibles(ImportesDeCheques,MontoAcred,ImportesPosibles):-
    incluido(ImportesPosibles,ImportesDeCheques), sumatoria(ImportesPosibles,MontoAcred).

% Give id to each
identificar(L,Identificada) :- identif(L, 1,Identificada).

removeId([],[]).
removeId([[Id,Valor]|Resto],[Valor|NL]) :- removeId(Resto,NL).

identif([X],Largo,[[Largo,X]]).
identif([Primero|Resto],Cuenta,[[Cuenta,Primero]|NL]) :- Cuenta2 is Cuenta+1, identif(Resto, Cuenta2,NL).

sumatoriaID(Lista, Suma):- removeId(Lista, ListaSinIds), sumatoria(ListaSinIds, Suma).


%identificado
acredPosiblesID(ImportesDeCheques,MontoAcred,ImportesPosiblesID):-
    identificar(ImportesDeCheques, ImportesChequesID), incluido(ImportesPosiblesID,ImportesDeChequesID), sumatoriaID(ImportesPosiblesID,MontoAcred).

