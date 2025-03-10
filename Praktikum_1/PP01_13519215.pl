/*Nama: Leonard Matheus, NIM: 13519215*/
/*Untuk file .pl*/ 

/* Bagian 1 */ 
/* Deklarasi fakta */

/*pria */
pria(yoga).
pria(zayn).
pria(padil).
pria(jovan).
pria(zunan).
pria(farras).
pria(william).
pria(faris).
pria(thajeb).
/*wanita */
wanita(lisa).
wanita(asin).
wanita(rikha).
wanita(siti).
wanita(nurbaya).
/*X berusia y*/
usia(yoga,71).
usia(lisa,65).
usia(zayn,56).
usia(asin,51).
usia(padli,58).
usia(rikha,40).
usia(jovan,24).
usia(zunan,30).
usia(farras,32).
usia(siti,26).
usia(william,28).
usia(nurbaya,24).
usia(faris,6).
usia(thajeb,3).
/*X menikah dengan y*/
menikah(yoga,lisa).
menikah(lisa,yoga).
menikah(zayn,asin).
menikah(asin,zayn).
menikah(padil,rikha).
menikah(rikha,padil).
menikah(farras,siti).
menikah(siti,farras).
menikah(william,nurbaya).
menikah(nurbaya,william).
/*anak*/
anak(faris,farras).
anak(faris,siti).
anak(farras,yoga).
anak(farras,lisa).
anak(zunan,yoga).
anak(zunan,lisa).
anak(jovan,yoga).
anak(jovan,lisa).
anak(thajeb,william).
anak(thajeb,nurbaya).
anak(siti,zayn).
anak(siti,asin).
anak(william,zayn).
anak(william,asin).
anak(nurbaya,padil).
anak(nurbaya,rikha).
/*saudara kandung y*/
saudara(jovan,zunan).
saudara(zunan, jonan).
saudara(jovan,farras).
saudara(farras,jovan).
saudara(zunan,farras).
saudara(farras,zunan).
saudara(siti,william).
saudara(william,siti).

/* Deklarasi rules */ 
/*kakak dari y (baik perempuan maupun lelaki) */ 
kakak(X,Y):- anak(X,U), anak(Y,U),
    saudara(X,Y),
    usia(X,W), usia(Y,Z), W>Z,!.
/*keponakan dari y */ 
keponakan(X,Y) :- anak(X,U), saudara(Y,U),
    usia(X,W), usia(Y,Z), W<Z.
/*suami dari y */
suami(X,Y) :- pria(X),menikah(X,Y).
/*sepupu dari y */
sepupu(X,Y) :- anak(X,U), anak(Y,V), 
    saudara(U,V).
/*mertua dari y */
mertua(X,Y) :- anak(U,X), menikah(U,Y).
mertua(X,Y) :- anak(U,X), menikah(Y,U).
/*mertua dari y */
bibi(X,Y):- wanita(X),
    anak(Y,Z), saudara(X,Z).
/*cucu dari y */
cucu(X,Y) :- anak(U,Y), anak(X,U).
/*anak paling tua */
anaksulung(X) :-  \+(kakak(X,_)), anak(X, _).
/*anak paling tua */
anakbungsu(X) :-  \+(kakak(_,X)), anak(X, _).

/* Bagian 2 */ 
/* Deklarasi fakta */
faktorial(0, 1).
faktorial(N, X) :- 
    N > 0,
    Prev is N - 1,
    faktorial(Prev, R),
    X is R * N.

gcd(A,0,A).
gcd(A,B,X) :- (A<B), gcd(B,A,X).
gcd(A,B,X) :- (A>B), (B>0),
    R is A mod B, gcd(B,R,X).

power(_,0,1).
power(A,B,X) :- (A>0),(B>0),
    C is B-1, power(A,C,R),
    X is R*A.
power(A,B,X) :- (A<0),(B>0),
    C is B-1, power(A,C,R),
    X is R*A.

countDigit(0,1).
countDigit(1,1).
countDigit(A,X) :- (A>0),
    R is (A // 10), countDigit(R,N),
    X is N+1.

foreach(Generator, Goal) :-
    findall(Goal, Generator, Goals),
    maplist(call, Goals).
createTriangle(N) :- createTriangle(N, N-1).
createTriangle(0, _) :- nl.
createTriangle(N, K) :- N > 0, N1 is N - 1,
                Q is N1 + 1,
                foreach(between(1, Q, _), write('*')),
                nl, createTriangle(N1, K).

/* Bagian 3 */ 
/* Deklarasi fakta */
push(E, [], [E]).
push(E, [H|T], [H | Result]) :-
    push(E, T, Result).

pop([_ | T], T).
pop([H | T], [H | Result]) :-
    pop(T, Result).

front([H | _], H).
front([H | T], [H | Result]) :-
    front(T, Result).

back([X],X).
back([_|T],X) :- back(T,X).

take(N, _, Xs) :- N =< 0, !, N =:= 0, Xs = [].
take(_, [], []).
take(N, [X|Xs], [X|Ys]) :- M is N-1, take(M, Xs, Ys).

con([],L1,L1).
con([X|Tail],L2,[X|Tail1]):-
    con(Tail,L2,Tail1).

concatenate([], L1, 0, 0, L1).
concatenate(Flist, Slist, X, Y, Result) :- 
    take(X,Flist,M), take(Y,Slist,N),
    con(M,N,Result).

balik([],[]). 
balik([X],[X]).
balik([X|Xs],R) :- 
  balik(Xs,T),        
  push(X,T,R).
palindrom([]).
palindrom(L):-
    balik(L,L).

/* Bonus */ 
/* Deklarasi fakta */
kompres([],[]).
kompres([X],[X]).
kompres([X,X|Xs],Zs) :- kompres([X|Xs],Zs).
kompres([X,Y|Ys],[X|Zs]) :- X \= Y, kompres([Y|Ys],Zs).

operasi([]).
operasi(A) :- 
    operasi(A, X), X > 0, write(X).
dynamic(operasi).
operasi([A, B, C], X) :- A > B, B < C, X is 1, !; X is 0, !.
operasi([A|B], X) :- 
    operasi(B, Y), 
    (B = [C|D], D = [E|_], A > C, C < E, X is Y + 1; X is Y), !.

ridge([]).
ridge(A) :-
    kompres(A,X),
    operasi(X).