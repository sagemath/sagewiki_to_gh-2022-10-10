\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\       Copyright (C) 2011 Denis Simon
\\
\\ Distributed under the terms of the GNU General Public License (GPL)
\\
\\    This code is distributed in the hope that it will be useful,
\\    but WITHOUT ANY WARRANTY; without even the implied warranty of
\\    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
\\    General Public License for more details.
\\
\\ The full text of the GPL is available at:
\\
\\                 http://www.gnu.org/licenses/
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/*
  Auteur :
  Denis SIMON -> simon@math.unicaen.fr
  adresse du fichier : 
  www.math.unicaen.fr/~simon/ellQ.gp

  *********************************************
  *          VERSION 24/01/2011               *
  *********************************************


  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\             English                      \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  This package provides functions to compute the rank of elliptic
  curves over Q using 2-descent.
  This package requires the other package qfsolve.gp downloadable at
  www.math.unicaen.fr/~simon/qfsolve.gp
  They can be run under GP by the commands 
  gp > \r qfsolve.gp
  gp > \r ellQ.gp

  The main function is ellrank(), which takes as an argument
  any elliptic curve in the form [a1,a2,a3,a4,a6]
  the result is a vector [r,s,v], where
    r is a lower bound for the rank,
    s is the rank of the 2-Selmer group
    v is a set of independant points in E(Q)/2E(Q).

  Example:

  gp > ell = [1,2,3,4,5];
  gp > ellrank(ell)
  %1 = [1, 1, [[1,2]]
  In this example, the rank is exactly 1, and [1,2] has infinite order.

  more details on the computations may be obtained by setting
  DEBUGLEVEL_ell = 1 (the higher value, the more details)

  Other functions: 

  ell2descent_complete, ell2descent_gen, ell2descent_viaisog,
  ellhalf, ellredgen, ellsort, elltors2, elltorseven,
  locallysoluble, polratroots, ratpoint, redquartic,
  bnfpSelmer, reducemodsquares

  Quick information is obtained by typing
  gp > ?NameOfTheFunction

  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\    Comment utiliser ce programme ?       \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  Programme de calcul du rang des courbes elliptiques sur Q.
  langage : GP
  pour l'utiliser, lancer gp, puis taper
  \r ellQ.gp

  Ce programme utilise le module de resolution des formes quadratiques
  situe a l'adresse
  www.math.unicaen.fr/~simon/qfsolve.gp
  Il faut donc aussi taper :
  \r qfsolve.gp


  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\  Description des principales fonctions   \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  Explications succintes :
  La fonction ellrank() accepte toutes les courbes sous la forme
  [a1,a2,a3,a4,a6]
  Les coefficients peuvent etre entiers ou non.
  L'algorithme utilise est celui de la 2-descente.
  La 2-torsion peut etre quelconque.
  Il suffit de taper : 

  gp > ell = [a1,a2,a3,a4,a6];
  gp > ellrank(ell)

  Retourne un vecteur [r,s,v] ou
    r est le rang probable (c'est toujours une minoration du rang),
    s est le 2-rang du groupe de Selmer,
    v est une liste de points independants dans E(Q)/2E(Q).

  Exemple :

  gp > ell = [1,2,3,4,5];
  gp > ellrank(ell)
  %1 = [1, 1, [[1,2]]
  Ici, le rang est exactement 1, et le point [1,2] est d'ordre infini.

  Courbes de la forme : k*y^2 = x^3+A*x^2+B*x+C
  sans 2-torsion, A,B,C entiers.
  gp > bnf = bnfinit(x^3+A*x^2+B*x+C);
  gp > ell = ellinit([0,A,0,B,C],1);
  gp > rank = ell2descent_gen(ell,bnf,k);

  Courbes avec #E[2](Q) >= 2 :
  ell doit etre sous la forme 
  y^2 = x^3 + A*^2 + B*x
  avec A et B entiers.
  gp > ell = [0,A,0,B,0]
  gp > ell2descent_viaisog(ell)
  = algorithme de la 2-descente par isogenies
  Attention A et B doivent etre entiers

  Courbes avec #E[2](Q) = 4 : y^2 = (x-e1)*(x-e2)*(x-e3)
  gp > ell2descent_complete(e1,e2,e3)
  = algorithme de la 2-descente complete
  Attention : les ei doivent etre entiers.

  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\     Autres fonctions utiles              \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  elltors2(E)      : determine le groupe E[2](Q)
  elltorseven(E)   : determine le groupe E[2^*](Q)
  ellhalf(E,P)     : liste les points Q tels que 2Q = P
  ellredgen(E,v)   : reduction des points de v sur E

  locallysoluble(pol): teste si y^2=pol(x) est ELS
  ratpoint(pol,lim): cherche un point sur y^2=pol(x)
  redquartic(pol): reduction de la quartique pol
  polratroots(pol) : liste les solutions rationnelles de pol


  Aide en ligne :
  ?NomDeLaFonction


  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\       Affichage des calculs              \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  On peut avoir plus ou moins de details de calculs avec
  DEBUGLEVEL_ell = 0;
  DEBUGLEVEL_ell = 1; 2; 3;...

*/

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\       Copyright (C) 2011 Denis Simon
\\
\\ Distributed under the terms of the GNU General Public License (GPL)
\\
\\    This code is distributed in the hope that it will be useful,
\\    but WITHOUT ANY WARRANTY; without even the implied warranty of
\\    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
\\    General Public License for more details.
\\
\\ The full text of the GPL is available at:
\\
\\                 http://www.gnu.org/licenses/
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

/*
  Author:
  Denis SIMON -> simon@math.unicaen.fr
  address of the file:
  www.math.unicaen.fr/~simon/qfsolve.gp

  *********************************************
  *          VERSION 21/02/2011               *
  *********************************************

  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\                English help                \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  This package provides functions to solve quadratic equations over Q.
  language: GP
  It can be run under GP by the command
  gp > \r qfsolve.gp

  This package contains 4 main functions:

  - Qfsolve(G,factD): solve over Q the quadratic equation X~*G*X = 0.
  G must be a symmetric matrix n*n, with coefficients in Z.
  If no solution exists, the output is a prime number
  indicating that there is no solution in the local field Q_p
  (-1 for the reals).
  This algorithm requires the factorization of -abs(2*matdet(G)).
  If this factorization is known, one can give it as factD (the second
  argument of the function) and save a lot of time.

  - Qfparam(G,sol,fl): parametrization by quadratic forms of the
  solutions of the ternary quadratic form G, using the particular
  solution sol.
  If fl>0, then the 'fl'th form is reduced.

  - IndefiniteLLL(G,c): Solve or reduce the quadratic form G with
  integral coefficients. G might be definite or indefinite.
  This is an LLL-type algorithm with a constant 1/4<c<1. 

  - class2(d,factd): computes the 2-Sylow of the (narrow) class group
  of discriminant d. d must be a fondamental discriminant.
  This algorithm requires the factorization of abs(2*d).
  If this factorization is known, one can give it as factd (the second
  argument of the function) and the algorithm runs in polynomial time.

  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
  \\         Description des fonctions          \\
  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  Programme de resolution des equations quadratiques
  langage: GP
  pour l'utiliser, lancer gp, puis taper
  \r qfsolve.gp

  Ce fichier contient 4 principales fonctions:

  - Qfsolve(G,factD): pour resoudre l'equation quadratique X^t*G*X = 0
  G doit etre une matrice symetrique n*n, a coefficients dans Z.
  S'il n'existe pas de solution, la reponse est un entier
  indiquant un corps local dans lequel aucune solution n'existe
  (-1 pour les reels, p pour Q_p).
  Si on connait la factorisation de -abs(2*matdet(G)),
  on peut la passer par le parametre factD pour gagner du temps.

  - Qfparam(G,sol,fl): pour parametrer les solutions de la forme
  quadratique ternaire G, en utilisant la solution particuliere sol.
  si fl>0, la 'fl'eme forme quadratique est reduite.

  - IndefiniteLLL(G,c): pour resoudre ou reduire la forme quadratique
  G a coefficients entiers. Il s'agit d'un algorithme type LLL, avec la
  constante 1/4<c<1.

  - class2(d,factd): determine le 2-Sylow du (narrow) groupe de classes de
  discriminant d, ou d est un discriminant fondamental.
  Si on connait la factorisation de abs(2*d),
  on peut la donner dans factd, et dans ce cas le reste
  de l'algorithme est polynomial.

*/

\\
\\ Usual global variables
\\ 

DEBUGLEVEL_qfsolve = 0;

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\          SCRIPT                             \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

