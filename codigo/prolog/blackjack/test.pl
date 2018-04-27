:- [cards].

:- set_prolog_flag(verbose, silent).

:- initialization main.

main :-
  current_prolog_flag(argv, Argv),
  [Command|_] = Argv,
  format('Tu comando es "~w"\n', Command),
  halt.

main :-
  halt(1).
