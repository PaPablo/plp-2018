/* Escribir con celulares */

tecla(2,[a,b,c]).
tecla(3, [d,e,f]).
tecla(4,[g,h,i]).
tecla(5, [j,k,l]).
tecla(6,[m,n,o]).
tecla(7, [p,q,r,s]).
tecla(8,[t,u,v]).
tecla(9, [w,x,y,z]).


esLetra(Letra, Numero):-tecla(Numero,Lista), member(Letra,Lista).

conversion([N],[L]):-esLetra(L,N).
conversion([N|Numeros], [L|Letras]) :- esLetra(L,N), conversion(Numeros,Letras).

