padrede(marcos,gustavo).
padrede(marcos,sabina).
padrede(ligia,gustavo).
padrede(ligia,sabina).
padrede(gustavo,maria).
padrede(sabina,carlos).
padrede(maria,samuel).
%Reglas
hijode(X,Y):- padrede(Y,X).
hermanode(X,Y):- padrede(Z, X),padrede(Z, Y).
abuelode(X,Y):- padrede(X,Z),padrede(Z,Y).
bisabuelode(X,Y):- padrede(X,Z),abuelode(Z,Y).
nietode(X,Y):- abuelode(Y,X).
tiode(X,Y):- padrede(Z, Y),hermanode(Z, X).
sobrinode(X,Y):- tiode(Y,X).
primode(X, Y):- padrede(Z, X),tiode(Z, Y).
bisnietode(X,Y):- bisabuelode(Y,X).
soncasados(X,Y):- padrede(X,Z),padrede(Y,Z).
esfeliz(X):- soncasados(X,_).

familiarde(A,B) :- padrede(A,B), A\==B.
familiarde(A,B) :- hermanode(A,B), A\==B.
familiarde(A,B) :- tiode(A,B), A\==B.
familiarde(A,B) :- primode(A,B), A\==B.
familiarde(A,B) :- abuelode(A,B), A\==B.
familiarde(A,B) :- nietode(A,B), A\==B.
familiarde(A,B) :- sobrinode(A,B), A\==B.
familiarde(A,B) :- bisabuelode(A,B), A\==B.
familiarde(A,B) :- bisnietode(A,B), A\==B.
familiares(X,L):- findall(B,familiarde(X,B),L).


