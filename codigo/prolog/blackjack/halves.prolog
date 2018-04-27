:-[cards].

halves(card(Number,_),1.5):- member(Number,[5]).
halves(card(Number,_),1):- member(Number,[3,4,6]).
halves(card(Number,_),0.5):- member(Number,[2,7]).
halves(card(8,_),0).
halves(card(9,_),-0.5).
halves(card(Number,_),-1):- member(Number,[10,j,q,k,a]).

halvesTotal([],0):-!.
halvesTotal([Card|Rest],Halves):- 
    halvesTotal(Rest, Aux), 
    halves(Card,Value),
    Halves is Aux + Value,!.


