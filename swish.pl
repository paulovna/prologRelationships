homem(pedro).
homem(mario).
homem(francisco).
homem(pietro).
homem(enzo).
homem(joao).
homem(carlos).

mulher(antonia).
mulher(helena).
mulher(francisca).
mulher(milene).
% Supondo que o Enzo seja casado com Antonia e que essa Antonia nao seja a sua avó
mulher(antonia2).
mulher(ana).
mulher(clara).
mulher(joana).

conjuge(X,Y) :- conjuge(Y,X).
conjuge(pedro,antonia).
conjuge(helena,mario).
conjuge(francisco,milene).
conjuge(francisca,pietro).
conjuge(enzo,antonia2).
progenitor(pedro, joao).
progenitor(antonia, joao).
progenitor(pedro, clara).
progenitor(antonia, clara).
progenitor(pedro, francisco).
progenitor(antonia, francisco).
progenitor(pedro, ana).
progenitor(antonia, ana).
progenitor(ana,helena).
progenitor(ana,joana).
progenitor(joao, mario).
progenitor(helena, carlos).
progenitor(mario, carlos).
progenitor(clara, pietro).
progenitor(clara, enzo).

%Só para testes
marido(X,Y) :- conjuge(X,Y), homem(X), mulher(Y).
esposa(X,Y) :- conjuge(X,Y), mulher(X), homem(Y).

%avo_f (avó) e avo_m(avô)
avo_f(X,Y) :- mulher(X), progenitor(Z,Y), progenitor(X,Z).
avo_m(X,Y) :- homem(X), progenitor(Z,Y), progenitor(X,Z).

irmao(X,Y) :- homem(X), progenitor(Z,X), progenitor(Z,Y), X\==Y.
irma(X,Y) :- mulher(X), progenitor(Z,X), progenitor(Z,Y), X\==Y.
irmao_geral(X,Y) :- progenitor(Z,X), progenitor(Z,Y), X\==Y.

tio(X,Y) :- progenitor(Z,Y), irmao(X,Z).
tia(X,Y) :- progenitor(Z,Y), irma(X,Z).

primo(X,Y) :- homem(X), progenitor(Z,X), irmao_geral(A,Z), progenitor(A,Y).
prima(X,Y) :- mulher(X), progenitor(Z,X), irmao_geral(A,Z), progenitor(A,Y).

%Segundo o dicionário, descendente é aquele que descende de alguém, como um filho, neto ou bisneto
%Sendo assim, entendo que descendente(X,Y) quer dizer que Y é pai, avo, bisavo etc. de X
descendente(X,Y) :- progenitor(Y,X).
descendente(X,Y) :- progenitor(Y,Z), descendente(X,Z).

ascendente(X,Y) :- progenitor(X,Y).
ascendente(X,Y) :- progenitor(Z,Y), ascendente(X,Z).

