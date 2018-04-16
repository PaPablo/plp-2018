% Una facultad desea un sistema para administrar las electivas que les ofrece a sus alumnos. La información recolectada se volcó en hechos del tipo:
% electivas(ListaDeMaterias).
% datosMateria(NombreMateria, Area, PuntosQueOtorga).
% donde la ListaDeMaterias contiene los nombres de las electivas que se dictan en la facultad, y el predicado datosMateria permite conocer de cada electiva el área temática y la cantidad de puntos que otorga cursarla. Completar el programa Prolog que permite responder a consultas del tipo combinarElectivas(PuntosNecesarios,AreasSeleccionadas, Electivas) que permitan determinar las Electivas que puede cursar un alumno, para obtener los PuntosNecesarios , teniendo en cuenta las AreasSeleccionadas



incluido([],_).
incluido([Pa|RestoA],[Pa|RestoB]) :-
    incluido(RestoA, RestoB).

incluido([Pa|RestoA],[_|RestoB]) :-
    incluido([Pa|RestoA],RestoB).

pertenece(X,[X|_]).
pertenece(X,[_|Resto]) :- pertenece(X,Resto).

electivas([e1,e2,e3,e4,e5,e6,e7,e8,e9]).

datosMateria(e1,a1,1).
datosMateria(e2,a1,2).
datosMateria(e3,a1,3).

datosMateria(e4,a2,1).
datosMateria(e5,a2,2).
datosMateria(e6,a2,3).

datosMateria(e7,a3,1).
datosMateria(e8,a3,2).
datosMateria(e9,a3,3).

electivasAreas(Areas,Materia):- 
    pertenece(Area, Areas),
    datosMateria(Materia,Area,_).

electivasArea(Areas, [Materia|RestoMaterias]):-
    electivas(Electivas),
    pertenece(Area,Areas),
    pertenece(Materia, Electivas),
    datosMateria(Materia,Area,_),
    electivasArea(Areas, RestoMaterias).

sumaPuntos([],0).
sumaPuntos([Materia|RestoMaterias], Suma):- 
    sumaPuntos(RestoMaterias, Aux), 
    datosMateria(Materia,_,Puntaje),
    Suma is Aux+Puntaje.

combinarElectivas(PuntosNecesarios,AreasSeleccionadas, Electivas):-
    electivas(LEctivas),
    incluido(Electivas,LEctivas),
    electivasArea(AreasSeleccionadas,Electivas),
    sumaPuntos(Electivas, PuntosNecesarios).

