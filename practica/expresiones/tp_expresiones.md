# Trabajo Práctico - Expresiones y Enunciados

## Paradigmas y Lenguajes de Programación - 2018

Cátedra:
    * Profesora:    Lic. Romina Stickar
    * JTP:          Lic. Lautaro Pecile

Integrantes:
    * Pablo Adrian Toledo Margalef


1. Defina los conceptos de precedencia y asociatividad de un operador.

*Precedencia*: Antes o después será evaluado un operador con respecto a otros. 
    Por ejemplo: la multiplación tiene mayor precedencia que la suma porque será resuelta primero al momento de evaluar una expresión.

*Asocitividad*: Si hay dos o más operadores que poseen el mismo nivel de precencia, cuál será resuelto primero. Está dada por la gramática del lenguaje.

2. Defina efecto colateral.

Cuando una función o procedimiento modifica entidades que están fuera de su ambiente local. Por ejemplo, un procedimiento que modifica una variable global.

Esto puede llevar a que dependiendo del orden de evaluación de dterminada expresión el valor resultante cambie.

teniendo lo siguiente

```
x = 1 
def f(a):
    x = 3
    return a

b = x + f(1)
```

Si se evalua de izquierda a derecha tenemos que b = 1 + 1 = 2. Si no tenemos que b = 3 + 1 = 4. Y 4 != 2.

Para evitar el efecto colateral se puede tomar uno de los siguientes caminos.

3. Defina operador sobrecargado y expresión de modo mixto.

*Operador sobrecargado*: Operador que sirve para varios tipos de datos.

*Expresión de modo mixto*: En una exresión un operador es utilizado en sus diferentes significados.

4. Qué es coerción? Defina conversión por estrechamiento y por ensanchamiento.

Es la conversión implícita.
Se le dice por estrechamiento cuando se pierde información o el tipo que se obtiene agrupa menos valores que el tipo de origen.

Por ejemplo: de float a int.

Y por ensanchamiento cuando no se pierde información o se aumenta la cantidad de valores posibles que puede tomar la variable.

Por ejemplo: de date a datetime.

5. ¿Qué es una evaluación de corto circuito? Nombre lenguajes que la usan para las expresiones booleanas,
lenguajes que no la usan y algún lenguaje en el que el programador pueda elegir.

Una expresión donde el lenguaje no requiere evaluar toda la expresión para conocer el resultado.

Por ejemplo: Expresión AND, al haber un valor falso ya toda la expresión se vuelve falsa.

ADA utiliza este tipo de evaluación.

6. ¿Cómo soporta C las expresiones relacionales y booleanas?

C toma las expresiones relacionales y booleanas a partir de valores numéricos, siendo 0 falso y todo lo demás verdadero.

7. ¿Cuál es el propósito de un operador de asignación? Indique una posible desventaja de tratar un operador de asignación como si fuera un operador aritmético. 

Ligar a una variable con un valor de determinado tipo.

Si se tomara como un operador se pueden dar situaciones del tipo

```
if (a = 1 + 1):
    statements...
```

En ese caso, la asignación en qué lugar se evalua, y qué valor retorna?

8. ¿Cuál es la asociatividad de un operador unario en C?

