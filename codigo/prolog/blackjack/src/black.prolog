:- [utils].

:- [cards].

:- [halves].

:- [croupier].


% HAND
cardNumbers([1,2,3,4,5,6,7,8,9,10]).

% values(card(Number, Suit), Value)
%
% Dada una carta, indica el valor de la misma. 
% Para las númericas su mismo valor, 
% para la figuras (J, Q, K) siempre 10 y para el As 11 o 1.

value(card(Number, _), Number) :- 
    cardNumbers(CardNumbers), 
    member(Number, CardNumbers),!.

value(card(Number, _), 10) :- 
    member(Number, [j,q,k]),!.

value(card(a, _),1).

value(card(a, _),11).

% hand(Hand, Value)
%
% Dada una mano, indica el valor o valores de la mano.

hand([],0).
hand([Card|Resto],Value) :- 
    hand(Resto, Aux), 
    value(Card, CardValue),
    Value is CardValue + Aux.

/*
* twentyone(Hand) : Indica si la mano suma exactamente 21.
*/

twentyone(Hand):- 
    hand(Hand, 21).

/* 
* over(Hand) : Indica si la mano se pasó de los 21.
*/

over(Hand):- 
    hand(Hand, Value), 
    Value > 21.

/* blackjack(Hand) : Indica si la mano es un blackjack. 
*                   O sea, suma 21 con sólo dos cartas.
* */

blackjack(Hand):- 
    twentyone(Hand), 
    longitud(Hand,2).

/* play */

halvesPlay(Hand,Croupier,Cards) :- 
    hand(Hand, Value), 
    halvesTotal(Croupier, HCards),
    halvesTotal(Cards, HCroupier),
    HTotal is HCards + HCroupier,
    halvesDecide(Value,HCroupier,HCards).

halvesDecide(Value,HCroupier,HCards):-
    Value =< 11,
    HTotal is HCroupier + HCards,
    HTotal > 0.

halvesDecide(Value,HCroupier,HCards):-
    Value > 11,
    HTotal is HCroupier + HCards,
    HTotal < 0.
