% DEALER - Criterio true pide otra y false si no

/*
* soft_dealer(Hand) :   Se planta con una mano de 17 suave. 
*                      Esto es, el As valiendo 11.
*/ 

soft_value(card(a,_),11):-!.
soft_value(Card,Value):- value(Card, Value).

soft_hand([],0).
soft_hand([Card|Resto],Value) :- 
    soft_hand(Resto, Aux), 
    soft_value(Card, CardValue),
    Value is CardValue + Aux.

soft_dealer(Hand):- soft_hand(Hand,Value), dealer(Value).

/* 
* hard_dealer(Hand) :   Sigue jugando con una mano de 17 suave.  
*/

hard_dealer(Hand):- hard_hand(Hand,Value), dealer(Value).

hard_value(card(a,_),1):-!.
hard_value(Card,Value):- value(Card, Value).

hard_hand([],0).
hard_hand([Card|Resto],Value) :- 
    hard_hand(Resto, Aux), 
    hard_value(Card, CardValue),
    Value is CardValue + Aux.

dealer(Value) :- Value =< 16.
