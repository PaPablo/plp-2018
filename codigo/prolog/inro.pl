persona(carlos).
persona(julia).
persona(miguel).
persona(ana).
persona(juana).
persona(pepe).

argentino(carlos).
argentino(ernesto).

pareja(carlos,julia).

padre(carlos,miguel).
padre(julia,miguel).
padre(pepe,carlos).

hijo(Hijo, Padre):- padre(Padre,Hijo).

abuelo(Abuelo,Nieto):- padre(Abuelo,Padre),padre(Padre,Nieto).
hermano(H1,H2):- padre(Padre,H1), padre(Padre,H2), H1 \= H2.

animal(firulais).
dueño(firulais, pepe).
mascota(Mascota):- animal(Mascota),dueño(Mascota,Alguien),persona(Alguien).

familia(X,Y):- padre(X,Y).
familia(X,Y):- hijo(X,Y).
familia(X,Y):- abuelo(X,Y).
familia(X,Y):- hermano(X,Y).
familia(X,Y):- dueño(X,Y).
