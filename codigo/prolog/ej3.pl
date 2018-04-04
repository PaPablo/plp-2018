%Dado un programa con hechos del tipo 
% - primario(Color) 
% - formadoPor(Color, Color, Color)
%
% construir las siguientes reglas:
% - secundario(X): determina si X es secundario, es decir está 
%                  formado por dos colores primarios.
%
% - complementarios(X,Y): un color X es complementario de un color 
%                         primario Y , cuando X se forma con dos colores 
%                         primarios entre los cuales Y no se encuentra. 
%                         Debe utilizar la regla anterior.


primario(amarillo).
primario(azul).
primario(rojo).

% Formado Por

formadoPor(naranja, rojo, amarillo).
formadoPor(naranja, amarillo, rojo).

formadoPor(verde, azul, amarillo).
formadoPor(verde, amarillo, azul).

formadoPor(violeta, rojo, azul).
formadoPor(violeta, azul, rojo).

% secundario

secundario(X) :- formadoPor(X,Y,Z), primario(Y), primario(Z).

% Complementarios

complementarios(X,Y) :- secundario(Z), formadoPor(X,P,Q), formadoPor(Z,Y,P), Y\=Q.
