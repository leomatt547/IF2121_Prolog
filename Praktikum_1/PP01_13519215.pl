/*Untuk File .pl*/ 

/* Bagian 1 */ 
/* Deklarasi Fakta */

/* X adalah pria */
pria(X). 
/*X adalah wanita */
wanita(X).
/*X berusia Y*/
usia(X,Y).
/*X menikah dengan Y*/
menikah(X,Y).
/*X adalah anak Y*/
anak(X,Y).
/*X adalah saudara kandung Y*/
saudara(X,Y).

/* Deklarasi Rules */ 
/* X adalah kakak dari Y (baik perempuan maupun lelaki) */ 
kakak(X,Y) :- pria(X),saudara(X,Y).
kakak(X,Y) :- wanita(X),saudara(X,Y).
kakak(X,Y) :- not(kakak(Y,X)).
/* X adalah keponakan dari Y */ 
keponakan(X,Y) :- not(keponakan(Y,X)).
keponakan(X,Y) :- bibi(X,Y).
/* X adalah suami dari Y */
suami(X,Y) :- menikah(X,Y),pria(X).
suami(X,Y) :- not(suami(Y,X)).
/* X adalah sepupu dari Y */
sepupu(X,Y) :- not(sepupu(Y,X)).
/* X adalah mertua dari Y */
mertua(X,Y) :- not(mertua(Y,X)).
/* X adalah mertua dari Y */
bibi(X,Y) :- not(bibi(Y,X)).
bibi(X,Y) :- keponakan(Y,X).
/* X adalah cucu dari Y */
cucu(X,Y) :- not(cucu(Y,X)).
bibi(X,Y) :- keponakan(Y,X).
/* X adalah anak paling tua */
anaksulung(X) :- anak(X,Y)
anaksulung(X) :- saudara(X,Y)
anaksulung(X) :- not(anakbungsu(X))
/* X adalah anak paling tua */
anakbungsu(X) :- anak(X,Y)
anakbungsu(X) :- saudara(X,Y)
anakbungsu(X) :- not(anaksulung(X))