{QfbReduce(M) =
\\ M = [a,b;b;c] has integral coefficients.
\\ Reduction of the binary quadratic form
\\   qf = (a,b,c)=a*X^2+2*b*X*Y+c*Y^2
\\ Returns the reduction matrix with det = +1.

local(a,b,c,H,test,di,q,r,nexta,nextb,nextc,aux);

if( DEBUGLEVEL_qfsolve >= 5, print("     starting QfbReduce with ",M));

  a = M[1,1]; b = M[1,2]; c = M[2,2];
  
  H = matid(2); test = 1;
  while( test && a,
    di = divrem(b,a); q = di[1]; r = di[2];
    if( 2*r > abs(a), r -= abs(a); q += sign(a));
    H[,2] -= q*H[,1];
    nextc = a; nextb = -r; nexta= (nextb-b)*q+c;
 
    if( test = abs(nexta) < abs(a),
      c = nextc; b = nextb; a = nexta;
      aux = H[,1]; H[,1] = -H[,2]; H[,2] = aux
    ) 
  );

if( DEBUGLEVEL_qfsolve >= 5, print("     end of QfbReduce with ",H));
return(H);
}
{IndefiniteLLL(G,c=1,base=0) =
\\ Performs first a LLL reduction on a positive definite
\\ quadratic form QD bounding the indefinite G.
\\ Then finishes the reduction with IndefiniteLLL2.

local(n,M,QD,M1,S,red);

  n = length(G);
  M = matid(n);
  QD = G;
  for( i = 1, n-1,
    if( !QD[i,i],
return(IndefiniteLLL2(G,c,base))
    );
    M1 = matid(n);
    M1[i,] = -QD[i,]/QD[i,i];
    M1[i,i] = 1;
    M = M*M1;
    QD = M1~*QD*M1
  );
  M = M^(-1);
  QD = M~*abs(QD)*M;
  S = qflllgram(QD/content(QD));
  red = IndefiniteLLL2(S~*G*S,c,base);
  if( type(red) == "t_COL",
return(S*red));
  if( length(red) == 3,
return([red[1],S*red[2],S*red[3]]));
return([red[1],S*red[2]]);
}
{IndefiniteLLL2(G,c=1,base=0) =
\\ following Cohen's book p. 86
\\ but without b and bstar: works on G
\\ returns [H~*G*H,H] where det(H) = 1 and H~*G*H is reduced.
\\ Exit with a norm 0 vector if one such is found.
\\ If base == 1 and norm 0 is obtained, returns [H~*G*H,H,sol] where 
\\   sol is a norm 0 vector and is the 1st column of H.

local(n,H,M,A,aux,sol,k,nextk,swap,q,di,HM,aux1,aux2,Mkk1,bk1new,Mkk1new,newG);

  n = length(G);
if( DEBUGLEVEL_qfsolve >= 3, print("   LLL dim ",n," avec |G| = ",log(vecmax(abs(G)))/log(10)));
if( DEBUGLEVEL_qfsolve >= 4, print("    LLL with ");print(G));
/* MODI2.1 */

 if( n <= 1, return([G,matid(n)]));

  H = M = matid(n); A = matrix(n,n);

\\ compute Gram-Schmidt  

  for( i = 1, n,
    if( !(A[i,i] = G[i,i]),
      if( base,
        aux = H[,1]; H[,1] = H[,i]; H[,i] = -aux;
        return([H~*G*H,H,H[,1]])
      , return(M[,i])));
    for( j = 1, i-1,
      A[i,j] = G[i,j] - sum( k = 1, j-1, M[j,k]*A[i,k]);
      M[i,j] = A[i,j]/A[j,j];
      A[i,i] -= M[i,j]*A[i,j];
      if( !A[i,i], 
        sol = (M^(-1))~[,i]; sol /= content(sol);
        if( base,
          H = completebasis(sol);
          aux = H[,1]; H[,1] = H[,n]; H[,n]= -aux;
          return([H~*G*H,H,H[,1]])
        , return(sol)))
    )
  );

\\ LLL loop

  k = 2; nextk = 1;
  while( k <= n,

    swap = 1;
    while( swap,
      swap = 0;

\\ red(k,k-1);
      if( q = round(M[k,k-1]),
        for( i = 1, k-2, M[k,i] -= q*M[k-1,i]);
        M[k,k-1] -= q;
        for( i = 1, n,
          A[k,i] -= q*A[k-1,i];
          H[i,k] -= q*H[i,k-1]
        )
      );

\\ preparation of swap(k,k-1)

      if( issquare( di = -A[k-1,k-1]*A[k,k]),
\\ di is the determinant of matr
\\ We find a solution
        HM = (M^(-1))~;
        aux1 = sqrtint(numerator(di));
        aux2 = sqrtint(denominator(di));
        sol = aux1*HM[,k-1]+aux2*A[k-1,k-1]*HM[,k];
        sol /= content(sol);
        if( base,
          H = H*completebasis(sol,1);
          aux = H[,1]; H[,1] = H[,n]; H[,n] = -aux;
          return([H~*G*H,H,H[,1]])
        , return(H*sol)
        )
      );

\\ Reduction [k,k-1].
      Mkk1 = M[k,k-1];
      bk1new = Mkk1^2*A[k-1,k-1] + A[k,k];
      if( swap = abs(bk1new) < c*abs(A[k-1,k-1]),
        Mkk1new = -Mkk1*A[k-1,k-1]/bk1new
      );

\\ Update the matrices after the swap.
      if( swap,
        for( j = 1, n,
          aux = H[j,k-1]; H[j,k-1] = H[j,k]; H[j,k] = -aux);
        for( j = 1, k-2,
          aux = M[k-1,j]; M[k-1,j] = M[k,j]; M[k,j] = -aux);
        for( j = k+1, n,
          aux = M[j,k]; M[j,k] = -M[j,k-1]+Mkk1*aux; M[j,k-1] = aux+Mkk1new*M[j,k]);
        for( j = 1, n, if( j != k && j != k-1,
          aux = A[k-1,j]; A[k-1,j] = A[k,j]; A[k,j] =- aux;
          aux = A[j,k-1]; A[j,k-1] = Mkk1*aux+A[j,k]; A[j,k] = -aux-Mkk1new*A[j,k-1]));

        aux1 = A[k-1,k-1];
        aux2 = A[k,k-1];
        A[k,k-1]  =-A[k-1,k] - Mkk1*aux1;
        A[k-1,k-1]= A[k,k]   + Mkk1*aux2;
        A[k,k]    = aux1     - Mkk1new*A[k,k-1];
        A[k-1,k]  =-aux2     - Mkk1new*A[k-1,k-1];

        M[k,k-1] = Mkk1new;

if( DEBUGLEVEL_qfsolve >=4, newG=H~*G*H;print(vector(n,i,matdet(vecextract(newG,1<<i-1,1<<i-1)))));

        if( k != 2, k--)
      )
    );

    forstep( l = k-2, 1, -1,
\\ red(k,l)
      if( q = round(M[k,l]),
        for( i = 1, l-1, M[k,i] -= q*M[l,i]);
        M[k,l] -= q;
        for( i = 1, n,
          A[k,i] -= q*A[l,i];
          H[i,k] -= q*H[i,l]
        )
      )
    );
    k++
  );
return([H~*G*H,H]);
}
{kermodp(M,p) =
\\ Compute the kernel of M mod p.
\\ returns [d,U], where
\\ d = dim (ker M mod p)
\\ U in SLn(Z), and its first d columns span the kernel.

local(n,U,d);

  n = length(M);
  U = centerlift(matker(M*Mod(1,p)));
  d = length(U);
  U = completebasis(U);
  U = matrix(n,n,i,j,U[i,n+1-j]);
return([d,U]);
}
{Qfparam(G,sol,fl=3) =
\\ G is a symmetric 3x3 matrix, and sol a solution of sol~*G*sol=0.
\\ Returns a parametrization of the solutions with the good invariants,
\\ as a matrix 3x3, where each line contains
\\ the coefficients of each of the 3 quadratic forms.

\\ If fl!=0, the fl-th form is reduced.

local(U,G1,G2);

if( DEBUGLEVEL_qfsolve >= 5, print("     starting Qfparam"));
  sol /= content(sol);
\\ build U such that U[,3] = sol, and det(U) = +-1
  U = completebasis(sol,1);
  G1 = U~*G*U; \\ G1 has a 0 at the bottom right corner
  G2 = [-2*G1[1,3],-2*G1[2,3],0;
      0,-2*G1[1,3],-2*G1[2,3];
      G1[1,1],2*G1[1,2],G1[2,2]];
  sol = U*G2;
  if(fl && !issquare(-matdet( U = [sol[fl,1],sol[fl,2]/2;
                                  sol[fl,2]/2,sol[fl,3]])),
    U = QfbReduce(U);
    U = [U[1,1]^2,2*U[1,2]*U[1,1],U[1,2]^2;
         U[2,1]*U[1,1],U[2,2]*U[1,1]+U[2,1]*U[1,2],U[1,2]*U[2,2];
         U[2,1]^2,2*U[2,1]*U[2,2],U[2,2]^2];
    sol = sol*U
  );
if( DEBUGLEVEL_qfsolve >= 5, print("     end of Qfparam"));
return(sol);
}
{LLLgoon3(G,c=1) =
\\ LLL reduction of the quadratic form G (Gram matrix)
\\ in dim 3 only, with detG = -1 and sign(G) = [1,2];

local(red,U1,G2,bez,U2,G3,cc,U3);

  red = IndefiniteLLL(G,c,1);
\\ We always find an isotropic vector.
  U1 = [0,0,1;0,1,0;1,0,0];
  G2 = U1~*red[1]*U1;
\\ G2 has a 0 at the bottom right corner.
  bez = bezout(G2[3,1],G2[3,2]);
  U2 = [bez[1],G2[3,2]/bez[3],0;bez[2],-G2[3,1]/bez[3],0;0,0,-1];
  G3 = U2~*G2*U2;
\\ G3 has 0 under the co-diagonal.
  cc = G3[1,1]%2;
  U3 = [1,0,0;  cc,1,0;
        round(-(G3[1,1]+cc*(2*G3[1,2]+G3[2,2]*cc))/2/G3[1,3]),
        round(-(G3[1,2]+cc*G3[2,2])/G3[1,3]),1];
return([U3~*G3*U3,red[2]*U1*U2*U3]);
}
{completebasis(v,redflag=0) =
\\ Gives a unimodular matrix with the last column equal to v.
\\ If redflag <> 0, then the first columns are reduced.

local(U,n,re);

  v = Mat(v);
  n = length(v~);
  if( n == length(v), return(v));
  U = (mathnf(v~,1)[2]~)^-1;
  if( n==1 || !redflag, return(U));
  re = qflll(vecextract(U,1<<n-1,1<<(n-#v)-1));
return( U*matdiagonalblock([re,matid(#v)]));
}
{LLLgoon(G,c=1) =
\\ LLL reduction of the quadratic form G (Gram matrix)
\\ where we go on, even if an isotropic vector is found.

local(red,U1,G2,U2,G3,n,U3,G4,U,V,B,U4,G5,U5,G6);

  red = IndefiniteLLL(G,c,1);
\\ If no isotropic vector is found, nothing to do.
  if( length(red) == 2, return(red));
\\ otherwise:
  U1 = red[2];
  G2 = red[1]; \\ On a G2[1,1] = 0
  U2 = mathnf(Mat(G2[1,]),4)[2];
  G3 = U2~*G2*U2;
\\ The first line of the matrix G3 only contains 0,
\\ except some 'g' on the right, where g^2| det G.
  n = length(G);
  U3 = matid(n); U3[1,n] = round(-G3[n,n]/G3[1,n]/2);
  G4 = U3~*G3*U3;
\\ The coeff G4[n,n] is reduced modulo 2g
  U = vecextract(G4,[1,n],[1,n]);
  if( n == 2,
    V = matrix(2,0)
  , V = vecextract(G4,[1,n],1<<(n-1)-2));
  B = round(-U^-1*V);
  U4 = matid(n);
  for( j = 2, n-1,
    U4[1,j] = B[1,j-1];
    U4[n,j] = B[2,j-1]
  );
  G5 = U4~*G4*U4;
\\ The last column of G5 is reduced
  if( n < 4, return([G5,U1*U2*U3*U4]));

  red = LLLgoon(matrix(n-2,n-2,i,j,G5[i+1,j+1]),c);
  U5 = matdiagonalblock([Mat(1),red[2],Mat(1)]);
  G6 = U5~*G5*U5;
return([G6,U1*U2*U3*U4*U5]);
}
{QfWittinvariant(G,p) =
\\ Compute the c-invariant (=Witt invariant) of a quadratic form
\\ at a prime (real place if p = -1)
/* MODI have to change det into det_s */

local(n,det_s,diag,c);

  n = length(G);
\\ Diagonalize G first.
  det_s  = vector( n+1, i, matdet(matrix(i-1,i-1,j,k,G[j,k])));
  diag = vector( n, i, det_s[i+1]/det_s[i]);

\\ Then compute Hilbert symbols
  c = prod( i = 1, n,
        prod( j = i+1, n,
          hilbert( diag[i], diag[j], p)));
return(c);
}
{Qflisteinvariants(G,fa=[]) =
\\ G is a quadratic form, or a symmetrix matrix,
\\ or a list of quadratic forms with the same discriminant.
\\ If given, fa must be equal to factor(-abs(2*matdet(G)))[,1].

local(l,sol,n,det_s);

if( DEBUGLEVEL_qfsolve >= 4, print("    starting Qflisteinvariants ",G));
  if( type(G) != "t_VEC", G = [G]);
  l = length(G);
  for( j = 1, l,   
    if( type(G[j]) == "t_QFI" || type(G[j]) == "t_QFR", 
      G[j] = mymat(G[j])));

  if( !length(fa), 
    fa = factor(-abs(2*matdet(G[1])))[,1]);

  if( length(G[1]) == 2, 
\\ In dimension 2, each invariant is a single Hilbert symbol.
    det_s = -matdet(G[1]);
    sol = matrix(length(fa),l,i,j,hilbert(G[j][1,1],det_s,fa[i])<0);
if( DEBUGLEVEL_qfsolve >= 4, print("    end of Qflisteinvariants"));
    return([fa,sol])
  );

  sol = matrix(length(fa),l);
  for( j = 1, l,
    n = length(G[j]);
\\ In dimension n, we need to compute a product of n Hilbert symbols.
    det_s = vector(n+1, i, matdet(matrix(i-1,i-1,k,m,G[j][k,m])));
    for( i = 1, length(fa),
      sol[i,j] = prod( k = 1, n-1, hilbert(-det_s[k],det_s[k+1],fa[i]))*hilbert(det_s[n],det_s[n+1],fa[i]) < 0;
    )
  );
if( DEBUGLEVEL_qfsolve >= 4, print("    end of Qflisteinvariants"));
return([fa,sol]);
}
{Qfsolvemodp(G,p) =
\\ p a prime number. 
\\ finds a solution mod p for the quadatic form G
\\ such that det(G) !=0 mod p and dim G = n>=3;
local(n,vdet,G2,sol,x1,x2,x3,N1,N2,N3,s,r);

  n = length(G);
  vdet = [0,0,0];
  for( i = 1, 3,
    G2 = vecextract(G,1<<i-1,1<<i-1)*Mod(1,p);
    if( !(vdet[i] = matdet(G2)),
      sol = kermodp(lift(G2),p)[2][,1];
      sol = vectorv(n, j, if( j <= i, sol[j]));
      return(sol)
    )
  );
\\ now, solve in dimension 3...
\\ reduction to the diagonal case:
  x1 = [1,0,0]~;
  x2 = [-G2[1,2],G2[1,1],0]~;
  x3 = [G2[2,2]*G2[1,3]-G2[2,3]*G2[1,2],G2[1,1]*G2[2,3]-G2[1,3]*G2[1,2],G2[1,2]^2-G2[1,1]*G2[2,2]]~;
  while(1,
    if( issquare( N1 = -vdet[2]),                 s = sqrt(N1); sol = s*x1+x2; break);
    if( issquare( N2 = -vdet[3]/vdet[1]),         s = sqrt(N2); sol = s*x2+x3; break);
    if( issquare( N3 = -vdet[2]*vdet[3]/vdet[1]), s = sqrt(N3); sol = s*x1+x3; break);
    r = 1;
    while( !issquare( s = (1-N1*r^2)/N3), r = random(p));
    s = sqrt(s); sol = x1+r*x2+s*x3; break
  );
  sol = vectorv(n, j, if( j <= 3, sol[j]));
return(sol);
}
{Qfminim(G,factdetG=0) =
\\ Minimization of the quadratic form G, with nonzero determinant.
\\ of dimension n>=2. 
\\ G must by symmetric and have integral coefficients.
\\ Returns [G',U,factd] with U in GLn(Q) such that G'=U~*G*U*constant
\\ is integral and has minimal determinant.
\\ In dimension 3 or 4, may return a prime p
\\ if the reduction at p is impossible because of the local non solvability.
\\ If given, factdetG must be equal to factor(abs(det(G))).
local(n,factd,detG,i,U,vp,Ker,dimKer,Ker2,dimKer2,sol,aux,p,di,m);

  n = length(G);
  factd = matrix(0,2);
  if( !factdetG,
    detG = matdet(G);
    factdetG = factor(detG)
  );

  i = 1; U = matid(n);
  while(i <= length(factdetG[,1]),
    p = factdetG[i,1];
    if( p == -1, i++; next);
    vp = factdetG[i,2];
if( DEBUGLEVEL_qfsolve >= 4, print("    p = ",p,"^",vp));
    if( vp == 0, i++; next);
\\ The case vp = 1 can be minimized only if n is odd.
    if( vp == 1 && n%2 == 0,
      factd = concat(factd~, Mat([p,1])~)~;
      i++; next
    );
    Ker = kermodp(G,p); dimKer = Ker[1]; Ker = Ker[2];
\\ Rem: we must have dimKer <= vp
if( DEBUGLEVEL_qfsolve >= 4, print("    dimKer = ",dimKer));
\\ trivial case: dimKer = n
    if( dimKer == n, 
if( DEBUGLEVEL_qfsolve >= 4, print("     case 0: dimKer = n"));
      G /= p;
      factdetG[i,2] -= n;
      next
    );
    G = Ker~*G*Ker;
    U = U*Ker;
\\ 1st case: dimKer < vp
\\ then the kernel mod p contains a kernel mod p^2
    if( dimKer < vp,
if( DEBUGLEVEL_qfsolve >= 4, print("    case 1: dimker < vp"));
      Ker2 = kermodp(matrix(dimKer,dimKer,j,k,G[j,k]/p),p);
      dimKer2 = Ker2[1]; Ker2 = Ker2[2];
      for( j = 1, dimKer2, Ker2[,j] /= p);
      Ker2 = matdiagonalblock([Ker2,matid(n-dimKer)]);
      G = Ker2~*G*Ker2;
      U = U*Ker2;
      factdetG[i,2] -= 2*dimKer2;
if( DEBUGLEVEL_qfsolve >= 4, print("    end of case 1"));
      next
    );

\\ Now, we have vp = dimKer 
\\ 2nd case: the dimension of the kernel is >=2
\\ and contains an element of norm 0 mod p^2
    if( dimKer > 2 || 
       (dimKer == 2 && issquare(di=Mod((G[1,2]^2-G[1,1]*G[2,2])/p^2,p))),
\\ search for an element of norm p^2... in the kernel
      if( dimKer > 2,
if( DEBUGLEVEL_qfsolve >= 4, print("    case 2.1"));
        dimKer = 3;
        sol = Qfsolvemodp(matrix(3,3,j,k,G[j,k]/p),p)
      ,  
if( DEBUGLEVEL_qfsolve >= 4, print("    case 2.2"));
        if( G[1,1]%p^2 == 0, 
          sol = [1,0]~
        , sol = [-G[1,2]/p+sqrt(di),Mod(G[1,1]/p,p)]~
        )
      );
      sol = centerlift(sol); sol /= content(sol);
if( DEBUGLEVEL_qfsolve >= 4, print("    sol = ",sol));
      Ker = vectorv(n, j, if( j<= dimKer, sol[j], 0)); \\ fill with 0's
      Ker = completebasis(Ker,1);
      Ker[,n] /= p;
      G = Ker~*G*Ker;
      U = U*Ker;
      factdetG[i,2] -= 2;
if( DEBUGLEVEL_qfsolve >= 4, print("    end of case 2"));
      next
    );

\\ Now, we have vp = dimKer <= 2 
\\   and the kernel contains no vector with norm p^2...

\\ In some cases, exchanging the kernel and the image
\\ makes the minimization easy.

    m = (n-1)\2-1;
    if( ( vp == 1 && issquare(Mod(-(-1)^m*matdet(G)/G[1,1],p)))
     || ( vp == 2 && n%2 == 1 && n >= 5)
     || ( vp == 2 && n%2 == 0 && !issquare(Mod((-1)^m*matdet(G)/p^2,p)))
    , 
if( DEBUGLEVEL_qfsolve >= 4, print("    case 3"));
      Ker = matid(n);
      for( j = dimKer+1, n, Ker[j,j] = p);
      G = Ker~*G*Ker/p;
      U = U*Ker;
      factdetG[i,2] -= 2*dimKer-n;
if( DEBUGLEVEL_qfsolve >= 4, print("    end of case 3"));
      next
    );

\\ Minimization was not possible se far.
\\ If n == 3 or 4, this proves the local non-solubility at p.
    if( n == 3 || n == 4, 
if( DEBUGLEVEL_qfsolve >= 1, print(" no local solution at ",p));
      return(p));

if( DEBUGLEVEL_qfsolve >= 4, print("    prime ",p," finished"));
    factd = concat(factd~,Mat([p,vp])~)~;
    i++
  );
\\ apply LLL to avoid coefficients explosion
  aux = qflll(U);
return([aux~*G*aux,U*aux,factd]);
}
{mymat(qfb) = qfb = Vec(qfb);[qfb[1],qfb[2]/2;qfb[2]/2,qfb[3]];
}
{Qfbsqrtgauss(G,factdetG) =
\\ Compute the square root of the quadratic form G.
\\ This function is not fully implemented.
\\ For the moment it only works for detG squarefree
\\ (except at 2, where the valuation is 2 or 3).
\\ factdetG must be given and is equal to factor(2*abs(det G))
local(a,b,c,d,m,n,p,aux,Q1,M);

if( DEBUGLEVEL_qfsolve >=3, print("   starting Qfbsqrtgauss with ",G,factdetG));
  G = Vec(G);
  a = G[1]; b = G[2]/2; c = G[3]; d = a*c-b^2;

\\ 1st step: solve m^2 = a (d), m*n = -b (d), n^2 = c (d)
  m = n = Mod(1,1);
  factdetG[1,2] -= 3;
  for( i = 1, length(factdetG[,1]),
    if( !factdetG[i,2], next);
    p = factdetG[i,1];
    if( gcd(a,p) == 1,
      aux = sqrt(Mod(a,p));
      m = chinese(m,aux);
      n = chinese(n,-b/aux)
    ,
      aux = sqrt(Mod(c,p));
      n = chinese(n,aux);
      m = chinese(m,-b/aux)
    )
  );
  m = centerlift(m);  n = centerlift(n);
if( DEBUGLEVEL_qfsolve >=4, print("    m = ",m); print("    n = ",n));
  
\\ 2nd step: build Q1, with det=-1 such that Q1(x,y,0) = G(x,y)
  Q1 = [(n^2-c)/d, (m*n+b)/d, n ;
        (m*n+b)/d, (m^2-a)/d, m ;
        n,         m,         d ];
  Q1 = -matadjoint(Q1);

\\ 3rd step: reduce Q1 to [0,0,-1;0,1,0;-1,0,0]
  M = LLLgoon3(Q1)[2][3,];
  if( M[1] < 0, M = -M);
if( DEBUGLEVEL_qfsolve >=3, print("   end of Qfbsqrtgauss"));
  if( M[1]%2,
    return(Qfb(M[1],2*M[2],2*M[3]))
  , return(Qfb(M[3],-2*M[2],2*M[1])));
}
{class2(D,factdetG,Winvariants,U2) =
\\ Implementation of Shanks/Bosma-Stevenhagen algorithm
\\ to compute the 2-Sylow of the class group of discriminant D.
\\ Only works for D = fundamental discriminant.
\\ When D = 1(4), work with 4D.
\\ If given, factdetG must be equal to factor(abs(2*D)).
\\ Apart from this factorization, the algorithm is polynomial time.
\\ If Winvariants is given, the algorithm stops as soon as
\\ an element having these W-invariants is found.
local(factD,n,rang,m,listgen,vD,p,vp,aux,invgen,im,Ker,Kerim,listgen2,G2,struct_s,E,red);
/* MODI change struct to struct_s */
/* MODI remove compteur */

if( DEBUGLEVEL_qfsolve >= 1, print(" Construction of the 2-class group of discriminant ",D));
  if( D%4 == 2 || D%4 == 3, error("class2: Discriminant not congruent to 0,1 mod 4"));

  if( D==-4, return([[1],[Qfb(1,0,1)]]));

  if( !factdetG, factdetG = factor(2*abs(D)));
  factD = concat([-1],factdetG[,1]~);
  if( D%4 == 1, D *= 4; factdetG[1,2] += 2);
  
  n = length(factD); rang = n-3;
  if(D>0, m = rang+1, m = rang);
  if(m<0, m=0);
if( DEBUGLEVEL_qfsolve >= 3, print("   factD = ",factD));
  listgen = vector(m);
  
  if( vD = valuation(D,2),
    E = Qfb(1,0,-D/4)
  , E = Qfb(1,1,(1-D)/4)
  );
if( DEBUGLEVEL_qfsolve >= 3, print("   E = ",E));

  if( type(Winvariants) == "t_COL" && (Winvariants == 0 || length(matinverseimage(U2*Mod(1,2),Winvariants))>0), return([[1],[E]]));
  
  for( i = 1, m, \\ no need to look at factD[1]=-1, nor factD[2]=2
    p = factD[i+2];
    vp = valuation(D,p);
    aux = p^vp;
    if( vD,
      listgen[i] = Qfb(aux,0,-D/4/aux)
    , listgen[i] = Qfb(aux,aux,(aux-D/aux)/4))
  );
  if( vD == 2 && D%16 != 4,
    m++; rang++; listgen = concat(listgen,[Qfb(2,2,(4-D)/8)]));
  if( vD == 3,
    m++; rang++; listgen = concat(listgen,[Qfb(2^(vD-2),0,-D/2^vD)]));
  
if( DEBUGLEVEL_qfsolve >= 3, print("   listgen = ",listgen));
if( DEBUGLEVEL_qfsolve >= 2, print("  rank = ",rang));

  if( !rang, return([[1],[E]]));

 invgen = Qflisteinvariants(listgen,factD)[2]*Mod(1,2);
if( DEBUGLEVEL_qfsolve >= 3, print("   invgen = ",lift(invgen)));
/* MODI2.1 */

  struct_s = vector(m,i,2);
  im = lift(matinverseimage(invgen,matimage(invgen)));
  while( (length(im) < rang) 
  || (type(Winvariants) == "t_COL" && length(matinverseimage(concat(invgen,U2),Winvariants) == 0)), 
    Ker = lift(matker(invgen));
    Kerim = concat(Ker,im);
    listgen2 = vector(m);
    for( i = 1, m,
      listgen2[i] = E;
      for( j = 1, m,
        if( Kerim[j,i],
          listgen2[i] = qfbcompraw(listgen2[i],listgen[j])));
      if( norml2(Kerim[,i]) > 1,
        red = QfbReduce(aux=mymat(listgen2[i]));
        aux = red~*aux*red;
        listgen2[i] = Qfb(aux[1,1],2*aux[1,2],aux[2,2]))
    );
    listgen = listgen2;
    invgen = invgen*Kerim;

if( DEBUGLEVEL_qfsolve >= 4, print("    listgen = ",listgen));
if( DEBUGLEVEL_qfsolve >= 4, print("    invgen = ",lift(invgen)));
/* MODI2.1 */

    for( i = 1, length(Ker),
      G2 = Qfbsqrtgauss(listgen[i],factdetG);
      struct_s[i] <<= 1;
      listgen[i] = G2;
      invgen[,i] = Qflisteinvariants(G2,factD)[2][,1]*Mod(1,2)
    );

if( DEBUGLEVEL_qfsolve >= 3, print("   listgen = ",listgen));
if( DEBUGLEVEL_qfsolve >= 3, print("   invgen = ",lift(invgen)));
if( DEBUGLEVEL_qfsolve >= 3, print("   struct = ",struct_s));
/* MODI2.1 */

    im = lift(matinverseimage(invgen,matimage(invgen)))
  );
 
  listgen2 = vector(rang);
  for( i = 1, rang,
    listgen2[i] = E;
    for( j = 1, m,
      if( im[j,i],
        listgen2[i] = qfbcompraw(listgen2[i],listgen[j])));
    if( norml2(im[,i]) > 1,
      red = QfbReduce(aux=mymat(listgen2[i]));
      aux = red~*aux*red;
      listgen2[i] = Qfb(aux[1,1],2*aux[1,2],aux[2,2]))
  );
  listgen = listgen2;
\\ listgen = vector(rang,i,listgen[m-rang+i]);
  struct_s = vector(rang,i,struct_s[m-rang+i]);

if( DEBUGLEVEL_qfsolve >= 2, print("  listgen = ",listgen));
if( DEBUGLEVEL_qfsolve >= 2, print("  struct = ",struct_s));

return([struct_s,listgen]);
}
{Qfsolve(G,factD) =
\\ Solves the quadratic equation X^tGX=0 of dimension n >= 3.
\\ G is assumed to have integral coprime coefficients.
\\ The solution might be a vectorv or a matrix.
\\ If no solution exists, returns a prime p
\\ such that there is no local solution at p.
\\
\\ If given, factD must be equal to factor(-abs(2*matdet(G))).

local(n,M,signG,d,Min,U,codim,aux,G1,detG1,M1,subspace1,G2,subspace2,M2,solG2,Winvariants,dQ,factd,U2,clgp2,V,detG2,dimseti,solG1,sol,Q);

if( DEBUGLEVEL_qfsolve >= 1, print(" starting Qfsolve"));
\\
\\ 1st reduction of the coefficients of G
\\

  n = length(G);
  d = matdet(G);
  if( d == 0, return(matker(G)[,1]));

  M = IndefiniteLLL(G);
  if( type(M) == "t_COL",
if( DEBUGLEVEL_qfsolve >= 1, print(" solution ",M));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
    return(M));
  G = M[1]; M = M[2];

\\ Real solubility
  signG = qfsign(G);
  if( signG[1] == 0 || signG[2] == 0,
if( DEBUGLEVEL_qfsolve >= 1, print(" no real solution"));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
    return(-1));
  if( signG[1] < signG[2], G = -G; signG = signG*[0,1;1,0]);

\\ Factorization of the determinant
  if( !factD, 
if( DEBUGLEVEL_qfsolve >= 1, print(" factorization of the determinant"));
    factD = factor(-abs(2*d));
if( DEBUGLEVEL_qfsolve >= 1, print(factD))
  );
  factD[1,2] = 0;
  factD[2,2] --;

\\
\\ Minimization and local solubility
\\

if( DEBUGLEVEL_qfsolve >= 1, print(" minimization of the determinant"));
  Min = Qfminim(G,factD);
  if( type(Min) == "t_INT",
if( DEBUGLEVEL_qfsolve >= 1, print(" no local solution at ",Min));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
    return(Min));

  M = M*Min[2];
  G = Min[1];
\\  Min[3] contains the factorization of abs(matdet(G));

if( DEBUGLEVEL_qfsolve >= 4, print("    G minim = ",G));
if( DEBUGLEVEL_qfsolve >= 4, print("    d = ",d));

\\ Now, we know that local solutions exist
\\ (except maybe at 2 if n==4),
\\ if n==3, det(G) = +-1
\\ if n==4, or n is odd, det(G) is squarefree.
\\ if n>=6, det(G) has all its valuations <=2.

\\ Reduction of G and search for trivial solutions.
\\ When det G=+-1, such trivial solutions always exist.

if( DEBUGLEVEL_qfsolve >= 1, print(" reduction"));
  U = IndefiniteLLL(G);
  if(type(U) == "t_COL",
if( DEBUGLEVEL_qfsolve >= 1, print(" solution = ",M*U));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
    return(M*U));
  G = U[1]; M = M*U[2];

\\
\\ If n >= 6 is even, need to increment the dimension by 1
\\ to suppress all the squares of det(G).
\\

  if( n >= 6 && n%2 == 0 && matsize(Min[3])[1] != 0,
if( DEBUGLEVEL_qfsolve >= 1, print(" increase the dimension by 1 = ",n+1));
    codim = 1; n++;
\\ largest square divisor of d.
    aux = prod( i = 1, matsize(Min[3])[1], if( Min[3][i,1] == 2, Min[3][i,1], 1));
\\ Choose the sign of aux such that the signature of G1
\\ is as balanced as possible
    if( signG[1] > signG[2],
      signG[2] ++; aux = -aux
    , signG[1] ++
    );
    G1 = matdiagonalblock([G,Mat(aux)]);
    detG1 = 2*matdet(G1);
    for( i = 2, length(factD[,1]),
      factD[i,2] = valuation(detG1,factD[i,1]));
    factD[2,2]--;
    Min = Qfminim(G1,factD);
    G1 = Min[1];
    M1 = Min[2];
    subspace1 = matrix(n,n-1,i,j, i == j)
  , codim = 0;
    G1 = G;
    subspace1 = M1 = matid(n)
  );
\\ Now, d is squarefree

\\ 
\\ If d is not +-1, need to increment the dimension by 2
\\

  if( matsize(Min[3])[1] == 0, \\ if( abs(d) == 1,
if( DEBUGLEVEL_qfsolve >= 2, print("  detG2 = 1"));
     G2 = G1;
     subspace2 = M2 = matid(n);
     solG2 = LLLgoon(G2,1)
  ,
if( DEBUGLEVEL_qfsolve >= 1, print("  increase the dimension by 2 = ",n+2));
    codim += 2;
    subspace2 = matrix( n+2, n, i, j, i == j);
    d = prod( i = 1, matsize(Min[3])[1],Min[3][i,1]);    \\ d = abs(matdet(G1));
    if( signG[2]%2 == 1, d = -d);                        \\ d = matdet(G1);
    if( Min[3][1,1] == 2, factD = [-1], factD = [-1,2]); \\ if d is even ...
    factD = concat(factD, Min[3][,1]~);
if( DEBUGLEVEL_qfsolve >= 4, print("    factD = ",factD));

\\ Solubility at 2 (this is the only remaining bad prime).
    if( n == 4 && d%8 == 1,
      if( QfWittinvariant(G,2) == 1,
if( DEBUGLEVEL_qfsolve >= 1, print(" no local solution at 2"));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
        return(2)));
  
\\
\\ Build a binary quadratic form with given invariants
\\
    Winvariants = vectorv(length(factD));

\\ choose the signature of Q.
\\ (real invariant and sign of the discriminant)
    dQ = abs(d);
    if( signG[1] ==signG[2], dQ = dQ; Winvariants[1] = 0); \\ signQ = [1,1];
    if( signG[1] > signG[2], dQ =-dQ; Winvariants[1] = 0); \\ signQ = [2,0];
    if( n == 4 && dQ%4 != 1, dQ *= 4);
    if( n >= 5, dQ *= 8);
    
\\ p-adic invariants
\\ for p = 2, the choice is fixed from the product formula
    if( n == 4, 
if( DEBUGLEVEL_qfsolve >= 1, print(" compute the local invariants of G1"));
      aux = Qflisteinvariants(-G1,factD)[2][,1];
      for( i = 3, length(factD), Winvariants[i] = aux[i])
    , 
      aux = (-1)^((n-3)/2)*dQ/d; \\ ici aux = 8 ou -8
      for( i = 3, length(factD), Winvariants[i] = hilbert(aux,factD[i],factD[i]) > 0)
    );
    Winvariants[2] = sum( i = 1, length(factD), Winvariants[i])%2;

if( DEBUGLEVEL_qfsolve >= 1,
  print(" Search for a binary quadrativ form of discriminant = ",dQ);
  print(" and Witt invariants = ",Winvariants));

\\ Construction of the 2-class group of discriminant dQ
\\ until some product of the generators gives the desired invariants.
\\ In dim 4, need to look among the form of the type q or 2*q
\\ because Q might be imprimitive.

    factd = matrix(length(factD)-1,2);
    for( i = 1, length(factD)-1,
      factd[i,1] = factD[i+1];
      factd[i,2] = valuation(dQ,factd[i,1]));
    factd[1,2]++;
    U2 = matrix(length(factD), n == 4, i,j, hilbert(2,dQ,factD[i])<0);
    clgp2 = class2(dQ,factd,Winvariants,U2);
if( DEBUGLEVEL_qfsolve >= 4, print("    clgp2 = ",clgp2));

    clgp2 = clgp2[2];
    U = Qflisteinvariants(clgp2,factD)[2];
    if( n == 4, U = concat(U,U2));
if( DEBUGLEVEL_qfsolve >= 4, print("    U = ",U));
/* MODI2.1 */

    V = lift(matinverseimage(U*Mod(1,2),Winvariants*Mod(1,2)));
/*    if( !length(V), next); */ /* MODI 1 */
if( DEBUGLEVEL_qfsolve >= 4, print("    V = ",V));

    if( dQ%2 == 1, Q = qfbprimeform(4*dQ,1), Q = qfbprimeform(dQ,1));
    for( i = 1, length(clgp2), 
      if( V[i], Q = qfbcompraw(Q,clgp2[i])));
    Q = mymat(Q);
    if( norml2(V) > 1, aux = QfbReduce(Q); Q = aux~*Q*aux);
    if( n == 4 && V[length(V)], Q*=  2);
if( DEBUGLEVEL_qfsolve >= 2, print("  Q = ",Q));
if( DEBUGLEVEL_qfsolve >= 3, print("   Witt invariants of Q = ",Qflisteinvariants(Q,factD)));

\\
\\ Build a form of dim=n+2 potentially unimodular
\\

    G2 = matdiagonalblock([G1,-Q]);
if( DEBUGLEVEL_qfsolve >= 4, print("    G2 = ",G2));

if( DEBUGLEVEL_qfsolve >= 2, print("  minimization of the form of dimension ",length(G2)));
\\ Minimization of G2
    detG2 = matdet(G2);
    factd = matrix(length(factD)-1,2);
    for( i = 1, length(factD)-1,
      factd[i,2] = valuation(detG2, factd[i,1] = factD[i+1]));
if( DEBUGLEVEL_qfsolve >= 3, print("   det(G2) = ",factd));
    Min = Qfminim(G2,factd);
    M2 = Min[2]; G2 = Min[1];
if( abs(matdet(G2)) > 2, error("Qfsolve: det(G2) <> +-1 *******"));
if( DEBUGLEVEL_qfsolve >= 4, print("    G2 = ",G2));

\\ Now, we have det(G2) = +-1

\\ Find a seti for G2 (Totally isotropic subspace, Sous-Espace Totalement Isotrope)
if( DEBUGLEVEL_qfsolve >= 2, print("  Search a subspace of solutions for G2"));
    solG2 = LLLgoon(G2,1);
    if( matrix(codim+1,codim+1,i,j,solG2[1][i,j]) != 0,
      error("Qfsolve: not enough solutions in G2"));
  );

\\ G2 must have a subspace of solutions of dimension > codim
  dimseti = 0;
  while( matrix(dimseti+1,dimseti+1,i,j,solG2[1][i,j]) == 0, dimseti ++);
  if( dimseti <= codim,
    error("Qfsolve: not enough solutions for G2"));
  solG2 = matrix(length(G2),dimseti,i,j,solG2[2][i,j]);
if( DEBUGLEVEL_qfsolve >= 3, print("   solG2 = ",solG2));

\\ The solution of G1 is simultaneously in solG2 and subspace2
if( DEBUGLEVEL_qfsolve >= 1, print(" Reconstruction of a solution of G1"));
  solG1 = matintersect(subspace2,M2*solG2);
  solG1 = subspace2~*solG1;
if( DEBUGLEVEL_qfsolve >= 3, print("   solG1 = ",solG1));

\\ The solution of G is simultaneously in solG and subspace1
if( DEBUGLEVEL_qfsolve >= 1, print(" Reconstruction of a solution of G"));
  sol = matintersect(subspace1,M1*solG1);
  sol = subspace1~*sol;
  sol = M*sol;
  sol /= content(sol);
  if( length(sol) == 1, sol = sol[,1]);
if( DEBUGLEVEL_qfsolve >= 3, print("   sol = ",sol));
if( DEBUGLEVEL_qfsolve >= 1, print(" end of Qfsolve"));
  return(sol);
}
{matdiagonalblock(v) =
local(lv,lt,M);
  lv = length(v);
  lt = sum( i = 1, lv, length(v[i]));
  M = matrix(lt,lt);
  lt = 0;
  for( i = 1, lv,
    for( j = 1, length(v[i]),
      for( k = 1, length(v[i]),
        M[lt+j,lt+k] = v[i][j,k]));
    lt += length(v[i])
  );
return(M);
}







{
\\
\\ Usual global variables
\\

  DEBUGLEVEL_ell = 0; \\ From 0 to 5 : choose a higher value to have
                      \\ more details printed.
  LIM1 = 5;       \\ Limit for the search of trivial points on quartics
  LIM3 = 50;      \\ Limit for the search of points on ELS quartics
  LIMTRIV = 3;    \\ Limit for the search of trivial points on the elliptic curve
  COMPLETE = 1;   \\ Use Complete 2-descent when full 2-torsion,
                  \\ otherwise 2-descent via isogenies.

\\
\\  Technical global variables
\\

  MAXPROB = 20;
  LIMBIGPRIME = 30; \\ for primes larger than this limit,
                    \\ use a probabilistic test
                    \\ LIMBIGPRIME = 0 means only deterministic tests
  ELLREDGENFLAG = 1;\\ to reduce the generators at the end
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\          SCRIPT                             \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    COMMON FUNCTIONS TO ell.gp AND ellQ.gp   \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("ellchangecurveinverse"));
{
ellchangecurveinverse(ell,v) = ellchangecurve(ell,ellinverturst(v));
}
if( DEBUGLEVEL_ell >= 4, print("ellchangepointinverse"));
{
ellchangepointinverse(pt,v) = ellchangepoint(pt,ellinverturst(v));
}
if( DEBUGLEVEL_ell >= 4, print("ellcomposeurst"));
{
ellcomposeurst(urst1,urst2) =
local(u1 = urst1[1], r1 = urst1[2], s1 = urst1[3], t1 = urst1[4],
      u2 = urst2[1], r2 = urst2[2], s2 = urst2[3], t2 = urst2[4]);
  [u1*u2,u1^2*r2+r1,u1*s2+s1,u1^3*t2+s1*u1^2*r2+t1];
}
if( DEBUGLEVEL_ell >= 4, print("ellinverturst"));
{
ellinverturst(urst) =
local(u = urst[1], r = urst[2], s = urst[3], t = urst[4]);
  [1/u,-r/u^2,-s/u,(r*s-t)/u^3];
}
if( DEBUGLEVEL_ell >= 4, print("mysubst"));
{
mysubst(polsu,subsx) = 
  if( type(lift(polsu)) == "t_POL",
    return(simplify(subst(lift(polsu),variable(lift(polsu)),subsx)))
  , return(simplify(lift(polsu))));
} 
if( DEBUGLEVEL_ell >= 4, print("degre"));
{
degre(idegre) =
local(ideg = idegre, jdeg = 0);

  while( ideg >>= 1, jdeg++);
  return(jdeg);
}
if( DEBUGLEVEL_ell >= 4, print("nfissquare"));
{
nfissquare(nf, a) = #nfsqrt(nf,a) > 0;
}
if( DEBUGLEVEL_ell >= 4, print("nfsqrt"));
{
nfsqrt( nf, a) =
\\ if a is a square in the number field nf returns [sqrt(a)], otherwise [].
local(alift,ta,py,pfact);

if( DEBUGLEVEL_ell >= 5, print("     starting nfsqrt ",a));
  if( a==0 || a==1, 
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",a));
    return([a]));

  alift = lift(a);
  ta = type(a);
  if( !poldegree(alift), alift = polcoeff(alift,0));

  if( type(alift) != "t_POL",
    if( issquare(alift), 
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",sqrtrat(alift)));
      return([sqrtrat(alift)])));

  if( poldegree(nf.pol) <= 1,
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",[]));
    return([]));
  if( ta == "t_POL", a = Mod(a,nf.pol));

\\ the real embeddings must all be >0 

  for( i = 1, nf.r1,
/* MODI: in ell.gp, nfsign_s(nf,a,i) < 0 so replaced. Both correct
or only one ? */
/*    py = mysubst(alift,nf.roots[i]);
    if( sign(py) < 0, */
    if( nfsign_s(nf,a,i) < 0,
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",[]));
      return([])));

\\ factorization over nf of the polynomial X^2-a

  if( variable(nf.pol) == x,
    py = subst(nf.pol,x,y);
    pfact = lift(factornf(x^2-mysubst(alift,Mod(y,py)),py)[1,1])
  ,
    pfact = lift(factornf(x^2-a,nf.pol)[1,1]));
  if( poldegree(pfact) == 2,
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",[]));
    return([]));
if( DEBUGLEVEL_ell >= 5, print("     end of nfsqrt ",pfact));
  return([subst(polcoeff(pfact,0),y,Mod(variable(nf.pol),nf.pol))]);
}
if( DEBUGLEVEL_ell >= 4, print("sqrtrat"));
{
sqrtrat(a) = 
  sqrtint(numerator(a))/sqrtint(denominator(a));
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\      FUNCTIONS SPECIFIC TO ellQ.gp          \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    FUNCTIONS FOR POLYNOMIALS                \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("polratroots"));
{
polratroots(pol) =
local(f,ans);
  f = factor(pol)[,1];
  ans = [];
  for( j = 1, #f, 
    if( poldegree(f[j]) == 1,
      ans = concat(ans,[-polcoeff(f[j],0)/polcoeff(f[j],1)])));
  return(ans);
}
if( DEBUGLEVEL_ell >= 4, print("ratpoint"));
{
ratpoint(pol,lim=1,singlepoint=1) =
\\ Search for points on y^2=pol(x).
\\ The coeff of pol must be integers.
\\ If singlepoint >= 1, stop after a first point is found.

local(listpoints,point1,odd,deg4,pol16,tab16,pol9,tab9,pol5,tab5,pol0,vecz,vecx,lead,zz,xx,evpol,iz,factpol);
local(deg,vz);
/* MODI: added deg, vz */

if( DEBUGLEVEL_ell >= 4,
  print("    Starting ratpoint with pol = ",pol); 
  print("    lim = ",lim););

  if( !singlepoint, listpoints = []);
  point1 = [];

\\
\\          trivial solutions
\\

\\ the leading coeff is a square
  if( issquare(pollead(pol)),
    point1 = [ 1, sqrtrat(pollead(pol)), 0];
if( DEBUGLEVEL_ell >= 3, print("   trivial solution: lead(pol) is a square"));
    if( singlepoint,
if( DEBUGLEVEL_ell >= 4, print("    end of ratpoint"));
      return(point1));
    listpoints = concat(listpoints,[point1]));

\\ the constant coeff is a square
  if( issquare(polcoeff(pol,0)),
    point1 = [ 0, sqrtrat(polcoeff(pol,0)) ];
if( DEBUGLEVEL_ell >= 3, print("   trivial solution: pol(0) is a square"));
    if( singlepoint,
if( DEBUGLEVEL_ell >= 4, print("    end of ratpoint"));
      return(point1));
    listpoints = concat(listpoints,[point1]));
  odd = poldegree(pol)%2;

\\ roots of pol ?
  factpol = polratroots(pol);
  if( #factpol, 
if( DEBUGLEVEL_ell >= 3, print("   trivial solution: roots of pol",factpol));
    if( singlepoint,
if( DEBUGLEVEL_ell >= 4, print("    end of ratpoint"));
      return([factpol[1],0]));
    listpoints = concat(listpoints,vector(#factpol,i,[factpol[i],0]))
  );

\\
\\       Sieve
\\

\\ initialisation of the sieve modulo 16, 9 and 5
\\ used only with even degree when lim is large

  deg = poldegree(pol);
  deg4 = ( !odd && lim > 20);
  if( deg4,

    pol16 = (Vec(pol)*Mod(1,16))~;
    tab16 = matrix(16,16);
    for(xx = 0, 16-1, 
      for(zz = 0, 16-1,
        tab16[xx+1,zz+1] = !issquare(vector(deg+1,i,xx^(deg+1-i)*zz^(i-1))*pol16)));
    pol9 = (Vec(pol)~)*Mod(1,9);
    tab9 = matrix(9,9);
    for(xx = 0, 9-1, 
      for(zz = 0, 9-1,
        tab9[xx+1,zz+1] = !issquare(vector(deg+1,i,xx^(deg+1-i)*zz^(i-1))*pol9)));
    pol5 = (Vec(pol)~)*Mod(1,5);
    tab5 = matrix(5,5);
    for(xx = 0, 5-1, 
      for(zz = 0, 5-1,
        tab5[xx+1,zz+1] = !issquare(vector(deg+1,i,xx^(deg+1-i)*zz^(i-1))*pol5)));
  );

\\ if the degree is odd, search only for square denominators
  if( odd, 
    vecz = vector(lim,i,i^2);
  ,
\\ if the degree is even, the leading coeff must be
\\ a square modulo zz.
    lead = pollead(pol);
    vecz = vector(lim);
    zz = 0;
    for( i = 1, lim,
      zz++; while( !issquare(Mod(lead,zz)),zz++); vecz[i] = zz
  ));

\\ the constant coeff must be a square modulo xx.
  pol0 = polcoeff(pol,0);
  vecx = vector(lim);
  xx = 0;
  for( i = 1, lim,
    xx++; while( !issquare(Mod(pol0,xx)),xx++); vecx[i] = xx);

if( DEBUGLEVEL_ell >= 4, print("    xmax = ",vecx[lim]));
if( DEBUGLEVEL_ell >= 4, print("    zmax = ",vecz[lim]));

if( DEBUGLEVEL_ell >= 5, print("    vecx = ",vecx));
if( DEBUGLEVEL_ell >= 5, print("    vecz = ",vecz));

  if( deg4,
    vz = vector(lim,i,Pol(
      vector(deg+1,j,polcoeff(pol,deg+1-j)*vecz[i]^(j-1))));
  );

\\ loop over x = xx/zz
\\ the loop on [xx,zz] is done diagonally
\\ to start with the smallest values of both xx and zz.
  for( somme = 2, 2*lim,
    for( ix = max(1,somme-lim), min(lim,somme-1),
      xx = vecx[ix]; iz = somme-ix; zz = vecz[iz];
      if( gcd(zz,xx) != 1, next);
      for( eps = 1, 2,
\\ when eps = 1, xx > 0; when eps = 2, xx < 0.
        if( deg4,
          if( tab16[xx%16+1,zz%16+1], xx=-xx;next);
          if( tab9[xx%9+1,zz%9+1],    xx=-xx;next);
          if( tab5[xx%5+1,zz%5+1],    xx=-xx;next);
          evpol = subst(vz[iz],x,xx)
        ,
          evpol = subst(pol,variable(pol),xx/zz)
        );
        if( issquare(evpol),
          point1 = [xx/zz,sqrtrat(subst(pol,variable(pol),xx/zz))];
if( DEBUGLEVEL_ell >= 4, print("    point found by ratpoint = ",point1));
          if( singlepoint, break(3));
          listpoints = concat(listpoints,[point1])
        );
        xx = -xx
  )));

  if( point1 != [], 
if( DEBUGLEVEL_ell >= 3, print("   point found by ratpoint = ",point1));
if( DEBUGLEVEL_ell >= 4, print("    end of ratpoint "));
    if( singlepoint, return(point1), return(listpoints))
  );

return([]);
}
if( DEBUGLEVEL_ell >= 4, print("ratpoint2"));
{
ratpoint2( pol, lim = 1, singlepoint = 1, redflag = 0) =
local(listpoints,list,rr,y2,aux);

  listpoints = [];
  list = listratpoint(pol,redflag);
  for( i = 1, #list,
    rr = ratpoint(list[i][1],lim,singlepoint);
    if( singlepoint && #rr, rr=[rr]);
    for( j = 1, #rr,
      y2 = rr[j][2]*list[i][4];
      if( #rr[j] == 2,
        aux = [rr[j][1],1]~
      , aux = [rr[j][1],rr[j][3]]~
      );
      aux = list[i][2] * aux;
      if( aux[2] == 0,
        rr[j] = [aux[1],y2,0]
      , rr[j] = [aux[1]/aux[2],y2/aux[2]^(poldegree(pol)\2)]
      );
    );
    if( singlepoint && #rr, return(rr[1]));
    listpoints = concat(listpoints,rr);
  );
  listpoints = vecsort(listpoints,,2);
return(listpoints);
}
if( DEBUGLEVEL_ell >= 4, print("listratpoint"));
{
listratpoint( pol, redflag = 0) =
local(list,i,K,ff,C,p,M,U,newpol,factpol,ll,listf,rr);

if( DEBUGLEVEL_ell >= 5, print("     Starting listratpoint with ",pol));
  list = [[pol,matid(2),1,1]];
  i = 1; 
  while( i <= #list,

    pol = list[i][1];

    K = abs(content(pol));
    if( K != 1,
      pol = (list[i][1] /= K);
      list[i][3] *= K
    );

    K = list[i][3];
    if( K == 1, i++; next);

    ff = factor(K);
    if( vecmax(ff[,2]) > 1,
      ff[,2] \= 2;
      C = factorback(ff);
      list[i][4] *= C;
      K = ( list[i][3] /= C^2);
      if( K == 1, i++; next);
      ff = factor(K);
    );

    p = ff[1,1];
    M = list[i][2];
    C = list[i][4];

    if( pollead(pol)%p == 0,
      U = M*[1,0;0,p];
      if( content(U) == 1,
        newpol = subst(pol,x,x/p)*p^(poldegree(pol)-1);
        list = concat(list, [[newpol,U,K/p,C*p]])
      )
    );

    factpol = centerlift(polrootsmod(pol,p));
    for( j = 1, #factpol,
      U = M*[p,factpol[j];0,1];
      if( content(U) == 1,
        newpol = subst(pol,x,p*x+factpol[j])/p;
        list = concat(list, [[newpol,U,K/p,C*p]])
    ));

    i++;
  );

  ll = sum( i = 1, #list, list[i][3] == 1);
  listf = vector(ll);
  i = 1;
  for( j = 1, #list,
    if( list[j][3] == 1,
      listf[i] = list[j]; i++));

  if( redflag,
    for( i = 1, #listf,
      rr = redquartic(listf[i][1]);
      listf[i][1] = rr[1];
      listf[i][2] = listf[i][2]*rr[2]
    )
  );

if( DEBUGLEVEL_ell >= 5, print("     Output of listratpoint = ",listf));

return(listf);
}
if( DEBUGLEVEL_ell >= 4, print("redquartic"));
{
redquartic(pol) =
\\ reduction of the quartic polynomial.
\\ (also works with other degrees)
local(prec_s,prec0,d,disc2,test,r,normderiv,disc2v,q,M);
/* MODI change prec into prec_s */

if( DEBUGLEVEL_ell >= 4, print("    starting redquartic"));
if( DEBUGLEVEL_ell >= 3, print("   reduction of the quartic ",pol));

\\ choice of the real precision used in the computation
  prec_s = prec0 = default(realprecision);
  d = poldegree(pol);
  disc2 = poldisc(pol)^2;
  test = 0;
  while( test == 0,
if( DEBUGLEVEL_ell >= 4, print("    precision = ",prec_s));
    r = polroots(pol);
    normderiv = vector( d, i, norm(subst(pol',variable(pol),r[i])));
    disc2v = prod( i = 1, d, normderiv[i]) * pollead(pol)^(2*d-4);
    test = abs(disc2v-disc2) < 10^(-prec_s\2);
    if( !test, default(realprecision, prec_s *= 2))
  );

\\ former choice of the quadratic form
\\  q = Vec(sum( i = 1, d, norm(x-r[i])));
\\ Now, uses the quadratic form normalized as in Cremona-Stoll
  q = Vec(sum( i = 1, d, norm(x-r[i]) / normderiv[i]^(1/(d-2))));
  M = QfbReduce([q[1],q[2]/2;q[2]/2,q[3]]);
  pol = subst(pol,variable(pol),Pol(M[1,])/Pol(M[2,]))*Pol(M[2,])^poldegree(pol);

  if( prec_s != prec0, default(realprecision,prec0));

if( DEBUGLEVEL_ell >= 3, print("   reduced quartic = ",pol));
if( DEBUGLEVEL_ell >= 4, print("    end of redquartic"));

  return([pol,M]);
}
if( DEBUGLEVEL_ell >= 4, print("polrealrootsisolate"));
{
polrealrootsisolate(pol) =
\\ pol is a squarefree polynomial in Z[x].
\\ Returns a list of vectors [a,b] with a and b rationals
\\ such that the intervals ]a,b] are disjoints and contain
\\ all the real roots of pol, and excatly one in each interval.
local(st,a,res,ind,b,c,stab,stac);

if( DEBUGLEVEL_ell >= 5, print("     starting polrealrootsisolate with pol = ",pol));
  st = polsturm(pol);
  if( !st, return([]));
  a = 1;
  while( polsturm(pol,-a,a) < st, a <<= 1);
  res = [[-a,a,st]];
  ind = 1;
  while( #res < st,
    while( res[ind][3] == 1, ind++);
    a = res[ind][1]; b = res[ind][2]; stab = res[ind][3];
    c = (a+b)/2;
    stac = polsturm(pol,a,c);
    if( stac == 0, res[ind][1] = c; next);
    if( stac == stab, res[ind][2] = c; next);
    res[ind] = [a,c,stac];
    res = concat(res,[[c,b,stab-stac]]);
  );
  res = vector(st,i,[res[i][1],res[i][2]]);
  res = vecsort(res,1);
if( DEBUGLEVEL_ell >= 5, print("     end of polrealrootsisolate with res = ",res));
  return(res);
}
if( DEBUGLEVEL_ell >= 4, print("polrealrootsimprove"));
{
polrealrootsimprove(pol,v) =
\\ pol is a polynomial and v is a vector v=[a,b]
\\ such that pol contains exactly one root in the interval ]a,b].
\\ Returns another interval with the same property, but with half length.
\\ (dichotomy)
local(c,v2,vc);

  c = (v[1]+v[2])/2;
  v2 = subst(pol,variable(pol),v[2]);
  if( v2 == 0, return([c,v[2]]));
  vc = subst(pol,variable(pol),c);
  if( v2*vc >= 0, v[2] = c, v[1] = c);
  return(v);
}
if( DEBUGLEVEL_ell >= 4, print("polrootsmodpn"));
{
polrootsmodpn(pol,p) =
\\ Compute a list v. Each element of v is of the form
\\ [a,b], with maximal b <= valuation(poldisc(pol),p)
\\ and a is a root of pol modulo p^b.
local(vd,rac,i,pol2,r,newrac);

if( DEBUGLEVEL_ell >= 5, print("     starting polrootsmodpn ",p,":",pol));

  vd = valuation(poldisc(pol),p);
  rac = [[0,0]];
  i = 1;
  while (i <= #rac,
\\    if( rac[i][2] > vd, i++; next);
    if( rac[i][2] >= vd, i++; next);
    pol2 = subst(pol,x,rac[i][1]+x*p^rac[i][2]);
    pol2 /= content(pol2);
    r = lift(polratroots(pol2*Mod(1,p)));
    if( #r == 0, i++; next);
    newrac = vector(#r,j,[rac[i][1] + p^rac[i][2]*r[j],rac[i][2]+1]);
    rac = concat(rac, vector(#r-1,j,newrac[j+1]));
    rac[i] = newrac[1];
  );
if( DEBUGLEVEL_ell >= 5, print("     end of polrootsmodpn ",rac));
  return(rac);
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    FUNCTIONS FOR LOCAL COMPUTATIONS         \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("ppinit"));
{
ppinit( nf, p) =
\\ a little more structure than idealprimedec()
local(pdec,pp);

  pdec = idealprimedec(nf,p);
  pp = vector(#pdec,i,
    [ pdec[i]
    , nfbasistoalg(nf,pdec[i][2])
    , if( p == 2, idealstar(nf,idealpow(nf,pdec[i],1+2*pdec[i].e)))
    , nfmodprinit(nf,pdec[i])
    ]);
  return(pp);
}
if( DEBUGLEVEL_ell >= 4, print("nfpsquareoddQ"));
{
nfpsquareoddQ( nf, a, pr) =
\\ pr is a prime ideal of nf as output by nfmodprinit
\\ a is an element of nf.
\\ Returns 1 if a is a square in the p-adics, 0 otherwise
\\ works only for p odd.
local(p,v,ap,den,norme);

if( DEBUGLEVEL_ell >= 5, print("     starting nfpsquareoddQ(",a,",",pr));
  if( a == 0,
if( DEBUGLEVEL_ell >= 5, print("     end of nfpsquareoddQ"));
    return(1));

  p = pr[3];
  v = idealval(nf,lift(a),p);
  if( v%2,
if( DEBUGLEVEL_ell >= 5, print("     end of nfpsquareoddQ"));
    return(0));
  ap = nfalgtobasis(nf,a/nfbasistoalg(nf,p[2])^v);
  den = valuation(denominator(content(ap)),p.p);
  if( den,
    den += den%2;
    ap = p.p^den*nfeltmul(nf,ap,nfeltpow(nf,p[2],-den*p.e));
  );

  norme = (p.p^p.f-1)/2;
  ap = nfeltpowmodpr(nf,ap,norme,pr);
  ap[1] -= 1;
  if( ap == 0,
if( DEBUGLEVEL_ell >= 5, print("     end of nfpsquareoddQ"));
    return(1));
  if( idealval(nf,ap,p) > 0,
if( DEBUGLEVEL_ell >= 5, print("     end of nfpsquareoddQ"));
    return(1));
if( DEBUGLEVEL_ell >= 5, print("     end of nfpsquareoddQ"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("psquare"));
{
psquare( a, p) =
\\ a is an integer.
\\ p is a prime integer.
\\ Returns 1 if a is a square in the p-adics, 0 otherwise.
local(v,ap);

if( DEBUGLEVEL_ell >= 5, print("     starting psquare ",[a,p]));

  if( a == 0, 
if( DEBUGLEVEL_ell >= 5, print("     end of psquare 1"));
    return(1));

  v = valuation(a,p);
  if( v%2,
if( DEBUGLEVEL_ell >= 5, print("     end of psquare 0"));
    return(0));
  if( p == 2, 
    ap = (a>>v)%8-1,
    ap = kronecker(a/p^v,p)-1
  );
if( DEBUGLEVEL_ell >= 5, print("     end of psquare ", !ap));
  return(!ap);
}
if( DEBUGLEVEL_ell >= 4, print("lemma6"));
{
lemma6(pol, p, nu, xx) =
\\ technical lemma for local solubility of quartics
\\ Only for p <> 2.
local(gx,gpx,lambda,mu);

  gx = subst( pol, variable(pol), xx);
  if( psquare(gx,p), return(1));
  gpx = subst( pol', variable(pol), xx);
  lambda = valuation(gx,p); mu = valuation(gpx,p);

  if( lambda > 2*mu, return(1));
\\  if( (lambda >= mu+nu) && (nu > mu), return(1));
  if( (lambda >= 2*nu) && (mu >= nu), return(0));
  return(-1);
}
if( DEBUGLEVEL_ell >= 4, print("lemma7"));
{
lemma7( pol, nu, xx) =
\\ technical lemma for local solubility of quartics
\\ at p = 2.
local(gx,gpx,lambda,mu,q);

  gx = subst( pol, variable(pol), xx);
  if( psquare(gx,2), return(1));
  gpx = subst( pol', variable(pol), xx);
  lambda = valuation(gx,2); mu = valuation(gpx,2);
  if( lambda > 2*mu, return(1));
  if( nu > mu,
    if( lambda%2, return(-1));
    q = mu+nu-lambda;
    if( q == 1, return(1));
    if( q == 2 && (gx>>lambda)%4 == 1, return(1));
    return(-1));
  q = lambda-2*nu;
  if( q >= 0, return(0));
  if( q == -2 && (gx>>lambda)%4 == 1, return(0));
  return(-1);
}
if( DEBUGLEVEL_ell >= 4, print("zpsoluble"));
{
zpsoluble(pol, p, nu, pnu, x0, pnup) =
local(result,pol2,fact,x1);

if( DEBUGLEVEL_ell >= 5, print("     starting zpsoluble ",[pol,p,x0,nu]));
  if( p == 2,
    result = lemma7(pol,nu,x0),
    result = lemma6(pol,p,nu,x0));
  if( result == +1,
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble 1 lemma"));
    return(1));
  if( result == -1,
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble 0 lemma"));
    return(0));
  pnup = pnu*p;
  nu++;
  if( p< LIMBIGPRIME || !LIMBIGPRIME,
    for( i = 0, p-1,
      if( zpsoluble(pol,p,nu,pnup,x0+pnu*i),
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble"));
        return(1)))
  ,
    pol2 = subst(pol,variable(pol),x0+pnu*variable(pol));
    pol2 /= content(pol2);
    pol2 = pol2*Mod(1,p);
    if( !poldegree(pol2), return(0));
    fact = factormod(pol2,p)[,1];
    for( i = 1, #fact,
      x1 = -centerlift(polcoeff(fact[i],0));
      if( zpsoluble(pol,p,nu,pnup,x0+pnu*x1),
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble"));
        return(1)));
    for( i = 1, MAXPROB,
      x1 = random(p);
      if( zpsoluble(pol,p,nu,pnup,x0+pnu*x1),
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble"));
        return(1)))
  );
if( DEBUGLEVEL_ell >= 2,
  if( p >= LIMBIGPRIME, 
    print("  ******* probabilistic test at p = ",p,"*******")));
if( DEBUGLEVEL_ell >= 5, print("     end of zpsoluble"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("qpsoluble"));
{
qpsoluble(pol, p) = 
if( DEBUGLEVEL_ell >= 5, 
  print("     starting qpsoluble ",p);
  print("     pol = ",pol));
  if( psquare(pollead(pol),p),
if( DEBUGLEVEL_ell >= 5, print("     end of qpsoluble 1"));
    return(1));
  if( psquare(polcoeff(pol,0),p),
if( DEBUGLEVEL_ell >= 5, print("     end of qpsoluble 1"));
    return(1));
  if( zpsoluble(pol,p,0,1,0),
if( DEBUGLEVEL_ell >= 5, print("     end of qpsoluble 1"));
    return(1));
  if( zpsoluble(polrecip(pol),p,1,p,0),
if( DEBUGLEVEL_ell >= 5, print("     end of qpsoluble 1"));
    return(1));
if( DEBUGLEVEL_ell >= 5, print("     end of qpsoluble 0"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("locallysoluble"));
{
locallysoluble(pol) =
\\ Determines if y^2 = pol(x,z) is everywhere locally soluble
local(c,disc0,plist,p,vc);

if( DEBUGLEVEL_ell >= 4, print("    starting locallysoluble :",pol));

\\ real place
  if( !(poldegree(pol)%2) && sign(pollead(pol)) < 0 
         && sign(polcoeff(pol,0)) < 0 && polsturm(pol) == 0,
if( DEBUGLEVEL_ell >= 3, print("   not ELS at infinity"));
if( DEBUGLEVEL_ell >= 4, print("    end of locallysoluble"));
    return(0));

\\
\\ finite places
\\
  pol *= denominator(content(pol))^2;
  c = content(pol);

  disc0 = poldisc(pol);
  plist = factor (abs(2*disc0));
if( DEBUGLEVEL_ell >= 4, print("    list of bad primes = ",plist));
  for( i = 1, #plist[,1],
    p = plist[i,1];
if( DEBUGLEVEL_ell >= 4, print("    p = ",p));
    vc = valuation(c,p);
    if( vc >= 2, 
      pol /= p^(2*(vc\2));
      plist[i,2] -= 2*(vc\2)*(2*poldegree(pol)-2)
    );
    if( poldegree(pol) == 4 && p != 2 && plist[i,2] < 2, next);
    if( !qpsoluble(pol,p),
if( DEBUGLEVEL_ell >= 3, print("   not ELS at ",p));
if( DEBUGLEVEL_ell >= 4, print("    end of locallysoluble"));
      return(0)));

if( DEBUGLEVEL_ell >= 2, print("  quartic ELS : Y^2 = ",pol));
if( DEBUGLEVEL_ell >= 4, print("    end of locallysoluble"));
  return(1);
}
if( DEBUGLEVEL_ell >= 4, print("LS2localimage"));
{
LS2localimage(nf,gen,pp) =
local(p,LS2image,ph,ival,delta);

if( DEBUGLEVEL_ell >= 4, print("    starting LS2localimage"));

  p = pp[1][1].p;
  LS2image = matrix( if( p == 2, sum(i=1,#pp,1+#pp[i][3].cyc), 2*#pp), #gen);

  for( j = 1, #gen,
    ph = [];
    for( i = 1, #pp,
      ival = idealval(nf,gen[j],pp[i][1]);
      ph = concat(ph,[ival]); 
      delta = gen[j]/pp[i][2]^ival;
      if( p == 2,
        ph = concat(ph,ideallog(nf,delta,pp[i][3])~);
      , ph = concat(ph,[1-nfpsquareoddQ(nf,delta,pp[i][4])]);
      )
    );
    LS2image[,j] = ph~
  );
  LS2image *= Mod(1,2);

if( DEBUGLEVEL_ell >= 4, print("    LS2image = ",lift(LS2image)));
if( DEBUGLEVEL_ell >= 4, print("    end of LS2localimage"));
  return(LS2image);
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    GENERIC FUNCTIONS FOR ELLIPTIC CURVES    \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("ellhalf"));
{
ellhalf(ell,P)=
\\ returns all the points Q on ell such that 2Q = P.
local(pol2,ratroots,half,x2,y2,P2);

  if(#ell < 13, ell=ellinit(ell,1));

  pol2 = Pol([4,ell.b2,2*ell.b4,ell.b6]); \\ 2-division polynomial

  if( P == [0], 
    ratroots = polratroots(pol2);
    half = vector(#ratroots,i,[ratroots[i],-(ell.a1*ratroots[i]+ell.a3)/2]);
    half = concat( [[0]], half);
    return(half)
  );

  x2 = Pol([1,0,-ell.b4,-2*ell.b6,-ell.b8]); \\ x(2P) = x2/pol2 

  half = [];
  ratroots = polratroots(x2-P[1]*pol2);  
  if( #ratroots == 0, return(half));
  for( i = 1, #ratroots,
    y2 = ellordinate(ell,ratroots[i]);
    for( j = 1, #y2,
      P2 = [ratroots[i],y2[j]];
      if( ellpow(ell,P2,2) == P, half = concat(half,[P2]))
    )
  );

  return(half);
}
if( DEBUGLEVEL_ell >= 4, print("elltors2"));
{
elltors2(ell)=
\\ Compute the 2-torsion subgroup of the elliptic curve ell.
local(tors2);

if( DEBUGLEVEL_ell >= 3, print("   computing the 2-torsion"));

  tors2 = ellhalf(ell,[0]);
  if( #tors2 == 1, 
    tors2 = [1, [], []],
  if( #tors2 == 2, 
    tors2 = [2, [2], [tors2[2]]]
  , tors2 = [4, [2,2], [tors2[2],tors2[3]]]
  ));
if( DEBUGLEVEL_ell >= 3, print("   E[2] = ",tors2));
  return(tors2);
}
if( DEBUGLEVEL_ell >= 4, print("elltorseven"));
{
elltorseven(ell)=
\\ Compute the 2-Sylow subgroup of the torsion of the elliptic curve ell.
local(torseven,P2);

if( DEBUGLEVEL_ell >= 4, print("    computing the 2^n-torsion"));
  if(#ell < 13, ell=ellinit(ell,1));
  torseven = elltors2(ell);

  while( torseven[1] != 1,
    P2 = ellhalf(ell,torseven[3][1]);
    if( #P2 > 0,
       torseven[1] *= 2;
       torseven[2][1] *= 2;
       torseven[3][1] = P2[1];
       next
    );
    if( #torseven[3] == 1, break());

    P2 = ellhalf(ell,torseven[3][2]);
    if( #P2 > 0,
       torseven[1] *= 2;
       torseven[2][2] *= 2;
       torseven[3][2] = P2[1];
       next
    );
    P2 = ellhalf(ell,elladd(ell,torseven[3][1],torseven[3][2]));
    if( #P2 > 0,
       torseven[1] *= 2;
       torseven[2][1] *= 2;
       torseven[3][1] = P2[1];
       next
    );
    break()
  );
  
if( DEBUGLEVEL_ell >= 4, print("    E[2^n] = ",torseven)); 
  return(torseven);
}
if( DEBUGLEVEL_ell >= 4, print("ellsort"));
{
ellsort(listpts) =
\\ Sorting the points listpts on an elliptic curve
\\ using the naive height.
local(n,v,aux,ord);

  v = vector(n = #listpts);
  for( i = 1, n, 
    if( listpts[i] == [0], v[i] = [0,0,0]; next);
    aux = denominator(listpts[i][2])/denominator(listpts[i][1]);
    v[i] = vecsort(abs([listpts[i][1]*aux^2, listpts[i][2]*aux^3,aux]),,4);
  );
  ord = Vec(vecsort(v,,3)); /* MODI Needed for gp2c */
  return(vector(n,i,listpts[ord[i]]));
}
if( DEBUGLEVEL_ell >= 4, print("ellremovetorsion"));
{
ellremovetorsion(ell,listgen) =
\\ Extracting the points of infinite order from listgen
local(d,extra);

if( DEBUGLEVEL_ell >= 5, print("     removing torsion from ",listgen));
  d = #listgen;
  extra = 0;
  for( i = 1, d,
\\ points of order 1 or 2
    if( listgen[i] == [0]
     || listgen[i] == ellpow(ell,listgen[i],-1)
    , extra += 1<<(i-1);
      next
    );
\\ detection of infinite order points by looking at
\\ 8*9*5*7*P modulo the prime 1048583
    if( ell.disc%1048583 != 0
     && denominator(listgen[i])%1048583 != 0
     && ellpow(ell,listgen[i]*Mod(1,1048583),2520) != [0]
    , next
    );
\\ detection of torsion points by ellorder()
    if( ellorder(ell,listgen[i]),
      extra += 1<<(i-1)
    )
  );
  if( extra,
    listgen = vecextract(listgen,1<<#listgen-1-extra);
  );
if( DEBUGLEVEL_ell >= 5, print("     without torsion = ",listgen));
  return(listgen);
}
if( DEBUGLEVEL_ell >= 4, print("ellredgen"));
{
ellredgen(ell0,listgen,K=1) =
\\ reduction of the generators of points in listgen
\\ on the elliptic curve ell = [a1,a2,a3,a4,a6]
\\ or K*y^2 = x^3 + a2*x^2 + a4*x + a6 (when a1 = a3 = 0);
\\ using the canonical height.
local(d,ell=ell0,sqrtK,urst,extra,M,U,listgen2,tors2,vt);

if( DEBUGLEVEL_ell >= 3, print("   Reduction of the generators ",listgen));
if( DEBUGLEVEL_ell >= 5, print("     ell=",ell));          
  d = #listgen;
  if( d == 0, return([]));

\\ removing torsion points from listgen
  listgen = ellremovetorsion(ell0,listgen);
  d = #listgen;
  if( d == 0, return([]));  

  if( #ell < 13, ell = ellinit(ell,1));

  if( K != 1,
    if( ell.a1 != 0 || ell.a3 != 0, error(" ellredgen : a1*a3 != 0"));
    ell[2] *= K; ell[4] *= K^2; ell[5] *= K^3;
    ell[6] *= K; ell[7] *= K^2; ell[8] *= K^3; ell[9] *= K^4;
    ell[10] *= K^2; ell[11] *= K^3; ell[12] *= K^6;
    sqrtK = sqrt(K);
    if( #ell == 19,
      ell[14] *= K;
      ell[15] /= sqrtK; ell[16] /= sqrtK;
      ell[17] *= sqrtK; ell[18] *= sqrtK;
      ell[19] /= K
    );

    for( i = 1, d,
      for( j = 1, #listgen[i],
        listgen[i][j] *= K^j))
  );

if( d == 1,
  urst = [1,0,0,0];
,
  if( #ell < 19, ell = ellinit(ell));
  ell = ellminimalmodel(ell,&urst);
  listgen = ellchangepoint(listgen,urst);
if( DEBUGLEVEL_ell >= 5, print("     ell = ",ell));
if( DEBUGLEVEL_ell >= 5, print("     listgen = ",listgen));

\\ Looking for relations between the points in listgen
\\ using LLL on the height matrix

  extra = 1;
  while( extra,
    M = ellheightmatrix(ell,listgen);
if( DEBUGLEVEL_ell >= 4, print("    height matrix = ",M));
    if( abs(matdet(M)) > 10^(-default(realprecision)+10),break);
    U = qflll(round(M*10^(default(realprecision)-10)),4);
    U = concat(U[1],U[2]);
if( DEBUGLEVEL_ell >= 4, print("    change of basis proposed by LLL = ",U));
\\ the columns of U that have very small coefficients
\\ are either exact relations or reductions (coeff <= 20)
\\ the other ones are irrelevant.
    extra = 0;
    for( i = 1, d,
      if( vecmax(abs(U[,i])) > 20, extra += 1<<(i-1))
    );
    U = vecextract(U,1<<d-1-extra);
    U = completebasis(U);
if( DEBUGLEVEL_ell >= 4, print("    change of basis 1 = ",U));

    listgen2 = vector(d);
    for( i = 1, d,
      listgen2[i] = [0];
      for( j = 1, d,
        listgen2[i] = elladd(ell,listgen2[i],ellpow(ell,listgen[j],U[j,i]))));
    listgen = listgen2;
  );

\\ Extracting the points of infinite order

\\ removing torsion points from listgen
    listgen = ellremovetorsion(ell,listgen);
    d = #listgen;
    if( d == 0, return([]));  
  );

if( DEBUGLEVEL_ell >= 3, print("   infinite order points = ",listgen));

\\ Now, the points should be of infinite order and independant
\\ Reducing the points of infinite order

  if( d > 1,
    M = ellheightmatrix(ell,listgen);
if( DEBUGLEVEL_ell >= 4, print("    height matrix = ",M));
    U = qflllgram(M);
if( DEBUGLEVEL_ell >= 4, print("    change of basis 2 = ",U));

    listgen2 = vector(d);
    for( i = 1, d,
      listgen2[i] = [0];
      for( j = 1, d,
        listgen2[i] = elladd(ell,listgen2[i],ellpow(ell,listgen[j],U[j,i]))));
    listgen = listgen2;
  );

if( DEBUGLEVEL_ell >= 3, print("   infinite order points = ",listgen));

  listgen = ellchangepointinverse(listgen,urst);

\\ Reducing modulo the 2-torsion

  tors2 = elltorseven(ell0);
  if( tors2[1] > 1,
    vt = vector(tors2[2][1],j,ellpow(ell0,tors2[3][1],j-1));
    if( #tors2[2] == 2,
      vt = concat(vt,vector(#vt,j,elladd(ell0,vt[j],tors2[3][2])))
    );
    for( i = 1, d,
      listgen[i] = ellsort(vector(#vt,j,elladd(ell0,listgen[i],vt[j])))[1];
    );
  );

if( DEBUGLEVEL_ell >= 3, print("   infinite order points = ",listgen));
  
  if( K != 1,
    for( i = 1, d,
      for( j = 1, 2,
        listgen[i][j] /= K^j)));

\\ keep only the points (x,y) with y >= 0

  if( ell0.a1 == 0 && ell0.a3 == 0, 
    for( i = 1, d,
      if( #listgen[i] == 2,
        listgen[i][2] = abs(listgen[i][2]))));

if( DEBUGLEVEL_ell >= 2, print("  reduced generators = ",listgen));
  return(listgen);
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    FUNCTIONS FOR NUMBER FIELDS              \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("reducemodsquares"));
{
reducemodsquares(delta,d) =
\\ Uses LLL to find z such that delta*z^2 has a small coefficient in x^d.
\\ delta must be a t_POLMOD
local(deg,xx,z,qd,Qd,reduc);

  deg = poldegree(component(delta,1)); /* MODI to make gp2c happy */
  xx = Mod(x,component(delta,1));
  z = subst(Pol(vector(deg,i,eval(Str("a"i)))),x,xx);
  qd = polcoeff(lift(delta*z^2),d,x);
  Qd = simplify(matrix(deg,deg,i,j,deriv(deriv(qd,eval(Str("a"i))),eval(Str("a"j)))/2));

  reduc = IndefiniteLLL(Qd);
  if( #reduc == 2, reduc = reduc[2][,1]);

  return(delta*subst(Pol(reduc),x,xx)^2);
}
if( DEBUGLEVEL_ell >= 4, print("bnfpSelmer"));
{
bnfpSelmer(bnf,S=1,p) =
\\ p is a prime integer and bnf a big number field.
\\ Compute the p-Selmer group of the number field bnf
\\ relative to the prime ideals dividing S.
\\ This group is denoted by LS2 in the sequel.
\\ Returns [gen,S'] where gen is a vector containing the generators
\\ of the p-Selmer group, represented has elements of bnf modulo p-powers,
\\ and S' is the support of gen.
local(S1,oddclass,multS,Slist,LS2gen,newprimes,newprimesval,kerval);

if( DEBUGLEVEL_ell >= 3, print("   Constructing the field Selmer group : L(S,",p,")"));
  S1 = idealhnf(bnf,S);

  oddclass = 0; multS = 1;
  while( !oddclass,
    if( multS != 1, S1 = idealmul(bnf,S1,multS));
    Slist = idealfactor(bnf,S1)[,1]~;
if( DEBUGLEVEL_ell >= 4, print("    constructing the S-units "));
if( DEBUGLEVEL_ell >= 4, print("    S1 = ",Slist));
    LS2gen = bnfsunit(bnf,Slist);

\\ If the class group is divisible by p,
\\ need to enlarge S1.
    oddclass = LS2gen[5].no % p;
    if( !oddclass,
if( DEBUGLEVEL_ell >= 4, print("    class group divisible by p = ",LS2gen[5].no));
      multS = idealmul(bnf,S,LS2gen[5].gen[1]);
    )
  );
  LS2gen = Mod(LS2gen[1],bnf.pol);

\\ The valuation of the generators must be divisible by p outside S.
  newprimes = [];
  for( i = 1, #Slist,
    if( idealadd(bnf,S,Slist[i]) == 1,
      newprimes = concat(newprimes,[Slist[i]])));
if( DEBUGLEVEL_ell >= 4, print("    newprimes = ",newprimes));
  newprimesval = matrix(#newprimes,#LS2gen,i,j,
    idealval(bnf,LS2gen[j],newprimes[i]));
if( DEBUGLEVEL_ell >= 4, print("    newprimesval = ",newprimesval));
  kerval = lift(matker(newprimesval*Mod(1,p)));
if( DEBUGLEVEL_ell >= 4, print("    kerval = ",kerval));
  LS2gen = vector(#kerval,i,
    prod( j = 1, #LS2gen,
      LS2gen[j]^kerval[j,i]));

\\ Add the units
  LS2gen = concat(bnf.fu,LS2gen);
\\ Add also the torsion unit if its order is divisible by p.
  if( bnf.tu[1]%p == 0, 
    LS2gen = concat( [bnf.tu[2]], LS2gen));
if( DEBUGLEVEL_ell >= 3, print("   #LS2gen = ",#LS2gen));
if( DEBUGLEVEL_ell >= 4, print("    LS2gen = ",LS2gen));
  return([LS2gen,Slist]);
}
if( DEBUGLEVEL_ell >= 4, print("kersign"));
{
kersign(gen,rootapprox) =
\\ Determine the kernel of the sign map
\\ restricted to the subgroup generated by gen,
\\ and relative to the real embedding corresponding to
\\ the root of pol contained in the interval rootapprox.
local(signs,elt,elt2,d,st,kers,compt);

if( DEBUGLEVEL_ell >= 3, print("   Computing the kernel of the sign ",rootapprox));

\\ determination of the signs
  signs = vector(#gen);
  for(i = 1, #gen,
    elt = lift(gen[i]);
    if( poldegree(elt) == 0, signs[i] = sign(simplify(elt)) < 0; next);
    d = poldisc(elt);
    if( poldegree(elt) == 2,
      if( d <= 0, signs[i] = sign(pollead(elt)) < 0; next));
    elt2 = if( d == 0, elt/gcd(elt,elt'), elt);
    st = 1;
    compt = 0;
    while( st,
      st = polsturm(elt2,rootapprox[1],rootapprox[2]);
      if( st,
        rootapprox = polrealrootsimprove(component(gen[i],1),rootapprox);
/* MODI to make gp2c happy */
\\ if the sign of elt is too difficult to determine, 
\\ try the sign of 1/elt.
        if( compt++ %5 == 0, gen[i] = 1/gen[i]; i--; next(2))
    ));
    signs[i] = sign(subst(elt,variable(elt),rootapprox[2])) < 0
  );
if( DEBUGLEVEL_ell >= 4, print("    signs = ",signs));

\\ construction of the kernel
  kers = matker(Mat(signs*Mod(1,2)))*Mod(1,2);
if( DEBUGLEVEL_ell >= 4, print("    kers = ",lift(kers)));
  return(kers);
}
if( DEBUGLEVEL_ell >= 4, print("kernorm"));
{
kernorm(gen,S,p) =
\\ gen is a generating set for a subgroup of K^*/K^p.
\\ Compute the kernel of the norm map.
\\ Uses the fact that all valuations are 0 mod p,
\\ except maybe at primes in S.
local(normgen,normmap,kern);
  
if( DEBUGLEVEL_ell >= 3, print("   Computing the kernel of the norm map"));

  if( p == 2, S = concat([-1],S));
  normgen = norm(gen);
if( DEBUGLEVEL_ell >= 4, print("    normgen = ",normgen));

\\ matrix of the norm map
  normmap = matrix(#S,#normgen,i,j,
    if( i == 1 && p == 2,
      sign(normgen[j]) < 0
    , valuation(normgen[j],S[i])));
if( DEBUGLEVEL_ell >= 4, print("    normmap = ",normmap));

\\ construction of the kernel
  kern = matker(normmap*Mod(1,p))*Mod(1,p);
if( DEBUGLEVEL_ell >= 4, print("    ker = ",lift(kern)));
  return(kern);
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\    FUNCTIONS FOR 2-DESCENT                  \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 4, print("elllocalimage"));
{
elllocalimage(nf,pp,K=1) =
\\ pol is the cubic polynomial defining the elliptic curve,
\\ nf is nfinit(pol),
\\ p is a prime integer, and pp = ppinit(p).
\\ Returns the image of the p-adic points 
\\ E(Qp)/2E(Qp) in Kp/Kp^2.
\\ The algorithm consists of choosing random p-adic points in E(Qp)
\\ until the number of images is equal to #E(Qp)[2] / |2|_p
local(X,p,prank,rac,pts,bound,essai,mrank,r,xx,delta,ph,delta2,prec_s,ival);
/* MODI add prec_s, ival */

if( DEBUGLEVEL_ell >= 4, print("    starting elllocalimage"));

  X = Mod(x,nf.pol);
  p = pp[1][1][1];
  prank  = #pp - (p != 2);
if( DEBUGLEVEL_ell >= 4, print("    prank = ",prank));

  rac = polrootsmodpn(K*nf.pol,p);
if( DEBUGLEVEL_ell >= 5, print("     rac = ",rac));

  pts = matrix(0,0);
  bound = p+6;
  essai = 0;
  mrank = 0;
  while( mrank < prank,

    essai ++;
    if( essai%16 == 0,
      pts = matimage(pts);
      bound *= p;
    );

    r = random(#rac)+1; prec_s = random(rac[r][2]+3)-2;
    xx = rac[r][1]+p^prec_s*random(bound);
if( DEBUGLEVEL_ell >= 5, print("     xx = ",xx));
    delta = K*(xx-X);

\\ rem : K*pol(xx) = norm(delta) ( = y^2 for a point on the elliptic curve)
    if( !psquare(K*subst(nf.pol,x,xx),p), next);
    ph = [];
    for( i = 1, #pp,
      ph = concat(ph,[ ival = idealval(nf,delta,pp[i][1])]);
      delta2 = delta/pp[i][2]^ival;
      if( p == 2,
        ph = concat(ph,ideallog(nf,delta2,pp[i][3])~);
      , ph = concat(ph,[1-nfpsquareoddQ(nf,delta2,pp[i][4])])
      )
    );
if( DEBUGLEVEL_ell >= 5, print("     ph = ",ph));

    pts = concat(pts,ph~*Mod(1,2));
    mrank = matrank(pts*Mod(1,2));
if( DEBUGLEVEL_ell >= 5, print("     pts = ",lift(pts)));
if( DEBUGLEVEL_ell >= 5, print("    matrank = ",mrank));
  );

  pts = matimage(pts);
if( DEBUGLEVEL_ell >= 5, print("     essai = ",essai));
if( DEBUGLEVEL_ell >= 4, print("    end of elllocalimage"));
  return(pts);
}
if( DEBUGLEVEL_ell >= 4, print("ell2descent_gen"));
{
ell2descent_gen(ell,bnf,K=1,help=[],redflag=0) =
\\ This algorithm performs 2-descent on the elliptic curve ell
\\ when ell has trivial 2-torsion.

\\ ell must be of the form K*y^2=x^3+A*x^2+B*x+C
\\ ie ell=[0,A,0,B,C], with K,A,B,C integers.
\\ bnf is bnfinit(x^3+A*x^2+B*x+C,1).

\\
\\ help is a list of known points (maybe empty) on ell.
\\ if redflag != 0, reduces the elements 
\\ of the field Selmer group modulo squares.

local(A,B,C,polrel,polprime,ttheta,badprimes,S,LS2,selmer,rootapprox,p,pp,locimage,LS2image,listpointstriv,listpoints,iwhile,expo,zc,liftzc,den,point,idealfactorzc,idealzc,baseidealzc,q2,sol,param,q1,pol,redq,q0,pointxx,point2,rang);

if( DEBUGLEVEL_ell >= 4, print("    starting ell2descent_gen"));

  if( #ell < 13, ell = ellinit(ell,1));

  if( ell.a1 != 0 || ell.a3 != 0,
    error(" ell2descent_gen : the curve is not of the form [0,a,0,b,c]"));
  if( denominator(ell.a2) > 1 || denominator(ell.a4) > 1 || denominator(ell.a6) >1,
    error(" ell2descent_gen : non integral coefficients"));

  A = ell.a2; if( DEBUGLEVEL_ell >= 2, print("  A = ",A));
  B = ell.a4; if( DEBUGLEVEL_ell >= 2, print("  B = ",B));
  C = ell.a6; if( DEBUGLEVEL_ell >= 2, print("  C = ",C));
  
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\      Construction of L(S,2)      \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 2, print(); print("  Computing L(S,2)"));

  polrel = Pol([1,A,B,C]);
  polprime = polrel';
  ttheta = Mod(x,polrel);

  if( !bnf, 
if( DEBUGLEVEL_ell >= 3, print("   bnfinit(",polrel,")"));
    bnf = bnfinit(polrel,1));

  badprimes = abs(K*idealadd(bnf,polprime,bnf.index));
if( DEBUGLEVEL_ell >= 5, print("     badprimes = ",badprimes[1,1]));
  S = bnfpSelmer(bnf,badprimes,2);
  LS2 = S[1]; S = S[2];

if( DEBUGLEVEL_ell >= 2, print("  L(S,2) = ",LS2));

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\   Construction of the Selmer group \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 2, print(); print("  Computing the Selmer group"));

\\ elements with square norm
  selmer = kernorm(LS2,vector(#S,i,S[i].p),2);
if( DEBUGLEVEL_ell >= 3, print("   selmer = ",lift(selmer)));

\\ the first real embedding must be > 0
\\ since the norm is a square, this is automatic
\\ if there is a single real embedding.
  if( bnf.r1 == 3,
    rootapprox = polrealrootsisolate(polrel)[1];
    selmer = matintersect(selmer,kersign(LS2,rootapprox))*Mod(1,2);
if( DEBUGLEVEL_ell >= 3, print("   selmer = ",lift(selmer)));
  );

\\ p-adic points
if( DEBUGLEVEL_ell >= 3, print("   p-adic points"));
  badprimes = factorint(badprimes[1,1]*2)[,1];
if( DEBUGLEVEL_ell >= 2, print("  badprimes = ",badprimes));
  for( i = 1, #badprimes,
    p = badprimes[i];
if( DEBUGLEVEL_ell >= 4, print("    p = ",p));
    pp = ppinit(bnf.nf,p);
    locimage = elllocalimage(bnf.nf,pp,K);
    LS2image = LS2localimage(bnf.nf,LS2,pp);
    locimage = matintersect(LS2image,locimage);
    selmer = matintersect(
      selmer,
      concat(
        matker(LS2image),
        matinverseimage(LS2image,locimage)*Mod(1,2)));
    selmer = matimage(selmer*Mod(1,2));
if( DEBUGLEVEL_ell >= 4, print("    selmer = ",selmer));
  if( !#selmer, break);
  );

if( DEBUGLEVEL_ell >= 2, print("  selmer = ",lift(selmer)));
if( DEBUGLEVEL_ell >= 2, print("  Selmer rank = ",#selmer));

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\   Search for trivial points      \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  if( #selmer,
if( DEBUGLEVEL_ell >= 2, print(); print("  Search for trivial points on the curve"));
    listpointstriv = ratpoint(K^3*subst(polrel,x,x/K),LIMTRIV,0);
    for( i = 1, #listpointstriv, 
      if( #listpointstriv[i] == 3,
        listpointstriv[i] = [0]
      , for( j = 1, 2, listpointstriv[i][j] /= K^j))
     );
    listpointstriv = concat(help,listpointstriv);
if( DEBUGLEVEL_ell >= 2, print("  Trivial points on the curve = ",listpointstriv));
  );

/* MODI: translate points triviaux */

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\   Run through the Selmer group   \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 2, print(); print("  Run through the Selmer group"));

  listpoints = [];
  selmer = lift(selmer);
  iwhile = 1;
  while( iwhile < 1<<#selmer,
if( DEBUGLEVEL_ell >= 2, print());
if( DEBUGLEVEL_ell >= 4, print("   iwhile = ",iwhile));

\\ the next element zc as an algebraic number modulo squares

    expo = selmer*vectorv(#selmer,i,bittest(iwhile,i-1));
    zc = prod( i = 1, #LS2, LS2[i]^expo[i]);
if( DEBUGLEVEL_ell >= 2, print("  zc = ",zc));
    liftzc = lift(zc);

\\ Reduction modulo squares

    if( redflag, 
      zc = reducemodsquares(zc,2);
      liftzc = lift(zc);
      den = denominator(content(liftzc))^2;
      zc *= den; liftzc *= den;
if( DEBUGLEVEL_ell >= 2, print("  zc reduced = ",zc))
    );

\\ Does it come from a trivial point ?

    for( i = 1, #listpointstriv,
      point = listpointstriv[i];
      if( #point == 2,
        if( nfissquare(bnf.nf,K*(point[1]-x)*liftzc),
if( DEBUGLEVEL_ell >= 2, print("  comes from the trivial point ",point));
          listpoints = concat(listpoints,[point]);
          iwhile = 1 << (degre(iwhile)+1);
          next(2)
    )));
    
if( DEBUGLEVEL_ell >= 2, print("  does not come from a trivial point"));

\\ Construction of the quadratic form q2
\\ Change the basis using the square factors of zc

    idealfactorzc = idealfactor(bnf,zc);
    idealfactorzc[,2] *= -1;
    idealfactorzc[,2] \= 2;
\\    idealzc = idealfactorback(bnf,idealfactorzc);
    idealzc = matid(3);
    for( i = 1, #idealfactorzc[,1],
      idealzc = idealmul(bnf,idealzc,idealpow(bnf,idealfactorzc[i,1],idealfactorzc[i,2]));
    );
    baseidealzc = vector(3,i,nfbasistoalg(bnf,idealzc[,i]));
    q2 = matrix(3,3,i,j,trace(zc*baseidealzc[i]*baseidealzc[j]/polprime));
if( DEBUGLEVEL_ell >= 4, print("    q2 = ",q2));
if( DEBUGLEVEL_ell >= 4, print("    q2/content(q2) = ",q2/content(q2)));

\\ Solution of the quadratic equation q2=0

    sol = Qfsolve(q2/content(q2));
if( DEBUGLEVEL_ell >= 4,print("    sol = ",sol));
    if( type(sol) == "t_INT", 
      error(" ell2descent_gen : WRONG ELEMENT IN THE SELMER GROUP, please report"));


\\ Parametrizing the solutions of q2=0

    param = Qfparam(q2,sol)*[x^2,x,1]~;
    param /= content(param);

\\ Construction of the quartic

    q1 = -matrix(3,3,i,j,trace(zc*baseidealzc[i]*baseidealzc[j]*(ttheta+A)/polprime));
    pol = param~*q1*param;
if( DEBUGLEVEL_ell >= 2, print("  quartic: ",K,"*Y^2 = ",pol));
    redq = redquartic(pol);
    pol = redq[1];
    den = denominator(content(K*pol));
    pol *= den^2;
if( DEBUGLEVEL_ell >= 2, print("  reduced: ",K,"*Y^2 = ",pol));

\\ Search for points on the quartic

    point = ratpoint(K*pol,LIM1,1);
    if( point == [], point = ratpoint2(K*pol,LIM3,1));
    if( point == [], iwhile ++; next );

    if( #point == 2, point = concat(point,[1]));
if( DEBUGLEVEL_ell >= 2, print("  point on the reduced quartic = ",point));
    point = concat(redq[2]*[point[1],point[3]]~,[point[2]/den]~);
if( DEBUGLEVEL_ell >= 2, print("  point on the quartic = ",point));

\\ Construction of the point on the elliptic curve from the point on the quartic

    param = subst(param,x,x/y)*y^2;
    param = subst(subst(param,x,point[1]),y,point[2]);
    param *= K/point[3];
if( DEBUGLEVEL_ell >= 3, print("  reconstruction of the point on the curve"));
    q0 = matrix(3,3,i,j,trace(zc*baseidealzc[i]*baseidealzc[j]*(ttheta^2+A*ttheta+B)/polprime));
    pointxx = param~*q0*param/K;
    point2 = [ pointxx, sqrtrat(subst(polrel,x,pointxx)/K)];
if( DEBUGLEVEL_ell >= 1, print("  point on the curve = ",point2));
    listpoints = concat(listpoints,[point2]);
    iwhile = 1 << (degre(iwhile)+1)
  );
/* MODI normalized blanks */

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\      Conclusion report           \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  rang = #listpoints;

if( DEBUGLEVEL_ell >= 2,
  print();
  print("  rank of found points     = ",#listpoints);
  print("  rank of the Selmer group = ",#selmer));

if( DEBUGLEVEL_ell >= 1, afficheselmer(rang,#selmer));
  
  if(  (#selmer - rang)%2,
    rang ++;
if( DEBUGLEVEL_ell >= 1, 
      print(" III should be a square, hence ");
      afficheselmer(rang,#selmer));
  );

\\ Verification

if( DEBUGLEVEL_ell >= 1, print("listpoints = ",listpoints));
  for( i = 1, #listpoints, 
    if( subst(polrel,x,listpoints[i][1])-K*listpoints[i][2]^2,
      error(" ell2descent_gen : WRONG POINT = ",listpoints[i]," please report")));

\\ Reduction of the points

  listpoints = vecsort(listpoints,,2);
  if( #listpoints >= 2 && ELLREDGENFLAG,
    listpoints = ellredgen(ell,listpoints,K));

if( DEBUGLEVEL_ell >= 4, print("    end of ell2descent_gen"));
  return([rang,#selmer,listpoints]);
}
if( DEBUGLEVEL_ell >= 4, print("afficheselmer"));
{
afficheselmer(m1,m2,tors2) = 

    print("#E(Q)[2]      = ",1<<tors2);
    print("#S(E/Q)[2]    = ",1<<m2);
  if( m1+tors2 == m2,
    print("#E(Q)/2E(Q)   = ",1<<(m1+tors2));
    print("#III(E/Q)[2]  = 1");
    print("rank(E/Q)     = ",m1);
  ,
    print("#E(Q)/2E(Q)  >= ",1<<(m1+tors2));
    print("#III(E/Q)[2] <= ",1<<(m2-m1-tors2));
    print("rank(E/Q)    >= ",m1)
  );
}
/* MODI: HC added */

ellrankdebug(ell,lev,help=[])=
{
 DEBUGLEVEL_ell=lev;
 return (ellrank(ell,help));
}

if( DEBUGLEVEL_ell >= 4, print("ellrank"));
{
ellrank(ell,help=[]) =
\\ Algorithm of 2-descent on the elliptic curve ell.
\\ help is a list of known points on ell.
local(urst,urst1,den,eqell,tors2,bnf,rang,time1);

if( DEBUGLEVEL_ell >= 3, print("   starting ellrank"));
  if( #ell < 13, ell = ellinit(ell,1));

\\ kill the coefficients a1 and a3
  urst = [1,0,0,0];
  if( ell.a1 != 0 || ell.a3 != 0,
    urst1 = [1,0,-ell.a1/2,-ell.a3/2];
    ell = ellchangecurve(ell,urst1);
    urst = ellcomposeurst(urst,urst1)
  );

\\ kill denominators
  while( (den = denominator([ell.a2,ell.a4,ell.a6])) > 1,
    den = factor(den); den[,2] = vectorv(#den[,2],i,1);
    den = factorback(den);
    urst1 = [1/den,0,0,0];
    ell = ellchangecurve(ell,urst1);
    urst = ellcomposeurst(urst,urst1)
  );

  help = ellchangepoint(help,urst);
  eqell = Pol([1,ell.a2,ell.a4,ell.a6]);
if( DEBUGLEVEL_ell >= 1, print(" Elliptic curve : Y^2 = ",eqell));

\\ Choice of the algorithm depending on the 2-torsion structure

  tors2 = ellhalf(ell,[0]);
if( DEBUGLEVEL_ell >= 1, print(" E[2] = ",tors2));

  if( #tors2 == 1,                              \\ case 1: 2-torsion trivial
if( DEBUGLEVEL_ell >= 3, print1("   bnfinit(",eqell,")"));
if( DEBUGLEVEL_ell >= 4, gettime());
    bnf = bnfinit(eqell,1);
if( DEBUGLEVEL_ell >= 4, time1 = gettime());
if( DEBUGLEVEL_ell >= 3, print(" done"));
    rang = ell2descent_gen(ell,bnf,1,help);
if( DEBUGLEVEL_ell >= 4, print("    time for bnfinit  = ",time1));
if( DEBUGLEVEL_ell >= 4, print("    time for the rest = ",gettime()));
  ,
  if( #tors2 == 2 || !COMPLETE,                 \\ case 2: 2-torsion >= Z/2Z
    if( ell.a6 != 0,
      urst1 = [1,tors2[2][1],0,0];
      ell = ellchangecurve(ell,urst1);
      urst = ellcomposeurst(urst,urst1)
    );
    eqell = Pol([1,ell.a2,ell.a4,ell.a6]);
if( DEBUGLEVEL_ell >= 1, print(" Elliptic curve : Y^2 = ",eqell));

    rang = ell2descent_viaisog(ell,help)
  ,                                             \\ case 3: 2-torsion = Z/2Z*Z/2Z
    rang = ell2descent_complete(tors2[2][1],tors2[3][1],tors2[4][1])
  ));

  rang[3] = ellchangepointinverse(rang[3],urst);
if( DEBUGLEVEL_ell >= 3, print("   end of ellrank"));

  return(rang);
}
if( DEBUGLEVEL_ell >= 4, print("ell2descent_complete"));
{
ell2descent_complete(e1,e2,e3,help) =
\\ Compute the rank of the elliptic curve
\\ E : Y^2 = (x-e1)*(x-e2)*(x-e3)
\\ using the complete 2-descent algorithm (see J.Silverman).
\\ Returns [r,s,v] with
\\   r is a lower bound for the rank of E(Q)
\\   s is the rank of Selmer[2]
\\   v is a system of independant points on E(Q)/2E(Q)

\\ e1, e2, e3 must be integers.
\\ help is a list of known points on E.

local(ee,d32,d31,d21,G1,G2,G3,vect1,vect2,vect3,selmer,rang,listepoints,b1,b2,q1,sol1,param1,param1x,quart,point,z1,solx,soly,strange,ell);
/* local(sol2,q2); */
/* only if used below */
/* MODI remove sol2 q2 */

if( DEBUGLEVEL_ell >= 2, print("  Algorithm of complete 2-descent"));

\\ sort the integers e1, e2, e3 in increasing order

  ee = vecsort([e1,e2,e3]);
  e1 = ee[1]; e2 = ee[2]; e3 = ee[3];

\\ Computation of the groups G1 and G2

  d32 = e3-e2; d31 = e3-e1; d21 = e2-e1;
  G1 = factor(d31*d21)[,1];   \\ (G1 > 0)
  G2 = factor(-d32*d21)[,1];  \\ (G2 < 0)
  G3 = d31*d32;

if( DEBUGLEVEL_ell >= 3, print("   G1 = ",G1));
if( DEBUGLEVEL_ell >= 3, print("   G2 = ",G2));

\\ Run through G1*G2

  vect1 = vector(#G1,i,[0,1]);
  vect2 = vector(#G2,i,[0,1]);
  selmer = 0;
  rang = 0;
  listepoints = [];

  forvec( X = vect1,
    b1 = prod( i = 1, #G1, G1[i]^X[i]);

\\ b1*b2*b3 must be a square, where b3 is a divisor of d32*d31
    vect3 = vect2;
    for( i = 2, #G2, 
      if( G3%G2[i] !=0,
        vect3[i] = [1,1]*valuation(b1,G2[i])));

    forvec( Y = vect3,
      b2 = prod( i = 1, #G2, G2[i]^Y[i]);

if( DEBUGLEVEL_ell >= 3, print("   [b1,b2] = ",lift([b1,b2])));

\\ Trivial points coming from the 2-torsion

      if( b1==1 && b2==1,
if( DEBUGLEVEL_ell >= 4, print("    trivial point [0]"));
        selmer++; rang++; next);
      if( issquare(-d21*b2) && issquare(d31*d21*b1),
if( DEBUGLEVEL_ell >= 3, print("   trivial point [e1,0]"));
        selmer++; rang++; listepoints = concat(listepoints,[[e1,0]]); next);
      if( issquare(d21*b1) && issquare(-d32*d21*b2),
if( DEBUGLEVEL_ell >= 3, print("   trivial point [e2,0]"));
        selmer++; rang++; listepoints = concat(listepoints,[[e2,0]]); next);
      if( issquare(d31*b1) && issquare(d32*b2),
if( DEBUGLEVEL_ell >= 3, print("   trivial point [e3,0]"));
        selmer++; rang++; listepoints = concat(listepoints,[[e3,0]]); next);

\\ Trivial points coming from help

      for( i = 1, #help,
        if( #help[i] != 2 || help[i][2] == 0, next);
        if( issquare(b1*(help[i][1]-e1)) && issquare(b2*(help[i][1]-e2)),
if( DEBUGLEVEL_ell >= 3, print("   trivial point from help ",help[i]));
          selmer++; rang++; 
          listepoints = concat(listepoints,[help[i]]); next(2));
      );

\\ If one can solve 2 quadratic equations
\\ (1) q1 : b1*z1^2-b2*z2^2 = e2-e1
\\ (2) q2 : b1*z1^2-b1*b2*z3^2 = e3-e1
\\ then (x,y) = (b1*z1^2+e1,b1*b2*z1*z2*z3) is a point on E
\\ we also have
\\ (3) q3 = q1-q2 : b1*b2*z3^2-b2*z2^2=e2-e3

\\ Solution of the q1

      q1 = matdiagonal([b1,-b2,-d21]);
if( DEBUGLEVEL_ell >= 3, print("   q1 = ",q1));
      sol1 = Qfsolve(q1);
      if( type(sol1) == "t_INT",
if( DEBUGLEVEL_ell >= 3, print("   q1 not ELS at ",sol1));
        next);
if( DEBUGLEVEL_ell >= 3, print("   solution of q1 = ",sol1));
      param1 = Qfparam(q1,sol1,1);
if( DEBUGLEVEL_ell >= 3, print("   parametrization of q1 = ",param1));
      param1x = param1*[x^2,x,1]~;

\\ Solution of the q2
\\ only useful to detect local non solubility

\\      q2 = matdiagonal([b1,-b1*b2,-d31]);
\\if( DEBUGLEVEL_ell >= 3, print("   q2 = ",q2));
\\      sol2 = Qfsolve(q2);
\\      if( type(sol2) == "t_INT",
\\if( DEBUGLEVEL_ell >= 3, print("   q2 not ELS at ",sol2));
\\        next);

\\ Construction of the quartic

      quart = b1*b2*(b1*param1x[1]^2-d31*param1x[3]^2);
if( DEBUGLEVEL_ell >= 3, print("   quart = ",quart));

\\ Local solubility of the quartic
   
      if( !locallysoluble(quart),
if( DEBUGLEVEL_ell >= 3, print("   quartic not ELS "));
        next);
if( DEBUGLEVEL_ell >= 2, print("  y^2 = ",quart));
      selmer++;

\\ Search for points on the quartic

      point = ratpoint2(quart,LIM3,1);
      if( point != [], 
if( DEBUGLEVEL_ell >= 2, print("  point found on the quartic !!"));
if( DEBUGLEVEL_ell >= 3, print("   ",point));
        if( #point == 2,
          z1 = subst(param1x[1],x,point[1])/subst(param1x[3],x,point[1])
        , z1 = param1[1,1]/param1[3,1]);
        solx = b1*z1^2+e1;
        soly = sqrtrat((solx-e1)*(solx-e2)*(solx-e3));
        listepoints = concat(listepoints,[[solx,soly]]);
if( DEBUGLEVEL_ell >= 1, print(" point on the elliptic curve = ",[solx,soly]));
        rang++
      ,
if( DEBUGLEVEL_ell >= 2, print("  no point found on the quartic"))
      )
    )
  );

\\ end

if( DEBUGLEVEL_ell >= 1, 
  print("#S^(2)      = ",selmer));
  if( rang > selmer/2, rang = selmer);
if( DEBUGLEVEL_ell >= 1,
  strange = rang != selmer;
  if( strange,
  print("#E[K]/2E[K]>= ",rang)
, print("#E[K]/2E[K] = ",rang));
  print("#E[2]       = 4");
);
  rang = ceil(log(rang)/log(2))-2;
  selmer = valuation(selmer,2);
if( DEBUGLEVEL_ell >= 1,
  if( strange,
  print(selmer-2," >= rank  >= ",rang)
, print("rank        = ",rang));
  if( rang, print("points = ",listepoints));
);
  ell = ellinit([0,-(e1+e2+e3),0,e1*e2+e2*e3+e3*e1,-e1*e2*e3],1);
  listepoints = vecsort(listepoints,,2);
  if( ELLREDGENFLAG, listepoints = ellredgen(ell,listepoints));
  listepoints = concat(ellsort(elltorseven(ell)[3]),listepoints);
 
  return([rang,selmer,listepoints]);
}
if( DEBUGLEVEL_ell >= 4, print("ellcount"));
{
ellcount( c, d, KS2gen, listpointstriv=[]) =
local(found,listgen,listpointscount,m1,m2,lastloc,mask,i,d1,iaux,j,triv,pol,point,qf,solqf,para,point1,v);

if( DEBUGLEVEL_ell >= 4, print("    starting ellcount ",[c,d]));
if( DEBUGLEVEL_ell >= 4, print("    KS2gen = ",KS2gen));
if( DEBUGLEVEL_ell >= 4, print("    listpointstriv = ",listpointstriv));

  found = 0;
  listgen = KS2gen;
  listpointscount = [];

  m1 = m2 = 0; lastloc = -1;

  mask = 1 << #KS2gen;
  i = 1;
  while( i < mask,
    d1 = 1; iaux = i; j = 1;
    while( iaux, 
      if( iaux%2, d1 *= listgen[j]);
      iaux >>= 1; j++);
if( DEBUGLEVEL_ell >= 3, print("   d1 = ",d1));
    triv = 0;
    for( j = 1, #listpointstriv,
      if( listpointstriv[j][1] && issquare(d1*listpointstriv[j][1]),
        listpointscount = concat(listpointscount,[listpointstriv[j]]);
if( DEBUGLEVEL_ell >= 2, print("  trivial point"));
        triv = 1; m1++;
        if( degre(i) > lastloc, m2++);
        found = 1; lastloc = -1; break));
    if( !triv,
    pol = Pol([d1,0,c,0,d/d1]);
if( DEBUGLEVEL_ell >= 3, print("   quartic = y^2 = ",pol));
    point = ratpoint(pol,LIM1,1);
    if( point != [],
if( DEBUGLEVEL_ell >= 2, print("  point on the quartic"));
if( DEBUGLEVEL_ell >= 3, print(   point));
      m1++;
      listpointscount = concat(listpointscount,[d1*point[1]*point]);
      if( degre(i) > lastloc, m2++);
      found = 1; lastloc = -1
    ,
      if( locallysoluble(pol),
        if( degre(i) > lastloc, m2++; lastloc = degre(i));
\\        point = ratpoint2(pol,LIM3,1);
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\ Instead of solving directly y^2 = d1*x^4+c*x^2+d/d1,
\\ we solve first y^2 = d1*X^2+c*X+d/d1, then solve the quartic X = x^2
\\ which gives a new quartic
        qf = 2*[d1,c/2,0;c/2,d/d1,0;0,0,-1];
        solqf = Qfsolve(qf);
        para = Qfparam(qf,solqf,2)*[x^2,x,1]~;
if( DEBUGLEVEL_ell >= 3, 
  print("   the conic y^2 = ",Pol([d1,c,d/d1]));
  print("   is parametrized by [x,y] = "subst([para[1]/para[2],para[3]/para[2]],x,t)));
        point1 = ratpoint2(para[1]*para[2],LIM3,1);
        if( point1 != [],
          if(#point1 == 2,
            para = subst(para,x,point1[1])
          , point1 = [1,point1[2]/point1[1]^2,0];
            para = vector(3,ii,polcoeff(para[ii],2))
          );
          point = [point1[2]/para[2],para[3]/para[2]];
        , point = [];
        );
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        if( point != [],
if( DEBUGLEVEL_ell >= 2, print("  point on the quartic"));
if( DEBUGLEVEL_ell >= 3, print(   point));
          m1++;
          listpointscount = concat(listpointscount,[d1*point[1]*point]);
          if( degre(i) > lastloc, m2++);
          found = 1; lastloc = -1
        ,
if( DEBUGLEVEL_ell >= 2, print("  no point found on the quartic"))
          ))));
    if( found,
      found = 0;
      v = 0; iaux = (i>>1);
      while( iaux, iaux >>= 1; v++);
      mask >>= 1;
      listgen = vecextract(listgen,(1<<#listgen)-(1<<v)-1);
      i = (1<<v)
    , i++)
  );

  for( i = 1, #listpointscount,
   if( #listpointscount[i] > 1,
    if( subst(x^3+c*x^2+d*x,x,listpointscount[i][1])-listpointscount[i][2]^2 != 0,
      error(" ellcount : WRONG POINT, please report ",i))));
if( DEBUGLEVEL_ell >= 4, print("    end of ellcount"));

  return([listpointscount,[m1,m2]]);
}
if( DEBUGLEVEL_ell >= 4, print("ell2descent_viaisog"));
{
ell2descent_viaisog(ell,help=[]) =
\\ Computation of the rank of the elliptic curve ell
\\ having rational 2-torsion, using the algorithm via 2-isogenies.
\\
\\ ell must be on the form
\\ y^2=x^3+ax^2+bx -> ell = [0,a,0,b,0]
\\ with a and b integers.

local(P,Pfact,tors,listpointstriv,KS2prod,KS2gen,listpoints,pointgen,n1,n2,certain,apinit,bpinit,np1,np2,listpoints2,aux1,aux2,certainp,rang,strange);

if( DEBUGLEVEL_ell >= 2, print("  Algorithm of 2-descent via isogenies"));
  if( #ell < 13, ell = ellinit(ell,1));

  if( ell.disc == 0,
    error(" ell2descent_viaisog : singular curve !!"));
  if( ell.a1 != 0 || ell.a3 != 0 || ell.a6 != 0, 
    error(" ell2descent_viaisog : the curve is not on the form [0,a,0,b,0]"));
  if( denominator(ell.a2) > 1 || denominator(ell.a4) > 1,
    error(" ell2descent_viaisog : non-integral coefficients"));

\\
\\ Working with the initial curve
\\

\\ Construction of trivial points : torsion

  P = Pol([1,ell.a2,ell.a4]);
  Pfact = factor(P)[,1];
  tors = #Pfact;
  listpointstriv = concat(help,elltorseven(ell)[3]);

\\ Construction of trivial points : small naive height

if( DEBUGLEVEL_ell >= 3, print("   Search for trivial points on the curve"));
  P *= x;
if( DEBUGLEVEL_ell >= 3, print("   Y^2 = ",P));
  listpointstriv = concat( listpointstriv, ratpoint(P,LIMTRIV,0));
if( DEBUGLEVEL_ell >= 1, print(" trivial points on E(Q) = ",listpointstriv); print());

  KS2prod = -abs(ell.a4);
  if( ell.a2^2-4*ell.a4 < 0, KS2prod *= -1);
  KS2gen = factor(KS2prod)[,1];

if( DEBUGLEVEL_ell >= 2,
  print("  #K(b,2)gen          = ",#KS2gen);
  print("  K(b,2)gen = ",KS2gen));

  listpoints = ellcount(ell.a2,ell.a4,KS2gen,listpointstriv);
  pointgen = listpoints[1];
if( DEBUGLEVEL_ell >= 1, print(" points on E(Q) = ",pointgen); print());
  n1 = listpoints[2][1]; n2 = listpoints[2][2];

  certain = (n1 == n2);
if( DEBUGLEVEL_ell >= 1,
  if( certain, 
    print("[E(Q):phi'(E'(Q))]  = ",1<<n1);
    print("#S^(phi')(E'/Q)     = ",1<<n2);
    print("#III(E'/Q)[phi']    = 1"); print()
  ,
    print("[E(Q):phi'(E'(Q))] >= ",1<<n1);
    print("#S^(phi')(E'/Q)     = ",1<<n2);
    print("#III(E'/Q)[phi']   <= ",1<<(n2-n1)); print())
);

\\
\\ Working with the isogeneous curve
\\

  apinit = -2*ell.a2; bpinit = ell.a2^2-4*ell.a4;
  KS2prod = -abs(bpinit);
  if( ell.a4 < 0, KS2prod *= -1);
  KS2gen = factor(KS2prod)[,1];

if( DEBUGLEVEL_ell >= 2,
  print("  #K(a^2-4b,2)gen     = ",#KS2gen);
  print("  K(a^2-4b,2)gen     = ",KS2gen));

\\ Construction of trivial points : torsion

  P = Pol([1,apinit,bpinit]);
  listpointstriv = elltorseven([0,apinit,0,bpinit,0])[3];
   
\\ Construction of trivial points : small naive height

if( DEBUGLEVEL_ell >= 3, print("   Search for trivial points on the curve"));
  P *= x;
if( DEBUGLEVEL_ell >= 3, print(" Y^2 = ",P));
  listpointstriv = concat( listpointstriv, ratpoint(P,LIMTRIV,0));
if( DEBUGLEVEL_ell >= 1, print(" trivial points on E'(Q) = ",listpointstriv); print());

  listpoints = ellcount(apinit,bpinit,KS2gen,listpointstriv);

if( DEBUGLEVEL_ell >= 1, print(" points on E'(Q) = ",listpoints[1]));
  np1 = listpoints[2][1]; np2 = listpoints[2][2];
  listpoints2 = vector(#listpoints[1],i,0);
  for( i = 1, #listpoints[1],
    listpoints2[i] = [0,0];
    aux1 = listpoints[1][i][1]^2;
    if( aux1 != 0,
      aux2 = listpoints[1][i][2];
      listpoints2[i][1] = aux2^2/aux1/4;
      listpoints2[i][2] = aux2*(bpinit-aux1)/aux1/8
    , listpoints2[i] = listpoints[1][i]));
if( DEBUGLEVEL_ell >= 1, print(" points on E(Q) = ",listpoints2); print());
  pointgen = concat(pointgen,listpoints2);

  certainp = (np1 == np2);
if( DEBUGLEVEL_ell >= 1,
  if( certainp,
    print("[E'(Q):phi(E(Q))]   = ",1<<np1);
    print("#S^(phi)(E/Q)       = ",1<<np2);
    print("#III(E/Q)[phi]      = 1"); print()
  ,
    print("[E'(Q):phi(E(Q))]  >= ",1<<np1);
    print("#S^(phi)(E/Q)       = ",1<<np2);
    print("#III(E/Q)[phi]     <= ",1<<(np2-np1)); print());

  if( !certain && (np2 > np1), print1(1<<(np2-np1)," <= "));
  print1("#III(E/Q)[2]       ");
  if( certain && certainp, print1(" "), print1("<"));
  print("= ",1<<(n2+np2-n1-np1));

  print("#E(Q)[2]            = ",1<<tors);
);
  rang = n1+np1-2;
if( DEBUGLEVEL_ell >= 1,
  if( certain && certainp,
    print("#E(Q)/2E(Q)         = ",(1<<(rang+tors)));
    print("rank                = ",rang); print()
  ,
    print("#E(Q)/2E(Q)        >= ",(1<<(rang+tors))); print();
    print("",rang," <= rank          <= ",n2+np2-2); print()
  ));

  strange = (n2+np2-n1-np1)%2;
  if( strange, 
if( DEBUGLEVEL_ell >= 1,
      print(" !!! III should be a square !!!"); print("hence"));
    if( certain, 
      np1++;
      certainp = (np1 == np2);
if( DEBUGLEVEL_ell >= 1,
        if( certainp,
          print("[E'(Q):phi(E(Q))]   = ",1<<np1);
          print("#S^(phi)(E/Q)       = ",1<<np2);
          print("#III(E/Q)[phi]      = 1"); print()
        ,
          print("[E'(Q):phi(E(Q))]  >= ",1<<np1);
          print("#S^(phi)(E/Q)       = ",1<<np2);
          print("#III(E/Q)[phi]     <= ",1<<(np2-np1)); print())
      )
    ,
    if( certainp,
      n1++;
      certain = (n1 == n2);
if( DEBUGLEVEL_ell >= 1, 
        if( certain,
          print("[E(Q):phi'(E'(Q))]   = ",1<<n1);
          print("#S^(phi')(E'/Q)       = ",1<<n2);
          print("#III(E'/Q)[phi']      = 1"); print()
        ,
          print("[E(Q):phi'(E'(Q))]  >= ",1<<n1);
          print("#S^(phi')(E'/Q)      = ",1<<n2);
          print("#III(E'/Q)[phi']    <= ",1<<(n2-n1)); print())
      )
    , n1++)
  );

if( DEBUGLEVEL_ell >= 1,
  print("#S^(2)(E/Q)           = ",1<<(n2+np2-1));
  if( !certain && (np2 > np1), print1(" ",1<<(np2-np1)," <= "));
  print1("#III(E/Q)[2]       ");
  if( certain && certainp, print1(" "), print1("<"));
  print("= ",1<<(n2+np2-n1-np1));
  print("#E(Q)[2]            = ",1<<tors);
);
  rang = n1+np1-2;
if( DEBUGLEVEL_ell >= 1,
  if( certain && certainp, 
    print("#E(Q)/2E(Q)         = ",(1<<(rang+tors))); print();
    print("rank                = ",rang); print()
  ,
    print("#E(Q)/2E(Q)        >= ",(1<<(rang+tors))); print();
    print(rang," <= rank          <= ",n2+np2-2); print())
  ));

\\ end of strange 
  
  pointgen = vecsort(pointgen,,2);
  if( ELLREDGENFLAG, pointgen = ellredgen(ell,pointgen));
  pointgen = concat(ellsort(elltorseven(ell)[3]),pointgen);
if( DEBUGLEVEL_ell >= 1, print("points = ",pointgen));
if( DEBUGLEVEL_ell >= 3, print("   end of ell2descent_viaisog"));

  return([rang,n2+np2-2+tors,pointgen]);
}

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\            HELP MESSAGES                \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

{
\\                  functions for elliptic curves
    addhelp(ell2descent_complete,"ell2descent_complete(e1,e2,e3): Performs a complete 2-descent on the elliptic curve y^2 = (x-e1)*(x-e2)*(x-e3). See ?ellrank for the format of the output.");
    addhelp(ell2descent_gen,"ell2descent_gen((E,bnf,k=1,help=[]): E is a vector of the form [0,A,0,B,C], (or the result of ellinit of such a vector) A,B,C integers such that x^3+A*x^2+B*x+C; bnf is the corresponding bnfinit(,1); Performs 2-descent on the elliptic curve Ek : k*y^2=x^3+A*x^2+B*x+C. See ?ellrank for the format of the output.");
    addhelp(ell2descent_viaisog,"ell2descent_viaisog(E,help=[]): E is an elliptic curve of the form [0,a,0,b,0], with a, b integers. Performs a 2-descent via isogeny on E. See ?ellrank for the format of the output.");
    addhelp(ellrank,"ellrank(E,help=[]): E is any elliptic curve defined over Q. Returns a vector [r,s,v], where r is a lower bound for the rank of E, s is the rank of its 2-Selmer group and v is a list of independant points in E(Q)/2E(Q). If help is a vector of nontrivial points on E, the result might be faster. This function might be used in conjunction with elltors2(E)");
    addhelp(ellhalf,"ellhalf(E,P): returns the vector of all points Q on the elliptic curve E such that 2Q = P");
    addhelp(ellredgen,"ellredgen(E,v): returns a vector of smallest possible points on the elliptic curve E generating the same subgroup as v, up to torsion.");
    addhelp(ellsort,"ellsort(v): v being a vector of points on some elliptic curve, returns the vector v sorted according to the naive height.");
    addhelp(elltors2,"elltors2(E): for an elliptic curve E, returns the group E(K)[2], where K is the field of definition of the coefficients of E (Q, R, Qp or Fp)."); 
    addhelp(elltorseven,"elltorseven(E): for an elliptic curve E, returns 2-Sylow subgroup of E(K)_tors, where K is the field of definition of the coefficients of E: (Q, R, Qp or Fp).");


\\                  functions for polynomials
    addhelp(locallysoluble,"locallysoluble(pol): returns 1 if y^2=pol(x) is everywhere locally soluble, 0 otherwise.");
    addhelp(polratroots,"polratroots(pol): rational roots of the polynomial pol, according to the field of definition of its coefficients (Q, R, Qp, Fp).");
    addhelp(polrealrootsimprove,"ratpoint(pol,lim=1,singlepoint=1): search for rational points on y^2=pol(x), for about within the bounds given by lim. The coefficients of pol must be integral. If singlepoint=1, returns at most one point, otherwise as many as possible.");
    addhelp(redquartic,"redquartic(pol): reduction of the quartic pol using Cremona-Stoll algorithm. Returns [p,M], where p is the reduced quartic and M is the GL2(Z) transformation. Also works with other degree polynomials.");


\\                  functions for number fields
    addhelp(bnfpSelmer,"bnfpSelmer(K,S,p): K being a number field given by bnfinit, S an ideal of K, and p a prime number, computes a set of generators of the group K(S,p) = { x in K^/K^p, v_P(x) = 0 (mod p) for all P coprime to S}");    addhelp(reducemodsquares,"reducemodsquares(delta,d): delta being a t_POLMOD, returns another delta'=delta*z^2, such that delta' has a small coefficient in x^d."); 

\\                  others
    addhelp(DEBUGLEVEL_ell,"DEBUGLEVEL_ell: Choose a higher value of this global variable to have more details of the computations printed during the 2-descent algorithm. 0 = don't print anything; 1 = (default) just print the result; 2 = print more details including the Selmer group and the nontrivial quartics.");
}

\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\       Copyright (C) 2007 Denis Simon
\\
\\ Distributed under the terms of the GNU General Public License (GPL)
\\
\\    This code is distributed in the hope that it will be useful,
\\    but WITHOUT ANY WARRANTY; without even the implied warranty of
\\    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
\\    General Public License for more details.
\\
\\ The full text of the GPL is available at:
\\
\\                 http://www.gnu.org/licenses/
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

\\
\\ Auteur:
\\ Denis SIMON -> simon@math.unicaen.fr
\\ adresse du fichier:
\\ www.math.unicaen.fr/~simon/ell.gp
\\
\\  *********************************************
\\  *          VERSION 25/03/2009               *
\\  *********************************************
\\
\\ Programme de calcul du rang des courbes elliptiques
\\ dans les corps de nombres.
\\ langage: GP
\\ pour l'utiliser, lancer gp, puis taper
\\ \r ell.gp
\\
\\
\\ Explications succintes :
\\ definition du corps :
\\ bnf=bnfinit(y^2+1);
\\ (il est indispensable que la variable soit y).
\\ on peut ensuite poser : 
\\ X = Mod(y,bnf.pol);
\\ 
\\ La fonction bnfellrank() accepte toutes les courbes sous la forme
\\ [a1,a2,a3,a4,a6]
\\ Les coefficients peuvent etre entiers ou non.
\\ L'algorithme utilise est celui de la 2-descente.
\\ La 2-torsion peut etre quelconque.
\\ Il suffit de taper : 
\\
\\ gp > ell = [a1,a2,a3,a4,a6];
\\ gp > bnfellrank(bnf,ell)
\\
\\ Retourne un vecteur [r,s,vec]
\\ ou r est le rang probable (c'est toujours une minoration du rang),
\\ s est le 2-rang du groupe de Selmer,
\\ vec est une liste de points dans E(K)/2E(K).
\\
\\ Courbes avec #E[2](K) >= 2:
\\ ell doit etre sous la forme 
\\ y^2 = x^3 + A*^2 + B*x
\\ avec A et B entiers algebriques
\\ gp > ell = [0,A,0,B,0]
\\ gp > bnfell2descent_viaisog(ell)
\\ = algorithme de la 2-descente par isogenies
\\ Attention A et B doivent etre entiers
\\
\\ Courbes avec #E[2](K) = 4: y^2 = (x-e1)*(x-e2)*(x-e3)
\\ -> bnfell2descent_complete(bnf,e1,e2,e3);
\\ = algorithme de la 2-descente complete
\\ Attention: les ei doivent etre entiers algebriques.
\\
\\
\\ On peut avoir plus ou moins de details de calculs avec
\\ DEBUGLEVEL_ell = 0;
\\ DEBUGLEVEL_ell = 1; 2; 3;...
\\

{
\\
\\ Variables globales usuelles
\\

  DEBUGLEVEL_ell = 1;   \\ pour avoir plus ou moins de details
  LIM1 = 2;    \\ limite des points triviaux sur les quartiques
  LIM3 = 4;    \\ limite des points sur les quartiques ELS
  LIMTRIV = 2; \\ limite des points triviaux sur la courbe elliptique

\\
\\  Variables globales techniques
\\

  BIGINT = 32000;   \\ l'infini
  MAXPROB = 20;
  LIMBIGPRIME = 30; \\ pour distinguer un petit nombre premier d'un grand
                    \\ utilise un test probabiliste pour les grands 
                    \\ si LIMBIGPRIME = 0, n'utilise aucun test probabiliste
  NBIDEAUX = 10;

}

\\
\\  Programmes
\\

\\
\\ Fonctions communes ell.gp et ellQ.gp
\\
/* 
{
ellinverturst(urst) =
local(u = urst[1], r = urst[2], s = urst[3], t = urst[4]);
  [1/u,-r/u^2,-s/u,(r*s-t)/u^3];
}
*/
/*
{
ellchangecurveinverse(ell,v) = ellchangecurve(ell,ellinverturst(v));
}
{
ellchangepointinverse(pt,v) = ellchangepoint(pt,ellinverturst(v));
}
*/
/*
{
ellcomposeurst(urst1,urst2) =
local(u1 = urst1[1], r1 = urst1[2], s1 = urst1[3], t1 = urst1[4],
      u2 = urst2[1], r2 = urst2[2], s2 = urst2[3], t2 = urst2[4]);
  [u1*u2,u1^2*r2+r1,u1*s2+s1,u1^3*t2+s1*u1^2*r2+t1];
}
*/
/*
if( DEBUGLEVEL_ell >= 4, print("mysubst"));
{
mysubst(polsu,subsx) = 
  if( type(lift(polsu)) == "t_POL", 
    return(simplify(subst(lift(polsu),variable(lift(polsu)),subsx)) )
  , return(simplify(lift(polsu))));
} 
*/

/* MODI nfsign is a GP function, must modify */

if( DEBUGLEVEL_ell >= 4, print("nfsign_s"));
{
nfsign_s(nf,a,i) =
\\ return the sign of the algebraic number a in the i-th real embedding.
local(nf_roots,ay,def);

  if( a == 0, return(0));

  a = lift(a);
  if( type(a) != "t_POL",
    return(sign(a)));

  nf_roots = nf.roots;
  def = default(realprecision);

  ay = 0;
  while( ay == 0 || precision(ay) < 10,

    ay = subst(a,variable(a),nf_roots[i]);

    if( ay == 0 || precision(ay) < 10,
if( DEBUGLEVEL_ell >= 3, 
  print(" **** Warning: doubling the real precision in nfsign_s **** ",
        2*default(realprecision)));
      default(realprecision,2*default(realprecision));
      nf_roots = real(polroots(nf.pol))
    )
  );
  default(realprecision,def); 

  return(sign(ay));
}
/*
if( DEBUGLEVEL_ell >= 4, print("degre"));
{
degre(idegre) =
local(ideg = idegre, jdeg = 0);

  while( ideg >>= 1, jdeg++);
  return(jdeg);
}
*/
/*
if( DEBUGLEVEL_ell >= 4, print("nfissquare"));
{
nfissquare(nf, a) = #nfsqrt(nf,a) > 0;
}
if( DEBUGLEVEL_ell >= 4, print("nfsqrt"));
{
nfsqrt( nf, a) =
\\ si a est un carre, renvoie [sqrt(a)], sinon [].
local(alift,ta,res,pfact);

if( DEBUGLEVEL_ell >= 5, print("entree dans nfsqrt ",a));
  if( a==0 || a==1, 
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
    return([a]));

  alift = lift(a);
  ta = type(a);
  if( !poldegree(alift), alift = polcoeff(alift,0));

  if( type(alift) != "t_POL",
    if( issquare(alift), 
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
      return([sqrtrat(alift)])));

  if( poldegree(nf.pol) <= 1,
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
    return([]));
  if( ta == "t_POL", a = Mod(a,nf.pol));

\\ tous les plgements reels doivent etre >0 

  for( i = 1, nf.r1,
    if( nfsign_s(nf,a,i) < 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
      return([])));

\\ factorisation sur K du polynome X^2-a :

  if( variable(nf.pol) == x,
    py = subst(nf.pol,x,y);
    pfact = lift(factornf(x^2-mysubst(alift,Mod(y,py)),py)[1,1])
  ,
    pfact = lift(factornf(x^2-a,nf.pol)[1,1]));
  if( poldegree(pfact) == 2,
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
    return([]));
if( DEBUGLEVEL_ell >= 5, print("fin de nfsqrt"));
  return([subst(polcoeff(pfact,0),y,Mod(variable(nf.pol),nf.pol))]);
}
*/
/*
if( DEBUGLEVEL_ell >= 4, print("sqrtrat"));
{
sqrtrat(a) = 
  sqrtint(numerator(a))/sqrtint(denominator(a));
}
*/

\\
\\ Fonctions propres a ell.gp
\\

if( DEBUGLEVEL_ell >= 4, print("nfpolratroots"));
{
nfpolratroots(nf,pol) =
local(f,ans);
  f = nffactor(nf,lift(pol))[,1];
  ans = [];
  for( j = 1, #f, 
    if( poldegree(f[j]) == 1,
      ans = concat(ans,[-polcoeff(f[j],0)/polcoeff(f[j],1)])));
  return(ans);
}
if( DEBUGLEVEL_ell >= 4, print("nfmodid2"));
{
nfmodid2(nf,a,ideal) = 
if( DEBUGLEVEL_ell >= 5, print("entree dans nfmodid2"));
\\ ideal doit etre sous la forme primedec 
  if( #nf.zk == 1,
if( DEBUGLEVEL_ell >= 5, print("fin de nfmodid2"));
    return(a*Mod(1,ideal.p)));
  a = mynfeltmod(nf,a,nfbasistoalg(nf,ideal[2]));
  if( gcd(denominator(content(lift(a))),ideal.p) == 1,
if( DEBUGLEVEL_ell >= 5, print("fin de nfmodid2"));
    return(a*Mod(1,ideal.p)));
if( DEBUGLEVEL_ell >= 5, print("fin de nfmodid2"));
  return(a);
}
if( DEBUGLEVEL_ell >= 4, print("nfhilb2"));
{
nfhilb2(nf,a,b,p) =
local(res);

if( DEBUGLEVEL_ell >= 5, print("entree dans nfhilb2"));
  if( nfqpsoluble(nf,a*x^2+b,initp(nf,p)), res = 1, res = -1);
if( DEBUGLEVEL_ell >= 5, print("fin de nfhilb2"));
  return(res);
}
if( DEBUGLEVEL_ell >= 4, print("mynfhilbertp"));
{
mynfhilbertp(nf,a,b,p) =
\\ calcule le symbole de Hilbert quadratique local (a,b)_p
\\ * en l'ideal premier p du corps nf,
\\ * a et b sont des elements non nuls de nf, sous la forme
\\ * de polymods ou de polynomes, et p renvoye par primedec.
local(alpha,beta,sig,aux,aux2,rep);

if( DEBUGLEVEL_ell >= 5, print("entree dans mynfhilbertp ",p));
  if( a == 0 || b == 0, print("0 argument in mynfhilbertp"));
  if( p.p == 2,
if( DEBUGLEVEL_ell >= 5, print("fin de mynfhilbertp"));
    return(nfhilb2(nf,a,b,p)));
  if( type(a) != "t_POLMOD", a = Mod(a,nf.pol));
  if( type(b) != "t_POLMOD", b = Mod(b,nf.pol));
  
  alpha = idealval(nf,a,p); beta = idealval(nf,b,p);
if( DEBUGLEVEL_ell >= 5, print("[alpha,beta] = ",[alpha,beta]));
  if( (alpha%2 == 0) && (beta%2 == 0),
if( DEBUGLEVEL_ell >= 5, print("fin de mynfhilbertp"));
    return(1));
  aux2 = idealnorm(nf,p)\2;
  if( alpha%2 && beta%2 && aux2%2, sig = 1, sig = -1);
  if( beta, aux = nfmodid2(nf,a^beta/b^alpha,p), aux = nfmodid2(nf,b^alpha,p));
  aux = aux^aux2 + sig;
  aux = lift(lift(aux));
  if( aux == 0, rep = 1, rep = (idealval(nf,aux,p) >=  1) );
if( DEBUGLEVEL_ell >= 5, print("fin de mynfhilbertp"));
  if( rep, return(1), return(-1));
}
if( DEBUGLEVEL_ell >= 4, print("ideallistfactor"));
{
ideallistfactor(nf,listfact) =
local(Slist,S1,test,k);
/* MODI remove i,j */

if( DEBUGLEVEL_ell >= 5, print("entree dans ideallistfactor"));
  Slist = []; test = 1;
  for( i = 1, #listfact,
    if( listfact[i] == 0, next);
    S1 = idealfactor(nf,listfact[i])[,1];
    for( j = 1, #S1, k = #Slist;
      for( k = 1, #Slist,
        if( Slist[k] == S1[j], test = 0; break));
      if( test, Slist = concat(Slist,[S1[j]]), test = 1);
     ));
if( DEBUGLEVEL_ell >= 5, print("fin de ideallistfactor"));
  return(Slist);
}
if( DEBUGLEVEL_ell >= 4, print("mynfhilbert"));
{
mynfhilbert(nf,a,b) =
\\ calcule le symbole de Hilbert quadratique global (a,b):
\\ =1 si l'equation X^2-aY^2-bZ^2=0 a une solution non triviale,
\\ =-1 sinon,
\\ a et b doivent etre non nuls.
local(al,bl,S);

if( DEBUGLEVEL_ell >= 4, print("entree dans mynfhilbert ",[a,b]));
  if( a == 0 || b == 0, error("mynfhilbert : argument = 0"));
  al = lift(a); bl = lift(b);

\\ solutions locales aux places reelles 

  for( i = 1, nf.r1,
    if( nfsign_s(nf,al,i) < 0 && nfsign_s(nf,bl,i) < 0,
if( DEBUGLEVEL_ell >= 3, print("mynfhilbert non soluble a l'infini"));
if( DEBUGLEVEL_ell >= 4, print("fin de mynfhilbert"));
      return(-1))
  );

  if( type(a) != "t_POLMOD", a = Mod(a,nf.pol));
  if( type(b) != "t_POLMOD", b = Mod(b,nf.pol));

\\  solutions locales aux places finies (celles qui divisent 2ab)

  S = ideallistfactor(nf,[2,a,b]);
  forstep ( i = #S, 2, -1,
\\ d'apres la formule du produit on peut eviter un premier 
    if( mynfhilbertp(nf,a,b, S[i]) == -1,
if( DEBUGLEVEL_ell >= 3, print("mynfhilbert non soluble en : ",S[i]));
if( DEBUGLEVEL_ell >= 4, print("fin de mynfhilbert"));
      return(-1)));
if( DEBUGLEVEL_ell >= 4, print("fin de mynfhilbert"));
  return(1);
}
if( DEBUGLEVEL_ell >= 4, print("initp"));
{
initp( nf, p) =
\\   pp[1] est l'ideal sous forme reduite 
\\   pp[2] est un entier de Zk avec une valuation 1 en p
\\   pp[3] est la valuation de 2 en p
\\   pp[4] sert a detecter les carres dans Qp 
\\     si p|2 il faut la structure de Zk/p^(1+2v) d'apres Hensel
\\     sinon il suffit de calculer x^(N(p)-1)/2 
\\   pp[5] est un systeme de representants de Zk/p 
\\     c'est donc un ensemble de cardinal p^f .
local(idval,pp);

if( DEBUGLEVEL_ell >= 5, print("entree dans initp"));
  idval = idealval(nf,2,p);
  pp=[ p, nfbasistoalg(nf,p[2]), idval, 0, repres(nf,p) ];
  if( idval,
    pp[4] = idealstar(nf,idealpow(nf,p,1+2*idval)),
    pp[4] = p.p^p.f\2 );
if( DEBUGLEVEL_ell >= 5, print("fin de initp"));
  return(pp);
}
if( DEBUGLEVEL_ell >= 4, print("deno"));
{
deno(num) = 
\\ calcule un denominateur du polynome num 

  if( num == 0, return(1));
  if( type(num) == "t_POL",
     return(denominator(content(num))));
  return(denominator(num));
}
if( DEBUGLEVEL_ell >= 4, print("nfratpoint"));
{
nfratpoint(nf,pol,lim,singlepoint=1) =
\\ Si singlepoint == 1, cherche un seul point, sinon plusieurs.
local(compt1,compt2,deg,n,AA,point,listpoints,vectx,evpol,sq,xpol);
/* MODI remove xx, denoz */
/* MODI add xpol */

if( DEBUGLEVEL_ell >= 4, print("entree dans nfratpoint avec pol = ",pol); print("lim = ",lim));
  compt1 = 0; compt2 = 0;
  deg = poldegree(pol); n = poldegree(nf.pol);
  AA = lim<<1;
  if( !singlepoint, listpoints = []);

\\ cas triviaux 
  sq = nfsqrt(nf,polcoeff(pol,0));
  if( sq!= [],
    point = [ 0, sq[1], 1];
    if( singlepoint,
if( DEBUGLEVEL_ell >= 4, print("fin de nfratpoint"));
      return(point));
    listpoints = concat(listpoints,[point])
  );
  sq = nfsqrt(nf,pollead(pol));
  if( sq != [],
    point = [ 1, sq[1], 0];
    if( singlepoint,
if( DEBUGLEVEL_ell >= 4, print("fin de nfratpoint"));
      return(point));
    listpoints = concat(listpoints,[point])
  );
  
\\ boucle generale
  point = [];
  vectx = vector(n,i,[-lim,lim]);
  for( denoz = 1, lim,
    forvec( xx = vectx,
      if( denoz == 1 || gcd(content(xx),denoz) == 1,
        xpol = nfbasistoalg(nf,xx~);
        evpol = subst(pol,x,xpol/denoz);
        sq = nfsqrt(nf,evpol);
        if( sq != [],
          point = [xpol/denoz, sq[1], 1];
          if( singlepoint, break(2));
          listpoints = concat(listpoints,[point])));
  ));

  if( singlepoint, listpoints = point);
if( DEBUGLEVEL_ell >= 4, print("sortie de nfratpoint"));
if( DEBUGLEVEL_ell >= 3, print("points trouves par nfratpoint = ",listpoints));
  return(listpoints);
}
if( DEBUGLEVEL_ell >= 4, print("repres"));
{
repres(nf,p) =
\\ calcule un systeme de representants Zk/p
local(fond,mat,f,rep,pp,ppi,pp2,jppi,gjf);
/* MODI remove i,j,k */

if( DEBUGLEVEL_ell >= 5, print("entree dans repres"));
  fond = [];
  mat = idealhnf(nf,p);
  for( i = 1, #mat,
    if( mat[i,i] != 1, fond = concat(fond,nf.zk[i])));
  f = #fond;
  pp = p.p;
  rep = vector(pp^f,i,0);
  rep[1] = 0;
  ppi = 1;
  pp2 = pp\2;
  for( i = 1, f,
    for( j = 1, pp-1,
      if( j <= pp2, gjf = j*fond[i], gjf = (j-pp)*fond[i]);
      jppi = j*ppi;
      for( k = 0, ppi-1, rep[jppi+k+1] = rep[k+1]+gjf ));
    ppi *= pp);
if( DEBUGLEVEL_ell >= 5, print("fin de repres"));
  return(Mod(rep,nf.pol));
}
if( DEBUGLEVEL_ell >= 4, print("val"));
{
val(nf,num,p) =
  if( num == 0, BIGINT, idealval(nf,lift(num),p));
}
if( DEBUGLEVEL_ell >= 4, print("nfissquarep"));
{
nfissquarep(nf,a,p,q) =
\\ suppose que a est un carre modulo p^q
\\ et renvoie sqrt(a) mod p^q (ou plutot p^(q/2))
local(pherm,f,aaa,n,pp,qq,e,z,xx,yy,r,aux,b,m,vp,inv2x,zinit,zlog,expo,id);
/* MODI add id */

if( DEBUGLEVEL_ell >= 5, print("entree dans nfissquarep ",a,p,q));
  if( a == 0 || a == 1,
if( DEBUGLEVEL_ell >= 4, print("fin de nfissquarep"));
    return(a));
  pherm = idealhnf(nf,p);
if( DEBUGLEVEL_ell >= 5, print("pherm = ",pherm));
  f = idealval(nf,a,p);
  if( f >= q,
    if( f > q, aaa = nfbasistoalg(nf,p[2])^((q+1)>>1), aaa = 0);
if( DEBUGLEVEL_ell >= 4, print("fin de nfissquarep"));
    return(aaa));
  if( f, aaa = a*nfbasistoalg(nf,p[5]/p.p)^f, aaa = a);
  if( pherm[1,1] != 2,
\\ cas ou p ne divise pas 2 
\\ algorithme de Shanks 
    n = nfrandintmodid(nf,pherm);
    while( nfpsquareodd(nf,n,p), n = nfrandintmodid(nf,pherm));
    pp = Mod(1,p.p);
    n *= pp;
    qq = idealnorm(nf,pherm)\2;
    e = 1; while( !(qq%2), e++; qq \= 2);
    z = mynfeltreduce(nf,lift(lift(n^qq)),pherm);
    yy = z;r = e;
    xx = mynfeltreduce(nf,lift(lift((aaa*pp)^(qq\2))),pherm);
    aux = mynfeltreduce(nf,aaa*xx,pherm);
    b = mynfeltreduce(nf,aux*xx,pherm);
    xx = aux;
    aux = b;m = 0;
    while( !val(nf,aux-1,p), m++; aux = mynfeltreduce(nf,aux^2,pherm));
    while( m,
      if( m == r, error("nfissquarep : m = r"));
      yy *= pp;
      aux = mynfeltreduce(nf,lift(lift(yy^(1<<(r-m-1)))),pherm);
      yy = mynfeltreduce(nf,aux^2,pherm);
      r = m;
      xx = mynfeltreduce(nf,xx*aux,pherm);
      b = mynfeltreduce(nf,b*yy,pherm);
      aux = b;m = 0;
      while( !val(nf,aux-1,p), m++; aux = mynfeltreduce(nf,aux^2,pherm));
    );
\\ lift de Hensel
\\
    if( q > 1, 
      vp = idealval(nf,xx^2-aaa,p);
      if( vp < q-f,
        yy = 2*xx;
        inv2x = nfbasistoalg(nf,idealaddtoone(nf,yy,p)[1])/yy;
        while( vp < q, vp++; xx -= (xx^2-aaa)*inv2x);
      );
      if( f, xx *= nfbasistoalg(nf,p[2])^(f>>1));
    );
    xx = mynfeltreduce(nf,xx,idealpow(nf,p,q))
  ,
\\ cas ou p divise 2 */
    if( q-f > 1, id = idealpow(nf,p,q-f), id = pherm);
    zinit = idealstar(nf,id,2);
    zlog = ideallog(nf,aaa,zinit);
    xx = 1;
    for( i = 1, #zlog,
      expo = zlog[i];
      if( expo,
        if( !expo%2,
          expo = expo>>1
        , aux = zinit[2][i];
          expo = expo*((aux+1)>>1)%aux
        );
        xx *= nfbasistoalg(nf,zinit[2][3][i])^expo
      )
    );
    if( f,
      xx *= nfbasistoalg(nf,p[2])^(f>>1);
      id = idealpow(nf,p,q));
    xx = mynfeltreduce(nf,xx,id);
  );
if( DEBUGLEVEL_ell >= 4, print("fin de nfissquarep ",xx));
  return(xx);
}
if( DEBUGLEVEL_ell >= 4, print("nfpsquareodd"));
{
nfpsquareodd( nf, a, p) =
\\ renvoie 1 si a est un carre dans ZK_p 0 sinon 
\\ seulement pour p premier avec 2 
local(v,ap,norme,den);

if( DEBUGLEVEL_ell >= 5, print("entree dans nfpsquareodd"));
  if( a == 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareodd"));
    return(1));
  v = idealval(nf,lift(a),p);
  if( v%2,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareodd"));
    return(0));
  ap = a/nfbasistoalg(nf,p[2])^v;

  norme = idealnorm(nf,p)\2;
  den = denominator(content(lift(ap)))%p.p;
  if(sign(den), ap*=Mod(1,p.p));
  ap = ap^norme-1;
  if( ap == 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareodd"));
    return(1));
  ap = lift(lift(ap));
  if( idealval(nf,ap,p) > 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareodd"));
    return(1));
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareodd"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("nfpsquare"));
{
nfpsquare( nf, a, p, zinit) =
\\ a est un entier de K 
\\ renvoie 1 si a est un carre dans ZKp 0 sinon 
local(valap,zlog);
/* MODI remove i */

if( DEBUGLEVEL_ell >= 5, print("entree dans nfpsquare ",[a,p,zinit]));
  if( a == 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquare"));
    return(1));

  if( p.p != 2,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquare"));
    return(nfpsquareodd(nf,a,p)));

  valap = idealval(nf,a,p);
  if( valap%2,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquare"));
    return(0));
  if( valap,
    zlog = ideallog(nf,a*(nfbasistoalg(nf,p[5])/p.p)^valap,zinit)
  ,
    zlog = ideallog(nf,a,zinit));
  for( i = 1, #zinit[2][2],
    if( !(zinit[2][2][i]%2) && (zlog[i]%2),
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquare"));
      return(0)));
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquare"));
  return(1);
}
if( DEBUGLEVEL_ell >= 4, print("nfpsquareq"));
{
nfpsquareq( nf, a, p, q) =
\\ cette fonction renvoie 1 si a est un carre 
\\ ?inversible? modulo P^q et 0 sinon.
\\ P divise 2, et ?(a,p)=1?.
local(vala,zinit,zlog);
/* MODI remove i */

if( DEBUGLEVEL_ell >= 5, print("entree dans nfpsquareq ",[a,p,q]));
  if( a == 0,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareq"));
    return(1));
  vala = idealval(nf,a,p);
  if( vala >= q,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareq"));
    return(1));
  if( vala%2,
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareq"));
    return(0));
  zinit = idealstar(nf,idealpow(nf,p,q-vala),2);
  zlog = ideallog(nf,a*nfbasistoalg(nf,p[5]/2)^vala,zinit);
  for( i = 1, #zinit[2][2],
    if( !(zinit[2][2][i]%2) && (zlog[i]%2),
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareq"));
      return(0)));
if( DEBUGLEVEL_ell >= 5, print("fin de nfpsquareq"));
  return(1);
}
if( DEBUGLEVEL_ell >= 4, print("nflemma6"));
{
nflemma6( nf, pol, p, nu, xx) =
local(gx,gpx,lambda,mu);

if( DEBUGLEVEL_ell >= 5, print("entree dans nflemma6"));
  gx = subst( pol, x, xx);
  if( nfpsquareodd(nf,gx,p),
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma6"));
    return(1));
  gpx = subst( pol', x, xx);
  lambda = val(nf,gx,p);mu = val(nf,gpx,p);

  if( lambda>2*mu,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma6"));
    return(1));
  if( (lambda >= 2*nu)  && (mu >= nu),
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma6"));
    return(0));
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma6"));
  return(-1);
}
if( DEBUGLEVEL_ell >= 4, print("nflemma7"));
{
nflemma7( nf, pol, p, nu, xx, zinit) =
local(gx,gpx,v,lambda,mu,q);

if( DEBUGLEVEL_ell >= 5, print("entree dans nflemma7 ",[xx,nu]));
  gx = subst( pol, x, xx);
  if( nfpsquare(nf,gx,p,zinit),
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
    return(1));
  gpx = subst( pol', x, xx);
  v = p[3];
  lambda = val(nf,gx,p);mu = val(nf,gpx,p);
  if( lambda>2*mu,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
    return(1));
  if( nu > mu,
    if( lambda%2,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(-1));
    q = mu+nu-lambda;
    if( q > 2*v,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(-1));
    if( nfpsquareq(nf,gx*nfbasistoalg(nf,p[5]/2)^lambda,p,q),
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(1))
  ,
    if( lambda >= 2*nu,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(0));
    if( lambda%2,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(-1));
    q = 2*nu-lambda;
    if( q > 2*v,
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(-1));
    if( nfpsquareq(nf,gx*nfbasistoalg(nf,p[5]/2)^lambda,p,q),
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
      return(0))
  );
if( DEBUGLEVEL_ell >= 5, print("fin de nflemma7"));
  return(-1);
}
if( DEBUGLEVEL_ell >= 4, print("nfzpsoluble"));
{
nfzpsoluble( nf, pol, p, nu, pnu, x0) =
local(result,pnup,lrep);

if( DEBUGLEVEL_ell >= 5, print("entree dans nfzpsoluble ",[lift(x0),nu]));
  if( p[3] == 0,
    result = nflemma6(nf,pol,p[1],nu,x0),
    result = nflemma7(nf,pol,p[1],nu,x0,p[4]));
  if( result == +1,
if( DEBUGLEVEL_ell >= 5, print("fin de nfzpsoluble"));
    return(1));
  if( result == -1,
if( DEBUGLEVEL_ell >= 5, print("fin de nfzpsoluble"));
    return(0));
  pnup = pnu*p[2];
  lrep = #p[5];
  nu++;
  for( i = 1, lrep,
    if( nfzpsoluble(nf,pol,p,nu,pnup,x0+pnu*p[5][i]),
if( DEBUGLEVEL_ell >= 5, print("fin de nfzpsoluble"));
      return(1)));
if( DEBUGLEVEL_ell >= 5, print("fin de nfzpsoluble"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("mynfeltmod"));
{
mynfeltmod(nf,a,b) =
local(qred);

  qred = round(nfalgtobasis(nf,a/b));
  qred = a-b*nfbasistoalg(nf,qred);
  return(qred);
}
if( DEBUGLEVEL_ell >= 4, print("mynfeltreduce"));
{
mynfeltreduce(nf,a,id) =
  nfbasistoalg(nf,nfeltreduce(nf,nfalgtobasis(nf,a),id));
}
if( DEBUGLEVEL_ell >= 4, print("nfrandintmodid"));
{
nfrandintmodid( nf, id) =
local(res);

if( DEBUGLEVEL_ell >= 5, print("entree dans nfrandintmodid"));
  res = 0;
  while( !res,
    res = nfrandint(nf,0);
    res = mynfeltreduce(nf,res,id));
if( DEBUGLEVEL_ell >= 5, print("fin de nfrandintmodid"));
  return(res);
}
if( DEBUGLEVEL_ell >= 4, print("nfrandint"));
{
nfrandint( nf, borne) =
local(l,res);
/* MODI remove i */

if( DEBUGLEVEL_ell >= 5, print("entree dans nfrandint"));
  l = #nf.zk;
  res = vectorv(l,i,0);
  for( i = 1, l,
      if( borne, res[i] = random(borne<<1)-borne, res[i] = random() ));
  res = nfbasistoalg(nf,res);
if( DEBUGLEVEL_ell >= 5, print("fin de nfrandint"));
  return(res);
}
if( DEBUGLEVEL_ell >= 4, print("nfqpsolublebig"));
{
nfqpsolublebig( nf, pol, p,ap=0,b=1) = 
local(deg,xx,z,Px,cont,pi,pol2,Roots);
/* MODI remove i,j */

if( DEBUGLEVEL_ell >= 4, print("entree dans nfqpsolublebig avec ",p.p));
  deg = poldegree(pol);

  if( nfpsquareodd(nf,polcoeff(pol,0),p),
if( DEBUGLEVEL_ell >= 4, print("fin de nfqpsolublebig"));
    return(1));
  if( nfpsquareodd(nf,pollead(pol),p),
if( DEBUGLEVEL_ell >= 4, print("fin de nfqpsolublebig"));
    return(1));

\\ on tient compte du contenu de pol
  cont = idealval(nf,polcoeff(pol,0),p);
  for( i = 1, deg,
    if( cont, cont = min(cont,idealval(nf,polcoeff(pol,i),p))));
  if( cont, pi = nfbasistoalg(nf,p[5]/p.p));
  if( cont > 1, pol *= pi^(2*(cont\2)));
    
\\ On essaye des valeurs de x au hasard
  if( cont%2,
    pol2 = pol*pi
  , pol2 = pol;
    for( i = 1, MAXPROB,
      xx = nfrandint(nf,0);
      z = 0; while( !z, z = random());
      xx = -ap*z+b*xx;
      Px=polcoeff(pol,deg);
      forstep (j=deg-1,0,-1,Px=Px*xx+polcoeff(pol,j));
      Px *= z^(deg);
      if( nfpsquareodd(nf,Px,p), 
if( DEBUGLEVEL_ell >= 4, print("fin de nfqpsolublebig"));
        return(1));
    )
  );

\\ On essaye les racines de pol 
  Roots = nfpolrootsmod(nf,pol2,p);
  pi = nfbasistoalg(nf,p[2]);
  for( i = 1, #Roots,
    if( nfqpsolublebig(nf,subst(pol,x,pi*x+Roots[i]),p),
      return(1)));

if( DEBUGLEVEL_ell >= 4, print("fin de nfqpsolublebig"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("nfpolrootsmod"));
{
nfpolrootsmod(nf,pol,p) =
\\ calcule les racines modulo l'ideal p du polynome pol.
\\ p est un ideal premier de nf, sous la forme idealprimedec
local(factlist,sol);

  factlist = nffactormod(nf,pol,p)[,1];
  sol = [];
  for( i = 1, #factlist,
    if( poldegree(factlist[i]) == 1,
      sol = concat(sol, [-polcoeff(factlist[i],0)/polcoeff(factlist[i],1)])));
  return(sol);
}
if( DEBUGLEVEL_ell >= 4, print("nfqpsoluble"));
{
nfqpsoluble( nf, pol, p) = 

if( DEBUGLEVEL_ell >= 4, print("entree dans nfqpsoluble ",p));
if( DEBUGLEVEL_ell >= 5, print("pol = ",pol));
  if( nfpsquare(nf,pollead(pol),p[1],p[4]),
if( DEBUGLEVEL_ell >= 5, print("fin de nfqpsoluble"));
    return(1));
  if( nfpsquare(nf,polcoeff(pol,0),p[1],p[4]),
if( DEBUGLEVEL_ell >= 5, print("fin de nfqpsoluble"));
    return(1));
  if( nfzpsoluble(nf,pol,p,0,1,0),
if( DEBUGLEVEL_ell >= 5, print("fin de nfqpsoluble"));
    return(1));
  if( nfzpsoluble(nf,polrecip(pol),p,1, p[2],0),
if( DEBUGLEVEL_ell >= 5, print("fin de nfqpsoluble"));
    return(1));
if( DEBUGLEVEL_ell >= 5, print("fin de nfqpsoluble"));
  return(0);
}
if( DEBUGLEVEL_ell >= 4, print("nflocallysoluble"));
{
nflocallysoluble( nf, pol, r=0,a=1,b=1) =
local(pol0,plist,add,ff,p,Delta,vecpol,vecpolr,Sturmr);

if( DEBUGLEVEL_ell >= 4, print("entree dans nflocallysoluble ",[pol,r,a,b]));
  pol0 = pol;
\\
\\ places finies de plist */
\\
  pol *= deno(content(lift(pol)))^2;
  for( ii = 1, 3,
    if( ii == 1, plist = idealprimedec(nf,2));
    if( ii == 2 && r, plist = idealfactor(nf,poldisc(pol0/pollead(pol0))/pollead(pol0)^6/2^12)[,1]);
    if( ii == 2 && !r, plist = idealfactor(nf,poldisc(pol0))[,1]);
    if( ii == 3,
      add = idealadd(nf,a,b);
      ff = factor(idealnorm(nf,add))[,1];
      addprimes(ff);
if( DEBUGLEVEL_ell >= 4, print("liste de premiers = ",ff));
      plist = idealfactor(nf,add)[,1]);
      for( i = 1, #plist,
        p =  plist[i];  
if( DEBUGLEVEL_ell >= 3, print("p = ",p));
        if( p.p < LIMBIGPRIME,
          if( !nfqpsoluble(nf,pol,initp(nf,p)),
if( DEBUGLEVEL_ell >= 2, print(" non ELS en ",p));
if( DEBUGLEVEL_ell >= 4, print("fin de nflocallysoluble"));
            return(0)),
          if( !nfqpsolublebig(nf,pol,p,r/a,b),
if( DEBUGLEVEL_ell >= 2, print(" non ELS en ",p.p," ( = grand premier  )"));
if( DEBUGLEVEL_ell >= 4, print("fin de nflocallysoluble"));
            return(0))));
);
\\ places reelles 
  if( nf.r1,
    Delta = poldisc(pol); vecpol = Vec(pol);
    for( i = 1, nf.r1,
      if( nfsign_s(nf,pollead(pol),i) > 0, next);
      if( nfsign_s(nf,polcoeff(pol,0),i) > 0, next);
      if( nfsign_s(nf,Delta,i) < 0, next);
      vecpolr = vector(#vecpol,j,mysubst(vecpol[j],nf.roots[i]));
      Sturmr = polsturm(Pol(vecpolr));
      if( Sturmr == 0, 
if( DEBUGLEVEL_ell >= 2, print(" non ELS a l'infini"));
if( DEBUGLEVEL_ell >= 4, print("fin de nflocallysoluble"));
        return(0));
  ));
if( DEBUGLEVEL_ell >= 2, print(" quartique ELS "));
if( DEBUGLEVEL_ell >= 4, print("fin de nflocallysoluble"));
  return(1);
}
if( DEBUGLEVEL_ell >= 4, print("nfellcount"));
{
nfellcount( nf, c, d, KS2gen, pointstriv) =
local(found,listgen,listpointscount,m1,m2,lastloc,mask,i,d1,iaux,j,triv,pol,point,deuxpoints,aux,v);
/* MODI add aux, v */
if( DEBUGLEVEL_ell >= 4, print("entree dans nfellcount ",[c,d]));
  found = 0;
  listgen = KS2gen;
  listpointscount = [];

  m1 = m2 = 0; lastloc = -1;

  mask = 1 << #KS2gen;
  i = 1;
  while( i < mask,
    d1 = 1; iaux = i; j = 1;
    while( iaux, 
      if( iaux%2, d1 *= listgen[j]);
      iaux >>= 1; j++);
if( DEBUGLEVEL_ell >= 2, print("d1 = ",d1));
    triv = 0;
    for( j = 1, #pointstriv,
      if( pointstriv[j][3]*pointstriv[j][1] 
        && nfissquare(nf,d1*pointstriv[j][1]*pointstriv[j][3]),
        listpointscount = concat(listpointscount,[pointstriv[j]]);
if( DEBUGLEVEL_ell >= 2, print("point trivial"));
        triv = 1; m1++;
        if( degre(i) > lastloc, m2++);
        found = 1; lastloc = -1; break));
    if( !triv, 
    pol = Pol([d1,0,c,0,d/d1]);
if( DEBUGLEVEL_ell >= 3, print("quartique = y^2 = ",pol));
    point = nfratpoint(nf,pol,LIM1,1);
    if( point != [],
if( DEBUGLEVEL_ell >= 2, print("point sur la quartique"));
if( DEBUGLEVEL_ell >= 3, print(point));
      m1++;
      if( point[3] != 0,
        aux = d1*point[1]/point[3]^2;
        deuxpoints = [ aux*point[1], aux*point[2]/point[3] ]
      ,
        deuxpoints = [0]);
      listpointscount = concat(listpointscount,[deuxpoints]);    
      if( degre(i) > lastloc, m2++);
      found = 1; lastloc = -1
    ,
      if( nflocallysoluble(nf,pol),
        if( degre(i) > lastloc, m2++; lastloc = degre(i));
        point = nfratpoint(nf,pol,LIM3,1);
        if( point != [],
if( DEBUGLEVEL_ell >= 2, print("point sur la quartique"));
if( DEBUGLEVEL_ell >= 3, print(point));
          m1++;
          aux = d1*point[1]/point[3]^2;
          deuxpoints = [ aux*point[1], aux*point[2]/point[3] ];
          listpointscount = concat(listpointscount,[deuxpoints]);
          if( degre(i) > lastloc, m2++);
          found = 1; lastloc = -1
        , 
if( DEBUGLEVEL_ell >= 2, print("pas de point trouve sur la quartique"));
          ))));
    if( found, 
      found = 0;
      v = 0; iaux = (i>>1);
      while( iaux, iaux >>= 1; v++);
      mask >>= 1;
      listgen = vecextract(listgen,(1<<#listgen)-(1<<v)-1);
      i = (1<<v)
    , i++)
  );
  for( i = 1, #listpointscount,
   if( #listpointscount[i] > 1, 
    if( subst(x^3+c*x^2+d*x,x,listpointscount[i][1])-listpointscount[i][2]^2 != 0,
      error("nfellcount : MAUVAIS POINT = ",listpointscount[i]))));
if( DEBUGLEVEL_ell >= 4, print("fin de nfellcount"));
  return([listpointscount,[m1,m2]]);
}

/* To keep gp2c happy */
gettufu(bnf)=concat(bnf.tu[2],bnf.fu);
getfutu(bnf)=concat(bnf.fu,bnf.tu[2]);


if( DEBUGLEVEL_ell >= 4, print("bnfell2descent_viaisog"));
{
bnfell2descent_viaisog( bnf, ell) =
\\ Calcul du rang des courbes elliptiques avec 2-torsion 
\\ dans le corps de nombres bnf
\\ par la methode des 2-isogenies.
\\
\\ ell = [a1,a2,a3,a4,a6]
\\ y^2+a1xy+a3y=x^3+a2x^2+a4x+a6
\\
\\ ell doit etre sous la forme 
\\ y^2=x^3+ax^2+bx -> ell = [0,a,0,b,0]
\\ avec a et b entiers.
local(P,Pfact,tors,pointstriv,apinit,bpinit,plist,KS2prod,oddclass,KS2gen,listpoints,pointgen,n1,n2,certain,np1,np2,listpoints2,aux1,aux2,certainp,rang,strange);
/* MODI remove i */

if( DEBUGLEVEL_ell >= 2, print("Algorithme de la 2-descente par isogenies"));
if( DEBUGLEVEL_ell >= 3, print("entree dans bnfell2descent_viaisog"));
  if( variable(bnf.pol) != y, 
    error(" bnfell2descent_viaisog : la variable du corps de nombres doit etre y "));
  ell = ellinit(Mod(lift(ell),bnf.pol),1);

  if( ell.disc == 0,
    error(" bnfell2descent_viaisog : courbe singuliere !!"));
  if( ell.a1 != 0 || ell.a3 != 0 || ell.a6 != 0, 
    error(" bnfell2descent_viaisog : la courbe n'est pas sous la forme [0,a,0,b,0]"));
  if( denominator(nfalgtobasis(bnf,ell.a2)) > 1 || denominator(nfalgtobasis(bnf,ell.a4)) > 1,
    error(" bnfell2descent_viaisog : coefficients non entiers"));

  P = Pol([1,ell.a2,ell.a4])*Mod(1,bnf.pol);
  Pfact = factornf(P,bnf.pol)[,1];
  tors = #Pfact;
  if( #Pfact > 1,
    pointstriv = [[0,0,1],[-polcoeff(Pfact[1],0),0,1],[-polcoeff(Pfact[2],0),0,1]]
  , pointstriv = [[0,0,1]]);

  apinit = -2*ell.a2; bpinit = ell.a2^2-4*ell.a4;

\\ calcul des ideaux premiers de plist 
\\ et de quelques renseignements associes 
  plist = idealfactor(bnf,6*ell.disc)[,1];

if( DEBUGLEVEL_ell >= 3, print(" Recherche de points triviaux sur la courbe"));
  P *= x;
if( DEBUGLEVEL_ell >= 3, print("Y^2 = ",P));
  pointstriv = concat( pointstriv, nfratpoint(bnf.nf,P,LIMTRIV,0));
if( DEBUGLEVEL_ell >= 1, print("points triviaux sur E(K) = ");
  print(lift(pointstriv)); print());

  KS2prod = ell.a4;
  oddclass = 0;
  while( !oddclass,
    KS2gen = bnfsunit(bnf,idealfactor(bnf,KS2prod)[,1]~);
    oddclass = KS2gen[5][1]%2;
    if( !oddclass,
      KS2prod = idealmul(bnf,KS2prod,(KS2gen[5][3][1])));
 );
  KS2gen = KS2gen[1];
\\  A CHANGER : KS2gen = matbasistoalg(bnf,KS2gen);
  for( i = 1, #KS2gen,
    KS2gen[i] = nfbasistoalg(bnf, KS2gen[i]));
  KS2gen = concat(Mod(lift(gettufu(bnf)),bnf.pol),KS2gen);
if( DEBUGLEVEL_ell >= 2,  
  print("#K(b,2)gen          = ",#KS2gen);
  print("K(b,2)gen = ",KS2gen));

  listpoints = nfellcount(bnf.nf,ell.a2,ell.a4,KS2gen,pointstriv);
  pointgen = listpoints[1];
if( DEBUGLEVEL_ell >= 1, print("points sur E(K) = ",lift(pointgen)); print());
  n1 = listpoints[2][1]; n2 = listpoints[2][2];

  certain = (n1 == n2);
if( DEBUGLEVEL_ell >= 1,
  if( certain, 
    print("[E(K):phi'(E'(K))]  = ",1<<n1);
    print("#S^(phi')(E'/K)     = ",1<<n2);
    print("#III(E'/K)[phi']    = 1"); print()
  ,
    print("[E(K):phi'(E'(K))] >= ",1<<n1);
    print("#S^(phi')(E'/K)     = ",1<<n2);
    print("#III(E'/K)[phi']   <= ",1<<(n2-n1)); print())
);

  KS2prod = bpinit;
  oddclass = 0;
  while( !oddclass,
    KS2gen = bnfsunit(bnf,idealfactor(bnf,KS2prod)[,1]~);
    oddclass = (KS2gen[5][1]%2);
    if( !oddclass,
      KS2prod = idealmul(bnf,KS2prod,(KS2gen[5][3][1]))));
  KS2gen = KS2gen[1];
\\ A CHANGER KS2gen = matbasistoalg(bnf,KS2gen);
  for( i = 1, #KS2gen,
    KS2gen[i] = nfbasistoalg(bnf, KS2gen[i]));
  KS2gen = concat(Mod(lift(gettufu(bnf)),bnf.pol),KS2gen);
if( DEBUGLEVEL_ell >= 2,  
  print("#K(a^2-4b,2)gen     = ",#KS2gen);
  print("K(a^2-4b,2)gen     = ",KS2gen));

  P = Pol([1,apinit,bpinit])*Mod(1,bnf.pol);
  Pfact= factornf(P,bnf.pol)[,1];
  if( #Pfact > 1,
    pointstriv=[[0,0,1],[-polcoeff(Pfact[1],0),0,1],[-polcoeff(Pfact[2],0),0,1]]
  , pointstriv = [[0,0,1]]);

if( DEBUGLEVEL_ell >= 3, print(" Recherche de points triviaux sur la courbe"));
  P *= x;
if( DEBUGLEVEL_ell >= 3, print("Y^2 = ",P));
  pointstriv = concat( pointstriv, nfratpoint(bnf.nf,P,LIMTRIV,0));
if( DEBUGLEVEL_ell >= 1, print("points triviaux sur E'(K) = ");
  print(lift(pointstriv)); print());

  listpoints = nfellcount(bnf.nf,apinit,bpinit,KS2gen,pointstriv);
if( DEBUGLEVEL_ell >= 1, print("points sur E'(K) = ",lift(listpoints[1])));
  np1 = listpoints[2][1]; np2 = listpoints[2][2];
  listpoints2 = vector(#listpoints[1],i,0);
  for( i = 1, #listpoints[1],
    listpoints2[i] = [0,0];
    aux1 = listpoints[1][i][1]^2;
    if( aux1 != 0,
      aux2 = listpoints[1][i][2];
      listpoints2[i][1] = aux2^2/aux1/4;
      listpoints2[i][2] = aux2*(bpinit-aux1)/aux1/8
    , listpoints2[i] = listpoints[1][i]));
if( DEBUGLEVEL_ell >= 1, print("points sur E(K) = ",lift(listpoints2)); print());
  pointgen = concat(pointgen,listpoints2);

  certainp = (np1 == np2);
if( DEBUGLEVEL_ell >= 1,
  if( certainp,
    print("[E'(K):phi(E(K))]   = ",1<<np1);
    print("#S^(phi)(E/K)       = ",1<<np2);
    print("#III(E/K)[phi]      = 1"); print()
  ,
    print("[E'(K):phi(E(K))]  >= ",1<<np1);
    print("#S^(phi)(E/K)       = ",1<<np2);
    print("#III(E/K)[phi]     <= ",1<<(np2-np1)); print());

  if( !certain && (np2>np1), print1(1<<(np2-np1)," <= "));
  print1("#III(E/K)[2]       ");
  if( certain && certainp, print1(" "), print1("<"));
  print("= ",1<<(n2+np2-n1-np1));

  print("#E(K)[2]            = ",1<<tors);
);
  rang = n1+np1-2;
if( DEBUGLEVEL_ell >= 1,
  if( certain && certainp,
    print("#E(K)/2E(K)         = ",(1<<(rang+tors)));
    print("rang                = ",rang); print()
  ,
    print("#E(K)/2E(K)        >= ",(1<<(rang+tors))); print();
    print(rang," <= rang          <= ",n2+np2-2); print()
  ));

  strange = (n2+np2-n1-np1)%2;
  if( strange, 
if( DEBUGLEVEL_ell >= 1,
      print(" !!! III doit etre un carre !!!"); print("donc"));
    if( certain, 
      np1++;
      certainp = (np1 == np2);
if( DEBUGLEVEL_ell >= 1,
        if( certainp,
          print("[E'(K):phi(E(K))]   = ",1<<np1);
          print("#S^(phi)(E/K)       = ",1<<np2);
          print("#III(E/K)[phi]      = 1"); print()
        ,
          print("[E'(K):phi(E(K))]  >= ",1<<np1);
          print("#S^(phi)(E/K)       = ",1<<np2);
          print("#III(E/K)[phi]     <= ",1<<(np2-np1)); print())
      )
    ,
    if( certainp,
      n1++;
      certain = ( n1 == n2);
if( DEBUGLEVEL_ell >= 1, 
        if( certain,
          print("[E(K):phi'(E'(K))]   = ",1<<n1);
          print("#S^(phi')(E'/K)       = ",1<<n2);
          print("#III(E'/K)[phi']      = 1"); print()
        ,
          print("[E(K):phi'(E'(K))]  >= ",1<<n1);
          print("#S^(phi')(E'/K)      = ",1<<n2);
          print("#III(E'/K)[phi']    <= ",1<<(n2-n1)); print())
      )
    , n1++)       
  );

if( DEBUGLEVEL_ell >= 1,
  if( !certain && (np2>np1), print1(1<<(np2-np1)," <= "));
  print1("#III(E/K)[2]       ");
  if( certain && certainp, print1(" "), print1("<"));
  print("= ",1<<(n2+np2-n1-np1));
  print("#E(K)[2]            = ",1<<tors);
);
  rang = n1+np1-2;
if( DEBUGLEVEL_ell >= 1,
  if( certain && certainp, 
    print("#E(K)/2E(K)         = ",(1<<(rang+tors))); print();
    print("rang                = ",rang); print()
  ,
    print("#E(K)/2E(K)        >= ",(1<<(rang+tors))); print();
    print(rang," <= rang          <= ",n2+np2-2); print())
  ));

\\ fin de strange 

if( DEBUGLEVEL_ell >= 1, print("points = ",pointgen));
if( DEBUGLEVEL_ell >= 3, print("fin de bnfell2descent_viaisog"));
  return([rang,n2+np2-2+tors,pointgen]);
}
if( DEBUGLEVEL_ell >= 4, print("nfchinremain"));
{
nfchinremain( nf, b, fact) =
\\ Chinese Remainder Theorem
local(l,fact2);
/* MODI remove i */

if( DEBUGLEVEL_ell >= 4, print("entree dans nfchinremain"));
  l = #fact[,1];
  fact2 = vector(l,i,idealdiv(nf,b,idealpow(nf,fact[i,1],fact[i,2])));
\\  for( i = 1, l,
\\    fact2[i] = idealdiv(nf,b,idealpow(nf,fact[i,1],fact[i,2])));
  fact2 = idealaddtoone(nf,fact2);
\\ A CHANGER : fact2 = matbasistoalg(nf,fact2);
  for( i = 1, l,
    fact2[i] = nfbasistoalg(nf,fact2[i]));
if( DEBUGLEVEL_ell >= 4, print("fin de nfchinremain"));
  return(fact2);
}
/* MODI must change auto to auto_s: reserved C */

if( DEBUGLEVEL_ell >= 4, print("bnfqfsolve2"));
{
bnfqfsolve2(bnf, aleg, bleg, auto_s=[y]) =
\\ Solves Legendre Equation x^2-aleg*Y^2=bleg*Z^2
\\ Using quadratic norm equations
\\ auto_s contient les automorphismes de bnf sous forme de polynomes
\\ en y, avec auto_s[1]=y .
local(aux,solvepolrel,auxsolve,solvepolabs,exprxy,rrrnf,bbbnf,SL0,SL1,SL,sunL,fondsunL,normfondsunL,SK,sunK,fondsunK,vecbleg,matnorm,matnormmod,expsolution,solution,reste,carre,verif,x0,x1);
/* MODI remove i */
/* MODI add x0, x1 */

if( DEBUGLEVEL_ell >= 3, print("entree dans bnfqfsolve2"));
  solvepolrel = x^2-aleg;
if( DEBUGLEVEL_ell >= 4, print("aleg = ",aleg));
if( DEBUGLEVEL_ell >= 4, print("bleg = ",bleg));

  if( #auto_s > 1,
if( DEBUGLEVEL_ell >= 4, print("factorisation du discriminant avec les auto_smorhpismes de bnf"));
    for( i = 2, #auto_s,
      aux = abs(polresultant(lift(aleg)-subst(lift(aleg),y,auto_s[i]),bnf.pol));
      if( aux, addprimes(factor(aux)[,1]))));

  auxsolve = rnfequation(bnf,solvepolrel,1);
  solvepolabs = auxsolve[1];
  exprxy = auxsolve[2];
  if( auxsolve[3],
if( DEBUGLEVEL_ell >=5, print(" CECI EST LE NOUVEAU CAS auxsolve[3] != 0")));
if( DEBUGLEVEL_ell >= 4, print(" bbbnfinit ",solvepolabs));
  rrrnf = rnfinit(bnf,solvepolrel);
  bbbnf = bnfinit(solvepolabs,1);
if( DEBUGLEVEL_ell >= 4, print(" done"));
  SL0 = 1;
if( DEBUGLEVEL_ell >= 4, print("bbbnf.clgp = ",bbbnf.clgp));
  for( i = 1, #bbbnf.clgp[2],
    if( bbbnf.clgp[2][i]%2 == 0,
      SL0 = idealmul(bbbnf,SL0,bbbnf.clgp[3][i][1,1])));
  SL1 = idealmul(bbbnf,SL0,rnfeltup(rrrnf,bleg));
  SL = idealfactor(bbbnf,SL1)[,1]~;
  sunL = bnfsunit(bbbnf,SL);
\\ A CHANGER : fondsunL = concat(bbbnf.futu,matbasistoalg(bbbnf,sunL[1]));
  fondsunL = concat(getfutu(bbbnf),vector(#sunL[1],i,nfbasistoalg(bbbnf,sunL[1][i])));
  normfondsunL = norm(rnfeltabstorel( rrrnf,fondsunL));
  SK = idealfactor(bnf,idealnorm(bbbnf,SL1))[,1]~;
  sunK = bnfsunit(bnf,SK);
\\ A CHANGER :  fondsunK = concat(bnf.futu,matbasistoalg(bnf,sunK[1]));
  fondsunK = concat(getfutu(bnf),vector(#sunK[1],i,nfbasistoalg(bnf,sunK[1][i])));
  vecbleg = bnfissunit(bnf,sunK,bleg);
  matnorm = matrix(#fondsunK,#normfondsunL,i,j,0);
  for( i = 1, #normfondsunL,
    matnorm[,i] = lift(bnfissunit( bnf,sunK,normfondsunL[i] )));
  matnormmod = matnorm*Mod(1,2);
  expsolution = lift(matinverseimage( matnormmod, vecbleg*Mod(1,2)));
if( expsolution == []~, error(" bnfqfsolve2 : IL N'Y A PAS DE SOLUTION "));
  solution = prod( i = 1, #expsolution, fondsunL[i]^expsolution[i]);
  solution = rnfeltabstorel(rrrnf,solution);
  reste = (lift(vecbleg) - matnorm*expsolution)/2;
  carre = prod( i = 1, #vecbleg, fondsunK[i]^reste[i]);
  solution *= carre;
  x1=polcoeff(lift(solution),1,x);x0=polcoeff(lift(solution),0,x);
  verif = x0^2 - aleg*x1^2-bleg;
if( verif, error(" bnfqfsolve2 : MAUVAIS POINT"));
if( DEBUGLEVEL_ell >= 3, print("fin de bnfqfsolve2"));
  return([x0,x1,1]);
}
if( DEBUGLEVEL_ell >= 4, print("bnfqfsolve"));
{
bnfqfsolve(bnf, aleg, bleg, flag3, auto_s=[y]) =
\\ cette fonction resout l'equation X^2-aleg*Y^2=bleg*Z^2
\\ dans le corps de nombres nf.
\\ la solution est [X,Y,Z],
\\ [0,0,0] sinon.
local(nf,aa,bb,na,nb,maxnb,mat,resl,t,sq,pol,vecrat,alpha,xx,yy,borne,test,sun,fact,suni,f,l,aux,alpha2,maxnbiter,idbb,rem,nbiter,mask,oldnb,newnb,bor,testici,de,xxp,yyp,rap,verif);
/* MODI remove k, maxna */

if( DEBUGLEVEL_ell >=5, print("entree dans bnfqfsolve"));
if( DEBUGLEVEL_ell >= 3, print("(a,b) = (",aleg,",",bleg,")"));
  nf = bnf.nf;
  aleg = Mod(lift(aleg),nf.pol); aa = aleg;
  bleg = Mod(lift(bleg),nf.pol); bb = bleg;

  if( aa == 0, 
if( DEBUGLEVEL_ell >= 5, print("fin de bnfqfsolve"));
    return([0,1,0]~));
  if( bb == 0,
if( DEBUGLEVEL_ell >= 5, print("fin de bnfqfsolve"));
    return([0,0,1]~));

  na = abs(norm(aa)); nb = abs(norm(bb));
  if( na > nb, maxnb = na, maxnb = nb);
  maxnb <<= 20;
  mat = Mod(matid(3),nf.pol); borne = 1;
  test = 0; nbiter = 0;

  while( 1,
    if( flag3 && bnf.clgp[1]>1, resl = bnfqfsolve2(bnf,aa,bb,auto_s)~; break);
if( DEBUGLEVEL_ell >= 4, print("(na,nb,a,b) = ",lift([na,nb,aa,bb,norm(aa),norm(bb)])));
if( DEBUGLEVEL_ell >= 5, print("***",nb,"*** "));
    if( nb >= maxnb, 
      mat = Mod(matid(3),nf.pol);
      aa = aleg; bb = bleg; na = abs(norm(aleg)); nb = abs(norm(bleg)));
    if( aa == 1, resl = [1,1,0]~; break);
    if( bb == 1, resl = [1,0,1]~; break);
    if( aa+bb == 1, resl = [1,1,1]~; break);
    if( aa+bb == 0, resl = [0,1,1]~; break);
    if( aa == bb  && aa != 1,
      t = aa*mat[,1];
      mat[,1] = mat[,3]; mat[,3] = t;
      aa = -1; na = 1);
    if( issquare(na),
      sq = nfsqrt(nf,aa);
      if( sq != [], resl = [sq[1],1,0]~; break));
    if( issquare(nb),
      sq = nfsqrt(nf,bb);
      if( sq != [], resl = [sq[1],0,1]~; break));
    if( na > nb,
      t = aa; aa = bb; bb = t;
      t = na; na = nb; nb = t;
      t = mat[,3]; mat[,3] = mat[,2]; mat[,2] = t);
    if( nb == 1,
if( DEBUGLEVEL_ell >= 4, print("(a,b) = ",lift([aa,bb])));
if( DEBUGLEVEL_ell >= 4, print("(na,nb) = ",lift([na,nb])));
      if( aleg == aa && bleg == bb, mat = Mod(matid(3),nf.pol));
      if( flag3, resl = bnfqfsolve2(bnf,aa,bb,auto_s)~; break);
      pol = aa*x^2+bb;  
      vecrat = nfratpoint(nf,pol,borne++,1);
      if( vecrat != 0, resl=[vecrat[2],vecrat[1],vecrat[3]]~; break);

      alpha = 0;
if( DEBUGLEVEL_ell >= 4, print("borne = ",borne));
      while( alpha==0,
        xx = nfrandint(nf,borne); yy = nfrandint(nf,borne);
        borne++; 
        alpha = xx^2-aa*yy^2 );
      bb *= alpha; nb *= abs(norm(alpha));
      t = xx*mat[,1]+yy*mat[,2];
      mat[,2] = xx*mat[,2]+aa*yy*mat[,1];
      mat[,1] = t;
      mat[,3] *= alpha
    ,
      test = 1;
if( DEBUGLEVEL_ell >= 4, print("on factorise bb = ",bb));
      sun = bnfsunit(bnf,idealfactor(bnf,bb)[,1]~);
      fact = lift(bnfissunit(bnf,sun,bb));
if( DEBUGLEVEL_ell >= 4, print("fact = ",fact));
      suni = concat(getfutu(bnf),vector(#sun[1],i,nfbasistoalg(bnf,sun[1][i])));
      for( i = 1, #suni,
        if( (f = fact[i]>>1), 
          test =0;
          for( k = 1, 3, mat[k,3] /= suni[i]^f);
          nb /= abs(norm(suni[i]))^(2*f);
          bb /= suni[i]^(2*f)));
if( DEBUGLEVEL_ell >= 4, print("on factorise bb = ",bb));
      fact = idealfactor(nf,bb);
if( DEBUGLEVEL_ell >= 4, print("fact = ",fact));
      l = #fact[,1];

      if( test,
        aux = 1;
        for( i = 1, l,
	  if( (f = fact[i,2]>>1) &&
	       !(fact[i,1][1]%2) && !nfpsquareodd(nf,aa,fact[i,1]),
	    aux=idealmul(nf,aux,idealpow(nf,fact[i,1],f))));
        if( aux != 1,
	  test = 0;
	  alpha = nfbasistoalg(nf,idealappr(nf,idealinv(nf,aux)));
          alpha2 = alpha^2;
          bb *= alpha2; nb *= abs(norm(alpha2));
          mat[,3] *= alpha));
      if( test,
	maxnbiter = 1<<l;
	sq = vector(l,i,nfissquarep(nf,aa,fact[i,1],fact[i,2]));
        l = #sq;
if( DEBUGLEVEL_ell >= 4, print("sq = ",sq); print("fact = ",fact); print("l = ",l));
        if( l > 1, 
	  idbb = idealhnf(nf,bb);
	  rem = nfchinremain(nf,idbb,fact));
        test = 1; nbiter = 1;
        while( test && nbiter <= maxnbiter,
	  if( l > 1,
	    mask = nbiter; xx = 0;
	    for( i = 1, l,
	      if( mask%2, xx += rem[i]*sq[i], xx -= rem[i]*sq[i] ); mask >>= 1)
          , 
            test = 0; xx = sq[1]);
          xx = mynfeltmod(nf,xx,bb);
          alpha = xx^2-aa;
          if( alpha == 0, resl=[xx,1,0]~; break(2));
          t = alpha/bb;
if( DEBUGLEVEL_ell >= 4, print("[alpha,bb] = ",[alpha,bb]));
          oldnb = nb;
          newnb = abs(norm(t));
if( DEBUGLEVEL_ell >= 4, print("[oldnb,newnb,oldnb/newnb] = ",[oldnb,newnb,oldnb/newnb+0.]));
          while( nb > newnb,
            mat[,3] *= t;
            bb = t; nb = newnb;
            t = xx*mat[,1]+mat[,2];
            mat[,2] = aa*mat[,1] + xx*mat[,2];
            mat[,1] = t;
            xx = mynfeltmod(nf,-xx,bb);
            alpha = xx^2-aa;
            t = alpha/bb;
            newnb = abs(norm(t));
          );
        if( nb == oldnb, nbiter++, test = 0);
        );
        if( nb == oldnb,
          if( flag3, resl = bnfqfsolve2(bnf,aa,bb,auto_s)~; break);
          pol = aa*x^2+bb;
          vecrat =nfratpoint(nf,pol,borne++<<1,1);
          if( vecrat != 0, resl = [vecrat[2],vecrat[1],vecrat[3]]~; break);

          bor = 1000; yy = 1; testici = 1;
          for( i = 1, 10000, de = nfbasistoalg(nf,vectorv(poldegree(nf.pol),j,random(bor)));
            if( idealadd(bnf,de,bb) != matid(poldegree(bnf.pol)),next);
            xxp = mynfeltmod(bnf,de*xx,bb); yyp = mynfeltmod(bnf,de*yy,bb);
            rap = (norm(xxp^2-aa*yyp^2)/nb^2+0.);
            if( abs(rap) < 1,
if( DEBUGLEVEL_ell >= 4, print("********** \n \n MIRACLE ",rap," \n \n ***"));
              t = (xxp^2-aa*yyp^2)/bb;
              mat[,3] *= t;
              bb = t; nb = abs(norm(bb));
if( DEBUGLEVEL_ell >= 4, print("newnb = ",nb));
              t = xxp*mat[,1]+yyp*mat[,2];
              mat[,2] = aa*yyp*mat[,1] + xxp*mat[,2];
              mat[,1] = t;
              xx = xxp; yy = -yyp; testici = 0;
              ));

          if( testici,  
            alpha = 0;
            while( alpha == 0,
              xx = nfrandint(nf,4*borne); yy = nfrandint(nf,4*borne);
              borne++;
              alpha = xx^2-aa*yy^2);
            bb *= alpha; nb *= abs(norm(alpha));
            t = xx*mat[,1] + yy*mat[,2];
            mat[,2] = xx*mat[,2]+aa*yy*mat[,1];
            mat[,1] = t;
            mat[,3] *= alpha;)))));
  resl = lift(mat*resl);
if( DEBUGLEVEL_ell >= 5, print("resl1 = ",resl));
if( DEBUGLEVEL_ell >= 5, print("content = ",content(resl)));
  resl /= content(resl);
  resl = Mod(lift(resl),nf.pol);
if( DEBUGLEVEL_ell >=5, print("resl3 = ",resl));
  fact = idealadd(nf,idealadd(nf,resl[1],resl[2]),resl[3]);
  fact = bnfisprincipal(bnf,fact,3);
  resl *=1/nfbasistoalg(nf,fact[2]);
if( DEBUGLEVEL_ell >= 5, print("resl4 = ",resl));
if( DEBUGLEVEL_ell >= 3, print("resl = ",resl));
  verif = (resl[1]^2-aleg*resl[2]^2-bleg*resl[3]^2 == 0);
  if( !verif && DEBUGLEVEL_ell >= 0, error(" bnfqfsolve : MAUVAIS POINT"));
if( DEBUGLEVEL_ell >= 3, print("fin de bnfqfsolve"));
  return(resl);
}
if( DEBUGLEVEL_ell >= 4, print("bnfredquartique2"));
{
bnfredquartique2( bnf, pol, r,a,b) =
\\ reduction d'une quartique issue de la 2-descente
\\ en connaissant les valeurs de r, a et b. 
local(gcc,princ,rp,pol2);
/* MODI remove ap, den */

if( DEBUGLEVEL_ell >= 4, print("entree dans bnfredquartique2"));
if( DEBUGLEVEL_ell >= 4, print([r,a,b]));
if( DEBUGLEVEL_ell >= 3, print(" reduction de la quartique ",pol));

  if( a == 0,
    rp = 0
  , 
    gcc = idealadd(bnf,b,a);
    if( gcc == 1,
      rp = nfbasistoalg(bnf,idealaddtoone(bnf.nf,a,b)[1])/a;
      rp = mynfeltmod(bnf,r*rp,b)
    ,
      princ = bnfisprincipal(bnf,gcc,3);
      if( princ[1] == 0, gcc = nfbasistoalg(bnf,princ[2])
      ,
if( DEBUGLEVEL_ell >= 3, print(" quartique non reduite"));
if( DEBUGLEVEL_ell >= 4, print("fin de bnfredquartique2"));
        return([pol,0,1]));
      rp = nfbasistoalg(bnf,idealaddtoone(bnf.nf,a/gcc,b/gcc)[1])/(a/gcc);
      rp = mynfeltmod(bnf,r*rp,b)/gcc;
      b /= gcc;
    )
  );
  pol2 = subst(pol/b,x,rp+b*x)/b^3;
if( DEBUGLEVEL_ell >= 3, print(" quartique reduite = ",pol2));
if( DEBUGLEVEL_ell >= 4, print("fin de bnfredquartique2"));
  return([pol2,rp,b]);
}
if( DEBUGLEVEL_ell >= 4, print("bnfell2descent_gen"));
{
bnfell2descent_gen( bnf, ell, ext, help=[], bigflag=1, flag3=1, auto_s=[y]) =
\\ bnf a un polynome en y.
\\ si ell= y^2=P(x), alors ext est
\\ ext[1] est une equation relative du corps (=P(x)),
\\ ext[2] est le resultat rnfequation(bnf,P,2);
\\ ext[3] est le buchinitfu (sur Q) de l'extension.
\\ dans la suite ext est note L = K(theta).
\\ help est une liste de points deja connus sur ell.
\\ si bigflag !=0 alors on applique bnfredquartique.
\\ si flag3 ==1 alors on utilise bnfqfsolve2 (equation aux normes) pour resoudre Legendre
\\ auto_s est une liste d'automorphismes connus de bnf
\\ (ca peut aider a factoriser certains discriminiants).
\\ ell est de la forme y^2=x^3+A*x^2+B*x+C
\\ ie ell=[0,A,0,B,C], avec A,B et C entiers.
\\
local(nf,unnf,ellnf,A,B,C,S,plist,Lrnf,SLprod,oddclass,SLlist,LS2gen,polrel,alpha,ttheta,KS2gen,LS2genunit,normcoord,LS2coordtilda,LS2tilda,aux,listgen,listpoints,listpointstriv,listpointsmwr,list,m1,m2,loc,lastloc,maskwhile,iwhile,zc,iaux,liftzc,ispointtriv,point,c,b,a,sol,found,alphac,r,denc,dena,cp,alphacp,beta,mattr,vec,z1,ff,cont,d,e,polorig,pol,redq,transl,multip,UVW,pointxx,point2,v,rang,normLS2gen);
local(listELS,listnotELS,listlistELS);
/* MODI remove i,j,normLS2, add normLS2gen */
/* MODI add listELS,listnotELS,listlistELS */

if( DEBUGLEVEL_ell >= 4, print("entree dans bnfell2descent_gen"));

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\      construction de L(S,2)         \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  nf = bnf.nf;
  unnf = Mod(1,nf.pol);
  ellnf = ell*unnf;
  if( #ellnf <= 5, ellnf = ellinit(ellnf,1));
  A = ellnf.a2; if( DEBUGLEVEL_ell >= 2, print("A = ",A));
  B = ellnf.a4; if( DEBUGLEVEL_ell >= 2, print("B = ",B));
  C = ellnf.a6; if( DEBUGLEVEL_ell >= 2, print("C = ",C));

  S = 6*lift(ellnf.disc);
  plist = idealfactor(nf,S)[,1];
  Lrnf = ext[3];
  SLprod = subst(lift(ext[1]'),y,lift(ext[2][2]));
if( DEBUGLEVEL_ell >= 3, print(ext[2]));
  oddclass = 0;
  while( !oddclass,
\\ Constructoin de S:
    SLlist = idealfactor(Lrnf,SLprod)[,1]~;
\\ Construction des S-unites
    LS2gen = bnfsunit(Lrnf,SLlist);
if( DEBUGLEVEL_ell >= 4, print("LS2gen = ",LS2gen));
\\ on ajoute la partie paire du groupe de classes.
    oddclass = LS2gen[5][1]%2;
    if( !oddclass,
if( DEBUGLEVEL_ell >= 3, print("2-class group ",LS2gen[5][3][1][1,1]));
      S *= LS2gen[5][3][1][1,1];
      SLprod = idealmul(Lrnf,SLprod,(LS2gen[5][3][1])));
  );
  
  polrel = ext[1];
  alpha = Mod(Mod(y,nf.pol),polrel); \\ alpha est l'element primitif de K
  ttheta = Mod(x,polrel);            \\ ttheta est la racine de P(x) 

  KS2gen = bnfsunit(bnf,idealfactor(nf,S)[,1]~);
 
if( DEBUGLEVEL_ell >= 3, print("#KS2gen = ",#KS2gen[1]));
if( DEBUGLEVEL_ell >= 3, print("KS2gen = ",KS2gen[1]));

  LS2genunit = lift(getfutu(Lrnf));
\\ A CHANGER : LS2genunit = concat(LS2genunit,lift(matbasistoalg(Lrnf,LS2gen[1])));
  LS2genunit = concat(LS2genunit,vector(#LS2gen[1],i,lift(nfbasistoalg(Lrnf,LS2gen[1][i]))));


  LS2genunit = subst(LS2genunit,x,ttheta);
  LS2genunit = LS2genunit*Mod(1,polrel);
if( DEBUGLEVEL_ell >= 3, print("#LS2genunit = ",#LS2genunit));
if( DEBUGLEVEL_ell >= 3, print("LS2genunit = ",LS2genunit));

\\ dans LS2gen, on ne garde que ceux dont la norme est un carre.

  normLS2gen = norm(LS2genunit);
if( DEBUGLEVEL_ell >= 4, print("normLS2gen = ",normLS2gen));

\\ matrice de l'application norme

  normcoord = matrix(#KS2gen[1]+#bnf[8][5]+1,#normLS2gen,i,j,0);
  for( i = 1, #normLS2gen,
    normcoord[,i] = bnfissunit(bnf,KS2gen,normLS2gen[i]));
if( DEBUGLEVEL_ell >= 4, print("normcoord = ",normcoord));

\\ construction du noyau de la norme

  LS2coordtilda = lift(matker(normcoord*Mod(1,2)));
if( DEBUGLEVEL_ell >= 4, print("LS2coordtilda = ",LS2coordtilda));
  LS2tilda = vector(#LS2coordtilda[1,],i,0);
  for( i = 1, #LS2coordtilda[1,],
    aux = 1;
    for( j = 1, #LS2coordtilda[,i],
      if( sign(LS2coordtilda[j,i]),
        aux *= LS2genunit[j]));
    LS2tilda[i] = aux;
  );

if( DEBUGLEVEL_ell >= 3, print("LS2tilda = ",LS2tilda));
if( DEBUGLEVEL_ell >= 3, print("norm(LS2tilda) = ",norm(LS2tilda)));

\\ Fin de la construction de L(S,2)

  listgen = LS2tilda;
if( DEBUGLEVEL_ell >= 2, print("LS2gen = ",listgen));
if( DEBUGLEVEL_ell >= 2, print("#LS2gen = ",#listgen));
  listpoints = [];

if( DEBUGLEVEL_ell >= 3, print("(A,B,C) = ",[A,B,C]));

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\   Recherche de points triviaux   \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

if( DEBUGLEVEL_ell >= 2, print(" Recherche de points triviaux sur la courbe "));
  listpointstriv = nfratpoint(nf,x^3+A*x^2+B*x+C,LIMTRIV,0);
  listpointstriv = concat(help,listpointstriv);
if( DEBUGLEVEL_ell >= 1, print("points triviaux sur la courbe = ",listpointstriv));

\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\          parcours de L(S,2)         \\
\\ \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

  listpointsmwr = [];
  list = [ 6, ellnf.disc, 0];
  m1 = 0; m2 = 0; lastloc = -1;
  maskwhile = 1<<#listgen;
  listELS = [0]; listnotELS = [];
  iwhile = 1;
  while( iwhile < maskwhile,
if( DEBUGLEVEL_ell >= 4, print("iwhile = ",iwhile); print("listgen = ",listgen));

\\ utilise la structure de groupe pour detecter une eventuelle solubilite locale.
if( DEBUGLEVEL_ell >= 4, print("listELS = ",listELS);
                   print("listnotELS = ",listnotELS));
    sol = 1; loc = 0;
    for( i = 1, #listELS,
      for( j = 1, #listnotELS,
        if( bitxor(listELS[i],listnotELS[j]) == iwhile,
if( DEBUGLEVEL_ell >= 3, print(" Non ELS d'apres la structure de groupe"));
          listnotELS = concat(listnotELS,[iwhile]);
          sol = 0; break(2))));
    if( !sol, iwhile++; next);

    for( i = 1, #listELS,
      for( j = i+1, #listELS,
        if( bitxor(listELS[i],listELS[j]) == iwhile,
if( DEBUGLEVEL_ell >= 3, print(" ELS d'aptres la structure de "));
          listELS = concat(listELS,[iwhile]);
          loc = 2;
          break(2))));

    iaux = vector(#listgen,i,bittest(iwhile,i-1))~;
    iaux = (LS2coordtilda*iaux)%2;

    zc = unnf*prod( i = 1, #LS2genunit,LS2genunit[i]^iaux[i]);

if( DEBUGLEVEL_ell >= 2, print("zc = ",zc));
    liftzc = lift(zc);

\\ Est-ce un point trivial ?
    ispointtriv = 0;
    for( i = 1, #listpointstriv,
      point = listpointstriv[i];
      if( #point == 2 || point[3] != 0,
        if( nfissquare(Lrnf.nf,subst((lift(point[1])-x)*lift(liftzc),y,lift(ext[2][2]))),
if( DEBUGLEVEL_ell >= 2, print(" vient du point trivial ",point));
          listpointsmwr = concat(listpointsmwr,[point]);
          m1++;
          listELS = concat(listELS,[iwhile]);
          if( degre(iwhile) > lastloc, m2++);
          sol = found = ispointtriv = 1; break
          )));

\\ Ce n'est pas un point trivial
    if( !ispointtriv, 
      c = polcoeff(liftzc,2);
      b = -polcoeff(liftzc,1);
      a = polcoeff(liftzc,0);
      sol = 0; found = 0;
\\ \\\\\\\\\\\\\
\\ On cherche a ecrire zc sous la forme a-b*theta
\\ \\\\\\\\\\\\\
      if( c == 0, sol = 1,
        alphac = (A*b+B*c-a)*c+b^2;
if( DEBUGLEVEL_ell >= 3, print("alphac = ",alphac));
        r = nfsqrt(nf,norm(zc))[1];
        if( alphac == 0,
\\ cas particulier
if( DEBUGLEVEL_ell >= 3, print(" on continue avec 1/zc"));
          sol = 1; zc = norm(zc)*(1/zc);
if( DEBUGLEVEL_ell >= 2, print(" zc = ",zc))
        ,
\\ Il faut resoudre une forme quadratique
\\ Existence (locale = globale) d'une solution :
          denc = deno(lift(c));
          if( denc != 1, cp = c*denc^2, cp = c);
          dena = deno(lift(alphac));
          if( dena != 1, alphacp = alphac*dena^2, alphacp = alphac);
if( DEBUGLEVEL_ell >= 2, print1(" symbole de Hilbert (",alphacp,",",cp,") = "));
          sol = loc || (mynfhilbert(nf, alphacp,cp)+1);
if( DEBUGLEVEL_ell >= 2, print(sol-1));
          if( sol,
            beta = A*(A*b*c+B*c^2+b^2)-C*c^2+a*b;
            mattr = matid(3);
            mattr[1,1] = c ;mattr[2,2] = alphac ;
            mattr[3,3] = r ;mattr[2,3] = -beta;
            mattr[1,2] = -(b +A*c) ;mattr[1,3] = a-B*c+A*(A*c+b);
if( DEBUGLEVEL_ell >= 2, print1(" sol de Legendre = "));
            vec = bnfqfsolve(bnf,alphacp,cp,flag3,auto_s);
if( DEBUGLEVEL_ell >= 2, print(lift(vec)));
            aux = vec[2]*dena;
            vec[2] = vec[1];vec[1] = aux;
            vec[3] = vec[3]*denc;
            vec = (mattr^(-1))*vec;
            vec /= content(lift(vec));
            z1 = (vec[3]*ttheta+vec[2])*ttheta+vec[1];		
if( DEBUGLEVEL_ell >= 3, print(" z1 = ",z1));
            zc *= z1^2;
if( DEBUGLEVEL_ell >= 2, print(" zc*z1^2 = ",zc));
          )
        )
      )
    );
    
    if( !sol, 
      listnotELS = concat(listnotELS,[iwhile]);
      iwhile++;
      next
    );

\\ \\\\\\\\\\
\\ Maintenant zc est de la forme a-b*theta
\\ \\\\\\\\\\
    if( !ispointtriv,
      liftzc = lift(zc);
if( DEBUGLEVEL_ell >= 3, print(" zc = ",liftzc));
if( DEBUGLEVEL_ell >= 4, print(" N(zc) = ",norm(zc)));
      if( poldegree(liftzc) >= 2, error(" bnfell2descent_gen : c <> 0"));
      b = -polcoeff(liftzc,1);
      a = polcoeff(liftzc,0);
if( DEBUGLEVEL_ell >= 4, print(" on factorise (a,b) = ",idealadd(nf,a,b)));
      ff = idealfactor(nf,idealadd(nf,a,b));
if( DEBUGLEVEL_ell >= 4, print(" ff = ",ff));
      cont = 1;
      for( i = 1, #ff[,1],
        cont = idealmul(nf,cont,idealpow(nf,ff[i,1],ff[i,2]\2)));
      cont = idealinv(nf,cont);
      cont = nfbasistoalg(nf,bnfisprincipal(bnf,cont,3)[2])^2;
      a *= cont; b *= cont; zc *= cont;
if( DEBUGLEVEL_ell >= 4, print(" [a,b] = ",[a,b]));
      if( nfissquare(nf,b),
if( DEBUGLEVEL_ell >= 3, print(" b est un carre"));
        point = [a/b,nfsqrt(nf,(a/b)^3+A*(a/b)^2+B*(a/b)+C)[1]];
if( DEBUGLEVEL_ell >= 2, print("point trouve = ",point));
        listpointsmwr = concat(listpointsmwr,[point]);
        m1++;
        if( degre(iwhile) > lastloc, m2++);
        found = ispointtriv = 1
      )
    );

\\ \\\\\\\\\\\
\\ Construction de la quartique 
\\ \\\\\\\\\\\
    if( !ispointtriv,
      r = nfsqrt(nf,norm(zc))[1];
if( DEBUGLEVEL_ell >= 4, print(" r = ",r));
      c = -2*(A*b+3*a);
if( DEBUGLEVEL_ell >= 4, print(" c = ",c));
      d = 8*r;
if( DEBUGLEVEL_ell >= 4, print(" d = ",d));
      e = (A^2*b^2 - 2*A*a*b-4*B*b^2-3*a^2);
if( DEBUGLEVEL_ell >= 4, print(" e = ",e));
      polorig = b*(x^4+c*x^2+d*x+e)*unnf;
if( DEBUGLEVEL_ell >= 2, print(" quartique : (",lift(b),")*Y^2 = ",lift(polorig/b)));
      list[3] = b;
      pol = polorig;
      if( bigflag,
        redq = bnfredquartique2(bnf,pol,r,a,b);
if( DEBUGLEVEL_ell >= 2, print(" reduite: Y^2 = ",lift(redq[1])));
        pol = redq[1]; transl = redq[2]; multip = redq[3]
      );
      point = nfratpoint(nf,pol,LIM1,1);
      if( point != [],
if( DEBUGLEVEL_ell >= 2, print("point = ",point));
        m1++;
        if( bigflag, 
          point[1] = point[1]*multip+transl;
          point[2] = nfsqrt(nf,subst(polorig,x,point[1]/point[3]))[1]);
        mattr = matid(3);
        mattr[1,1] = -2*b^2; mattr[1,2] = (A*b+a)*b;
        mattr[1,3] = a^2+(2*B-A^2)*b^2; mattr[2,2] = -b;
        mattr[2,3] = a+A*b; mattr[3,3] =r;
        UVW = [point[1]^2,point[3]^2,point[1]*point[3]]~;
        vec = (mattr^(-1))*UVW;
        z1 = (vec[3]*ttheta+vec[2])*ttheta+vec[1];
        zc *= z1^2;
        zc /= -polcoeff(lift(zc),1);
if( DEBUGLEVEL_ell >= 3, print("zc*z1^2 = ",zc));
        pointxx = polcoeff(lift(zc),0);
        point2 = [ pointxx, nfsqrt(nf,subst(x^3+A*x^2+B*x+C,x,pointxx))[1]];
if( DEBUGLEVEL_ell >= 1, print(" point trouve = ",point2));
        listpointsmwr = concat(listpointsmwr,[point2]);
        if( degre(iwhile) > lastloc, m2++);
        found = 1; lastloc = -1
      ,  
        if( loc
             || (!bigflag && nflocallysoluble(nf,pol,r,a,b))
             || (bigflag && nflocallysoluble(nf,pol,0,1,1)),

          if( !loc, listlistELS=concat(listELS,[iwhile]));
          if( degre(iwhile) > lastloc, m2++; lastloc = degre(iwhile));
          point = nfratpoint(nf,pol,LIM3,1);
          if( point != [],
            m1++;
            if( bigflag,
              point[1] = point[1]*multip+transl;
              point[2] = nfsqrt(nf,subst(polorig,x,point[1]/point[3]))[1];
            );
            mattr = matid(3);
            mattr[1,1] = -2*b^2; mattr[1,2] = (A*b+a)*b;
            mattr[1,3] = a^2+(2*B-A^2)*b^2; mattr[2,2] = -b;
            mattr[2,3] = a+A*b; mattr[3,3] =r;
            UVW = [point[1]^2,point[3]^2,point[1]*point[3]]~;
            vec = (mattr^(-1))*UVW;
            z1 = (vec[3]*ttheta+vec[2])*ttheta+vec[1];
            zc *= z1^2;
            zc /= -polcoeff(lift(zc),1);
if( DEBUGLEVEL_ell >= 3, print(" zc*z1^2 = ",zc));
            pointxx = polcoeff(lift(zc),0);
            point2 = [ pointxx, nfsqrt(nf,subst(x^3+A*x^2+B*x+C,x,pointxx))[1]];
if( DEBUGLEVEL_ell >= 1, print(" point trouve = ",point2));
            listpointsmwr = concat(listpointsmwr,[point2]);
            found = 1; lastloc = -1;
          )
        , listnotELS = concat(listnotELS,[iwhile])
        )
      )
    );
    if( found,
      found = 0; lastloc = -1;
      v = degre(iwhile);
      iwhile = 1<<v;
      maskwhile >>= 1;
      LS2coordtilda = vecextract(LS2coordtilda,1<<#listgen-iwhile-1);
      listgen = vecextract(listgen,1<<#listgen-iwhile-1);
      while( listELS[#listELS] >= iwhile,
        listELS = vecextract(listELS,1<<(#listELS-1)-1));
      while( #listnotELS && listnotELS[#listnotELS] >= iwhile,
        listnotELS = vecextract(listnotELS,1<<(#listnotELS-1)-1))
    , iwhile ++
    )
  );

if( DEBUGLEVEL_ell >= 2,  
  print("m1 = ",m1);
  print("m2 = ",m2));
if( DEBUGLEVEL_ell >= 1,
  print("#S(E/K)[2]    = ",1<<m2));
  if( m1 == m2,
if( DEBUGLEVEL_ell >= 1,
    print("#E(K)/2E(K)   = ",1<<m1);
    print("#III(E/K)[2]  = 1");
    print("rang(E/K)     = ",m1));
    rang = m1
  ,
if( DEBUGLEVEL_ell >= 1,
    print("#E(K)/2E(K)  >= ",1<<m1);
    print("#III(E/K)[2] <= ",1<<(m2-m1));
    print("rang(E/K)    >= ",m1));
    rang = m1;
    if( (m2-m1)%2,
if( DEBUGLEVEL_ell >= 1,
      print(" III devrait etre un carre, donc ");
      if( m2-m1 > 1,
        print("#E(K)/2E(K)  >= ",1<<(m1+1));
        print("#III(E/K)[2] <= ",1<<(m2-m1-1));
        print("rang(E/K)    >= ",m1+1)
      ,
        print("#E(K)/2E(K)  = ",1<<(m1+1));
        print("#III(E/K)[2] = 1");
        print("rang(E/K)    = ",m1+1)));
      rang = m1+1)
  );
if( DEBUGLEVEL_ell >= 1, print("listpointsmwr = ",listpointsmwr));
  for( i = 1, #listpointsmwr,
    if( #listpointsmwr[i] == 3, 
      listpointsmwr[i] = vecextract(listpointsmwr[i],3));
    if( !ellisoncurve(ellnf,listpointsmwr[i]), 
      error("bnfell2descent : MAUVAIS POINT ")));
if( DEBUGLEVEL_ell >= 4, print("fin de bnfell2descent_gen"));
  return([rang,m2,listpointsmwr]);
}
if( DEBUGLEVEL_ell >= 4, print("bnfellrank"));
{
bnfellrank(bnf,ell,help=[],bigflag=1,flag3=1) =
\\ Algorithme de la 2-descente sur la courbe elliptique ell.
\\ help est une liste de points connus sur ell.

\\ attention bnf a un polynome en y.
\\ si bigflag !=0, on reduit les quartiques
\\ si flag3 != 0, on utilise bnfqfsolve2
local(urst,urst1,den,factden,eqtheta,rnfeq,bbnf,ext,rang,f);
/* MODI add f */
if( DEBUGLEVEL_ell >= 3, print("entree dans bnfellrank"));
  if( #ell <= 5, ell = ellinit(ell,1));

\\ removes the coefficients a1 and a3
  urst = [1,0,0,0];
  if( ell.a1 != 0 || ell.a3 != 0,
    urst1 = [1,0,-ell.a1/2,-ell.a3/2];
    ell = ellchangecurve(ell,urst1);
    urst = ellcomposeurst(urst,urst1)
  );

\\ removes denominators
  while( (den = idealinv(bnf,idealadd(bnf,idealadd(bnf,1,ell.a2),idealadd(bnf,ell.a4,ell.a6))))[1,1] > 1,
    factden = idealfactor(bnf,den)[,1];
    den = 1;     
    for( i = 1, #factden, 
      den = idealmul(bnf,den,factden[i]));
    den = den[1,1];
    urst1 = [1/den,0,0,0];
    ell = ellchangecurve(ell,urst1);
    urst = ellcomposeurst(urst,urst1);
  );

  help = ellchangepoint(help,urst);

\\ choix de l'algorithme suivant la 2-torsion
  ell *= Mod(1,bnf.pol);
  eqtheta = Pol([1,ell.a2,ell.a4,ell.a6]);
if( DEBUGLEVEL_ell >= 1, print("courbe elliptique : Y^2 = ",eqtheta));
  f = nfpolratroots(bnf,eqtheta);

  if( #f == 0,                                  \\ cas 1: 2-torsion triviale
    rnfeq = rnfequation(bnf,eqtheta,1);
    urst1 = [1,-rnfeq[3]*Mod(y,bnf.pol),0,0];
    if( rnfeq[3] != 0, 
      ell = ellchangecurve(ell,urst1);
      urst = ellcomposeurst(urst,urst1);
      eqtheta = subst(eqtheta,x,x-rnfeq[3]*Mod(y,bnf.pol));
      rnfeq = rnfequation(bnf,eqtheta,1);
if( DEBUGLEVEL_ell >= 2, print("translation : on travaille avec Y^2 = ",eqtheta));
    );
if( DEBUGLEVEL_ell >= 3, print1("bbnfinit "));
    bbnf = bnfinit(rnfeq[1],1);
if( DEBUGLEVEL_ell >= 3, print("done"));
    ext = [eqtheta, rnfeq, bbnf];
    rang = bnfell2descent_gen(bnf,ell,ext,help,bigflag,flag3)
  ,
  if( #f == 1,                                  \\ cas 2: 2-torsion = Z/2Z
    if( f[1] != 0, 
      urst1 = [1,f[1],0,0];
      ell = ellchangecurve(ell,urst1);
      urst = ellcomposeurst(urst,urst1)
    );
    rang = bnfell2descent_viaisog(bnf,ell)
  ,                                             \\ cas 3: 2-torsion = Z/2Z*Z/2Z
    rang = bnfell2descent_complete(bnf,f[1],f[2],f[3],flag3)
  ));
 
  rang[3] = ellchangepointinverse(rang[3],urst);
if( DEBUGLEVEL_ell >= 3, print("fin de bnfellrank"));

return(rang);
}
if( DEBUGLEVEL_ell >= 4, print("bnfell2descent_complete"));
{
bnfell2descent_complete(bnf,e1,e2,e3,flag3=1,auto_s=[y]) =
\\ calcul du rang d'une courbe elliptique
\\ par la methode de 2-descente complete.
\\ Y^2 = (x-e1)*(x-e2)*(x-e3);
\\ en suivant la methode decrite par J.Silverman
\\ si flag3 ==1 alors on utilise bnfqfsolve2 (equation aux normes) 
\\ pour resoudre Legendre 
\\ on pourra alors utiliser auto_s=nfgaloisconj(bnf.pol)

\\ e1, e2 et e3 sont des entiers algebriques de bnf.

local(KS2prod,oddclass,KS2gen,vect,selmer,rang,b1,b2,vec,z1,z2,d31,quart0,quart,cont,fa,point,solx,soly,listepoints,strange);
/* MODI remove i,X,Y */
/* MODI add strange */
if( DEBUGLEVEL_ell >= 2, print("Algorithme de la 2-descente complete"));

\\ calcul de K(S,2)

  KS2prod = (e1-e2)*(e2-e3)*(e3-e1)*2;
  oddclass = 0;
  while( !oddclass,
    KS2gen = bnfsunit(bnf,idealfactor(bnf,KS2prod)[,1]~);
    oddclass = (KS2gen[5][1]%2);
    if( !oddclass,
      KS2prod = idealmul(bnf,KS2prod,(KS2gen[5][3][1])));
  );
  KS2gen = KS2gen[1];
\\ A CHANGER : KS2gen = matbasistoalg(bnf,KS2gen);
  for( i = 1, #KS2gen,
    KS2gen[i] = nfbasistoalg(bnf, KS2gen[i]));
  KS2gen = concat(Mod(lift(gettufu(bnf)),bnf.pol),KS2gen);
if( DEBUGLEVEL_ell >= 2,
  print("#K(S,2)gen          = ",#KS2gen);
  print("K(S,2)gen = ",KS2gen));

\\ parcours de K(S,2)*K(S,2)

  vect = vector(#KS2gen,i,[0,1]);
  selmer = 0;
  rang = 0;
  listepoints = [];

  forvec( X = vect,
    b1 = prod( i = 1, #KS2gen, KS2gen[i]^X[i]);
    forvec( Y = vect,
      b2 = prod( i = 1, #KS2gen, KS2gen[i]^Y[i]);

if( DEBUGLEVEL_ell >= 3, print("[b1,b2] = ",lift([b1,b2])));

\\ points triviaux provenant de la 2-torsion

      if( b1==1 && b2==1, 
if( DEBUGLEVEL_ell >= 2, print(" point trivial [0]"));
        selmer++; rang++; next);
      if( nfissquare(bnf.nf,(e2-e1)*b1)
        && nfissquare(bnf.nf,(e2-e3)*(e2-e1)*b2),
if( DEBUGLEVEL_ell >= 2, print(" point trivial [e2,0]"));
        selmer++; rang++; next);
      if( nfissquare(bnf.nf,(e1-e2)*b2)
        && nfissquare(bnf.nf,(e1-e3)*(e1-e2)*b1),
if( DEBUGLEVEL_ell >= 2, print(" point trivial [e1,0]"));
        selmer++; rang++; next);
      if( nfissquare(bnf.nf,(e3-e1)*b1)
        && nfissquare(bnf.nf,(e3-e2)*b2),
if( DEBUGLEVEL_ell >= 2, print(" point trivial [e3,0]"));
        selmer++; rang++; next);

\\ premier critere local : sur les formes quadratiques

      if( mynfhilbert(bnf.nf,b1*b2,b1*(e2-e1)) < 0
        || mynfhilbert(bnf.nf,b2,b1*(e3-e1)) < 0
        || mynfhilbert(bnf.nf,b1,b2*(e3-e2)) < 0
        ,
if( DEBUGLEVEL_ell >= 3, print("non ELS"));
        next);

if( DEBUGLEVEL_ell >= 2, print("[b1,b2] = ",lift([b1,b2])));
if( DEBUGLEVEL_ell >= 2, print("qf loc soluble"));

\\ solution de la premiere forme quadratique

      if( b1 != b2,
        vec = bnfqfsolve(bnf,b1*b2,b1*(e2-e1),flag3);
if( DEBUGLEVEL_ell >= 3, print("sol part = ",vec));
        if( vec[3] == 0, error("bnfell2descent_complete : BUG !!! : vec[3]=0 "));
        z1 = vec[1]/vec[3]/b1; z2 = vec[2]/vec[3]
      ,
        z1 = (1+(e2-e1)/b1)/2; z2 = z1-1
      );
      d31 = e3-e1;
      quart0 = b2^2*(z1^2*b1 - d31)*x^4 - 4*z1*b2^2*z2*b1*x^3 
           + 2*b1*b2*(z1^2*b1 + 2*b2*z2^2 + d31)*x^2 - 4*z1*b2*z2*b1^2*x 
           + b1^2*(z1^2*b1 - d31);
      quart = quart0*b1*b2;
if( DEBUGLEVEL_ell >= 4, print("quart = ",quart));
      quart *= denominator(simplify(content(quart)))^2;
      cont = simplify(content(lift(quart)));
      fa = factor(cont);
      for( i = 1, #fa[,1], quart /= fa[i,1]^(2*(fa[i,2]\2)));
if( DEBUGLEVEL_ell >= 3, print("quart red = ",quart));

\\ la quartique est-elle localement soluble ?
   
      if( !nflocallysoluble(bnf.nf,quart),
if( DEBUGLEVEL_ell >= 2, print(" quartique non ELS "));
        next);
      selmer++;

\\ recherche de points sur la quartique.
    
      point = nfratpoint(bnf.nf,quart,LIM3,1);
      if( point != [], 
if( DEBUGLEVEL_ell >= 2, print("point trouve sur la quartique !!"));
if( DEBUGLEVEL_ell >= 3, print(point));
        if( point[3], 
          point /= point[3];
          z1 = (2*b2*point[1]*z2-z1*(b1+b2*point[1]^2))/(b1-b2*point[1]^2);
          solx = b1*z1^2+e1;
          soly = nfsqrt(bnf.nf,(solx-e1)*(solx-e2)*(solx-e3))[1];
          listepoints = concat(listepoints,[[solx,soly]]);
if( DEBUGLEVEL_ell >= 1, print("point sur la courbe elliptique =",[solx,soly]))
        );
        rang++
      ,
if( DEBUGLEVEL_ell >= 2, print("aucun point trouve sur la quartique"))
      )
    )
  );

\\ fin

if( DEBUGLEVEL_ell >= 1, 
  print("#S^(2)      = ",selmer));
  if( rang > selmer/2, rang = selmer);
if( DEBUGLEVEL_ell >= 1,
  strange = rang != selmer;
  if( strange,
  print("#E[K]/2E[K]>= ",rang)
, print("#E[K]/2E[K] = ",rang));
  print("#E[2]       = 4");
);
  rang = ceil(log(rang)/log(2))-2;
  selmer = valuation(selmer,2);
if( DEBUGLEVEL_ell >= 1,
  if( strange,
  print(selmer-2," >= rang  >= ",rang)
, print("rang        = ",rang));
  if( rang, print("points = ",listepoints));
);

return([rang,selmer,listepoints]);
}
