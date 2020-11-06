/*consult('D:/git/IF2121_Prolog/Praktikum_1/PP01_13519215').*/
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