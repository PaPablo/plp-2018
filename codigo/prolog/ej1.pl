%jefe(Jefe, Empleado)

jefe(maria, juan).
jefe(juan, miguel).
jefe(miguel, esteban).
jefe(maria, carla).
jefe(carla, ernesto).

acata(Empleado, Jefe) :- jefe(Jefe, Empleado).
acata(Empleado, Jefe) :- jefe(X, Empleado), acata(X, Jefe).

