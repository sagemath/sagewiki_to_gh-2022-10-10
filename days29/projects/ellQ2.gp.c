/*-*- compile-command: "/usr/bin/gcc -c -o ellQ2.gp.o -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer -fPIC -I"/usr/local/include" ellQ2.gp.c && /usr/bin/gcc -o ellQ2.gp.so -shared -O3 -Wall -fno-strict-aliasing -fomit-frame-pointer -fPIC -Wl,-shared ellQ2.gp.o -lc -lm -L"/usr/local/lib" -lpari"; -*-*/
#include <pari/pari.h>
/*
GP;install("init_ellQ2","v","init_ellQ2","./ellQ2.gp.so");
GP;install("QfbReduce","D0,G,p","QfbReduce","./ellQ2.gp.so");
GP;install("IndefiniteLLL","D0,G,DGDGp","IndefiniteLLL","./ellQ2.gp.so");
GP;install("IndefiniteLLL2","D0,G,DGDGp","IndefiniteLLL2","./ellQ2.gp.so");
GP;install("kermodp","D0,G,D0,G,","kermodp","./ellQ2.gp.so");
GP;install("Qfparam","D0,G,D0,G,DGp","Qfparam","./ellQ2.gp.so");
GP;install("LLLgoon3","D0,G,DGp","LLLgoon3","./ellQ2.gp.so");
GP;install("completebasis","D0,G,DG","completebasis","./ellQ2.gp.so");
GP;install("LLLgoon","D0,G,DGp","LLLgoon","./ellQ2.gp.so");
GP;install("QfWittinvariant","D0,G,D0,G,","QfWittinvariant","./ellQ2.gp.so");
GP;install("Qflisteinvariants","D0,G,DGp","Qflisteinvariants","./ellQ2.gp.so");
GP;install("Qfsolvemodp","D0,G,D0,G,p","Qfsolvemodp","./ellQ2.gp.so");
GP;install("Qfminim","D0,G,DGp","Qfminim","./ellQ2.gp.so");
GP;install("mymat","D0,G,","mymat","./ellQ2.gp.so");
GP;install("Qfbsqrtgauss","D0,G,D0,G,p","Qfbsqrtgauss","./ellQ2.gp.so");
GP;install("class2","D0,G,D0,G,D0,G,D0,G,p","class2","./ellQ2.gp.so");
GP;install("Qfsolve","D0,G,D0,G,p","Qfsolve","./ellQ2.gp.so");
GP;install("matdiagonalblock","D0,G,","matdiagonalblock","./ellQ2.gp.so");
GP;install("ellchangecurveinverse","D0,G,D0,G,","ellchangecurveinverse","./ellQ2.gp.so");
GP;install("ellchangepointinverse","D0,G,D0,G,","ellchangepointinverse","./ellQ2.gp.so");
GP;install("ellcomposeurst","D0,G,D0,G,","ellcomposeurst","./ellQ2.gp.so");
GP;install("ellinverturst","D0,G,","ellinverturst","./ellQ2.gp.so");
GP;install("mysubst","D0,G,D0,G,","mysubst","./ellQ2.gp.so");
GP;install("degre","D0,G,","degre","./ellQ2.gp.so");
GP;install("nfissquare","lD0,G,D0,G,p","nfissquare","./ellQ2.gp.so");
GP;install("nfsqrt","D0,G,D0,G,p","nfsqrt","./ellQ2.gp.so");
GP;install("sqrtrat","D0,G,","sqrtrat","./ellQ2.gp.so");
GP;install("polratroots","D0,G,","polratroots","./ellQ2.gp.so");
GP;addhelp(polratroots, "polratroots(pol): rational roots of the polynomial pol, according to the field of definition of its coefficients (Q, R, Qp, Fp).");
GP;install("ratpoint","D0,G,DGDGp","ratpoint","./ellQ2.gp.so");
GP;install("ratpoint2","D0,G,DGDGDGp","ratpoint2","./ellQ2.gp.so");
GP;install("listratpoint","D0,G,DGp","listratpoint","./ellQ2.gp.so");
GP;install("redquartic","D0,G,p","redquartic","./ellQ2.gp.so");
GP;addhelp(redquartic, "redquartic(pol): reduction of the quartic pol using Cremona-Stoll algorithm. Returns [p,M], where p is the reduced quartic and M is the GL2(Z) transformation. Also works with other degree polynomials.");
GP;install("polrealrootsisolate","D0,G,","polrealrootsisolate","./ellQ2.gp.so");
GP;install("polrealrootsimprove","D0,G,D0,G,","polrealrootsimprove","./ellQ2.gp.so");
GP;addhelp(polrealrootsimprove, "ratpoint(pol,lim=1,singlepoint=1): search for rational points on y^2=pol(x), for about within the bounds given by lim. The coefficients of pol must be integral. If singlepoint=1, returns at most one point, otherwise as many as possible.");
GP;install("polrootsmodpn","D0,G,D0,G,p","polrootsmodpn","./ellQ2.gp.so");
GP;install("ppinit","D0,G,D0,G,","ppinit","./ellQ2.gp.so");
GP;install("nfpsquareoddQ","lD0,G,D0,G,D0,G,p","nfpsquareoddQ","./ellQ2.gp.so");
GP;install("psquare","lD0,G,D0,G,p","psquare","./ellQ2.gp.so");
GP;install("lemma6","lD0,G,D0,G,D0,G,D0,G,p","lemma6","./ellQ2.gp.so");
GP;install("lemma7","lD0,G,D0,G,D0,G,p","lemma7","./ellQ2.gp.so");
GP;install("zpsoluble","lD0,G,D0,G,D0,G,D0,G,D0,G,D0,G,p","zpsoluble","./ellQ2.gp.so");
GP;install("qpsoluble","lD0,G,D0,G,p","qpsoluble","./ellQ2.gp.so");
GP;install("locallysoluble","lD0,G,p","locallysoluble","./ellQ2.gp.so");
GP;addhelp(locallysoluble, "locallysoluble(pol): returns 1 if y^2=pol(x) is everywhere locally soluble, 0 otherwise.");
GP;install("LS2localimage","D0,G,D0,G,D0,G,p","LS2localimage","./ellQ2.gp.so");
GP;install("ellhalf","D0,G,D0,G,p","ellhalf","./ellQ2.gp.so");
GP;addhelp(ellhalf, "ellhalf(E,P): returns the vector of all points Q on the elliptic curve E such that 2Q = P");
GP;install("elltors2","D0,G,p","elltors2","./ellQ2.gp.so");
GP;addhelp(elltors2, "elltors2(E): for an elliptic curve E, returns the group E(K)[2], where K is the field of definition of the coefficients of E (Q, R, Qp or Fp).");
GP;install("elltorseven","D0,G,p","elltorseven","./ellQ2.gp.so");
GP;addhelp(elltorseven, "elltorseven(E): for an elliptic curve E, returns 2-Sylow subgroup of E(K)_tors, where K is the field of definition of the coefficients of E: (Q, R, Qp or Fp).");
GP;install("ellsort","D0,G,p","ellsort","./ellQ2.gp.so");
GP;addhelp(ellsort, "ellsort(v): v being a vector of points on some elliptic curve, returns the vector v sorted according to the naive height.");
GP;install("ellremovetorsion","D0,G,D0,G,","ellremovetorsion","./ellQ2.gp.so");
GP;install("ellredgen","D0,G,D0,G,DGp","ellredgen","./ellQ2.gp.so");
GP;addhelp(ellredgen, "ellredgen(E,v): returns a vector of smallest possible points on the elliptic curve E generating the same subgroup as v, up to torsion.");
GP;install("reducemodsquares","D0,G,D0,G,p","reducemodsquares","./ellQ2.gp.so");
GP;addhelp(reducemodsquares, "reducemodsquares(delta,d): delta being a t_POLMOD, returns another delta'=delta*z^2, such that delta' has a small coefficient in x^d.");
GP;install("bnfpSelmer","D0,G,DGD0,G,p","bnfpSelmer","./ellQ2.gp.so");
GP;addhelp(bnfpSelmer, "bnfpSelmer(K,S,p): K being a number field given by bnfinit, S an ideal of K, and p a prime number, computes a set of generators of the group K(S,p) = { x in K^/K^p, v_P(x) = 0 (mod p) for all P coprime to S}");
GP;install("kersign","D0,G,D0,G,","kersign","./ellQ2.gp.so");
GP;install("kernorm","D0,G,D0,G,D0,G,","kernorm","./ellQ2.gp.so");
GP;install("elllocalimage","D0,G,D0,G,DGp","elllocalimage","./ellQ2.gp.so");
GP;install("ell2descent_gen","D0,G,D0,G,DGDGDGp","ell2descent_gen","./ellQ2.gp.so");
GP;addhelp(ell2descent_gen, "ell2descent_gen((E,bnf,k=1,help=[]): E is a vector of the form [0,A,0,B,C], (or the result of ellinit of such a vector) A,B,C integers such that x^3+A*x^2+B*x+C; bnf is the corresponding bnfinit(,1); Performs 2-descent on the elliptic curve Ek : k*y^2=x^3+A*x^2+B*x+C. See ?ellrank for the format of the output.");
GP;install("afficheselmer","vD0,G,D0,G,D0,G,","afficheselmer","./ellQ2.gp.so");
GP;install("ellrankdebug","D0,G,D0,G,DGp","ellrankdebug","./ellQ2.gp.so");
GP;install("ellrank","D0,G,DGp","ellrank","./ellQ2.gp.so");
GP;addhelp(ellrank, "ellrank(E,help=[]): E is any elliptic curve defined over Q. Returns a vector [r,s,v], where r is a lower bound for the rank of E, s is the rank of its 2-Selmer group and v is a list of independant points in E(Q)/2E(Q). If help is a vector of nontrivial points on E, the result might be faster. This function might be used in conjunction with elltors2(E)");
GP;install("ell2descent_complete","D0,G,D0,G,D0,G,D0,G,p","ell2descent_complete","./ellQ2.gp.so");
GP;addhelp(ell2descent_complete, "ell2descent_complete(e1,e2,e3): Performs a complete 2-descent on the elliptic curve y^2 = (x-e1)*(x-e2)*(x-e3). See ?ellrank for the format of the output.");
GP;install("ellcount","D0,G,D0,G,D0,G,DGp","ellcount","./ellQ2.gp.so");
GP;install("ell2descent_viaisog","D0,G,DGp","ell2descent_viaisog","./ellQ2.gp.so");
GP;addhelp(ell2descent_viaisog, "ell2descent_viaisog(E,help=[]): E is an elliptic curve of the form [0,a,0,b,0], with a, b integers. Performs a 2-descent via isogeny on E. See ?ellrank for the format of the output.");
GP;install("nfsign_s","lD0,G,D0,G,D0,G,p","nfsign_s","./ellQ2.gp.so");
GP;install("nfpolratroots","D0,G,D0,G,","nfpolratroots","./ellQ2.gp.so");
GP;install("nfmodid2","D0,G,D0,G,D0,G,","nfmodid2","./ellQ2.gp.so");
GP;install("nfhilb2","D0,G,D0,G,D0,G,D0,G,p","nfhilb2","./ellQ2.gp.so");
GP;install("mynfhilbertp","D0,G,D0,G,D0,G,D0,G,p","mynfhilbertp","./ellQ2.gp.so");
GP;install("ideallistfactor","D0,G,D0,G,","ideallistfactor","./ellQ2.gp.so");
GP;install("mynfhilbert","lD0,G,D0,G,D0,G,p","mynfhilbert","./ellQ2.gp.so");
GP;install("initp","D0,G,D0,G,p","initp","./ellQ2.gp.so");
GP;install("deno","D0,G,","deno","./ellQ2.gp.so");
GP;install("nfratpoint","D0,G,D0,G,D0,G,DGp","nfratpoint","./ellQ2.gp.so");
GP;install("repres","D0,G,D0,G,p","repres","./ellQ2.gp.so");
GP;install("val","D0,G,D0,G,D0,G,","val","./ellQ2.gp.so");
GP;install("nfissquarep","D0,G,D0,G,D0,G,D0,G,p","nfissquarep","./ellQ2.gp.so");
GP;install("nfpsquareodd","lD0,G,D0,G,D0,G,p","nfpsquareodd","./ellQ2.gp.so");
GP;install("nfpsquare","lD0,G,D0,G,D0,G,D0,G,p","nfpsquare","./ellQ2.gp.so");
GP;install("nfpsquareq","lD0,G,D0,G,D0,G,D0,G,p","nfpsquareq","./ellQ2.gp.so");
GP;install("nflemma6","lD0,G,D0,G,D0,G,D0,G,D0,G,p","nflemma6","./ellQ2.gp.so");
GP;install("nflemma7","lD0,G,D0,G,D0,G,D0,G,D0,G,D0,G,p","nflemma7","./ellQ2.gp.so");
GP;install("nfzpsoluble","lD0,G,D0,G,D0,G,D0,G,D0,G,D0,G,p","nfzpsoluble","./ellQ2.gp.so");
GP;install("mynfeltmod","D0,G,D0,G,D0,G,","mynfeltmod","./ellQ2.gp.so");
GP;install("mynfeltreduce","D0,G,D0,G,D0,G,","mynfeltreduce","./ellQ2.gp.so");
GP;install("nfrandintmodid","D0,G,D0,G,","nfrandintmodid","./ellQ2.gp.so");
GP;install("nfrandint","D0,G,D0,G,","nfrandint","./ellQ2.gp.so");
GP;install("nfqpsolublebig","lD0,G,D0,G,D0,G,DGDGp","nfqpsolublebig","./ellQ2.gp.so");
GP;install("nfpolrootsmod","D0,G,D0,G,D0,G,","nfpolrootsmod","./ellQ2.gp.so");
GP;install("nfqpsoluble","lD0,G,D0,G,D0,G,p","nfqpsoluble","./ellQ2.gp.so");
GP;install("nflocallysoluble","lD0,G,D0,G,DGDGDGp","nflocallysoluble","./ellQ2.gp.so");
GP;install("nfellcount","D0,G,D0,G,D0,G,D0,G,D0,G,p","nfellcount","./ellQ2.gp.so");
GP;install("gettufu","D0,G,","gettufu","./ellQ2.gp.so");
GP;install("getfutu","D0,G,","getfutu","./ellQ2.gp.so");
GP;install("bnfell2descent_viaisog","D0,G,D0,G,p","bnfell2descent_viaisog","./ellQ2.gp.so");
GP;install("nfchinremain","D0,G,D0,G,D0,G,","nfchinremain","./ellQ2.gp.so");
GP;install("bnfqfsolve2","D0,G,D0,G,D0,G,DGp","bnfqfsolve2","./ellQ2.gp.so");
GP;install("bnfqfsolve","D0,G,D0,G,D0,G,D0,G,DGp","bnfqfsolve","./ellQ2.gp.so");
GP;install("bnfredquartique2","D0,G,D0,G,D0,G,D0,G,D0,G,","bnfredquartique2","./ellQ2.gp.so");
GP;install("bnfell2descent_gen","D0,G,D0,G,D0,G,DGDGDGDGp","bnfell2descent_gen","./ellQ2.gp.so");
GP;install("bnfellrank","D0,G,D0,G,DGDGDGp","bnfellrank","./ellQ2.gp.so");
GP;install("bnfell2descent_complete","D0,G,D0,G,D0,G,D0,G,DGDGp","bnfell2descent_complete","./ellQ2.gp.so");
*/
void init_ellQ2(void);
GEN QfbReduce(GEN M, long prec);
GEN IndefiniteLLL(GEN G, GEN c, GEN base, long prec);
GEN IndefiniteLLL2(GEN G, GEN c, GEN base, long prec);
GEN kermodp(GEN M, GEN p);
GEN Qfparam(GEN G, GEN sol, GEN fl, long prec);
GEN LLLgoon3(GEN G, GEN c, long prec);
GEN completebasis(GEN v, GEN redflag);
GEN LLLgoon(GEN G, GEN c, long prec);
GEN QfWittinvariant(GEN G, GEN p);
GEN Qflisteinvariants(GEN G, GEN fa, long prec);
GEN Qfsolvemodp(GEN G, GEN p, long prec);
GEN Qfminim(GEN G, GEN factdetG, long prec);
GEN mymat(GEN qfb);
GEN Qfbsqrtgauss(GEN G, GEN factdetG, long prec);
GEN class2(GEN D, GEN factdetG, GEN Winvariants, GEN U2, long prec);
GEN Qfsolve(GEN G, GEN factD, long prec);
GEN matdiagonalblock(GEN v);
GEN ellchangecurveinverse(GEN ell, GEN v);
GEN ellchangepointinverse(GEN pt, GEN v);
GEN ellcomposeurst(GEN urst1, GEN urst2);
GEN ellinverturst(GEN urst);
GEN mysubst(GEN polsu, GEN subsx);
GEN degre(GEN idegre);
long nfissquare(GEN nf, GEN a, long prec);
GEN nfsqrt(GEN nf, GEN a, long prec);
GEN sqrtrat(GEN a);
GEN polratroots(GEN pol);
GEN ratpoint(GEN pol, GEN lim, GEN singlepoint, long prec);
GEN ratpoint2(GEN pol, GEN lim, GEN singlepoint, GEN redflag, long prec);
GEN listratpoint(GEN pol, GEN redflag, long prec);
GEN redquartic(GEN pol, long prec);
GEN polrealrootsisolate(GEN pol);
GEN polrealrootsimprove(GEN pol, GEN v);
GEN polrootsmodpn(GEN pol, GEN p, long prec);
GEN ppinit(GEN nf, GEN p);
long nfpsquareoddQ(GEN nf, GEN a, GEN pr, long prec);
long psquare(GEN a, GEN p, long prec);
long lemma6(GEN pol, GEN p, GEN nu, GEN xx, long prec);
long lemma7(GEN pol, GEN nu, GEN xx, long prec);
long zpsoluble(GEN pol, GEN p, GEN nu, GEN pnu, GEN x0, GEN pnup, long prec);
long qpsoluble(GEN pol, GEN p, long prec);
long locallysoluble(GEN pol, long prec);
GEN LS2localimage(GEN nf, GEN gen, GEN pp, long prec);
GEN ellhalf(GEN ell, GEN P, long prec);
GEN elltors2(GEN ell, long prec);
GEN elltorseven(GEN ell, long prec);
GEN ellsort(GEN listpts, long prec);
GEN ellremovetorsion(GEN ell, GEN listgen);
GEN ellredgen(GEN ell0, GEN listgen, GEN K, long prec);
GEN reducemodsquares(GEN delta, GEN d, long prec);
GEN bnfpSelmer(GEN bnf, GEN S, GEN p, long prec);
GEN kersign(GEN gen, GEN rootapprox);
GEN kernorm(GEN gen, GEN S, GEN p);
GEN elllocalimage(GEN nf, GEN pp, GEN K, long prec);
GEN ell2descent_gen(GEN ell, GEN bnf, GEN K, GEN help, GEN redflag, long prec);
void afficheselmer(GEN m1, GEN m2, GEN tors2);
GEN ellrankdebug(GEN ell, GEN lev, GEN help, long prec);
GEN ellrank(GEN ell, GEN help, long prec);
GEN ell2descent_complete(GEN e1, GEN e2, GEN e3, GEN help, long prec);
GEN ellcount(GEN c, GEN d, GEN KS2gen, GEN listpointstriv, long prec);
GEN ell2descent_viaisog(GEN ell, GEN help, long prec);
long nfsign_s(GEN nf, GEN a, GEN i, long prec);
GEN nfpolratroots(GEN nf, GEN pol);
GEN nfmodid2(GEN nf, GEN a, GEN ideal);
GEN nfhilb2(GEN nf, GEN a, GEN b, GEN p, long prec);
GEN mynfhilbertp(GEN nf, GEN a, GEN b, GEN p, long prec);
GEN ideallistfactor(GEN nf, GEN listfact);
long mynfhilbert(GEN nf, GEN a, GEN b, long prec);
GEN initp(GEN nf, GEN p, long prec);
GEN deno(GEN num);
GEN nfratpoint(GEN nf, GEN pol, GEN lim, GEN singlepoint, long prec);
GEN repres(GEN nf, GEN p, long prec);
GEN val(GEN nf, GEN num, GEN p);
GEN nfissquarep(GEN nf, GEN a, GEN p, GEN q, long prec);
long nfpsquareodd(GEN nf, GEN a, GEN p, long prec);
long nfpsquare(GEN nf, GEN a, GEN p, GEN zinit, long prec);
long nfpsquareq(GEN nf, GEN a, GEN p, GEN q, long prec);
long nflemma6(GEN nf, GEN pol, GEN p, GEN nu, GEN xx, long prec);
long nflemma7(GEN nf, GEN pol, GEN p, GEN nu, GEN xx, GEN zinit, long prec);
long nfzpsoluble(GEN nf, GEN pol, GEN p, GEN nu, GEN pnu, GEN x0, long prec);
GEN mynfeltmod(GEN nf, GEN a, GEN b);
GEN mynfeltreduce(GEN nf, GEN a, GEN id);
GEN nfrandintmodid(GEN nf, GEN id);
GEN nfrandint(GEN nf, GEN borne);
long nfqpsolublebig(GEN nf, GEN pol, GEN p, GEN ap, GEN b, long prec);
GEN nfpolrootsmod(GEN nf, GEN pol, GEN p);
long nfqpsoluble(GEN nf, GEN pol, GEN p, long prec);
long nflocallysoluble(GEN nf, GEN pol, GEN r, GEN a, GEN b, long prec);
GEN nfellcount(GEN nf, GEN c, GEN d, GEN KS2gen, GEN pointstriv, long prec);
GEN gettufu(GEN bnf);
GEN getfutu(GEN bnf);
GEN bnfell2descent_viaisog(GEN bnf, GEN ell, long prec);
GEN nfchinremain(GEN nf, GEN b, GEN fact);
GEN bnfqfsolve2(GEN bnf, GEN aleg, GEN bleg, GEN auto_s, long prec);
GEN bnfqfsolve(GEN bnf, GEN aleg, GEN bleg, GEN flag3, GEN auto_s, long prec);
GEN bnfredquartique2(GEN bnf, GEN pol, GEN r, GEN a, GEN b);
GEN bnfell2descent_gen(GEN bnf, GEN ell, GEN ext, GEN help, GEN bigflag, GEN flag3, GEN auto_s, long prec);
GEN bnfellrank(GEN bnf, GEN ell, GEN help, GEN bigflag, GEN flag3, long prec);
GEN bnfell2descent_complete(GEN bnf, GEN e1, GEN e2, GEN e3, GEN flag3, GEN auto_s, long prec);
/*End of prototype*/

static GEN DEBUGLEVEL_qfsolve;
static GEN DEBUGLEVEL_ell;
static GEN LIM1;
static GEN LIM3;
static GEN LIMTRIV;
static GEN COMPLETE;
static GEN MAXPROB;
static GEN LIMBIGPRIME;
static GEN ELLREDGENFLAG;
static GEN BIGINT;
static GEN NBIDEAUX;
/*End of global vars*/

void
init_ellQ2(void)	  /* void */
{
  pari_sp ltop = avma;
  DEBUGLEVEL_qfsolve = pol_x(fetch_user_var("DEBUGLEVEL_qfsolve"));
  DEBUGLEVEL_ell = pol_x(fetch_user_var("DEBUGLEVEL_ell"));
  LIM1 = pol_x(fetch_user_var("LIM1"));
  LIM3 = pol_x(fetch_user_var("LIM3"));
  LIMTRIV = pol_x(fetch_user_var("LIMTRIV"));
  COMPLETE = pol_x(fetch_user_var("COMPLETE"));
  MAXPROB = pol_x(fetch_user_var("MAXPROB"));
  LIMBIGPRIME = pol_x(fetch_user_var("LIMBIGPRIME"));
  ELLREDGENFLAG = pol_x(fetch_user_var("ELLREDGENFLAG"));
  BIGINT = pol_x(fetch_user_var("BIGINT"));
  NBIDEAUX = pol_x(fetch_user_var("NBIDEAUX"));
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*       Copyright (C) 2011 Denis Simon */
  /* */
  /* Distributed under the terms of the GNU General Public License (GPL) */
  /* */
  /*    This code is distributed in the hope that it will be useful, */
  /*    but WITHOUT ANY WARRANTY; without even the implied warranty of */
  /*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU */
  /*    General Public License for more details. */
  /* */
  /* The full text of the GPL is available at: */
  /* */
  /*                 http://www.gnu.org/licenses/ */
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
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
  
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*       Copyright (C) 2011 Denis Simon */
  /* */
  /* Distributed under the terms of the GNU General Public License (GPL) */
  /* */
  /*    This code is distributed in the hope that it will be useful, */
  /*    but WITHOUT ANY WARRANTY; without even the implied warranty of */
  /*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU */
  /*    General Public License for more details. */
  /* */
  /* The full text of the GPL is available at: */
  /* */
  /*                 http://www.gnu.org/licenses/ */
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
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
  
  /* */
  /* Usual global variables */
  /*  */
  
  DEBUGLEVEL_qfsolve = gen_0;
  /* */
  /* Usual global variables */
  /* */
  
  DEBUGLEVEL_ell = gen_0;
  /* From 0 to 5 : choose a higher value to have */
  /* more details printed. */
  LIM1 = stoi(5);
  /* Limit for the search of trivial points on quartics */
  LIM3 = stoi(50);
  /* Limit for the search of points on ELS quartics */
  LIMTRIV = stoi(3);
  /* Limit for the search of trivial points on the elliptic curve */
  COMPLETE = gen_1;
  /* Use Complete 2-descent when full 2-torsion, */
  /* otherwise 2-descent via isogenies. */
  
  /* */
  /*  Technical global variables */
  /* */
  
  MAXPROB = stoi(20);
  LIMBIGPRIME = stoi(30);
  /* for primes larger than this limit, */
  /* use a probabilistic test */
  /* LIMBIGPRIME = 0 means only deterministic tests */
  ELLREDGENFLAG = gen_1;
  /* to reduce the generators at the end */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*          SCRIPT                             \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    COMMON FUNCTIONS TO ell.gp AND ellQ.gp   \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellchangecurveinverse\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellchangepointinverse\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellcomposeurst\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellinverturst\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("mysubst\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("degre\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfissquare\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfsqrt\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("sqrtrat\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*      FUNCTIONS SPECIFIC TO ellQ.gp          \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    FUNCTIONS FOR POLYNOMIALS                \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("polratroots\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ratpoint\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ratpoint2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("listratpoint\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("redquartic\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("polrealrootsisolate\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("polrealrootsimprove\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("polrootsmodpn\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    FUNCTIONS FOR LOCAL COMPUTATIONS         \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ppinit\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpsquareoddQ\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("psquare\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("lemma6\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("lemma7\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("zpsoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("qpsoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("locallysoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("LS2localimage\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    GENERIC FUNCTIONS FOR ELLIPTIC CURVES    \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellhalf\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("elltors2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("elltorseven\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellsort\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellremovetorsion\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellredgen\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    FUNCTIONS FOR NUMBER FIELDS              \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("reducemodsquares\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfpSelmer\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("kersign\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("kernorm\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*    FUNCTIONS FOR 2-DESCENT                  \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("elllocalimage\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ell2descent_gen\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("afficheselmer\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellrank\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ell2descent_complete\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ellcount\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ell2descent_viaisog\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*            HELP MESSAGES                \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  /*                  functions for elliptic curves */
  /*                  functions for polynomials */
  /*                  functions for number fields */
  /*                  others */
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*       Copyright (C) 2007 Denis Simon */
  /* */
  /* Distributed under the terms of the GNU General Public License (GPL) */
  /* */
  /*    This code is distributed in the hope that it will be useful, */
  /*    but WITHOUT ANY WARRANTY; without even the implied warranty of */
  /*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU */
  /*    General Public License for more details. */
  /* */
  /* The full text of the GPL is available at: */
  /* */
  /*                 http://www.gnu.org/licenses/ */
  /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  /* */
  /* Auteur: */
  /* Denis SIMON -> simon@math.unicaen.fr */
  /* adresse du fichier: */
  /* www.math.unicaen.fr/~simon/ell.gp */
  /* */
  /*  ********************************************* */
  /*  *          VERSION 25/03/2009               * */
  /*  ********************************************* */
  /* */
  /* Programme de calcul du rang des courbes elliptiques */
  /* dans les corps de nombres. */
  /* langage: GP */
  /* pour l'utiliser, lancer gp, puis taper */
  /* \r ell.gp */
  /* */
  /* */
  /* Explications succintes : */
  /* definition du corps : */
  /* bnf=bnfinit(y^2+1); */
  /* (il est indispensable que la variable soit y). */
  /* on peut ensuite poser :  */
  /* X = Mod(y,bnf.pol); */
  /*  */
  /* La fonction bnfellrank() accepte toutes les courbes sous la forme */
  /* [a1,a2,a3,a4,a6] */
  /* Les coefficients peuvent etre entiers ou non. */
  /* L'algorithme utilise est celui de la 2-descente. */
  /* La 2-torsion peut etre quelconque. */
  /* Il suffit de taper :  */
  /* */
  /* gp > ell = [a1,a2,a3,a4,a6]; */
  /* gp > bnfellrank(bnf,ell) */
  /* */
  /* Retourne un vecteur [r,s,vec] */
  /* ou r est le rang probable (c'est toujours une minoration du rang), */
  /* s est le 2-rang du groupe de Selmer, */
  /* vec est une liste de points dans E(K)/2E(K). */
  /* */
  /* Courbes avec #E[2](K) >= 2: */
  /* ell doit etre sous la forme  */
  /* y^2 = x^3 + A*^2 + B*x */
  /* avec A et B entiers algebriques */
  /* gp > ell = [0,A,0,B,0] */
  /* gp > bnfell2descent_viaisog(ell) */
  /* = algorithme de la 2-descente par isogenies */
  /* Attention A et B doivent etre entiers */
  /* */
  /* Courbes avec #E[2](K) = 4: y^2 = (x-e1)*(x-e2)*(x-e3) */
  /* -> bnfell2descent_complete(bnf,e1,e2,e3); */
  /* = algorithme de la 2-descente complete */
  /* Attention: les ei doivent etre entiers algebriques. */
  /* */
  /* */
  /* On peut avoir plus ou moins de details de calculs avec */
  /* DEBUGLEVEL_ell = 0; */
  /* DEBUGLEVEL_ell = 1; 2; 3;... */
  /* */
  
  /* */
  /* Variables globales usuelles */
  /* */
  
  DEBUGLEVEL_ell = gen_1;
  /* pour avoir plus ou moins de details */
  LIM1 = gen_2;
  /* limite des points triviaux sur les quartiques */
  LIM3 = stoi(4);
  /* limite des points sur les quartiques ELS */
  LIMTRIV = gen_2;
  /* limite des points triviaux sur la courbe elliptique */
  
  /* */
  /*  Variables globales techniques */
  /* */
  
  BIGINT = stoi(32000);
  /* l'infini */
  MAXPROB = stoi(20);
  LIMBIGPRIME = stoi(30);
  /* pour distinguer un petit nombre premier d'un grand */
  /* utilise un test probabiliste pour les grands  */
  /* si LIMBIGPRIME = 0, n'utilise aucun test probabiliste */
  NBIDEAUX = stoi(10);
  /* */
  /*  Programmes */
  /* */
  
  /* */
  /* Fonctions communes ell.gp et ellQ.gp */
  /* */
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
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfsign_s\n");
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
  
  /* */
  /* Fonctions propres a ell.gp */
  /* */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpolratroots\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfmodid2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfhilb2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("mynfhilbertp\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("ideallistfactor\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("mynfhilbert\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("initp\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("deno\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfratpoint\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("repres\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("val\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfissquarep\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpsquareodd\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpsquare\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpsquareq\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nflemma6\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nflemma7\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfzpsoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("mynfeltmod\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("mynfeltreduce\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfrandintmodid\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfrandint\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfqpsolublebig\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfpolrootsmod\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfqpsoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nflocallysoluble\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfellcount\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfell2descent_viaisog\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("nfchinremain\n");
  /* MODI must change auto to auto_s: reserved C */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfqfsolve2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfqfsolve\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfredquartique2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfell2descent_gen\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfellrank\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bnfell2descent_complete\n");
  gerepileall(ltop, 11, &DEBUGLEVEL_qfsolve, &DEBUGLEVEL_ell, &LIM1, &LIM3, &LIMTRIV, &COMPLETE, &MAXPROB, &LIMBIGPRIME, &ELLREDGENFLAG, &BIGINT, &NBIDEAUX);
  return;
}

/* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
/*          SCRIPT                             \\ */
/* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */

GEN
QfbReduce(GEN M, long prec)
{
  pari_sp ltop = avma;
  GEN a = gen_0, b = gen_0, c = gen_0, H = gen_0, test = gen_0, di = gen_0, q = gen_0, r = gen_0, nexta = gen_0, nextb = gen_0, nextc = gen_0, aux = gen_0;
  if (gcmpgs(DEBUGLEVEL_qfsolve, 5) >= 0)
    pari_printf("     starting QfbReduce with %Ps\n", M);
  a = gcopy(gcoeff(M, 1, 1));
  b = gcopy(gcoeff(M, 1, 2));
  c = gcopy(gcoeff(M, 2, 2));
  H = matid(2);
  test = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (!gequal0(test) && !gequal0(a))
    {
      di = divrem(b, a, -1);
      q = gcopy(gel(di, 1));
      r = gcopy(gel(di, 2));
      if (gcmp(gmulsg(2, r), gabs(a, prec)) > 0)
      {
        r = gsub(r, gabs(a, prec));
        q = gaddgs(q, gsigne(a));
      }
      gel(H, 2) = gsub(gel(H, 2), gmul(q, gel(H, 1)));
      nextc = a;
      nextb = gneg(r);
      nexta = gadd(gmul(gsub(nextb, b), q), c);
      if (!gequal0(test = stoi(gcmp(gabs(nexta, prec), gabs(a, prec)) < 0)))
      {
        c = nextc;
        b = nextb;
        a = nexta;
        aux = gcopy(gel(H, 1));
        gel(H, 1) = gneg(gel(H, 2));
        gel(H, 2) = gcopy(aux);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 12, &di, &q, &r, &H, &nextc, &nextb, &nexta, &test, &c, &b, &a, &aux);
    }
  }
  if (gcmpgs(DEBUGLEVEL_qfsolve, 5) >= 0)
    pari_printf("     end of QfbReduce with %Ps\n", H);
  H = gerepilecopy(ltop, H);
  return H;
}

GEN
IndefiniteLLL(GEN G, GEN c, GEN base, long prec)
{
  pari_sp ltop = avma;
  GEN n = gen_0, M = gen_0, QD = gen_0, M1 = gen_0, S = gen_0, red = gen_0, p1 = gen_0, p2 = gen_0;
  GEN p3 = gen_0, p4 = gen_0;	  /* vec */
  if (!c)
    c = gen_1;
  if (!base)
    base = gen_0;
  n = stoi(glength(G));
  M = matid(gtos(n));
  QD = gcopy(G);
  p1 = gsubgs(n, 1);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0, p5 = gen_0;
    long l6;	  /* lg */
    long l7;
    GEN p8 = gen_0;	  /* vec */
    for (i = gen_1; gcmp(i, p1) <= 0; i = gaddgs(i, 1))
    {
      if (gequal0(gcoeff(QD, gtos(i), gtos(i))))
      {
        p5 = IndefiniteLLL2(G, c, base, prec);
        p5 = gerepilecopy(ltop, p5);
        return p5;
      }
      M1 = matid(gtos(n));
      p8 = gdiv(gneg(rowcopy(QD, gtos(i))), gcoeff(QD, gtos(i), gtos(i)));
      l6 = lg(M1);
      for (l7 = 1; l7 < l6; ++l7)
        gcoeff(M1, gtos(i), l7) = gcopy(gel(p8, l7));
      gcoeff(M1, gtos(i), gtos(i)) = gen_1;
      M = gmul(M, M1);
      QD = gmul(gmul(gtrans(M1), QD), M1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &i, &p5, &M1, &p8, &M, &QD);
    }
  }
  M = ginv(M);
  QD = gmul(gmul(gtrans(M), gabs(QD, prec)), M);
  S = qflllgram0(gdiv(QD, content(QD)), 0);
  red = IndefiniteLLL2(gmul(gmul(gtrans(S), G), S), c, base, prec);
  if (typ(red) == t_COL)
  {
    p2 = gmul(S, red);
    p2 = gerepilecopy(ltop, p2);
    return p2;
  }
  if (glength(red) == 3)
  {
    p3 = cgetg(4, t_VEC);
    gel(p3, 1) = gcopy(gel(red, 1));
    gel(p3, 2) = gmul(S, gel(red, 2));
    gel(p3, 3) = gmul(S, gel(red, 3));
    p3 = gerepilecopy(ltop, p3);
    return p3;
  }
  p4 = cgetg(3, t_VEC);
  gel(p4, 1) = gcopy(gel(red, 1));
  gel(p4, 2) = gmul(S, gel(red, 2));
  p4 = gerepilecopy(ltop, p4);
  return p4;
}

GEN
IndefiniteLLL2(GEN G, GEN c, GEN base, long prec)
{
  pari_sp ltop = avma;
  GEN n = gen_0, H = gen_0, M = gen_0, A = gen_0, aux = gen_0, sol = gen_0, k = gen_0, nextk = gen_0, swap = gen_0, q = gen_0, di = gen_0, HM = gen_0, aux1 = gen_0, aux2 = gen_0, Mkk1 = gen_0, bk1new = gen_0, Mkk1new = gen_0, newG = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0;	  /* vec */
  if (!c)
    c = gen_1;
  if (!base)
    base = gen_0;
  n = stoi(glength(G));
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   LLL dim %Ps avec |G| = %Ps\n", n, gdiv(glog(vecmax(gabs(G, prec)), prec), glog(stoi(10), prec)));
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
  {
    pari_printf("    LLL with \n");
    pari_printf("%Ps\n", G);
  }
  /* MODI2.1 */
  
  if (gcmpgs(n, 1) <= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(G);
    gel(p1, 2) = matid(gtos(n));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  H = gcopy(M = matid(gtos(n)));
  {
    long l4, l5;
    p2 = cgetg(gtos(n)+1, t_MAT);
    for (l5 = 1; gcmpsg(l5, n) <= 0; ++l5)
    {
      gel(p2, l5) = cgetg(gtos(n)+1, t_COL);
      for (l4 = 1; gcmpsg(l4, n) <= 0; ++l4)
        gcoeff(p2, l4, l5) = gen_0;
    }
  }
  A = p2;
  /* compute Gram-Schmidt   */
  
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    GEN p6 = gen_0;	  /* vec */
    GEN p7 = gen_0, p8 = gen_0;
    for (i = gen_1; gcmp(i, n) <= 0; i = gaddgs(i, 1))
    {
      if (gequal0(gcoeff(A, gtos(i), gtos(i)) = gcopy(gcoeff(G, gtos(i), gtos(i)))))
      {
        if (!gequal0(base))
        {
          aux = gcopy(gel(H, 1));
          gel(H, 1) = gcopy(gel(H, gtos(i)));
          gel(H, gtos(i)) = gneg(aux);
          p6 = cgetg(4, t_VEC);
          gel(p6, 1) = gmul(gmul(gtrans(H), G), H);
          gel(p6, 2) = gcopy(H);
          gel(p6, 3) = gcopy(gel(H, 1));
          p6 = gerepilecopy(ltop, p6);
          return p6;
        }
        else
        {
          p7 = gcopy(gel(M, gtos(i)));
          p7 = gerepilecopy(ltop, p7);
          return p7;
        }
      }
      p8 = gsubgs(i, 1);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN j = gen_0, p9 = gen_0, p10 = gen_0;
        GEN p11 = gen_0;	  /* vec */
        for (j = gen_1; gcmp(j, p8) <= 0; j = gaddgs(j, 1))
        {
          p9 = gsubgs(j, 1);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN k = gen_0;
            p10 = gen_0;
            for (k = gen_1; gcmp(k, p9) <= 0; k = gaddgs(k, 1))
            {
              p10 = gadd(p10, gmul(gcoeff(M, gtos(j), gtos(k)), gcoeff(A, gtos(i), gtos(k))));
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 2, &p10, &k);
            }
          }
          gcoeff(A, gtos(i), gtos(j)) = gsub(gcoeff(G, gtos(i), gtos(j)), p10);
          gcoeff(M, gtos(i), gtos(j)) = gdiv(gcoeff(A, gtos(i), gtos(j)), gcoeff(A, gtos(j), gtos(j)));
          gcoeff(A, gtos(i), gtos(i)) = gsub(gcoeff(A, gtos(i), gtos(i)), gmul(gcoeff(M, gtos(i), gtos(j)), gcoeff(A, gtos(i), gtos(j))));
          if (gequal0(gcoeff(A, gtos(i), gtos(i))))
          {
            sol = gcopy(gel(gtrans(ginv(M)), gtos(i)));
            sol = gdiv(sol, content(sol));
            if (!gequal0(base))
            {
              H = completebasis(sol, NULL);
              aux = gcopy(gel(H, 1));
              gel(H, 1) = gcopy(gel(H, gtos(n)));
              gel(H, gtos(n)) = gneg(aux);
              p11 = cgetg(4, t_VEC);
              gel(p11, 1) = gmul(gmul(gtrans(H), G), H);
              gel(p11, 2) = gcopy(H);
              gel(p11, 3) = gcopy(gel(H, 1));
              p11 = gerepilecopy(ltop, p11);
              return p11;
            }
            else
            {
              sol = gerepilecopy(ltop, sol);
              return sol;
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 9, &j, &p9, &p10, &A, &M, &sol, &H, &aux, &p11);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 9, &i, &A, &aux, &H, &p6, &p7, &p8, &M, &sol);
    }
  }
  /* LLL loop */
  
  k = gen_2;
  nextk = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p12 = gen_0;
    while (gcmp(k, n) <= 0)
    {
      swap = gen_1;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN p13 = gen_0;
        long l14;
        GEN p15 = gen_0;	  /* vec */
        GEN p16 = gen_0, p17 = gen_0, p18 = gen_0;
        GEN p19 = gen_0;	  /* vec */
        while (!gequal0(swap))
        {
          swap = gen_0;
          /* red(k,k-1); */
          if (!gequal0(q = ground(gcoeff(M, gtos(k), gtos(gsubgs(k, 1))))))
          {
            p13 = gsubgs(k, 2);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN i = gen_0;
              long l20;
              for (i = gen_1; gcmp(i, p13) <= 0; i = gaddgs(i, 1))
              {
                l20 = gtos(gsubgs(k, 1));
                gcoeff(M, gtos(k), gtos(i)) = gsub(gcoeff(M, gtos(k), gtos(i)), gmul(q, gcoeff(M, l20, gtos(i))));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 2, &i, &M);
              }
            }
            l14 = gtos(gsubgs(k, 1));
            gcoeff(M, gtos(k), l14) = gsub(gcoeff(M, gtos(k), l14), q);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN i = gen_0;
              long l21, l22;
              for (i = gen_1; gcmp(i, n) <= 0; i = gaddgs(i, 1))
              {
                l21 = gtos(gsubgs(k, 1));
                gcoeff(A, gtos(k), gtos(i)) = gsub(gcoeff(A, gtos(k), gtos(i)), gmul(q, gcoeff(A, l21, gtos(i))));
                l22 = gtos(gsubgs(k, 1));
                gcoeff(H, gtos(i), gtos(k)) = gsub(gcoeff(H, gtos(i), gtos(k)), gmul(q, gcoeff(H, gtos(i), l22)));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &i, &A, &H);
              }
            }
          }
          /* preparation of swap(k,k-1) */
          
          if (!gequal0(gissquare(di = gmul(gneg(gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1)))), gcoeff(A, gtos(k), gtos(k))))))
          {
            /* di is the determinant of matr */
            /* We find a solution */
            HM = gtrans(ginv(M));
            aux1 = sqrtint(numer(di));
            aux2 = sqrtint(denom(di));
            sol = gadd(gmul(aux1, gel(HM, gtos(gsubgs(k, 1)))), gmul(gmul(aux2, gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1)))), gel(HM, gtos(k))));
            sol = gdiv(sol, content(sol));
            if (!gequal0(base))
            {
              H = gmul(H, completebasis(sol, gen_1));
              aux = gcopy(gel(H, 1));
              gel(H, 1) = gcopy(gel(H, gtos(n)));
              gel(H, gtos(n)) = gneg(aux);
              p15 = cgetg(4, t_VEC);
              gel(p15, 1) = gmul(gmul(gtrans(H), G), H);
              gel(p15, 2) = gcopy(H);
              gel(p15, 3) = gcopy(gel(H, 1));
              p15 = gerepilecopy(ltop, p15);
              return p15;
            }
            else
            {
              p16 = gmul(H, sol);
              p16 = gerepilecopy(ltop, p16);
              return p16;
            }
          }
          /* Reduction [k,k-1]. */
          Mkk1 = gcopy(gcoeff(M, gtos(k), gtos(gsubgs(k, 1))));
          bk1new = gadd(gmul(gsqr(Mkk1), gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1)))), gcoeff(A, gtos(k), gtos(k)));
          if (!gequal0(swap = stoi(gcmp(gabs(bk1new, prec), gmul(c, gabs(gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1))), prec))) < 0)))
            Mkk1new = gdiv(gmul(gneg(Mkk1), gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1)))), bk1new);
          /* Update the matrices after the swap. */
          if (!gequal0(swap))
          {
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN j = gen_0;
              for (j = gen_1; gcmp(j, n) <= 0; j = gaddgs(j, 1))
              {
                aux = gcopy(gcoeff(H, gtos(j), gtos(gsubgs(k, 1))));
                gcoeff(H, gtos(j), gtos(gsubgs(k, 1))) = gcopy(gcoeff(H, gtos(j), gtos(k)));
                gcoeff(H, gtos(j), gtos(k)) = gneg(aux);
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &j, &aux, &H);
              }
            }
            p17 = gsubgs(k, 2);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN j = gen_0;
              for (j = gen_1; gcmp(j, p17) <= 0; j = gaddgs(j, 1))
              {
                aux = gcopy(gcoeff(M, gtos(gsubgs(k, 1)), gtos(j)));
                gcoeff(M, gtos(gsubgs(k, 1)), gtos(j)) = gcopy(gcoeff(M, gtos(k), gtos(j)));
                gcoeff(M, gtos(k), gtos(j)) = gneg(aux);
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &j, &aux, &M);
              }
            }
            p18 = gaddgs(k, 1);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN j = gen_0;
              for (j = p18; gcmp(j, n) <= 0; j = gaddgs(j, 1))
              {
                aux = gcopy(gcoeff(M, gtos(j), gtos(k)));
                gcoeff(M, gtos(j), gtos(k)) = gadd(gneg(gcoeff(M, gtos(j), gtos(gsubgs(k, 1)))), gmul(Mkk1, aux));
                gcoeff(M, gtos(j), gtos(gsubgs(k, 1))) = gadd(aux, gmul(Mkk1new, gcoeff(M, gtos(j), gtos(k))));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &j, &aux, &M);
              }
            }
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN j = gen_0;
              for (j = gen_1; gcmp(j, n) <= 0; j = gaddgs(j, 1))
              {
                if (!gequal(j, k) && !gequal(j, gsubgs(k, 1)))
                {
                  aux = gcopy(gcoeff(A, gtos(gsubgs(k, 1)), gtos(j)));
                  gcoeff(A, gtos(gsubgs(k, 1)), gtos(j)) = gcopy(gcoeff(A, gtos(k), gtos(j)));
                  gcoeff(A, gtos(k), gtos(j)) = gneg(aux);
                  aux = gcopy(gcoeff(A, gtos(j), gtos(gsubgs(k, 1))));
                  gcoeff(A, gtos(j), gtos(gsubgs(k, 1))) = gadd(gmul(Mkk1, aux), gcoeff(A, gtos(j), gtos(k)));
                  gcoeff(A, gtos(j), gtos(k)) = gsub(gneg(aux), gmul(Mkk1new, gcoeff(A, gtos(j), gtos(gsubgs(k, 1)))));
                }
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &j, &aux, &A);
              }
            }
            aux1 = gcopy(gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1))));
            aux2 = gcopy(gcoeff(A, gtos(k), gtos(gsubgs(k, 1))));
            gcoeff(A, gtos(k), gtos(gsubgs(k, 1))) = gsub(gneg(gcoeff(A, gtos(gsubgs(k, 1)), gtos(k))), gmul(Mkk1, aux1));
            gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1))) = gadd(gcoeff(A, gtos(k), gtos(k)), gmul(Mkk1, aux2));
            gcoeff(A, gtos(k), gtos(k)) = gsub(aux1, gmul(Mkk1new, gcoeff(A, gtos(k), gtos(gsubgs(k, 1)))));
            gcoeff(A, gtos(gsubgs(k, 1)), gtos(k)) = gsub(gneg(aux2), gmul(Mkk1new, gcoeff(A, gtos(gsubgs(k, 1)), gtos(gsubgs(k, 1)))));
            gcoeff(M, gtos(k), gtos(gsubgs(k, 1))) = gcopy(Mkk1new);
            if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
            {
              newG = gmul(gmul(gtrans(H), G), H);
              {
                long i;
                p19 = cgetg(gtos(n)+1, t_VEC);
                for (i = 1; gcmpsg(i, n) <= 0; ++i)
                  gel(p19, i) = det(extract0(newG, subis(shifti(gen_1, i), 1), subis(shifti(gen_1, i), 1)));
              }
              pari_printf("%Ps\n", p19);
            }
            if (!gequalgs(k, 2))
              k = gsubgs(k, 1);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 22, &swap, &q, &p13, &M, &A, &H, &di, &HM, &aux1, &aux2, &sol, &aux, &p15, &p16, &Mkk1, &bk1new, &Mkk1new, &p17, &p18, &newG, &p19, &k);
        }
      }
      p12 = gsubgs(k, 2);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN l = gen_0;
        long l23 = -1 > 0;	  /* bool */
        GEN p24 = gen_0;
        for (l = p12; l23?gcmpgs(l, 1) <= 0:gcmpgs(l, 1) >= 0; l = gaddgs(l, -1))
        {
          /* red(k,l) */
          if (!gequal0(q = ground(gcoeff(M, gtos(k), gtos(l)))))
          {
            p24 = gsubgs(l, 1);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN i = gen_0;
              for (i = gen_1; gcmp(i, p24) <= 0; i = gaddgs(i, 1))
              {
                gcoeff(M, gtos(k), gtos(i)) = gsub(gcoeff(M, gtos(k), gtos(i)), gmul(q, gcoeff(M, gtos(l), gtos(i))));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 2, &i, &M);
              }
            }
            gcoeff(M, gtos(k), gtos(l)) = gsub(gcoeff(M, gtos(k), gtos(l)), q);
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN i = gen_0;
              for (i = gen_1; gcmp(i, n) <= 0; i = gaddgs(i, 1))
              {
                gcoeff(A, gtos(k), gtos(i)) = gsub(gcoeff(A, gtos(k), gtos(i)), gmul(q, gcoeff(A, gtos(l), gtos(i))));
                gcoeff(H, gtos(i), gtos(k)) = gsub(gcoeff(H, gtos(i), gtos(k)), gmul(q, gcoeff(H, gtos(i), gtos(l))));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 3, &i, &A, &H);
              }
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 6, &l, &q, &p24, &M, &A, &H);
        }
      }
      k = gaddgs(k, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 17, &swap, &q, &M, &A, &H, &di, &HM, &aux1, &aux2, &sol, &aux, &Mkk1, &bk1new, &Mkk1new, &newG, &k, &p12);
    }
  }
  p3 = cgetg(3, t_VEC);
  gel(p3, 1) = gmul(gmul(gtrans(H), G), H);
  gel(p3, 2) = gcopy(H);
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
kermodp(GEN M, GEN p)	  /* vec */
{
  pari_sp ltop = avma;
  GEN n = gen_0, U = gen_0, d = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  n = stoi(glength(M));
  U = centerlift(matker0(gmul(M, gmodulsg(1, p)), 0));
  d = stoi(glength(U));
  U = completebasis(U, NULL);
  {
    long i, j;
    p1 = cgetg(gtos(n)+1, t_MAT);
    for (j = 1; gcmpsg(j, n) <= 0; ++j)
    {
      gel(p1, j) = cgetg(gtos(n)+1, t_COL);
      for (i = 1; gcmpsg(i, n) <= 0; ++i)
        gcoeff(p1, i, j) = gcopy(gcoeff(U, i, gtos(gsubgs(gaddgs(n, 1), j))));
    }
  }
  U = p1;
  p2 = cgetg(3, t_VEC);
  gel(p2, 1) = gcopy(d);
  gel(p2, 2) = gcopy(U);
  p2 = gerepilecopy(ltop, p2);
  return p2;
}

GEN
Qfparam(GEN G, GEN sol, GEN fl, long prec)
{
  pari_sp ltop = avma;
  GEN U = gen_0, G1 = gen_0, G2 = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0;	  /* vec */
  if (!fl)
    fl = stoi(3);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 5) >= 0)
    pari_printf("     starting Qfparam\n");
  sol = gdiv(sol, content(sol));
  /* build U such that U[,3] = sol, and det(U) = +-1 */
  U = completebasis(sol, gen_1);
  G1 = gmul(gmul(gtrans(U), G), U);
  p1 = cgetg(4, t_MAT);
  gel(p1, 1) = cgetg(4, t_COL);
  gel(p1, 2) = cgetg(4, t_COL);
  gel(p1, 3) = cgetg(4, t_COL);
  gcoeff(p1, 1, 1) = gmulsg(-2, gcoeff(G1, 1, 3));
  gcoeff(p1, 1, 2) = gmulsg(-2, gcoeff(G1, 2, 3));
  gcoeff(p1, 1, 3) = gen_0;
  gcoeff(p1, 2, 1) = gen_0;
  gcoeff(p1, 2, 2) = gmulsg(-2, gcoeff(G1, 1, 3));
  gcoeff(p1, 2, 3) = gmulsg(-2, gcoeff(G1, 2, 3));
  gcoeff(p1, 3, 1) = gcopy(gcoeff(G1, 1, 1));
  gcoeff(p1, 3, 2) = gmulsg(2, gcoeff(G1, 1, 2));
  gcoeff(p1, 3, 3) = gcopy(gcoeff(G1, 2, 2));
  /* G1 has a 0 at the bottom right corner */
  G2 = p1;
  sol = gmul(U, G2);
  p2 = cgetg(3, t_MAT);
  gel(p2, 1) = cgetg(3, t_COL);
  gel(p2, 2) = cgetg(3, t_COL);
  gcoeff(p2, 1, 1) = gcopy(gcoeff(sol, gtos(fl), 1));
  gcoeff(p2, 1, 2) = gdivgs(gcoeff(sol, gtos(fl), 2), 2);
  gcoeff(p2, 2, 1) = gdivgs(gcoeff(sol, gtos(fl), 2), 2);
  gcoeff(p2, 2, 2) = gcopy(gcoeff(sol, gtos(fl), 3));
  if (!gequal0(fl) && (gequal0(gissquare(gneg(det(U = p2))))))
  {
    U = QfbReduce(U, prec);
    p3 = cgetg(4, t_MAT);
    gel(p3, 1) = cgetg(4, t_COL);
    gel(p3, 2) = cgetg(4, t_COL);
    gel(p3, 3) = cgetg(4, t_COL);
    gcoeff(p3, 1, 1) = gsqr(gcoeff(U, 1, 1));
    gcoeff(p3, 1, 2) = gmul(gmulsg(2, gcoeff(U, 1, 2)), gcoeff(U, 1, 1));
    gcoeff(p3, 1, 3) = gsqr(gcoeff(U, 1, 2));
    gcoeff(p3, 2, 1) = gmul(gcoeff(U, 2, 1), gcoeff(U, 1, 1));
    gcoeff(p3, 2, 2) = gadd(gmul(gcoeff(U, 2, 2), gcoeff(U, 1, 1)), gmul(gcoeff(U, 2, 1), gcoeff(U, 1, 2)));
    gcoeff(p3, 2, 3) = gmul(gcoeff(U, 1, 2), gcoeff(U, 2, 2));
    gcoeff(p3, 3, 1) = gsqr(gcoeff(U, 2, 1));
    gcoeff(p3, 3, 2) = gmul(gmulsg(2, gcoeff(U, 2, 1)), gcoeff(U, 2, 2));
    gcoeff(p3, 3, 3) = gsqr(gcoeff(U, 2, 2));
    U = p3;
    sol = gmul(sol, U);
  }
  if (gcmpgs(DEBUGLEVEL_qfsolve, 5) >= 0)
    pari_printf("     end of Qfparam\n");
  sol = gerepilecopy(ltop, sol);
  return sol;
}

GEN
LLLgoon3(GEN G, GEN c, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN red = gen_0, U1 = gen_0, G2 = gen_0, bez = gen_0, U2 = gen_0, G3 = gen_0, cc = gen_0, U3 = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0;	  /* vec */
  if (!c)
    c = gen_1;
  red = IndefiniteLLL(G, c, gen_1, prec);
  p1 = cgetg(4, t_MAT);
  gel(p1, 1) = cgetg(4, t_COL);
  gel(p1, 2) = cgetg(4, t_COL);
  gel(p1, 3) = cgetg(4, t_COL);
  gcoeff(p1, 1, 1) = gen_0;
  gcoeff(p1, 1, 2) = gen_0;
  gcoeff(p1, 1, 3) = gen_1;
  gcoeff(p1, 2, 1) = gen_0;
  gcoeff(p1, 2, 2) = gen_1;
  gcoeff(p1, 2, 3) = gen_0;
  gcoeff(p1, 3, 1) = gen_1;
  gcoeff(p1, 3, 2) = gen_0;
  gcoeff(p1, 3, 3) = gen_0;
  /* We always find an isotropic vector. */
  U1 = p1;
  G2 = gmul(gmul(gtrans(U1), gel(red, 1)), U1);
  /* G2 has a 0 at the bottom right corner. */
  bez = vecbezout(gcoeff(G2, 3, 1), gcoeff(G2, 3, 2));
  p2 = cgetg(4, t_MAT);
  gel(p2, 1) = cgetg(4, t_COL);
  gel(p2, 2) = cgetg(4, t_COL);
  gel(p2, 3) = cgetg(4, t_COL);
  gcoeff(p2, 1, 1) = gcopy(gel(bez, 1));
  gcoeff(p2, 1, 2) = gdiv(gcoeff(G2, 3, 2), gel(bez, 3));
  gcoeff(p2, 1, 3) = gen_0;
  gcoeff(p2, 2, 1) = gcopy(gel(bez, 2));
  gcoeff(p2, 2, 2) = gdiv(gneg(gcoeff(G2, 3, 1)), gel(bez, 3));
  gcoeff(p2, 2, 3) = gen_0;
  gcoeff(p2, 3, 1) = gen_0;
  gcoeff(p2, 3, 2) = gen_0;
  gcoeff(p2, 3, 3) = gen_m1;
  U2 = p2;
  G3 = gmul(gmul(gtrans(U2), G2), U2);
  /* G3 has 0 under the co-diagonal. */
  cc = gmodgs(gcoeff(G3, 1, 1), 2);
  p3 = cgetg(4, t_MAT);
  gel(p3, 1) = cgetg(4, t_COL);
  gel(p3, 2) = cgetg(4, t_COL);
  gel(p3, 3) = cgetg(4, t_COL);
  gcoeff(p3, 1, 1) = gen_1;
  gcoeff(p3, 1, 2) = gen_0;
  gcoeff(p3, 1, 3) = gen_0;
  gcoeff(p3, 2, 1) = gcopy(cc);
  gcoeff(p3, 2, 2) = gen_1;
  gcoeff(p3, 2, 3) = gen_0;
  gcoeff(p3, 3, 1) = ground(gdiv(gdivgs(gneg(gadd(gcoeff(G3, 1, 1), gmul(cc, gadd(gmulsg(2, gcoeff(G3, 1, 2)), gmul(gcoeff(G3, 2, 2), cc))))), 2), gcoeff(G3, 1, 3)));
  gcoeff(p3, 3, 2) = ground(gdiv(gneg(gadd(gcoeff(G3, 1, 2), gmul(cc, gcoeff(G3, 2, 2)))), gcoeff(G3, 1, 3)));
  gcoeff(p3, 3, 3) = gen_1;
  U3 = p3;
  p4 = cgetg(3, t_VEC);
  gel(p4, 1) = gmul(gmul(gtrans(U3), G3), U3);
  gel(p4, 2) = gmul(gmul(gmul(gel(red, 2), U1), U2), U3);
  p4 = gerepilecopy(ltop, p4);
  return p4;
}

GEN
completebasis(GEN v, GEN redflag)
{
  pari_sp ltop = avma;
  GEN U = gen_0, n = gen_0, re = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN p2 = gen_0;
  if (!redflag)
    redflag = gen_0;
  v = gtomat(v);
  n = stoi(glength(gtrans(v)));
  if (gequalgs(n, glength(v)))
  {
    v = gerepilecopy(ltop, v);
    return v;
  }
  U = ginv(gtrans(gel(mathnf0(gtrans(v), 1), 2)));
  if (gequal1(n) || (gequal0(redflag)))
  {
    U = gerepilecopy(ltop, U);
    return U;
  }
  re = lll(extract0(U, subis(shifti(gen_1, gtos(n)), 1), subis(shifti(gen_1, gtos(gsubgs(n, glength(v)))), 1)));
  p1 = cgetg(3, t_VEC);
  gel(p1, 1) = gcopy(re);
  gel(p1, 2) = matid(glength(v));
  p2 = gmul(U, matdiagonalblock(p1));
  p2 = gerepilecopy(ltop, p2);
  return p2;
}

GEN
LLLgoon(GEN G, GEN c, long prec)
{
  pari_sp ltop = avma;
  GEN red = gen_0, U1 = gen_0, G2 = gen_0, U2 = gen_0, G3 = gen_0, n = gen_0, U3 = gen_0, G4 = gen_0, U = gen_0, V = gen_0, B = gen_0, U4 = gen_0, G5 = gen_0, U5 = gen_0, G6 = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0;	  /* vec */
  GEN p5 = gen_0;
  GEN p6 = gen_0;	  /* vec */
  GEN p7 = gen_0, p8 = gen_0;
  GEN p9 = gen_0, p10 = gen_0, p11 = gen_0;	  /* vec */
  if (!c)
    c = gen_1;
  red = IndefiniteLLL(G, c, gen_1, prec);
  /* If no isotropic vector is found, nothing to do. */
  if (glength(red) == 2)
  {
    red = gerepilecopy(ltop, red);
    return red;
  }
  /* otherwise: */
  U1 = gcopy(gel(red, 2));
  G2 = gcopy(gel(red, 1));
  /* On a G2[1,1] = 0 */
  U2 = gcopy(gel(mathnf0(gtomat(rowcopy(G2, 1)), 4), 2));
  G3 = gmul(gmul(gtrans(U2), G2), U2);
  /* The first line of the matrix G3 only contains 0, */
  /* except some 'g' on the right, where g^2| det G. */
  n = stoi(glength(G));
  U3 = matid(gtos(n));
  gcoeff(U3, 1, gtos(n)) = ground(gdivgs(gdiv(gneg(gcoeff(G3, gtos(n), gtos(n))), gcoeff(G3, 1, gtos(n))), 2));
  G4 = gmul(gmul(gtrans(U3), G3), U3);
  p1 = cgetg(3, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gcopy(n);
  p2 = cgetg(3, t_VEC);
  gel(p2, 1) = gen_1;
  gel(p2, 2) = gcopy(n);
  /* The coeff G4[n,n] is reduced modulo 2g */
  U = extract0(G4, p1, p2);
  if (gequalgs(n, 2))
  {
    {
      long l12, l13;
      p3 = cgetg(1, t_MAT);
      for (l13 = 1; l13 <= 0; ++l13)
      {
        gel(p3, l13) = cgetg(3, t_COL);
        for (l12 = 1; l12 <= 2; ++l12)
          gcoeff(p3, l12, l13) = gen_0;
      }
    }
    V = p3;
  }
  else
  {
    p4 = cgetg(3, t_VEC);
    gel(p4, 1) = gen_1;
    gel(p4, 2) = gcopy(n);
    V = extract0(G4, p4, subis(shifti(gen_1, gtos(gsubgs(n, 1))), 2));
  }
  B = ground(gmul(gneg(ginv(U)), V));
  U4 = matid(gtos(n));
  p5 = gsubgs(n, 1);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN j = gen_0;
    for (j = gen_2; gcmp(j, p5) <= 0; j = gaddgs(j, 1))
    {
      gcoeff(U4, 1, gtos(j)) = gcopy(gcoeff(B, 1, gtos(gsubgs(j, 1))));
      gcoeff(U4, gtos(n), gtos(j)) = gcopy(gcoeff(B, 2, gtos(gsubgs(j, 1))));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &j, &U4);
    }
  }
  G5 = gmul(gmul(gtrans(U4), G4), U4);
  /* The last column of G5 is reduced */
  if (gcmpgs(n, 4) < 0)
  {
    p6 = cgetg(3, t_VEC);
    gel(p6, 1) = gcopy(G5);
    gel(p6, 2) = gmul(gmul(gmul(U1, U2), U3), U4);
    p6 = gerepilecopy(ltop, p6);
    return p6;
  }
  p7 = gsubgs(n, 2);
  p8 = gsubgs(n, 2);
  {
    long i, j;
    p9 = cgetg(gtos(p7)+1, t_MAT);
    for (j = 1; gcmpsg(j, p7) <= 0; ++j)
    {
      gel(p9, j) = cgetg(gtos(p8)+1, t_COL);
      for (i = 1; gcmpsg(i, p8) <= 0; ++i)
        gcoeff(p9, i, j) = gcopy(gcoeff(G5, i + 1, j + 1));
    }
  }
  red = LLLgoon(p9, c, prec);
  p10 = cgetg(4, t_VEC);
  gel(p10, 1) = gtomat(gen_1);
  gel(p10, 2) = gcopy(gel(red, 2));
  gel(p10, 3) = gtomat(gen_1);
  U5 = matdiagonalblock(p10);
  G6 = gmul(gmul(gtrans(U5), G5), U5);
  p11 = cgetg(3, t_VEC);
  gel(p11, 1) = gcopy(G6);
  gel(p11, 2) = gmul(gmul(gmul(gmul(U1, U2), U3), U4), U5);
  p11 = gerepilecopy(ltop, p11);
  return p11;
}

GEN
QfWittinvariant(GEN G, GEN p)
{
  pari_sp ltop = avma;
  GEN n = gen_0, det_s = gen_0, diag = gen_0, c = gen_0, p1 = gen_0;
  GEN p2 = gen_0, p3 = gen_0;	  /* vec */
  GEN p4 = gen_0;
  n = stoi(glength(G));
  p1 = gaddgs(n, 1);
  {
    long i, l5, l6;
    GEN p7 = gen_0;	  /* vec */
    p2 = cgetg(gtos(p1)+1, t_VEC);
    for (i = 1; gcmpsg(i, p1) <= 0; ++i)
    {
      l5 = i - 1;
      l6 = i - 1;
      {
        long j, k;
        p7 = cgetg(l5+1, t_MAT);
        for (k = 1; k <= l5; ++k)
        {
          gel(p7, k) = cgetg(l6+1, t_COL);
          for (j = 1; j <= l6; ++j)
            gcoeff(p7, j, k) = gcopy(gcoeff(G, j, k));
        }
      }
      gel(p2, i) = det(p7);
    }
  }
  /* Diagonalize G first. */
  det_s = p2;
  {
    long i;
    p3 = cgetg(gtos(n)+1, t_VEC);
    for (i = 1; gcmpsg(i, n) <= 0; ++i)
      gel(p3, i) = gdiv(gel(det_s, i + 1), gel(det_s, i));
  }
  diag = p3;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0, p8 = gen_0, p9 = gen_0;
    p4 = gen_1;
    for (i = gen_1; gcmp(i, n) <= 0; i = gaddgs(i, 1))
    {
      p8 = gaddgs(i, 1);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN j = gen_0;
        p9 = gen_1;
        for (j = p8; gcmp(j, n) <= 0; j = gaddgs(j, 1))
        {
          p9 = gmulgs(p9, hilbert(gel(diag, gtos(i)), gel(diag, gtos(j)), p));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &p9, &j);
        }
      }
      p4 = gmul(p4, p9);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p4, &i, &p8, &p9);
    }
  }
  /* Then compute Hilbert symbols */
  c = p4;
  c = gerepilecopy(ltop, c);
  return c;
}

GEN
Qflisteinvariants(GEN G, GEN fa, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN l = gen_0, sol = gen_0, n = gen_0, det_s = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2;
  GEN p3 = gen_0, p4 = gen_0;	  /* vec */
  long l5;
  GEN p6 = gen_0, p7 = gen_0;	  /* vec */
  if (!fa)
    fa = cgetg(1, t_VEC);
  G = gcopy(G);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
    pari_printf("    starting Qflisteinvariants %Ps\n", G);
  if (typ(G) != t_VEC)
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(G);
    G = p1;
  }
  l = stoi(glength(G));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN j = gen_0;
    for (j = gen_1; gcmp(j, l) <= 0; j = gaddgs(j, 1))
    {
      if ((typ(gel(G, gtos(j))) == t_QFI) || (typ(gel(G, gtos(j))) == t_QFR))
        gel(G, gtos(j)) = mymat(gel(G, gtos(j)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &j, &G);
    }
  }
  if (!glength(fa))
    fa = gcopy(gel(factor(gneg(gabs(gmulsg(2, det(gel(G, 1))), prec))), 1));
  if (glength(gel(G, 1)) == 2)
  {
    /* In dimension 2, each invariant is a single Hilbert symbol. */
    det_s = gneg(det(gel(G, 1)));
    l2 = glength(fa);
    {
      long i, j;
      p3 = cgetg(gtos(l)+1, t_MAT);
      for (j = 1; gcmpsg(j, l) <= 0; ++j)
      {
        gel(p3, j) = cgetg(l2+1, t_COL);
        for (i = 1; i <= l2; ++i)
          gcoeff(p3, i, j) = stoi(hilbert(gcoeff(gel(G, j), 1, 1), det_s, gel(fa, i)) < 0);
      }
    }
    sol = p3;
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    end of Qflisteinvariants\n");
    p4 = cgetg(3, t_VEC);
    gel(p4, 1) = gcopy(fa);
    gel(p4, 2) = gcopy(sol);
    p4 = gerepilecopy(ltop, p4);
    return p4;
  }
  l5 = glength(fa);
  {
    long l8, l9;
    p6 = cgetg(gtos(l)+1, t_MAT);
    for (l9 = 1; gcmpsg(l9, l) <= 0; ++l9)
    {
      gel(p6, l9) = cgetg(l5+1, t_COL);
      for (l8 = 1; l8 <= l5; ++l8)
        gcoeff(p6, l8, l9) = gen_0;
    }
  }
  sol = p6;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN j = gen_0, p10 = gen_0;
    GEN p11 = gen_0;	  /* vec */
    long l12;
    for (j = gen_1; gcmp(j, l) <= 0; j = gaddgs(j, 1))
    {
      n = stoi(glength(gel(G, gtos(j))));
      p10 = gaddgs(n, 1);
      {
        long i, l13, l14;
        GEN p15 = gen_0;	  /* vec */
        p11 = cgetg(gtos(p10)+1, t_VEC);
        for (i = 1; gcmpsg(i, p10) <= 0; ++i)
        {
          l13 = i - 1;
          l14 = i - 1;
          {
            long k, m;
            p15 = cgetg(l13+1, t_MAT);
            for (m = 1; m <= l13; ++m)
            {
              gel(p15, m) = cgetg(l14+1, t_COL);
              for (k = 1; k <= l14; ++k)
                gcoeff(p15, k, m) = gcopy(gcoeff(gel(G, gtos(j)), k, m));
            }
          }
          gel(p11, i) = det(p15);
        }
      }
      /* In dimension n, we need to compute a product of n Hilbert symbols. */
      det_s = p11;
      l12 = glength(fa);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        GEN p16 = gen_0, p17 = gen_0;
        for (i = 1; i <= l12; ++i)
        {
          p16 = gsubgs(n, 1);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN k = gen_0;
            long l18;
            p17 = gen_1;
            for (k = gen_1; gcmp(k, p16) <= 0; k = gaddgs(k, 1))
            {
              l18 = gtos(gaddgs(k, 1));
              p17 = gmulgs(p17, hilbert(gneg(gel(det_s, gtos(k))), gel(det_s, l18), gel(fa, i)));
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 2, &p17, &k);
            }
          }
          gcoeff(sol, i, gtos(j)) = stoi(gcmpgs(gmulgs(p17, hilbert(gel(det_s, gtos(n)), gel(det_s, gtos(gaddgs(n, 1))), gel(fa, i))), 0) < 0);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 3, &p16, &p17, &sol);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &j, &n, &p10, &p11, &det_s, &sol);
    }
  }
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
    pari_printf("    end of Qflisteinvariants\n");
  p7 = cgetg(3, t_VEC);
  gel(p7, 1) = gcopy(fa);
  gel(p7, 2) = gcopy(sol);
  p7 = gerepilecopy(ltop, p7);
  return p7;
}

GEN
Qfsolvemodp(GEN G, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN n = gen_0, vdet = gen_0, G2 = gen_0, sol = gen_0, x1 = gen_0, x2 = gen_0, x3 = gen_0, N1 = gen_0, N2 = gen_0, N3 = gen_0, s = gen_0, r = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0;	  /* vec */
  n = stoi(glength(G));
  p1 = cgetg(4, t_VEC);
  gel(p1, 1) = gen_0;
  gel(p1, 2) = gen_0;
  gel(p1, 3) = gen_0;
  vdet = p1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p6 = gen_0;	  /* vec */
    for (i = 1; i <= 3; ++i)
    {
      G2 = gmul(extract0(G, subis(shifti(gen_1, i), 1), subis(shifti(gen_1, i), 1)), gmodulsg(1, p));
      if (gequal0(gel(vdet, i) = det(G2)))
      {
        sol = gcopy(gel(gel(kermodp(lift(G2), p), 2), 1));
        {
          long j;
          GEN p7 = gen_0;
          p6 = cgetg(gtos(n)+1, t_COL);
          for (j = 1; gcmpsg(j, n) <= 0; ++j)
          {
            if (j <= i)
              p7 = gcopy(gel(sol, j));
            gel(p6, j) = p7;
          }
        }
        sol = p6;
        sol = gerepilecopy(ltop, sol);
        return sol;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &G2, &vdet, &sol, &p6);
    }
  }
  p2 = cgetg(4, t_COL);
  gel(p2, 1) = gen_1;
  gel(p2, 2) = gen_0;
  gel(p2, 3) = gen_0;
  /* now, solve in dimension 3... */
  /* reduction to the diagonal case: */
  x1 = p2;
  p3 = cgetg(4, t_COL);
  gel(p3, 1) = gneg(gcoeff(G2, 1, 2));
  gel(p3, 2) = gcopy(gcoeff(G2, 1, 1));
  gel(p3, 3) = gen_0;
  x2 = p3;
  p4 = cgetg(4, t_COL);
  gel(p4, 1) = gsub(gmul(gcoeff(G2, 2, 2), gcoeff(G2, 1, 3)), gmul(gcoeff(G2, 2, 3), gcoeff(G2, 1, 2)));
  gel(p4, 2) = gsub(gmul(gcoeff(G2, 1, 1), gcoeff(G2, 2, 3)), gmul(gcoeff(G2, 1, 3), gcoeff(G2, 1, 2)));
  gel(p4, 3) = gsub(gsqr(gcoeff(G2, 1, 2)), gmul(gcoeff(G2, 1, 1), gcoeff(G2, 2, 2)));
  x3 = p4;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (1)
    {
      if (!gequal0(gissquare(N1 = gneg(gel(vdet, 2)))))
      {
        s = gsqrt(N1, prec);
        sol = gadd(gmul(s, x1), x2);
        break;
      }
      if (!gequal0(gissquare(N2 = gdiv(gneg(gel(vdet, 3)), gel(vdet, 1)))))
      {
        s = gsqrt(N2, prec);
        sol = gadd(gmul(s, x2), x3);
        break;
      }
      if (!gequal0(gissquare(N3 = gdiv(gmul(gneg(gel(vdet, 2)), gel(vdet, 3)), gel(vdet, 1)))))
      {
        s = gsqrt(N3, prec);
        sol = gadd(gmul(s, x1), x3);
        break;
      }
      r = gen_1;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (gequal0(gissquare(s = gdiv(gsubsg(1, gmul(N1, gsqr(r))), N3))))
        {
          r = genrand(p);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &s, &r);
        }
      }
      s = gsqrt(s, prec);
      sol = gadd(gadd(x1, gmul(r, x2)), gmul(s, x3));
      break;
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &N1, &s, &sol, &N2, &N3, &r);
    }
  }
  {
    long j;
    GEN p8 = gen_0;
    p5 = cgetg(gtos(n)+1, t_COL);
    for (j = 1; gcmpsg(j, n) <= 0; ++j)
    {
      if (j <= 3)
        p8 = gcopy(gel(sol, j));
      gel(p5, j) = p8;
    }
  }
  sol = p5;
  sol = gerepilecopy(ltop, sol);
  return sol;
}

GEN
Qfminim(GEN G, GEN factdetG, long prec)
{
  pari_sp ltop = avma;
  GEN n = gen_0, factd = gen_0, detG = gen_0, i = gen_0, U = gen_0, vp = gen_0, Ker = gen_0, dimKer = gen_0, Ker2 = gen_0, dimKer2 = gen_0, sol = gen_0, aux = gen_0, p = gen_0, di = gen_0, m = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  if (!factdetG)
    factdetG = gen_0;
  factdetG = gcopy(factdetG);
  n = stoi(glength(G));
  {
    long l3, l4;
    p1 = cgetg(3, t_MAT);
    for (l4 = 1; l4 <= 2; ++l4)
    {
      gel(p1, l4) = cgetg(1, t_COL);
      for (l3 = 1; l3 <= 0; ++l3)
        gcoeff(p1, l3, l4) = gen_0;
    }
  }
  factd = p1;
  if (gequal0(factdetG))
  {
    detG = det(G);
    factdetG = factor(detG);
  }
  i = gen_1;
  U = matid(gtos(n));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p5 = gen_0, p6 = gen_0, p7 = gen_0, p8 = gen_0, p9 = gen_0, p10 = gen_0, p11 = gen_0;	  /* vec */
    GEN p12 = gen_0;
    GEN p13 = gen_0;	  /* vec */
    while (gcmpgs(i, glength(gel(factdetG, 1))) <= 0)
    {
      p = gcopy(gcoeff(factdetG, gtos(i), 1));
      if (gequalm1(p))
      {
        i = gaddgs(i, 1);
        continue;
      }
      vp = gcopy(gcoeff(factdetG, gtos(i), 2));
      if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
        pari_printf("    p = %Ps^%Ps\n", p, vp);
      if (gequal0(vp))
      {
        i = gaddgs(i, 1);
        continue;
      }
      /* The case vp = 1 can be minimized only if n is odd. */
      if (gequal1(vp) && gequal0(gmodgs(n, 2)))
      {
        p5 = cgetg(3, t_VEC);
        gel(p5, 1) = gcopy(p);
        gel(p5, 2) = gen_1;
        factd = gtrans(concat(gtrans(factd), gtrans(gtomat(p5))));
        i = gaddgs(i, 1);
        continue;
      }
      Ker = kermodp(G, p);
      dimKer = gcopy(gel(Ker, 1));
      Ker = gcopy(gel(Ker, 2));
      /* Rem: we must have dimKer <= vp */
      if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
        pari_printf("    dimKer = %Ps\n", dimKer);
      /* trivial case: dimKer = n */
      if (gequal(dimKer, n))
      {
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("     case 0: dimKer = n\n");
        G = gdiv(G, p);
        gcoeff(factdetG, gtos(i), 2) = gsub(gcoeff(factdetG, gtos(i), 2), n);
        continue;
      }
      G = gmul(gmul(gtrans(Ker), G), Ker);
      U = gmul(U, Ker);
      /* 1st case: dimKer < vp */
      /* then the kernel mod p contains a kernel mod p^2 */
      if (gcmp(dimKer, vp) < 0)
      {
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    case 1: dimker < vp\n");
        {
          long j, k;
          p6 = cgetg(gtos(dimKer)+1, t_MAT);
          for (k = 1; gcmpsg(k, dimKer) <= 0; ++k)
          {
            gel(p6, k) = cgetg(gtos(dimKer)+1, t_COL);
            for (j = 1; gcmpsg(j, dimKer) <= 0; ++j)
              gcoeff(p6, j, k) = gdiv(gcoeff(G, j, k), p);
          }
        }
        Ker2 = kermodp(p6, p);
        dimKer2 = gcopy(gel(Ker2, 1));
        Ker2 = gcopy(gel(Ker2, 2));
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN j = gen_0;
          for (j = gen_1; gcmp(j, dimKer2) <= 0; j = gaddgs(j, 1))
          {
            gel(Ker2, gtos(j)) = gdiv(gel(Ker2, gtos(j)), p);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &j, &Ker2);
          }
        }
        p7 = cgetg(3, t_VEC);
        gel(p7, 1) = gcopy(Ker2);
        gel(p7, 2) = matid(gtos(gsub(n, dimKer)));
        Ker2 = matdiagonalblock(p7);
        G = gmul(gmul(gtrans(Ker2), G), Ker2);
        U = gmul(U, Ker2);
        gcoeff(factdetG, gtos(i), 2) = gsub(gcoeff(factdetG, gtos(i), 2), gmulsg(2, dimKer2));
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    end of case 1\n");
        continue;
      }
      /* Now, we have vp = dimKer  */
      /* 2nd case: the dimension of the kernel is >=2 */
      /* and contains an element of norm 0 mod p^2 */
      if ((gcmpgs(dimKer, 2) > 0) || (gequalgs(dimKer, 2) && !gequal0(gissquare(di = gmodulo(gdiv(gsub(gsqr(gcoeff(G, 1, 2)), gmul(gcoeff(G, 1, 1), gcoeff(G, 2, 2))), gsqr(p)), p)))))
      {
        /* search for an element of norm p^2... in the kernel */
        if (gcmpgs(dimKer, 2) > 0)
        {
          if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
            pari_printf("    case 2.1\n");
          dimKer = stoi(3);
          {
            long j, k;
            p8 = cgetg(4, t_MAT);
            for (k = 1; k <= 3; ++k)
            {
              gel(p8, k) = cgetg(4, t_COL);
              for (j = 1; j <= 3; ++j)
                gcoeff(p8, j, k) = gdiv(gcoeff(G, j, k), p);
            }
          }
          sol = Qfsolvemodp(p8, p, prec);
        }
        else
        {
          if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
            pari_printf("    case 2.2\n");
          if (gequal0(gmod(gcoeff(G, 1, 1), gsqr(p))))
          {
            p9 = cgetg(3, t_COL);
            gel(p9, 1) = gen_1;
            gel(p9, 2) = gen_0;
            sol = p9;
          }
          else
          {
            p10 = cgetg(3, t_COL);
            gel(p10, 1) = gadd(gdiv(gneg(gcoeff(G, 1, 2)), p), gsqrt(di, prec));
            gel(p10, 2) = gmodulo(gdiv(gcoeff(G, 1, 1), p), p);
            sol = p10;
          }
        }
        sol = centerlift(sol);
        sol = gdiv(sol, content(sol));
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    sol = %Ps\n", sol);
        {
          long j;
          GEN p14 = gen_0;
          p11 = cgetg(gtos(n)+1, t_COL);
          for (j = 1; gcmpsg(j, n) <= 0; ++j)
          {
            if (gcmpsg(j, dimKer) <= 0)
              p14 = gcopy(gel(sol, j));
            else
              p14 = gen_0;
            gel(p11, j) = p14;
          }
        }
        Ker = p11;
        /* fill with 0's */
        Ker = completebasis(Ker, gen_1);
        gel(Ker, gtos(n)) = gdiv(gel(Ker, gtos(n)), p);
        G = gmul(gmul(gtrans(Ker), G), Ker);
        U = gmul(U, Ker);
        gcoeff(factdetG, gtos(i), 2) = gsubgs(gcoeff(factdetG, gtos(i), 2), 2);
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    end of case 2\n");
        continue;
      }
      /* Now, we have vp = dimKer <= 2  */
      /*   and the kernel contains no vector with norm p^2... */
      
      /* In some cases, exchanging the kernel and the image */
      /* makes the minimization easy. */
      
      m = gsubgs(gdiventgs(gsubgs(n, 1), 2), 1);
      if (((gequal1(vp) && !gequal0(gissquare(gmodulo(gdiv(gmul(gneg(gpow(gen_m1, m, prec)), det(G)), gcoeff(G, 1, 1)), p)))) || ((gequalgs(vp, 2) && gequal1(gmodgs(n, 2))) && (gcmpgs(n, 5) >= 0))) || ((gequalgs(vp, 2) && gequal0(gmodgs(n, 2))) && (gequal0(gissquare(gmodulo(gdiv(gmul(gpow(gen_m1, m, prec), det(G)), gsqr(p)), p))))))
      {
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    case 3\n");
        Ker = matid(gtos(n));
        p12 = gaddgs(dimKer, 1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN j = gen_0;
          for (j = p12; gcmp(j, n) <= 0; j = gaddgs(j, 1))
          {
            gcoeff(Ker, gtos(j), gtos(j)) = gcopy(p);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &j, &Ker);
          }
        }
        G = gdiv(gmul(gmul(gtrans(Ker), G), Ker), p);
        U = gmul(U, Ker);
        gcoeff(factdetG, gtos(i), 2) = gsub(gcoeff(factdetG, gtos(i), 2), gsub(gmulsg(2, dimKer), n));
        if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
          pari_printf("    end of case 3\n");
        continue;
      }
      /* Minimization was not possible se far. */
      /* If n == 3 or 4, this proves the local non-solubility at p. */
      if (gequalgs(n, 3) || gequalgs(n, 4))
      {
        if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
          pari_printf(" no local solution at %Ps\n", p);
        p = gerepilecopy(ltop, p);
        return p;
      }
      if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
        pari_printf("    prime %Ps finished\n", p);
      p13 = cgetg(3, t_VEC);
      gel(p13, 1) = gcopy(p);
      gel(p13, 2) = gcopy(vp);
      factd = gtrans(concat(gtrans(factd), gtrans(gtomat(p13))));
      i = gaddgs(i, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 23, &p, &i, &vp, &p5, &factd, &Ker, &dimKer, &G, &factdetG, &U, &p6, &Ker2, &dimKer2, &p7, &di, &p8, &sol, &p9, &p10, &p11, &m, &p12, &p13);
    }
  }
  /* apply LLL to avoid coefficients explosion */
  aux = lll(U);
  p2 = cgetg(4, t_VEC);
  gel(p2, 1) = gmul(gmul(gtrans(aux), G), aux);
  gel(p2, 2) = gmul(U, aux);
  gel(p2, 3) = gcopy(factd);
  p2 = gerepilecopy(ltop, p2);
  return p2;
}

GEN
mymat(GEN qfb)	  /* vec */
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* vec */
  qfb = gtovec(qfb);
  p1 = cgetg(3, t_MAT);
  gel(p1, 1) = cgetg(3, t_COL);
  gel(p1, 2) = cgetg(3, t_COL);
  gcoeff(p1, 1, 1) = gcopy(gel(qfb, 1));
  gcoeff(p1, 1, 2) = gdivgs(gel(qfb, 2), 2);
  gcoeff(p1, 2, 1) = gdivgs(gel(qfb, 2), 2);
  gcoeff(p1, 2, 2) = gcopy(gel(qfb, 3));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
Qfbsqrtgauss(GEN G, GEN factdetG, long prec)
{
  pari_sp ltop = avma;
  GEN a = gen_0, b = gen_0, c = gen_0, d = gen_0, m = gen_0, n = gen_0, p = gen_0, aux = gen_0, Q1 = gen_0, M = gen_0;
  long l1;
  GEN p2 = gen_0;	  /* vec */
  GEN p3 = gen_0, p4 = gen_0;
  factdetG = gcopy(factdetG);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   starting Qfbsqrtgauss with %Ps%Ps\n", G, factdetG);
  G = gtovec(G);
  a = gcopy(gel(G, 1));
  b = gdivgs(gel(G, 2), 2);
  c = gcopy(gel(G, 3));
  d = gsub(gmul(a, c), gsqr(b));
  /* 1st step: solve m^2 = a (d), m*n = -b (d), n^2 = c (d) */
  m = n = gmodulss(1, 1);
  gcoeff(factdetG, 1, 2) = gsubgs(gcoeff(factdetG, 1, 2), 3);
  l1 = glength(gel(factdetG, 1));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l1; ++i)
    {
      if (gequal0(gcoeff(factdetG, i, 2)))
        continue;
      p = gcopy(gcoeff(factdetG, i, 1));
      if (gequal1(ggcd(a, p)))
      {
        aux = gsqrt(gmodulo(a, p), prec);
        m = chinese(m, aux);
        n = chinese(n, gdiv(gneg(b), aux));
      }
      else
      {
        aux = gsqrt(gmodulo(c, p), prec);
        n = chinese(n, aux);
        m = chinese(m, gdiv(gneg(b), aux));
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p, &aux, &m, &n);
    }
  }
  m = centerlift(m);
  n = centerlift(n);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
  {
    pari_printf("    m = %Ps\n", m);
    pari_printf("    n = %Ps\n", n);
  }
  p2 = cgetg(4, t_MAT);
  gel(p2, 1) = cgetg(4, t_COL);
  gel(p2, 2) = cgetg(4, t_COL);
  gel(p2, 3) = cgetg(4, t_COL);
  gcoeff(p2, 1, 1) = gdiv(gsub(gsqr(n), c), d);
  gcoeff(p2, 1, 2) = gdiv(gadd(gmul(m, n), b), d);
  gcoeff(p2, 1, 3) = gcopy(n);
  gcoeff(p2, 2, 1) = gdiv(gadd(gmul(m, n), b), d);
  gcoeff(p2, 2, 2) = gdiv(gsub(gsqr(m), a), d);
  gcoeff(p2, 2, 3) = gcopy(m);
  gcoeff(p2, 3, 1) = gcopy(n);
  gcoeff(p2, 3, 2) = gcopy(m);
  gcoeff(p2, 3, 3) = gcopy(d);
  /* 2nd step: build Q1, with det=-1 such that Q1(x,y,0) = G(x,y) */
  Q1 = p2;
  Q1 = gneg(matadjoint0(Q1, 0));
  /* 3rd step: reduce Q1 to [0,0,-1;0,1,0;-1,0,0] */
  M = rowcopy(gel(LLLgoon3(Q1, NULL, prec), 2), 3);
  if (gcmpgs(gel(M, 1), 0) < 0)
    M = gneg(M);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   end of Qfbsqrtgauss\n");
  if (!gequal0(gmodgs(gel(M, 1), 2)))
  {
    p3 = Qfb0(gel(M, 1), gmulsg(2, gel(M, 2)), gmulsg(2, gel(M, 3)), NULL, prec);
    p3 = gerepilecopy(ltop, p3);
    return p3;
  }
  else
  {
    p4 = Qfb0(gel(M, 3), gmulsg(-2, gel(M, 2)), gmulsg(2, gel(M, 1)), NULL, prec);
    p4 = gerepilecopy(ltop, p4);
    return p4;
  }
  avma = ltop;
  return gen_0;
}

GEN
class2(GEN D, GEN factdetG, GEN Winvariants, GEN U2, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN factD = gen_0, n = gen_0, rang = gen_0, m = gen_0, listgen = gen_0, vD = gen_0, p = gen_0, vp = gen_0, aux = gen_0, invgen = gen_0, im = gen_0, Ker = gen_0, Kerim = gen_0, listgen2 = gen_0, G2 = gen_0, struct_s = gen_0, E = gen_0, red = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0, p6 = gen_0, p7 = gen_0, p8 = gen_0, p9 = gen_0, p10 = gen_0, p11 = gen_0, p12 = gen_0, p13 = gen_0, p14 = gen_0, p15 = gen_0, p16 = gen_0, p17 = gen_0;	  /* vec */
  factdetG = gcopy(factdetG);
  /* MODI change struct to struct_s */
  /* remove compteur */
  
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" Construction of the 2-class group of discriminant %Ps\n", D);
  if (gequalgs(gmodgs(D, 4), 2) || gequalgs(gmodgs(D, 4), 3))
    pari_err(user, "class2: Discriminant not congruent to 0,1 mod 4");
  if (gequalgs(D, -4))
  {
    p1 = cgetg(3, t_VEC);
    p2 = cgetg(2, t_VEC);
    gel(p2, 1) = gen_1;
    gel(p1, 1) = p2;
    p3 = cgetg(2, t_VEC);
    gel(p3, 1) = Qfb0(gen_1, gen_0, gen_1, NULL, prec);
    gel(p1, 2) = p3;
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  if (gequal0(factdetG))
    factdetG = factor(gmulsg(2, gabs(D, prec)));
  p4 = cgetg(2, t_VEC);
  gel(p4, 1) = gen_m1;
  factD = concat(p4, gtrans(gel(factdetG, 1)));
  if (gequal1(gmodgs(D, 4)))
  {
    D = gmulgs(D, 4);
    gcoeff(factdetG, 1, 2) = gaddgs(gcoeff(factdetG, 1, 2), 2);
  }
  n = stoi(glength(factD));
  rang = gsubgs(n, 3);
  if (gcmpgs(D, 0) > 0)
    m = gaddgs(rang, 1);
  else
    m = rang;
  if (gcmpgs(m, 0) < 0)
    m = gen_0;
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   factD = %Ps\n", factD);
  {
    long l18;
    p5 = cgetg(gtos(m)+1, t_VEC);
    for (l18 = 1; gcmpsg(l18, m) <= 0; ++l18)
      gel(p5, l18) = gen_0;
  }
  listgen = p5;
  if (!gequal0(vD = stoi(ggval(D, gen_2))))
    E = Qfb0(gen_1, gen_0, gdivgs(gneg(D), 4), NULL, prec);
  else
    E = Qfb0(gen_1, gen_1, gdivgs(gsubsg(1, D), 4), NULL, prec);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   E = %Ps\n", E);
  if ((typ(Winvariants) == t_COL) && (gequal0(Winvariants) || (glength(inverseimage(gmul(U2, gmodulss(1, 2)), Winvariants)) > 0)))
  {
    p6 = cgetg(3, t_VEC);
    p7 = cgetg(2, t_VEC);
    gel(p7, 1) = gen_1;
    gel(p6, 1) = p7;
    p8 = cgetg(2, t_VEC);
    gel(p8, 1) = gcopy(E);
    gel(p6, 2) = p8;
    p6 = gerepilecopy(ltop, p6);
    return p6;
  }
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, m) <= 0; i = gaddgs(i, 1))
    {
      /* no need to look at factD[1]=-1, nor factD[2]=2 */
      p = gcopy(gel(factD, gtos(gaddgs(i, 2))));
      vp = stoi(ggval(D, p));
      aux = gpow(p, vp, prec);
      if (!gequal0(vD))
        gel(listgen, gtos(i)) = Qfb0(aux, gen_0, gdiv(gdivgs(gneg(D), 4), aux), NULL, prec);
      else
        gel(listgen, gtos(i)) = Qfb0(aux, aux, gdivgs(gsub(aux, gdiv(D, aux)), 4), NULL, prec);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 5, &i, &p, &vp, &aux, &listgen);
    }
  }
  if (gequalgs(vD, 2) && !gequalgs(gmodgs(D, 16), 4))
  {
    m = gaddgs(m, 1);
    rang = gaddgs(rang, 1);
    p9 = cgetg(2, t_VEC);
    gel(p9, 1) = Qfb0(gen_2, gen_2, gdivgs(gsubsg(4, D), 8), NULL, prec);
    listgen = concat(listgen, p9);
  }
  if (gequalgs(vD, 3))
  {
    m = gaddgs(m, 1);
    rang = gaddgs(rang, 1);
    p10 = cgetg(2, t_VEC);
    gel(p10, 1) = Qfb0(gpow(gen_2, gsubgs(vD, 2), prec), gen_0, gdiv(gneg(D), gpow(gen_2, vD, prec)), NULL, prec);
    listgen = concat(listgen, p10);
  }
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   listgen = %Ps\n", listgen);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
    pari_printf("  rank = %Ps\n", rang);
  if (gequal0(rang))
  {
    p11 = cgetg(3, t_VEC);
    p12 = cgetg(2, t_VEC);
    gel(p12, 1) = gen_1;
    gel(p11, 1) = p12;
    p13 = cgetg(2, t_VEC);
    gel(p13, 1) = gcopy(E);
    gel(p11, 2) = p13;
    p11 = gerepilecopy(ltop, p11);
    return p11;
  }
  invgen = gmul(gel(Qflisteinvariants(listgen, factD, prec), 2), gmodulss(1, 2));
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   invgen = %Ps\n", lift(invgen));
  {
    long i;
    p14 = cgetg(gtos(m)+1, t_VEC);
    for (i = 1; gcmpsg(i, m) <= 0; ++i)
      gel(p14, i) = gen_2;
  }
  /* MODI2.1 */
  
  struct_s = p14;
  im = lift(inverseimage(invgen, matimage0(invgen, 0)));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p19 = gen_0;	  /* vec */
    long l20;
    while ((gcmpsg(glength(im), rang) < 0) || ((typ(Winvariants) == t_COL) && glength(stoi(gequal0(inverseimage(concat(invgen, U2), Winvariants))))))
    {
      Ker = lift(matker0(invgen, 0));
      Kerim = concat(Ker, im);
      {
        long l21;
        p19 = cgetg(gtos(m)+1, t_VEC);
        for (l21 = 1; gcmpsg(l21, m) <= 0; ++l21)
          gel(p19, l21) = gen_0;
      }
      listgen2 = p19;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN i = gen_0;
        for (i = gen_1; gcmp(i, m) <= 0; i = gaddgs(i, 1))
        {
          gel(listgen2, gtos(i)) = gcopy(E);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN j = gen_0;
            for (j = gen_1; gcmp(j, m) <= 0; j = gaddgs(j, 1))
            {
              if (!gequal0(gcoeff(Kerim, gtos(j), gtos(i))))
                gel(listgen2, gtos(i)) = qfbcompraw(gel(listgen2, gtos(i)), gel(listgen, gtos(j)));
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 2, &j, &listgen2);
            }
          }
          if (gcmpgs(gnorml2(gel(Kerim, gtos(i))), 1) > 0)
          {
            red = QfbReduce(aux = mymat(gel(listgen2, gtos(i))), prec);
            aux = gmul(gmul(gtrans(red), aux), red);
            gel(listgen2, gtos(i)) = Qfb0(gcoeff(aux, 1, 1), gmulsg(2, gcoeff(aux, 1, 2)), gcoeff(aux, 2, 2), NULL, prec);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &i, &listgen2, &aux, &red);
        }
      }
      listgen = gcopy(listgen2);
      invgen = gmul(invgen, Kerim);
      if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
        pari_printf("    listgen = %Ps\n", listgen);
      if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
        pari_printf("    invgen = %Ps\n", lift(invgen));
      /* MODI2.1 */
      
      l20 = glength(Ker);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 1; i <= l20; ++i)
        {
          G2 = Qfbsqrtgauss(gel(listgen, i), factdetG, prec);
          gel(struct_s, i) = gshift(gel(struct_s, i), 1);
          gel(listgen, i) = gcopy(G2);
          gel(invgen, i) = gmul(gel(gel(Qflisteinvariants(G2, factD, prec), 2), 1), gmodulss(1, 2));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &G2, &struct_s, &listgen, &invgen);
        }
      }
      if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
        pari_printf("   listgen = %Ps\n", listgen);
      if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
        pari_printf("   invgen = %Ps\n", lift(invgen));
      if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
        pari_printf("   struct = %Ps\n", struct_s);
      /* MODI2.1 */
      
      im = lift(inverseimage(invgen, matimage0(invgen, 0)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 11, &Ker, &Kerim, &p19, &listgen2, &aux, &red, &listgen, &invgen, &G2, &struct_s, &im);
    }
  }
  {
    long l22;
    p15 = cgetg(gtos(rang)+1, t_VEC);
    for (l22 = 1; gcmpsg(l22, rang) <= 0; ++l22)
      gel(p15, l22) = gen_0;
  }
  listgen2 = p15;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, rang) <= 0; i = gaddgs(i, 1))
    {
      gel(listgen2, gtos(i)) = gcopy(E);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN j = gen_0;
        for (j = gen_1; gcmp(j, m) <= 0; j = gaddgs(j, 1))
        {
          if (!gequal0(gcoeff(im, gtos(j), gtos(i))))
            gel(listgen2, gtos(i)) = qfbcompraw(gel(listgen2, gtos(i)), gel(listgen, gtos(j)));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &j, &listgen2);
        }
      }
      if (gcmpgs(gnorml2(gel(im, gtos(i))), 1) > 0)
      {
        red = QfbReduce(aux = mymat(gel(listgen2, gtos(i))), prec);
        aux = gmul(gmul(gtrans(red), aux), red);
        gel(listgen2, gtos(i)) = Qfb0(gcoeff(aux, 1, 1), gmulsg(2, gcoeff(aux, 1, 2)), gcoeff(aux, 2, 2), NULL, prec);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &i, &listgen2, &aux, &red);
    }
  }
  listgen = gcopy(listgen2);
  {
    long i;
    p16 = cgetg(gtos(rang)+1, t_VEC);
    for (i = 1; gcmpsg(i, rang) <= 0; ++i)
      gel(p16, i) = gcopy(gel(struct_s, gtos(gaddgs(gsub(m, rang), i))));
  }
  /* listgen = vector(rang,i,listgen[m-rang+i]); */
  struct_s = p16;
  if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
    pari_printf("  listgen = %Ps\n", listgen);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
    pari_printf("  struct = %Ps\n", struct_s);
  p17 = cgetg(3, t_VEC);
  gel(p17, 1) = gcopy(struct_s);
  gel(p17, 2) = gcopy(listgen);
  p17 = gerepilecopy(ltop, p17);
  return p17;
}

GEN
Qfsolve(GEN G, GEN factD, long prec)
{
  pari_sp ltop = avma;
  GEN n = gen_0, M = gen_0, signG = gen_0, d = gen_0, Min = gen_0, U = gen_0, codim = gen_0, aux = gen_0, G1 = gen_0, detG1 = gen_0, M1 = gen_0, subspace1 = gen_0, G2 = gen_0, subspace2 = gen_0, M2 = gen_0, solG2 = gen_0, Winvariants = gen_0, dQ = gen_0, factd = gen_0, U2 = gen_0, clgp2 = gen_0, V = gen_0, detG2 = gen_0, dimseti = gen_0, solG1 = gen_0, sol = gen_0, Q = gen_0, p1 = gen_0;
  GEN p2 = gen_0;	  /* vec */
  GEN p3 = gen_0, p4 = gen_0, p5 = gen_0;
  GEN p6 = gen_0;	  /* vec */
  long l7;
  GEN p8 = gen_0;
  GEN p9 = gen_0;	  /* vec */
  GEN p10 = gen_0;
  GEN p11 = gen_0;	  /* vec */
  GEN p12 = gen_0, p13 = gen_0;
  GEN p14 = gen_0, p15 = gen_0;	  /* vec */
  long l16;
  GEN p17 = gen_0;	  /* vec */
  long l18, l19, l20;
  GEN p21 = gen_0;
  long l22;
  GEN p23 = gen_0;	  /* vec */
  long l24;
  long l25;	  /* bool */
  long l26;
  GEN p27 = gen_0;	  /* vec */
  long l28;
  GEN p29 = gen_0;	  /* vec */
  long l30;
  GEN p31 = gen_0;	  /* vec */
  long l32;
  GEN p33 = gen_0, p34 = gen_0;
  GEN p35 = gen_0;	  /* vec */
  long l36;
  GEN p37 = gen_0;	  /* vec */
  factD = gcopy(factD);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" starting Qfsolve\n");
  /* */
  /* 1st reduction of the coefficients of G */
  /* */
  
  n = stoi(glength(G));
  d = det(G);
  if (gequal0(d))
  {
    p1 = gcopy(gel(matker0(G, 0), 1));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  M = IndefiniteLLL(G, NULL, NULL, prec);
  if (typ(M) == t_COL)
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" solution %Ps\n", M);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" end of Qfsolve\n");
    M = gerepilecopy(ltop, M);
    return M;
  }
  G = gcopy(gel(M, 1));
  M = gcopy(gel(M, 2));
  /* Real solubility */
  signG = qfsign(G);
  if (gequal0(gel(signG, 1)) || gequal0(gel(signG, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" no real solution\n");
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" end of Qfsolve\n");
    avma = ltop;
    return gen_m1;
  }
  if (gcmp(gel(signG, 1), gel(signG, 2)) < 0)
  {
    G = gneg(G);
    p2 = cgetg(3, t_MAT);
    gel(p2, 1) = cgetg(3, t_COL);
    gel(p2, 2) = cgetg(3, t_COL);
    gcoeff(p2, 1, 1) = gen_0;
    gcoeff(p2, 1, 2) = gen_1;
    gcoeff(p2, 2, 1) = gen_1;
    gcoeff(p2, 2, 2) = gen_0;
    signG = gmul(signG, p2);
  }
  /* Factorization of the determinant */
  if (gequal0(factD))
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" factorization of the determinant\n");
    factD = factor(gneg(gabs(gmulsg(2, d), prec)));
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf("%Ps\n", factD);
  }
  gcoeff(factD, 1, 2) = gen_0;
  gcoeff(factD, 2, 2) = gsubgs(gcoeff(factD, 2, 2), 1);
  /* */
  /* Minimization and local solubility */
  /* */
  
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" minimization of the determinant\n");
  Min = Qfminim(G, factD, prec);
  if (typ(Min) == t_INT)
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" no local solution at %Ps\n", Min);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" end of Qfsolve\n");
    Min = gerepilecopy(ltop, Min);
    return Min;
  }
  M = gmul(M, gel(Min, 2));
  G = gcopy(gel(Min, 1));
  /*  Min[3] contains the factorization of abs(matdet(G)); */
  
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
    pari_printf("    G minim = %Ps\n", G);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
    pari_printf("    d = %Ps\n", d);
  /* Now, we know that local solutions exist */
  /* (except maybe at 2 if n==4), */
  /* if n==3, det(G) = +-1 */
  /* if n==4, or n is odd, det(G) is squarefree. */
  /* if n>=6, det(G) has all its valuations <=2. */
  
  /* Reduction of G and search for trivial solutions. */
  /* When det G=+-1, such trivial solutions always exist. */
  
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" reduction\n");
  U = IndefiniteLLL(G, NULL, NULL, prec);
  if (typ(U) == t_COL)
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" solution = %Ps\n", gmul(M, U));
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" end of Qfsolve\n");
    p3 = gmul(M, U);
    p3 = gerepilecopy(ltop, p3);
    return p3;
  }
  G = gcopy(gel(U, 1));
  M = gmul(M, gel(U, 2));
  /* */
  /* If n >= 6 is even, need to increment the dimension by 1 */
  /* to suppress all the squares of det(G). */
  /* */
  
  if (((gcmpgs(n, 6) >= 0) && gequal0(gmodgs(n, 2))) && !gequalgs(gel(matsize(gel(Min, 3)), 1), 0))
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf(" increase the dimension by 1 = %Ps\n", gaddgs(n, 1));
    codim = gen_1;
    n = gaddgs(n, 1);
    p4 = gcopy(gel(matsize(gel(Min, 3)), 1));
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0, p38 = gen_0;
      p5 = gen_1;
      for (i = gen_1; gcmp(i, p4) <= 0; i = gaddgs(i, 1))
      {
        if (gequalgs(gcoeff(gel(Min, 3), gtos(i), 1), 2))
          p38 = gcopy(gcoeff(gel(Min, 3), gtos(i), 1));
        else
          p38 = gen_1;
        p5 = gmul(p5, p38);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 3, &p38, &p5, &i);
      }
    }
    /* largest square divisor of d. */
    aux = p5;
    /* Choose the sign of aux such that the signature of G1 */
    /* is as balanced as possible */
    if (gcmp(gel(signG, 1), gel(signG, 2)) > 0)
    {
      gel(signG, 2) = gaddgs(gel(signG, 2), 1);
      aux = gneg(aux);
    }
    else
      gel(signG, 1) = gaddgs(gel(signG, 1), 1);
    p6 = cgetg(3, t_VEC);
    gel(p6, 1) = gcopy(G);
    gel(p6, 2) = gtomat(aux);
    G1 = matdiagonalblock(p6);
    detG1 = gmulsg(2, det(G1));
    l7 = glength(gel(factD, 1));
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 2; i <= l7; ++i)
      {
        gcoeff(factD, i, 2) = stoi(ggval(detG1, gcoeff(factD, i, 1)));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          factD = gerepilecopy(btop, factD);
      }
    }
    gcoeff(factD, 2, 2) = gsubgs(gcoeff(factD, 2, 2), 1);
    Min = Qfminim(G1, factD, prec);
    G1 = gcopy(gel(Min, 1));
    M1 = gcopy(gel(Min, 2));
    p8 = gsubgs(n, 1);
    {
      long i, j;
      p9 = cgetg(gtos(p8)+1, t_MAT);
      for (j = 1; gcmpsg(j, p8) <= 0; ++j)
      {
        gel(p9, j) = cgetg(gtos(n)+1, t_COL);
        for (i = 1; gcmpsg(i, n) <= 0; ++i)
          gcoeff(p9, i, j) = stoi(i == j);
      }
    }
    subspace1 = p9;
  }
  else
  {
    codim = gen_0;
    G1 = gcopy(G);
    subspace1 = M1 = matid(gtos(n));
  }
  /* Now, d is squarefree */
  
  /*  */
  /* If d is not +-1, need to increment the dimension by 2 */
  /* */
  
  if (gequal0(gel(matsize(gel(Min, 3)), 1)))
  {
    /* if( abs(d) == 1, */
    if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
      pari_printf("  detG2 = 1\n");
    G2 = G1;
    subspace2 = M2 = matid(gtos(n));
    solG2 = LLLgoon(G2, gen_1, prec);
  }
  else
  {
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
      pari_printf("  increase the dimension by 2 = %Ps\n", gaddgs(n, 2));
    codim = gaddgs(codim, 2);
    p10 = gaddgs(n, 2);
    {
      long i, j;
      p11 = cgetg(gtos(n)+1, t_MAT);
      for (j = 1; gcmpsg(j, n) <= 0; ++j)
      {
        gel(p11, j) = cgetg(gtos(p10)+1, t_COL);
        for (i = 1; gcmpsg(i, p10) <= 0; ++i)
          gcoeff(p11, i, j) = stoi(i == j);
      }
    }
    subspace2 = p11;
    p12 = gcopy(gel(matsize(gel(Min, 3)), 1));
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      p13 = gen_1;
      for (i = gen_1; gcmp(i, p12) <= 0; i = gaddgs(i, 1))
      {
        p13 = gmul(p13, gcoeff(gel(Min, 3), gtos(i), 1));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &p13, &i);
      }
    }
    d = p13;
    /* d = abs(matdet(G1)); */
    if (gequal1(gmodgs(gel(signG, 2), 2)))
      d = gneg(d);
    /* d = matdet(G1); */
    if (gequalgs(gcoeff(gel(Min, 3), 1, 1), 2))
    {
      p14 = cgetg(2, t_VEC);
      gel(p14, 1) = gen_m1;
      factD = p14;
    }
    else
    {
      p15 = cgetg(3, t_VEC);
      gel(p15, 1) = gen_m1;
      gel(p15, 2) = gen_2;
      factD = p15;
    }
    /* if d is even ... */
    factD = concat(factD, gtrans(gel(gel(Min, 3), 1)));
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    factD = %Ps\n", factD);
    /* Solubility at 2 (this is the only remaining bad prime). */
    if (gequalgs(n, 4) && gequal1(gmodgs(d, 8)))
      if (gequal1(QfWittinvariant(G, gen_2)))
      {
        if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
          pari_printf(" no local solution at 2\n");
        if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
          pari_printf(" end of Qfsolve\n");
        avma = ltop;
        return gen_2;
      }
    l16 = glength(factD);
    {
      long l39;
      p17 = cgetg(l16+1, t_COL);
      for (l39 = 1; l39 <= l16; ++l39)
        gel(p17, l39) = gen_0;
    }
    /* */
    /* Build a binary quadratic form with given invariants */
    /* */
    Winvariants = p17;
    /* choose the signature of Q. */
    /* (real invariant and sign of the discriminant) */
    dQ = gabs(d, prec);
    if (gequal(gel(signG, 1), gel(signG, 2)))
    {
      dQ = dQ;
      gel(Winvariants, 1) = gen_0;
    }
    /* signQ = [1,1]; */
    if (gcmp(gel(signG, 1), gel(signG, 2)) > 0)
    {
      dQ = gneg(dQ);
      gel(Winvariants, 1) = gen_0;
    }
    /* signQ = [2,0]; */
    if (gequalgs(n, 4) && !gequalgs(gmodgs(dQ, 4), 1))
      dQ = gmulgs(dQ, 4);
    if (gcmpgs(n, 5) >= 0)
      dQ = gmulgs(dQ, 8);
    /* p-adic invariants */
    /* for p = 2, the choice is fixed from the product formula */
    if (gequalgs(n, 4))
    {
      if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
        pari_printf(" compute the local invariants of G1\n");
      aux = gcopy(gel(gel(Qflisteinvariants(gneg(G1), factD, prec), 2), 1));
      l18 = glength(factD);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 3; i <= l18; ++i)
        {
          gel(Winvariants, i) = gcopy(gel(aux, i));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            Winvariants = gerepilecopy(btop, Winvariants);
        }
      }
    }
    else
    {
      aux = gdiv(gmul(gpow(gen_m1, gdivgs(gsubgs(n, 3), 2), prec), dQ), d);
      /* ici aux = 8 ou -8 */
      l19 = glength(factD);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 3; i <= l19; ++i)
        {
          gel(Winvariants, i) = stoi(hilbert(aux, gel(factD, i), gel(factD, i)) > 0);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            Winvariants = gerepilecopy(btop, Winvariants);
        }
      }
    }
    l20 = glength(factD);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      p21 = gen_0;
      for (i = 1; i <= l20; ++i)
      {
        p21 = gadd(p21, gel(Winvariants, i));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          p21 = gerepilecopy(btop, p21);
      }
    }
    gel(Winvariants, 2) = gmodgs(p21, 2);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    {
      pari_printf(" Search for a binary quadrativ form of discriminant = %Ps\n", dQ);
      pari_printf(" and Witt invariants = %Ps\n", Winvariants);
    }
    l22 = glength(factD) - 1;
    {
      long l40, l41;
      p23 = cgetg(3, t_MAT);
      for (l41 = 1; l41 <= 2; ++l41)
      {
        gel(p23, l41) = cgetg(l22+1, t_COL);
        for (l40 = 1; l40 <= l22; ++l40)
          gcoeff(p23, l40, l41) = gen_0;
      }
    }
    /* Construction of the 2-class group of discriminant dQ */
    /* until some product of the generators gives the desired invariants. */
    /* In dim 4, need to look among the form of the type q or 2*q */
    /* because Q might be imprimitive. */
    
    factd = p23;
    l24 = glength(factD) - 1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      for (i = gen_1; gcmpgs(i, l24) <= 0; i = gaddgs(i, 1))
      {
        gcoeff(factd, gtos(i), 1) = gcopy(gel(factD, gtos(gaddgs(i, 1))));
        gcoeff(factd, gtos(i), 2) = stoi(ggval(dQ, gcoeff(factd, gtos(i), 1)));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &i, &factd);
      }
    }
    gcoeff(factd, 1, 2) = gaddgs(gcoeff(factd, 1, 2), 1);
    l25 = gequalgs(n, 4);
    l26 = glength(factD);
    {
      long i, j;
      p27 = cgetg(l25+1, t_MAT);
      for (j = 1; j <= l25; ++j)
      {
        gel(p27, j) = cgetg(l26+1, t_COL);
        for (i = 1; i <= l26; ++i)
          gcoeff(p27, i, j) = stoi(hilbert(gen_2, dQ, gel(factD, i)) < 0);
      }
    }
    U2 = p27;
    clgp2 = class2(dQ, factd, Winvariants, U2, prec);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    clgp2 = %Ps\n", clgp2);
    clgp2 = gcopy(gel(clgp2, 2));
    U = gcopy(gel(Qflisteinvariants(clgp2, factD, prec), 2));
    if (gequalgs(n, 4))
      U = concat(U, U2);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    U = %Ps\n", U);
    /* MODI2.1 */
    
    V = lift(inverseimage(gmul(U, gmodulss(1, 2)), gmul(Winvariants, gmodulss(1, 2))));
    /*    if( !length(V), next); */ /* MODI 1 */
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    V = %Ps\n", V);
    if (gequal1(gmodgs(dQ, 2)))
      Q = primeform(gmulsg(4, dQ), gen_1, prec);
    else
      Q = primeform(dQ, gen_1, prec);
    l28 = glength(clgp2);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 1; i <= l28; ++i)
      {
        if (!gequal0(gel(V, i)))
          Q = qfbcompraw(Q, gel(clgp2, i));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          Q = gerepilecopy(btop, Q);
      }
    }
    Q = mymat(Q);
    if (gcmpgs(gnorml2(V), 1) > 0)
    {
      aux = QfbReduce(Q, prec);
      Q = gmul(gmul(gtrans(aux), Q), aux);
    }
    if (gequalgs(n, 4) && !gequal0(gel(V, glength(V))))
      Q = gmulgs(Q, 2);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
      pari_printf("  Q = %Ps\n", Q);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
      pari_printf("   Witt invariants of Q = %Ps\n", Qflisteinvariants(Q, factD, prec));
    p29 = cgetg(3, t_VEC);
    gel(p29, 1) = gcopy(G1);
    gel(p29, 2) = gneg(Q);
    /* */
    /* Build a form of dim=n+2 potentially unimodular */
    /* */
    
    G2 = matdiagonalblock(p29);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    G2 = %Ps\n", G2);
    if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
      pari_printf("  minimization of the form of dimension %ld\n", glength(G2));
    /* Minimization of G2 */
    detG2 = det(G2);
    l30 = glength(factD) - 1;
    {
      long l42, l43;
      p31 = cgetg(3, t_MAT);
      for (l43 = 1; l43 <= 2; ++l43)
      {
        gel(p31, l43) = cgetg(l30+1, t_COL);
        for (l42 = 1; l42 <= l30; ++l42)
          gcoeff(p31, l42, l43) = gen_0;
      }
    }
    factd = p31;
    l32 = glength(factD) - 1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      for (i = gen_1; gcmpgs(i, l32) <= 0; i = gaddgs(i, 1))
      {
        gcoeff(factd, gtos(i), 2) = stoi(ggval(detG2, gcoeff(factd, gtos(i), 1) = gcopy(gel(factD, gtos(gaddgs(i, 1))))));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &i, &factd);
      }
    }
    if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
      pari_printf("   det(G2) = %Ps\n", factd);
    Min = Qfminim(G2, factd, prec);
    M2 = gcopy(gel(Min, 2));
    G2 = gcopy(gel(Min, 1));
    if (gcmpgs(gabs(det(G2), prec), 2) > 0)
      pari_err(user, "Qfsolve: det(G2) <> +-1 *******");
    if (gcmpgs(DEBUGLEVEL_qfsolve, 4) >= 0)
      pari_printf("    G2 = %Ps\n", G2);
    /* Now, we have det(G2) = +-1 */
    
    /* Find a seti for G2 (Totally isotropic subspace, Sous-Espace Totalement Isotrope) */
    if (gcmpgs(DEBUGLEVEL_qfsolve, 2) >= 0)
      pari_printf("  Search a subspace of solutions for G2\n");
    solG2 = LLLgoon(G2, gen_1, prec);
    p33 = gaddgs(codim, 1);
    p34 = gaddgs(codim, 1);
    {
      long i, j;
      p35 = cgetg(gtos(p33)+1, t_MAT);
      for (j = 1; gcmpsg(j, p33) <= 0; ++j)
      {
        gel(p35, j) = cgetg(gtos(p34)+1, t_COL);
        for (i = 1; gcmpsg(i, p34) <= 0; ++i)
          gcoeff(p35, i, j) = gcopy(gcoeff(gel(solG2, 1), i, j));
      }
    }
    if (!gequalgs(p35, 0))
      pari_err(user, "Qfsolve: not enough solutions in G2");
  }
  /* G2 must have a subspace of solutions of dimension > codim */
  dimseti = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p44 = gen_0, p45 = gen_0;
    GEN p46 = gen_0;	  /* vec */
    for(;;)
    {
      p44 = gaddgs(dimseti, 1);
      p45 = gaddgs(dimseti, 1);
      {
        long i, j;
        p46 = cgetg(gtos(p44)+1, t_MAT);
        for (j = 1; gcmpsg(j, p44) <= 0; ++j)
        {
          gel(p46, j) = cgetg(gtos(p45)+1, t_COL);
          for (i = 1; gcmpsg(i, p45) <= 0; ++i)
            gcoeff(p46, i, j) = gcopy(gcoeff(gel(solG2, 1), i, j));
        }
      }
      if (!gequal0(p46))
        break;
      dimseti = gaddgs(dimseti, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p44, &p45, &p46, &dimseti);
    }
  }
  if (gcmp(dimseti, codim) <= 0)
    pari_err(user, "Qfsolve: not enough solutions for G2");
  l36 = glength(G2);
  {
    long i, j;
    p37 = cgetg(gtos(dimseti)+1, t_MAT);
    for (j = 1; gcmpsg(j, dimseti) <= 0; ++j)
    {
      gel(p37, j) = cgetg(l36+1, t_COL);
      for (i = 1; i <= l36; ++i)
        gcoeff(p37, i, j) = gcopy(gcoeff(gel(solG2, 2), i, j));
    }
  }
  solG2 = p37;
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   solG2 = %Ps\n", solG2);
  /* The solution of G1 is simultaneously in solG2 and subspace2 */
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" Reconstruction of a solution of G1\n");
  solG1 = intersect(subspace2, gmul(M2, solG2));
  solG1 = gmul(gtrans(subspace2), solG1);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   solG1 = %Ps\n", solG1);
  /* The solution of G is simultaneously in solG and subspace1 */
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" Reconstruction of a solution of G\n");
  sol = intersect(subspace1, gmul(M1, solG1));
  sol = gmul(gtrans(subspace1), sol);
  sol = gmul(M, sol);
  sol = gdiv(sol, content(sol));
  if (glength(sol) == 1)
    sol = gcopy(gel(sol, 1));
  if (gcmpgs(DEBUGLEVEL_qfsolve, 3) >= 0)
    pari_printf("   sol = %Ps\n", sol);
  if (gcmpgs(DEBUGLEVEL_qfsolve, 1) >= 0)
    pari_printf(" end of Qfsolve\n");
  sol = gerepilecopy(ltop, sol);
  return sol;
}

GEN
matdiagonalblock(GEN v)
{
  pari_sp ltop = avma;
  GEN lv = gen_0, lt = gen_0, M = gen_0, p1 = gen_0;
  GEN p2 = gen_0;	  /* vec */
  lv = stoi(glength(v));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    p1 = gen_0;
    for (i = gen_1; gcmp(i, lv) <= 0; i = gaddgs(i, 1))
    {
      p1 = gaddgs(p1, glength(gel(v, gtos(i))));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p1, &i);
    }
  }
  lt = p1;
  {
    long l3, l4;
    p2 = cgetg(gtos(lt)+1, t_MAT);
    for (l4 = 1; gcmpsg(l4, lt) <= 0; ++l4)
    {
      gel(p2, l4) = cgetg(gtos(lt)+1, t_COL);
      for (l3 = 1; gcmpsg(l3, lt) <= 0; ++l3)
        gcoeff(p2, l3, l4) = gen_0;
    }
  }
  M = p2;
  lt = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    long l5;
    for (i = gen_1; gcmp(i, lv) <= 0; i = gaddgs(i, 1))
    {
      l5 = glength(gel(v, gtos(i)));
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j, l6;
        for (j = 1; j <= l5; ++j)
        {
          l6 = glength(gel(v, gtos(i)));
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long k;
            for (k = 1; k <= l6; ++k)
            {
              gcoeff(M, gtos(gaddgs(lt, j)), gtos(gaddgs(lt, k))) = gcopy(gcoeff(gel(v, gtos(i)), j, k));
              if (low_stack(st_lim, stack_lim(btop, 1)))
                M = gerepilecopy(btop, M);
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            M = gerepilecopy(btop, M);
        }
      }
      lt = gaddgs(lt, glength(gel(v, gtos(i))));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &i, &M, &lt);
    }
  }
  M = gerepilecopy(ltop, M);
  return M;
}

GEN
ellchangecurveinverse(GEN ell, GEN v)	  /* ell */
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* ell */
  p1 = ellchangecurve(ell, ellinverturst(v));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
ellchangepointinverse(GEN pt, GEN v)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  p1 = ellchangepoint(pt, ellinverturst(v));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
ellcomposeurst(GEN urst1, GEN urst2)	  /* vec */
{
  pari_sp ltop = avma;
  GEN u1 = gen_0, r1 = gen_0, s1 = gen_0, t1 = gen_0, u2 = gen_0, r2 = gen_0, s2 = gen_0, t2 = gen_0;
  GEN p1 = gen_0;	  /* vec */
  t2 = gcopy(gel(urst2, 4));
  s2 = gcopy(gel(urst2, 3));
  r2 = gcopy(gel(urst2, 2));
  u2 = gcopy(gel(urst2, 1));
  t1 = gcopy(gel(urst1, 4));
  s1 = gcopy(gel(urst1, 3));
  r1 = gcopy(gel(urst1, 2));
  u1 = gcopy(gel(urst1, 1));
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = gmul(u1, u2);
  gel(p1, 2) = gadd(gmul(gsqr(u1), r2), r1);
  gel(p1, 3) = gadd(gmul(u1, s2), s1);
  gel(p1, 4) = gadd(gadd(gmul(gpowgs(u1, 3), t2), gmul(gmul(s1, gsqr(u1)), r2)), t1);
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
ellinverturst(GEN urst)	  /* vec */
{
  pari_sp ltop = avma;
  GEN u = gen_0, r = gen_0, s = gen_0, t = gen_0;
  GEN p1 = gen_0;	  /* vec */
  t = gcopy(gel(urst, 4));
  s = gcopy(gel(urst, 3));
  r = gcopy(gel(urst, 2));
  u = gcopy(gel(urst, 1));
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = ginv(u);
  gel(p1, 2) = gdiv(gneg(r), gsqr(u));
  gel(p1, 3) = gdiv(gneg(s), u);
  gel(p1, 4) = gdiv(gsub(gmul(r, s), t), gpowgs(u, 3));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
mysubst(GEN polsu, GEN subsx)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0, p2 = gen_0;
  if (typ(lift(polsu)) == t_POL)
  {
    p1 = simplify(gsubst(lift(polsu), gvar(gpolvar(lift(polsu))), subsx));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  else
  {
    p2 = simplify(lift(polsu));
    p2 = gerepilecopy(ltop, p2);
    return p2;
  }
  avma = ltop;
  return gen_0;
}

GEN
degre(GEN idegre)
{
  pari_sp ltop = avma;
  GEN ideg = gen_0, jdeg = gen_0;
  ideg = gcopy(idegre);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (signe(ideg = gshift(ideg, -1)))
    {
      jdeg = gaddgs(jdeg, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &ideg, &jdeg);
    }
  }
  jdeg = gerepilecopy(ltop, jdeg);
  return jdeg;
}

long
nfissquare(GEN nf, GEN a, long prec)	  /* bool */
{
  pari_sp ltop = avma;
  long l1;	  /* bool */
  l1 = (lg(nfsqrt(nf, a, prec))-1) > 0;
  avma = ltop;
  return l1;
}

GEN
nfsqrt(GEN nf, GEN a, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN alift = gen_0, ta = gen_0, py = gen_0, pfact = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0;	  /* vec */
  GEN p4 = gen_0;	  /* int */
  GEN x = pol_x(fetch_user_var("x")), y = pol_x(fetch_user_var("y"));
  GEN p5 = gen_0, p6 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     starting nfsqrt %Ps\n", a);
  if (gequal0(a) || gequal1(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfsqrt %Ps\n", a);
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(a);
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  alift = lift(a);
  ta = strtoGENstr(type_name(typ(a)));
  if (!degree(alift))
    alift = polcoeff0(alift, 0, -1);
  if (typ(alift) != t_POL)
    if (!gequal0(gissquare(alift)))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("     end of nfsqrt %Ps\n", sqrtrat(alift));
      p2 = cgetg(2, t_VEC);
      gel(p2, 1) = sqrtrat(alift);
      p2 = gerepilecopy(ltop, p2);
      return p2;
    }
  if (degree(member_pol(nf)) <= 1)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfsqrt %Ps\n", cgetg(1, t_VEC));
    p3 = cgetg(1, t_VEC);
    p3 = gerepilecopy(ltop, p3);
    return p3;
  }
  if (gequal(ta, strtoGENstr("t_POL")))
    a = gmodulo(a, member_pol(nf));
  /* the real embeddings must all be >0  */
  
  p4 = icopy(member_r1(nf));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    GEN p7 = gen_0;	  /* vec */
    for (i = gen_1; gcmp(i, p4) <= 0; i = gaddgs(i, 1))
    {
      /* MODI: in ell.gp, nfsign_s(nf,a,i) < 0 so replaced. Both correct
      or only one ? */
      /*    py = mysubst(alift,nf.roots[i]);
      if( sign(py) < 0, */
      if (nfsign_s(nf, a, i, prec) < 0)
      {
        if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
          pari_printf("     end of nfsqrt %Ps\n", cgetg(1, t_VEC));
        p7 = cgetg(1, t_VEC);
        p7 = gerepilecopy(ltop, p7);
        return p7;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &p7);
    }
  }
  /* factorization over nf of the polynomial X^2-a */
  
  if (gequal(gpolvar(member_pol(nf)), x))
  {
    py = gsubst(member_pol(nf), gvar(x), y);
    pfact = lift(gcoeff(polfnf(gsub(gsqr(x), mysubst(alift, gmodulo(y, py))), py), 1, 1));
  }
  else
    pfact = lift(gcoeff(polfnf(gsub(gsqr(x), a), member_pol(nf)), 1, 1));
  if (degree(pfact) == 2)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfsqrt %Ps\n", cgetg(1, t_VEC));
    p5 = cgetg(1, t_VEC);
    p5 = gerepilecopy(ltop, p5);
    return p5;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of nfsqrt %Ps\n", pfact);
  p6 = cgetg(2, t_VEC);
  gel(p6, 1) = gsubst(polcoeff0(pfact, 0, -1), gvar(y), gmodulo(gpolvar(member_pol(nf)), member_pol(nf)));
  p6 = gerepilecopy(ltop, p6);
  return p6;
}

GEN
sqrtrat(GEN a)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  p1 = gdiv(sqrtint(numer(a)), sqrtint(denom(a)));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
polratroots(GEN pol)
{
  pari_sp ltop = avma;
  GEN f = gen_0, ans = gen_0;
  long l1;
  f = gcopy(gel(factor(pol), 1));
  ans = cgetg(1, t_VEC);
  l1 = glength(f);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long j;
    GEN p2 = gen_0;	  /* vec */
    for (j = 1; j <= l1; ++j)
    {
      if (degree(gel(f, j)) == 1)
      {
        p2 = cgetg(2, t_VEC);
        gel(p2, 1) = gdiv(gneg(polcoeff0(gel(f, j), 0, -1)), polcoeff0(gel(f, j), 1, -1));
        ans = concat(ans, p2);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p2, &ans);
    }
  }
  ans = gerepilecopy(ltop, ans);
  return ans;
}

GEN
ratpoint(GEN pol, GEN lim, GEN singlepoint, long prec)
{
  pari_sp ltop = avma;
  GEN listpoints = gen_0, point1 = gen_0, odd = gen_0, deg4 = gen_0, pol16 = gen_0, tab16 = gen_0, pol9 = gen_0, tab9 = gen_0, pol5 = gen_0, tab5 = gen_0, pol0 = gen_0, vecz = gen_0, vecx = gen_0, lead = gen_0, zz = gen_0, xx = gen_0, evpol = gen_0, iz = gen_0, factpol = gen_0, deg = gen_0, vz = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0;	  /* vec */
  long l6;
  GEN p7 = gen_0, p8 = gen_0;	  /* vec */
  long l9;
  GEN p10 = gen_0;	  /* vec */
  long l11;
  GEN p12 = gen_0;	  /* vec */
  long l13;
  GEN p14 = gen_0, p15 = gen_0, p16 = gen_0, p17 = gen_0;	  /* vec */
  GEN p18 = gen_0, x = pol_x(fetch_user_var("x"));
  GEN p19 = gen_0;	  /* vec */
  if (!lim)
    lim = gen_1;
  if (!singlepoint)
    singlepoint = gen_1;
  /* MODI: added deg, vz */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    pari_printf("    Starting ratpoint with pol = %Ps\n", pol);
    pari_printf("    lim = %Ps\n", lim);
  }
  if (gequal0(singlepoint))
    listpoints = cgetg(1, t_VEC);
  point1 = cgetg(1, t_VEC);
  /* */
  /*          trivial solutions */
  /* */
  
  /* the leading coeff is a square */
  if (!gequal0(gissquare(pollead(pol, -1))))
  {
    p1 = cgetg(4, t_VEC);
    gel(p1, 1) = gen_1;
    gel(p1, 2) = sqrtrat(pollead(pol, -1));
    gel(p1, 3) = gen_0;
    point1 = p1;
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   trivial solution: lead(pol) is a square\n");
    if (!gequal0(singlepoint))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    end of ratpoint\n");
      point1 = gerepilecopy(ltop, point1);
      return point1;
    }
    p2 = cgetg(2, t_VEC);
    gel(p2, 1) = gcopy(point1);
    listpoints = concat(listpoints, p2);
  }
  /* the constant coeff is a square */
  if (!gequal0(gissquare(polcoeff0(pol, 0, -1))))
  {
    p3 = cgetg(3, t_VEC);
    gel(p3, 1) = gen_0;
    gel(p3, 2) = sqrtrat(polcoeff0(pol, 0, -1));
    point1 = p3;
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   trivial solution: pol(0) is a square\n");
    if (!gequal0(singlepoint))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    end of ratpoint\n");
      point1 = gerepilecopy(ltop, point1);
      return point1;
    }
    p4 = cgetg(2, t_VEC);
    gel(p4, 1) = gcopy(point1);
    listpoints = concat(listpoints, p4);
  }
  odd = stoi(smodss(degree(pol), 2));
  /* roots of pol ? */
  factpol = polratroots(pol);
  if (glength(factpol))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   trivial solution: roots of pol%Ps\n", factpol);
    if (!gequal0(singlepoint))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    end of ratpoint\n");
      p5 = cgetg(3, t_VEC);
      gel(p5, 1) = gcopy(gel(factpol, 1));
      gel(p5, 2) = gen_0;
      p5 = gerepilecopy(ltop, p5);
      return p5;
    }
    l6 = glength(factpol);
    {
      long i;
      GEN p20 = gen_0;	  /* vec */
      p7 = cgetg(l6+1, t_VEC);
      for (i = 1; i <= l6; ++i)
      {
        p20 = cgetg(3, t_VEC);
        gel(p20, 1) = gcopy(gel(factpol, i));
        gel(p20, 2) = gen_0;
        gel(p7, i) = p20;
      }
    }
    listpoints = concat(listpoints, p7);
  }
  /* */
  /*       Sieve */
  /* */
  
  /* initialisation of the sieve modulo 16, 9 and 5 */
  /* used only with even degree when lim is large */
  
  deg = stoi(degree(pol));
  deg4 = stoi((gequal0(odd)) && (gcmpgs(lim, 20) > 0));
  if (!gequal0(deg4))
  {
    pol16 = gtrans(gmul(gtovec(pol), gmodulss(1, 16)));
    {
      long l21, l22;
      p8 = cgetg(17, t_MAT);
      for (l22 = 1; l22 <= 16; ++l22)
      {
        gel(p8, l22) = cgetg(17, t_COL);
        for (l21 = 1; l21 <= 16; ++l21)
          gcoeff(p8, l21, l22) = gen_0;
      }
    }
    tab16 = p8;
    l9 = 16 - 1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN xx = gen_0;
      long l23;
      for (xx = gen_0; gcmpgs(xx, l9) <= 0; xx = gaddgs(xx, 1))
      {
        l23 = 16 - 1;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN zz = gen_0, p24 = gen_0;
          GEN p25 = gen_0;	  /* vec */
          for (zz = gen_0; gcmpgs(zz, l23) <= 0; zz = gaddgs(zz, 1))
          {
            p24 = gaddgs(deg, 1);
            {
              long i;
              p25 = cgetg(gtos(p24)+1, t_VEC);
              for (i = 1; gcmpsg(i, p24) <= 0; ++i)
                gel(p25, i) = gmul(gpow(xx, gsubgs(gaddgs(deg, 1), i), prec), gpowgs(zz, i - 1));
            }
            gcoeff(tab16, gtos(gaddgs(xx, 1)), gtos(gaddgs(zz, 1))) = stoi(gequal0(gissquare(gmul(p25, pol16))));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 4, &zz, &p24, &p25, &tab16);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &xx, &tab16);
      }
    }
    pol9 = gmul(gtrans(gtovec(pol)), gmodulss(1, 9));
    {
      long l26, l27;
      p10 = cgetg(10, t_MAT);
      for (l27 = 1; l27 <= 9; ++l27)
      {
        gel(p10, l27) = cgetg(10, t_COL);
        for (l26 = 1; l26 <= 9; ++l26)
          gcoeff(p10, l26, l27) = gen_0;
      }
    }
    tab9 = p10;
    l11 = 9 - 1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN xx = gen_0;
      long l28;
      for (xx = gen_0; gcmpgs(xx, l11) <= 0; xx = gaddgs(xx, 1))
      {
        l28 = 9 - 1;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN zz = gen_0, p29 = gen_0;
          GEN p30 = gen_0;	  /* vec */
          for (zz = gen_0; gcmpgs(zz, l28) <= 0; zz = gaddgs(zz, 1))
          {
            p29 = gaddgs(deg, 1);
            {
              long i;
              p30 = cgetg(gtos(p29)+1, t_VEC);
              for (i = 1; gcmpsg(i, p29) <= 0; ++i)
                gel(p30, i) = gmul(gpow(xx, gsubgs(gaddgs(deg, 1), i), prec), gpowgs(zz, i - 1));
            }
            gcoeff(tab9, gtos(gaddgs(xx, 1)), gtos(gaddgs(zz, 1))) = stoi(gequal0(gissquare(gmul(p30, pol9))));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 4, &zz, &p29, &p30, &tab9);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &xx, &tab9);
      }
    }
    pol5 = gmul(gtrans(gtovec(pol)), gmodulss(1, 5));
    {
      long l31, l32;
      p12 = cgetg(6, t_MAT);
      for (l32 = 1; l32 <= 5; ++l32)
      {
        gel(p12, l32) = cgetg(6, t_COL);
        for (l31 = 1; l31 <= 5; ++l31)
          gcoeff(p12, l31, l32) = gen_0;
      }
    }
    tab5 = p12;
    l13 = 5 - 1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN xx = gen_0;
      long l33;
      for (xx = gen_0; gcmpgs(xx, l13) <= 0; xx = gaddgs(xx, 1))
      {
        l33 = 5 - 1;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN zz = gen_0, p34 = gen_0;
          GEN p35 = gen_0;	  /* vec */
          for (zz = gen_0; gcmpgs(zz, l33) <= 0; zz = gaddgs(zz, 1))
          {
            p34 = gaddgs(deg, 1);
            {
              long i;
              p35 = cgetg(gtos(p34)+1, t_VEC);
              for (i = 1; gcmpsg(i, p34) <= 0; ++i)
                gel(p35, i) = gmul(gpow(xx, gsubgs(gaddgs(deg, 1), i), prec), gpowgs(zz, i - 1));
            }
            gcoeff(tab5, gtos(gaddgs(xx, 1)), gtos(gaddgs(zz, 1))) = stoi(gequal0(gissquare(gmul(p35, pol5))));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 4, &zz, &p34, &p35, &tab5);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &xx, &tab5);
      }
    }
  }
  /* if the degree is odd, search only for square denominators */
  if (!gequal0(odd))
  {
    {
      long i;
      p14 = cgetg(gtos(lim)+1, t_VEC);
      for (i = 1; gcmpsg(i, lim) <= 0; ++i)
        gel(p14, i) = sqri(stoi(i));
    }
    vecz = p14;
  }
  else
  {
    /* if the degree is even, the leading coeff must be */
    /* a square modulo zz. */
    lead = pollead(pol, -1);
    {
      long l36;
      p15 = cgetg(gtos(lim)+1, t_VEC);
      for (l36 = 1; gcmpsg(l36, lim) <= 0; ++l36)
        gel(p15, l36) = gen_0;
    }
    vecz = p15;
    zz = gen_0;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      for (i = gen_1; gcmp(i, lim) <= 0; i = gaddgs(i, 1))
      {
        zz = gaddgs(zz, 1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gequal0(gissquare(gmodulo(lead, zz))))
          {
            zz = gaddgs(zz, 1);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              zz = gerepilecopy(btop, zz);
          }
        }
        gel(vecz, gtos(i)) = gcopy(zz);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 3, &i, &zz, &vecz);
      }
    }
  }
  /* the constant coeff must be a square modulo xx. */
  pol0 = polcoeff0(pol, 0, -1);
  {
    long l37;
    p16 = cgetg(gtos(lim)+1, t_VEC);
    for (l37 = 1; gcmpsg(l37, lim) <= 0; ++l37)
      gel(p16, l37) = gen_0;
  }
  vecx = p16;
  xx = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, lim) <= 0; i = gaddgs(i, 1))
    {
      xx = gaddgs(xx, 1);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (gequal0(gissquare(gmodulo(pol0, xx))))
        {
          xx = gaddgs(xx, 1);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            xx = gerepilecopy(btop, xx);
        }
      }
      gel(vecx, gtos(i)) = gcopy(xx);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &i, &xx, &vecx);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    xmax = %Ps\n", gel(vecx, gtos(lim)));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    zmax = %Ps\n", gel(vecz, gtos(lim)));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("    vecx = %Ps\n", vecx);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("    vecz = %Ps\n", vecz);
  if (!gequal0(deg4))
  {
    {
      long i;
      GEN p38 = gen_0;
      GEN p39 = gen_0;	  /* vec */
      p17 = cgetg(gtos(lim)+1, t_VEC);
      for (i = 1; gcmpsg(i, lim) <= 0; ++i)
      {
        p38 = gaddgs(deg, 1);
        {
          long j;
          p39 = cgetg(gtos(p38)+1, t_VEC);
          for (j = 1; gcmpsg(j, p38) <= 0; ++j)
            gel(p39, j) = gmul(polcoeff0(pol, gtos(gsubgs(gaddgs(deg, 1), j)), -1), gpowgs(gel(vecz, i), j - 1));
        }
        gel(p17, i) = gtopoly(p39, -1);
      }
    }
    vz = p17;
  }
  /* loop over x = xx/zz */
  /* the loop on [xx,zz] is done diagonally */
  /* to start with the smallest values of both xx and zz. */
  p18 = gmulsg(2, lim);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN somme = gen_0, p40 = gen_0, p41 = gen_0;
    for (somme = gen_2; gcmp(somme, p18) <= 0; somme = gaddgs(somme, 1))
    {
      p40 = gmaxsg(1, gsub(somme, lim));
      p41 = gmin(lim, gsubgs(somme, 1));
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN ix = gen_0;
        for (ix = p40; gcmp(ix, p41) <= 0; ix = gaddgs(ix, 1))
        {
          xx = gcopy(gel(vecx, gtos(ix)));
          iz = gsub(somme, ix);
          zz = gcopy(gel(vecz, gtos(iz)));
          if (!gequalgs(ggcd(zz, xx), 1))
            continue;
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long eps;
            GEN p42 = gen_0, p43 = gen_0;	  /* vec */
            for (eps = 1; eps <= 2; ++eps)
            {
              /* when eps = 1, xx > 0; when eps = 2, xx < 0. */
              if (!gequal0(deg4))
              {
                if (!gequal0(gcoeff(tab16, gtos(gaddgs(gmodgs(xx, 16), 1)), gtos(gaddgs(gmodgs(zz, 16), 1)))))
                {
                  xx = gneg(xx);
                  continue;
                }
                if (!gequal0(gcoeff(tab9, gtos(gaddgs(gmodgs(xx, 9), 1)), gtos(gaddgs(gmodgs(zz, 9), 1)))))
                {
                  xx = gneg(xx);
                  continue;
                }
                if (!gequal0(gcoeff(tab5, gtos(gaddgs(gmodgs(xx, 5), 1)), gtos(gaddgs(gmodgs(zz, 5), 1)))))
                {
                  xx = gneg(xx);
                  continue;
                }
                evpol = gsubst(gel(vz, gtos(iz)), gvar(x), xx);
              }
              else
                evpol = gsubst(pol, gvar(gpolvar(pol)), gdiv(xx, zz));
              if (!gequal0(gissquare(evpol)))
              {
                p42 = cgetg(3, t_VEC);
                gel(p42, 1) = gdiv(xx, zz);
                gel(p42, 2) = sqrtrat(gsubst(pol, gvar(gpolvar(pol)), gdiv(xx, zz)));
                point1 = p42;
                if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                  pari_printf("    point found by ratpoint = %Ps\n", point1);
                if (!gequal0(singlepoint))
                  goto label1;
                p43 = cgetg(2, t_VEC);
                gel(p43, 1) = gcopy(point1);
                listpoints = concat(listpoints, p43);
              }
              xx = gneg(xx);
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 6, &xx, &evpol, &p42, &point1, &p43, &listpoints);
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 7, &ix, &xx, &iz, &zz, &evpol, &point1, &listpoints);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 9, &somme, &p40, &p41, &xx, &iz, &zz, &evpol, &point1, &listpoints);
    }
    label1:;
  }
  if (!gequal(point1, cgetg(1, t_VEC)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   point found by ratpoint = %Ps\n", point1);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    end of ratpoint \n");
    if (!gequal0(singlepoint))
    {
      point1 = gerepilecopy(ltop, point1);
      return point1;
    }
    else
    {
      listpoints = gerepilecopy(ltop, listpoints);
      return listpoints;
    }
  }
  p19 = cgetg(1, t_VEC);
  p19 = gerepilecopy(ltop, p19);
  return p19;
}

GEN
ratpoint2(GEN pol, GEN lim, GEN singlepoint, GEN redflag, long prec)
{
  pari_sp ltop = avma;
  GEN listpoints = gen_0, list = gen_0, rr = gen_0, y2 = gen_0, aux = gen_0;
  long l1;
  if (!lim)
    lim = gen_1;
  if (!singlepoint)
    singlepoint = gen_1;
  if (!redflag)
    redflag = gen_0;
  listpoints = cgetg(1, t_VEC);
  list = listratpoint(pol, redflag, prec);
  l1 = glength(list);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p2 = gen_0;	  /* vec */
    long l3;
    GEN p4 = gen_0;
    for (i = 1; i <= l1; ++i)
    {
      rr = ratpoint(gel(gel(list, i), 1), lim, singlepoint, prec);
      if (!gequal0(singlepoint) && glength(rr))
      {
        p2 = cgetg(2, t_VEC);
        gel(p2, 1) = gcopy(rr);
        rr = p2;
      }
      l3 = glength(rr);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        GEN p5 = gen_0, p6 = gen_0, p7 = gen_0, p8 = gen_0;	  /* vec */
        for (j = 1; j <= l3; ++j)
        {
          y2 = gmul(gel(gel(rr, j), 2), gel(gel(list, i), 4));
          if (glength(gel(rr, j)) == 2)
          {
            p5 = cgetg(3, t_COL);
            gel(p5, 1) = gcopy(gel(gel(rr, j), 1));
            gel(p5, 2) = gen_1;
            aux = p5;
          }
          else
          {
            p6 = cgetg(3, t_COL);
            gel(p6, 1) = gcopy(gel(gel(rr, j), 1));
            gel(p6, 2) = gcopy(gel(gel(rr, j), 3));
            aux = p6;
          }
          aux = gmul(gel(gel(list, i), 2), aux);
          if (gequal0(gel(aux, 2)))
          {
            p7 = cgetg(4, t_VEC);
            gel(p7, 1) = gcopy(gel(aux, 1));
            gel(p7, 2) = gcopy(y2);
            gel(p7, 3) = gen_0;
            gel(rr, j) = p7;
          }
          else
          {
            p8 = cgetg(3, t_VEC);
            gel(p8, 1) = gdiv(gel(aux, 1), gel(aux, 2));
            gel(p8, 2) = gdiv(y2, gpowgs(gel(aux, 2), degree(pol)/2));
            gel(rr, j) = p8;
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 7, &y2, &p5, &aux, &p6, &p7, &rr, &p8);
        }
      }
      if (!gequal0(singlepoint) && glength(rr))
      {
        p4 = gcopy(gel(rr, 1));
        p4 = gerepilecopy(ltop, p4);
        return p4;
      }
      listpoints = concat(listpoints, rr);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &rr, &p2, &y2, &aux, &p4, &listpoints);
    }
  }
  listpoints = vecsort0(listpoints, NULL, 2);
  listpoints = gerepilecopy(ltop, listpoints);
  return listpoints;
}

GEN
listratpoint(GEN pol, GEN redflag, long prec)
{
  pari_sp ltop = avma;
  GEN list = gen_0, i = gen_0, K = gen_0, ff = gen_0, C = gen_0, p = gen_0, M = gen_0, U = gen_0, newpol = gen_0, factpol = gen_0, ll = gen_0, listf = gen_0, rr = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  long l3;
  GEN p4 = gen_0;
  GEN p5 = gen_0;	  /* vec */
  long l6, l7;
  if (!redflag)
    redflag = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     Starting listratpoint with %Ps\n", pol);
  p1 = cgetg(2, t_VEC);
  p2 = cgetg(5, t_VEC);
  gel(p2, 1) = gcopy(pol);
  gel(p2, 2) = matid(2);
  gel(p2, 3) = gen_1;
  gel(p2, 4) = gen_1;
  gel(p1, 1) = p2;
  list = p1;
  i = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p8 = gen_0, p9 = gen_0, p10 = gen_0;	  /* vec */
    long l11;
    while (gcmpgs(i, glength(list)) <= 0)
    {
      pol = gcopy(gel(gel(list, gtos(i)), 1));
      K = gabs(content(pol), prec);
      if (!gequalgs(K, 1))
      {
        pol = gel(gel(list, gtos(i)), 1) = gdiv(gel(gel(list, gtos(i)), 1), K);
        gel(gel(list, gtos(i)), 3) = gmul(gel(gel(list, gtos(i)), 3), K);
      }
      K = gcopy(gel(gel(list, gtos(i)), 3));
      if (gequal1(K))
      {
        i = gaddgs(i, 1);
        continue;
      }
      ff = factor(K);
      if (gcmpgs(vecmax(gel(ff, 2)), 1) > 0)
      {
        gel(ff, 2) = gdivent(gel(ff, 2), gen_2);
        C = factorback(ff);
        gel(gel(list, gtos(i)), 4) = gmul(gel(gel(list, gtos(i)), 4), C);
        K = gel(gel(list, gtos(i)), 3) = gdiv(gel(gel(list, gtos(i)), 3), gsqr(C));
        if (gequal1(K))
        {
          i = gaddgs(i, 1);
          continue;
        }
        ff = factor(K);
      }
      p = gcopy(gcoeff(ff, 1, 1));
      M = gcopy(gel(gel(list, gtos(i)), 2));
      C = gcopy(gel(gel(list, gtos(i)), 4));
      if (gequal0(gmod(pollead(pol, -1), p)))
      {
        p8 = cgetg(3, t_MAT);
        gel(p8, 1) = cgetg(3, t_COL);
        gel(p8, 2) = cgetg(3, t_COL);
        gcoeff(p8, 1, 1) = gen_1;
        gcoeff(p8, 1, 2) = gen_0;
        gcoeff(p8, 2, 1) = gen_0;
        gcoeff(p8, 2, 2) = gcopy(p);
        U = gmul(M, p8);
        if (gequal1(content(U)))
        {
          newpol = gmul(gsubst(pol, gvar(x), gdiv(x, p)), gpowgs(p, degree(pol) - 1));
          p9 = cgetg(2, t_VEC);
          p10 = cgetg(5, t_VEC);
          gel(p10, 1) = gcopy(newpol);
          gel(p10, 2) = gcopy(U);
          gel(p10, 3) = gdiv(K, p);
          gel(p10, 4) = gmul(C, p);
          gel(p9, 1) = p10;
          list = concat(list, p9);
        }
      }
      factpol = centerlift(rootmod(pol, p));
      l11 = glength(factpol);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        GEN p12 = gen_0, p13 = gen_0, p14 = gen_0;	  /* vec */
        for (j = 1; j <= l11; ++j)
        {
          p12 = cgetg(3, t_MAT);
          gel(p12, 1) = cgetg(3, t_COL);
          gel(p12, 2) = cgetg(3, t_COL);
          gcoeff(p12, 1, 1) = gcopy(p);
          gcoeff(p12, 1, 2) = gcopy(gel(factpol, j));
          gcoeff(p12, 2, 1) = gen_0;
          gcoeff(p12, 2, 2) = gen_1;
          U = gmul(M, p12);
          if (gequal1(content(U)))
          {
            newpol = gdiv(gsubst(pol, gvar(x), gadd(gmul(p, x), gel(factpol, j))), p);
            p13 = cgetg(2, t_VEC);
            p14 = cgetg(5, t_VEC);
            gel(p14, 1) = gcopy(newpol);
            gel(p14, 2) = gcopy(U);
            gel(p14, 3) = gdiv(K, p);
            gel(p14, 4) = gmul(C, p);
            gel(p13, 1) = p14;
            list = concat(list, p13);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 6, &p12, &U, &newpol, &p14, &p13, &list);
        }
      }
      i = gaddgs(i, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 14, &pol, &K, &list, &i, &ff, &C, &p, &M, &p8, &U, &newpol, &p10, &p9, &factpol);
    }
  }
  l3 = glength(list);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    p4 = gen_0;
    for (i = 1; i <= l3; ++i)
    {
      p4 = gaddgs(p4, gequal1(gel(gel(list, i), 3)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        p4 = gerepilecopy(btop, p4);
    }
  }
  ll = p4;
  {
    long l15;
    p5 = cgetg(gtos(ll)+1, t_VEC);
    for (l15 = 1; gcmpsg(l15, ll) <= 0; ++l15)
      gel(p5, l15) = gen_0;
  }
  listf = p5;
  i = gen_1;
  l6 = glength(list);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long j;
    for (j = 1; j <= l6; ++j)
    {
      if (gequal1(gel(gel(list, j), 3)))
      {
        gel(listf, gtos(i)) = gcopy(gel(list, j));
        i = gaddgs(i, 1);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &listf, &i);
    }
  }
  if (!gequal0(redflag))
  {
    l7 = glength(listf);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 1; i <= l7; ++i)
      {
        rr = redquartic(gel(gel(listf, i), 1), prec);
        gel(gel(listf, i), 1) = gcopy(gel(rr, 1));
        gel(gel(listf, i), 2) = gmul(gel(gel(listf, i), 2), gel(rr, 2));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &rr, &listf);
      }
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     Output of listratpoint = %Ps\n", listf);
  listf = gerepilecopy(ltop, listf);
  return listf;
}

GEN
redquartic(GEN pol, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN prec_s = gen_0, prec0 = gen_0, d = gen_0, disc2 = gen_0, test = gen_0, r = gen_0, normderiv = gen_0, disc2v = gen_0, q = gen_0, M = gen_0, p1 = gen_0, x = pol_x(fetch_user_var("x"));
  GEN p2 = gen_0, p3 = gen_0;	  /* vec */
  /* MODI change prec into prec_s */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    starting redquartic\n");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   reduction of the quartic %Ps\n", pol);
  /* choice of the real precision used in the computation */
  prec_s = prec0 = stoi(getrealprecision());
  d = stoi(degree(pol));
  disc2 = gsqr(poldisc0(pol, -1));
  test = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p4 = gen_0;	  /* vec */
    GEN p5 = gen_0;
    while (gequal0(test))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    precision = %Ps\n", prec_s);
      r = roots0(pol, 0, prec);
      {
        long i;
        p4 = cgetg(gtos(d)+1, t_VEC);
        for (i = 1; gcmpsg(i, d) <= 0; ++i)
          gel(p4, i) = gnorm(gsubst(deriv(pol,-1), gvar(gpolvar(pol)), gel(r, i)));
      }
      normderiv = p4;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN i = gen_0;
        p5 = gen_1;
        for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
        {
          p5 = gmul(p5, gel(normderiv, gtos(i)));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &p5, &i);
        }
      }
      disc2v = gmul(p5, gpow(pollead(pol, -1), gsubgs(gmulsg(2, d), 4), prec));
      test = stoi(gcmp(gabs(gsub(disc2v, disc2), prec), gpow(stoi(10), gdiventgs(gneg(prec_s), 2), prec)) < 0);
      if (gequal0(test))
        setrealprecision(gtos(prec_s = gmulgs(prec_s, 2)), &prec);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 7, &r, &p4, &normderiv, &p5, &disc2v, &test, &prec_s);
    }
  }
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    p1 = gen_0;
    for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
    {
      p1 = gadd(p1, gdiv(gnorm(gsub(x, gel(r, gtos(i)))), gpow(gel(normderiv, gtos(i)), ginv(gsubgs(d, 2)), prec)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p1, &i);
    }
  }
  /* former choice of the quadratic form */
  /*  q = Vec(sum( i = 1, d, norm(x-r[i]))); */
  /* Now, uses the quadratic form normalized as in Cremona-Stoll */
  q = gtovec(p1);
  p2 = cgetg(3, t_MAT);
  gel(p2, 1) = cgetg(3, t_COL);
  gel(p2, 2) = cgetg(3, t_COL);
  gcoeff(p2, 1, 1) = gcopy(gel(q, 1));
  gcoeff(p2, 1, 2) = gdivgs(gel(q, 2), 2);
  gcoeff(p2, 2, 1) = gdivgs(gel(q, 2), 2);
  gcoeff(p2, 2, 2) = gcopy(gel(q, 3));
  M = QfbReduce(p2, prec);
  pol = gmul(gsubst(pol, gvar(gpolvar(pol)), gdiv(gtopoly(rowcopy(M, 1), -1), gtopoly(rowcopy(M, 2), -1))), gpowgs(gtopoly(rowcopy(M, 2), -1), degree(pol)));
  if (!gequal(prec_s, prec0))
    setrealprecision(gtos(prec0), &prec);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   reduced quartic = %Ps\n", pol);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of redquartic\n");
  p3 = cgetg(3, t_VEC);
  gel(p3, 1) = gcopy(pol);
  gel(p3, 2) = gcopy(M);
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
polrealrootsisolate(GEN pol)
{
  pari_sp ltop = avma;
  GEN st = gen_0, a = gen_0, res = gen_0, ind = gen_0, b = gen_0, c = gen_0, stab = gen_0, stac = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     starting polrealrootsisolate with pol = %Ps\n", pol);
  st = stoi(sturmpart(pol, NULL, NULL));
  if (gequal0(st))
  {
    p1 = cgetg(1, t_VEC);
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  a = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gcmpsg(sturmpart(pol, gneg(a), a), st) < 0)
    {
      a = gshift(a, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        a = gerepilecopy(btop, a);
    }
  }
  p2 = cgetg(2, t_VEC);
  p3 = cgetg(4, t_VEC);
  gel(p3, 1) = gneg(a);
  gel(p3, 2) = gcopy(a);
  gel(p3, 3) = gcopy(st);
  gel(p2, 1) = p3;
  res = p2;
  ind = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p5 = gen_0, p6 = gen_0, p7 = gen_0;	  /* vec */
    while (gcmpsg(glength(res), st) < 0)
    {
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (gequal1(gel(gel(res, gtos(ind)), 3)))
        {
          ind = gaddgs(ind, 1);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            ind = gerepilecopy(btop, ind);
        }
      }
      a = gcopy(gel(gel(res, gtos(ind)), 1));
      b = gcopy(gel(gel(res, gtos(ind)), 2));
      stab = gcopy(gel(gel(res, gtos(ind)), 3));
      c = gdivgs(gadd(a, b), 2);
      stac = stoi(sturmpart(pol, a, c));
      if (gequal0(stac))
      {
        gel(gel(res, gtos(ind)), 1) = gcopy(c);
        continue;
      }
      if (gequal(stac, stab))
      {
        gel(gel(res, gtos(ind)), 2) = gcopy(c);
        continue;
      }
      p5 = cgetg(4, t_VEC);
      gel(p5, 1) = gcopy(a);
      gel(p5, 2) = gcopy(c);
      gel(p5, 3) = gcopy(stac);
      gel(res, gtos(ind)) = p5;
      p6 = cgetg(2, t_VEC);
      p7 = cgetg(4, t_VEC);
      gel(p7, 1) = gcopy(c);
      gel(p7, 2) = gcopy(b);
      gel(p7, 3) = gsub(stab, stac);
      gel(p6, 1) = p7;
      res = concat(res, p6);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 10, &ind, &a, &b, &stab, &c, &stac, &res, &p5, &p7, &p6);
    }
  }
  {
    long i;
    GEN p8 = gen_0;	  /* vec */
    p4 = cgetg(gtos(st)+1, t_VEC);
    for (i = 1; gcmpsg(i, st) <= 0; ++i)
    {
      p8 = cgetg(3, t_VEC);
      gel(p8, 1) = gcopy(gel(gel(res, i), 1));
      gel(p8, 2) = gcopy(gel(gel(res, i), 2));
      gel(p4, i) = p8;
    }
  }
  res = p4;
  res = vecsort0(res, gen_1, 0);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of polrealrootsisolate with res = %Ps\n", res);
  res = gerepilecopy(ltop, res);
  return res;
}

GEN
polrealrootsimprove(GEN pol, GEN v)
{
  pari_sp ltop = avma;
  GEN c = gen_0, v2 = gen_0, vc = gen_0;
  GEN p1 = gen_0;	  /* vec */
  v = gcopy(v);
  c = gdivgs(gadd(gel(v, 1), gel(v, 2)), 2);
  v2 = gsubst(pol, gvar(gpolvar(pol)), gel(v, 2));
  if (gequal0(v2))
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(c);
    gel(p1, 2) = gcopy(gel(v, 2));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  vc = gsubst(pol, gvar(gpolvar(pol)), c);
  if (gcmpgs(gmul(v2, vc), 0) >= 0)
    gel(v, 2) = gcopy(c);
  else
    gel(v, 1) = gcopy(c);
  v = gerepilecopy(ltop, v);
  return v;
}

GEN
polrootsmodpn(GEN pol, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN vd = gen_0, rac = gen_0, i = gen_0, pol2 = gen_0, r = gen_0, newrac = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     starting polrootsmodpn %Ps:%Ps\n", p, pol);
  vd = stoi(ggval(poldisc0(pol, -1), p));
  p1 = cgetg(2, t_VEC);
  p2 = cgetg(3, t_VEC);
  gel(p2, 1) = gen_0;
  gel(p2, 2) = gen_0;
  gel(p1, 1) = p2;
  rac = p1;
  i = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l3;
    GEN p4 = gen_0;	  /* vec */
    long l5;
    GEN p6 = gen_0;	  /* vec */
    while (gcmpgs(i, glength(rac)) <= 0)
    {
      /*    if( rac[i][2] > vd, i++; next); */
      if (gcmp(gel(gel(rac, gtos(i)), 2), vd) >= 0)
      {
        i = gaddgs(i, 1);
        continue;
      }
      pol2 = gsubst(pol, gvar(x), gadd(gel(gel(rac, gtos(i)), 1), gmul(x, gpow(p, gel(gel(rac, gtos(i)), 2), prec))));
      pol2 = gdiv(pol2, content(pol2));
      r = lift(polratroots(gmul(pol2, gmodulsg(1, p))));
      if (glength(r) == 0)
      {
        i = gaddgs(i, 1);
        continue;
      }
      l3 = glength(r);
      {
        long j;
        GEN p7 = gen_0;	  /* vec */
        p4 = cgetg(l3+1, t_VEC);
        for (j = 1; j <= l3; ++j)
        {
          p7 = cgetg(3, t_VEC);
          gel(p7, 1) = gadd(gel(gel(rac, gtos(i)), 1), gmul(gpow(p, gel(gel(rac, gtos(i)), 2), prec), gel(r, j)));
          gel(p7, 2) = gaddgs(gel(gel(rac, gtos(i)), 2), 1);
          gel(p4, j) = p7;
        }
      }
      newrac = p4;
      l5 = glength(r) - 1;
      {
        long j;
        p6 = cgetg(l5+1, t_VEC);
        for (j = 1; j <= l5; ++j)
          gel(p6, j) = gcopy(gel(newrac, j + 1));
      }
      rac = concat(rac, p6);
      gel(rac, gtos(i)) = gcopy(gel(newrac, 1));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 7, &i, &pol2, &r, &p4, &newrac, &p6, &rac);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of polrootsmodpn %Ps\n", rac);
  rac = gerepilecopy(ltop, rac);
  return rac;
}

GEN
ppinit(GEN nf, GEN p)
{
  pari_sp ltop = avma;
  GEN pdec = gen_0, pp = gen_0;
  long l1;
  GEN p2 = gen_0;	  /* vec */
  pdec = idealprimedec(nf, p);
  l1 = glength(pdec);
  {
    long i;
    GEN p3 = gen_0;	  /* vec */
    GEN p4 = gen_0;
    p2 = cgetg(l1+1, t_VEC);
    for (i = 1; i <= l1; ++i)
    {
      p3 = cgetg(5, t_VEC);
      gel(p3, 1) = gcopy(gel(pdec, i));
      gel(p3, 2) = basistoalg(nf, gel(gel(pdec, i), 2));
      if (gequalgs(p, 2))
        p4 = idealstar0(nf, idealpow0(nf, gel(pdec, i), stoi(1 + (2*pr_get_e(gel(pdec, i)))), 0), 1);
      gel(p3, 3) = p4;
      gel(p3, 4) = nfmodprinit(nf, gel(pdec, i));
      gel(p2, i) = p3;
    }
  }
  pp = p2;
  pp = gerepilecopy(ltop, pp);
  return pp;
}

long
nfpsquareoddQ(GEN nf, GEN a, GEN pr, long prec)
{
  pari_sp ltop = avma;
  GEN p = gen_0, v = gen_0, ap = gen_0, den = gen_0, norme = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     starting nfpsquareoddQ(%Ps,%Ps\n", a, pr);
  if (gequal0(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfpsquareoddQ\n");
    avma = ltop;
    return 1;
  }
  p = gcopy(gel(pr, 3));
  v = stoi(idealval(nf, lift(a), p));
  if (!gequal0(gmodgs(v, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfpsquareoddQ\n");
    avma = ltop;
    return 0;
  }
  ap = algtobasis(nf, gdiv(a, gpow(basistoalg(nf, gel(p, 2)), v, prec)));
  den = stoi(ggval(denom(content(ap)), member_p(p)));
  if (!gequal0(den))
  {
    den = gadd(den, gmodgs(den, 2));
    ap = gmul(gpow(member_p(p), den, prec), nfmul(nf, ap, nfpow(nf, gel(p, 2), gmulgs(gneg(den), pr_get_e(p)))));
  }
  norme = gdivgs(gsubgs(gpowgs(member_p(p), pr_get_f(p)), 1), 2);
  ap = nfpowmodpr(nf, ap, norme, pr);
  gel(ap, 1) = gsubgs(gel(ap, 1), 1);
  if (gequal0(ap))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfpsquareoddQ\n");
    avma = ltop;
    return 1;
  }
  if (idealval(nf, ap, p) > 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of nfpsquareoddQ\n");
    avma = ltop;
    return 1;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of nfpsquareoddQ\n");
  avma = ltop;
  return 0;
}

long
psquare(GEN a, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN v = gen_0, ap = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2;	  /* bool */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(a);
    gel(p1, 2) = gcopy(p);
    pari_printf("     starting psquare %Ps\n", p1);
  }
  if (gequal0(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of psquare 1\n");
    avma = ltop;
    return 1;
  }
  v = stoi(ggval(a, p));
  if (!gequal0(gmodgs(v, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of psquare 0\n");
    avma = ltop;
    return 0;
  }
  if (gequalgs(p, 2))
    ap = gsubgs(gmodgs(gshift(a, -gtos(v)), 8), 1);
  else
    ap = gsubgs(gkronecker(gdiv(a, gpow(p, v, prec)), p), 1);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of psquare %ld\n", gequal0(ap));
  l2 = gequal0(ap);
  avma = ltop;
  return l2;
}

long
lemma6(GEN pol, GEN p, GEN nu, GEN xx, long prec)
{
  pari_sp ltop = avma;
  GEN gx = gen_0, gpx = gen_0, lambda = gen_0, mu = gen_0;
  gx = gsubst(pol, gvar(gpolvar(pol)), xx);
  if (psquare(gx, p, prec))
  {
    avma = ltop;
    return 1;
  }
  gpx = gsubst(deriv(pol,-1), gvar(gpolvar(pol)), xx);
  lambda = stoi(ggval(gx, p));
  mu = stoi(ggval(gpx, p));
  if (gcmp(lambda, gmulsg(2, mu)) > 0)
  {
    avma = ltop;
    return 1;
  }
  /*  if( (lambda >= mu+nu) && (nu > mu), return(1)); */
  if ((gcmp(lambda, gmulsg(2, nu)) >= 0) && (gcmp(mu, nu) >= 0))
  {
    avma = ltop;
    return 0;
  }
  avma = ltop;
  return -1;
}

long
lemma7(GEN pol, GEN nu, GEN xx, long prec)
{
  pari_sp ltop = avma;
  GEN gx = gen_0, gpx = gen_0, lambda = gen_0, mu = gen_0, q = gen_0;
  gx = gsubst(pol, gvar(gpolvar(pol)), xx);
  if (psquare(gx, gen_2, prec))
  {
    avma = ltop;
    return 1;
  }
  gpx = gsubst(deriv(pol,-1), gvar(gpolvar(pol)), xx);
  lambda = stoi(ggval(gx, gen_2));
  mu = stoi(ggval(gpx, gen_2));
  if (gcmp(lambda, gmulsg(2, mu)) > 0)
  {
    avma = ltop;
    return 1;
  }
  if (gcmp(nu, mu) > 0)
  {
    if (!gequal0(gmodgs(lambda, 2)))
    {
      avma = ltop;
      return -1;
    }
    q = gsub(gadd(mu, nu), lambda);
    if (gequal1(q))
    {
      avma = ltop;
      return 1;
    }
    if (gequalgs(q, 2) && gequal1(gmodgs(gshift(gx, -gtos(lambda)), 4)))
    {
      avma = ltop;
      return 1;
    }
    avma = ltop;
    return -1;
  }
  q = gsub(lambda, gmulsg(2, nu));
  if (gcmpgs(q, 0) >= 0)
  {
    avma = ltop;
    return 0;
  }
  if (gequalgs(q, -2) && gequal1(gmodgs(gshift(gx, -gtos(lambda)), 4)))
  {
    avma = ltop;
    return 0;
  }
  avma = ltop;
  return -1;
}

long
zpsoluble(GEN pol, GEN p, GEN nu, GEN pnu, GEN x0, GEN pnup, long prec)
{
  pari_sp ltop = avma;
  GEN result = gen_0, pol2 = gen_0, fact = gen_0, x1 = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN p2 = gen_0;
  long l3;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(5, t_VEC);
    gel(p1, 1) = gcopy(pol);
    gel(p1, 2) = gcopy(p);
    gel(p1, 3) = gcopy(x0);
    gel(p1, 4) = gcopy(nu);
    pari_printf("     starting zpsoluble %Ps\n", p1);
  }
  if (gequalgs(p, 2))
    result = stoi(lemma7(pol, nu, x0, prec));
  else
    result = stoi(lemma6(pol, p, nu, x0, prec));
  if (gequalgs(result, 1))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of zpsoluble 1 lemma\n");
    avma = ltop;
    return 1;
  }
  if (gequalm1(result))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of zpsoluble 0 lemma\n");
    avma = ltop;
    return 0;
  }
  pnup = gmul(pnu, p);
  nu = gaddgs(nu, 1);
  if ((gcmp(p, LIMBIGPRIME) < 0) || (gequal0(LIMBIGPRIME)))
  {
    p2 = gsubgs(p, 1);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      for (i = gen_0; gcmp(i, p2) <= 0; i = gaddgs(i, 1))
      {
        if (zpsoluble(pol, p, nu, pnup, gadd(x0, gmul(pnu, i)), gen_0, prec))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
            pari_printf("     end of zpsoluble\n");
          avma = ltop;
          return 1;
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          i = gerepilecopy(btop, i);
      }
    }
  }
  else
  {
    pol2 = gsubst(pol, gvar(gpolvar(pol)), gadd(x0, gmul(pnu, gpolvar(pol))));
    pol2 = gdiv(pol2, content(pol2));
    pol2 = gmul(pol2, gmodulsg(1, p));
    if (!degree(pol2))
    {
      avma = ltop;
      return 0;
    }
    fact = gcopy(gel(factormod0(pol2, p, 0), 1));
    l3 = glength(fact);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 1; i <= l3; ++i)
      {
        x1 = gneg(centerlift(polcoeff0(gel(fact, i), 0, -1)));
        if (zpsoluble(pol, p, nu, pnup, gadd(x0, gmul(pnu, x1)), gen_0, prec))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
            pari_printf("     end of zpsoluble\n");
          avma = ltop;
          return 1;
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          x1 = gerepilecopy(btop, x1);
      }
    }
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      for (i = gen_1; gcmp(i, MAXPROB) <= 0; i = gaddgs(i, 1))
      {
        x1 = genrand(p);
        if (zpsoluble(pol, p, nu, pnup, gadd(x0, gmul(pnu, x1)), gen_0, prec))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
            pari_printf("     end of zpsoluble\n");
          avma = ltop;
          return 1;
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &i, &x1);
      }
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    if (gcmp(p, LIMBIGPRIME) >= 0)
      pari_printf("  ******* probabilistic test at p = %Ps*******\n", p);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of zpsoluble\n");
  avma = ltop;
  return 0;
}

long
qpsoluble(GEN pol, GEN p, long prec)
{
  pari_sp ltop = avma;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    pari_printf("     starting qpsoluble %Ps\n", p);
    pari_printf("     pol = %Ps\n", pol);
  }
  if (psquare(pollead(pol, -1), p, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of qpsoluble 1\n");
    avma = ltop;
    return 1;
  }
  if (psquare(polcoeff0(pol, 0, -1), p, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of qpsoluble 1\n");
    avma = ltop;
    return 1;
  }
  if (zpsoluble(pol, p, gen_0, gen_1, gen_0, gen_0, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of qpsoluble 1\n");
    avma = ltop;
    return 1;
  }
  if (zpsoluble(polrecip(pol), p, gen_1, p, gen_0, gen_0, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     end of qpsoluble 1\n");
    avma = ltop;
    return 1;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     end of qpsoluble 0\n");
  avma = ltop;
  return 0;
}

long
locallysoluble(GEN pol, long prec)
{
  pari_sp ltop = avma;
  GEN c = gen_0, disc0 = gen_0, plist = gen_0, p = gen_0, vc = gen_0;
  long l1;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    starting locallysoluble :%Ps\n", pol);
  /* real place */
  if ((((!smodss(degree(pol), 2)) && (gsigne(pollead(pol, -1)) < 0)) && (gsigne(polcoeff0(pol, 0, -1)) < 0)) && (sturmpart(pol, NULL, NULL) == 0))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   not ELS at infinity\n");
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    end of locallysoluble\n");
    avma = ltop;
    return 0;
  }
  /* */
  /* finite places */
  /* */
  pol = gmul(/* */
  /* finite places */
  /* */
  pol, gsqr(denom(content(pol))));
  c = content(pol);
  disc0 = poldisc0(pol, -1);
  plist = factor(gabs(gmulsg(2, disc0), prec));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    list of bad primes = %Ps\n", plist);
  l1 = glength(gel(plist, 1));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l1; ++i)
    {
      p = gcopy(gcoeff(plist, i, 1));
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    p = %Ps\n", p);
      vc = stoi(ggval(c, p));
      if (gcmpgs(vc, 2) >= 0)
      {
        pol = gdiv(pol, gpow(p, gmulsg(2, gdiventgs(vc, 2)), prec));
        gcoeff(plist, i, 2) = gsub(gcoeff(plist, i, 2), gmulgs(gmulsg(2, gdiventgs(vc, 2)), (2*degree(pol)) - 2));
      }
      if (((degree(pol) == 4) && !gequalgs(p, 2)) && (gcmpgs(gcoeff(plist, i, 2), 2) < 0))
        continue;
      if (!qpsoluble(pol, p, prec))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("   not ELS at %Ps\n", p);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("    end of locallysoluble\n");
        avma = ltop;
        return 0;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p, &vc, &pol, &plist);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  quartic ELS : Y^2 = %Ps\n", pol);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of locallysoluble\n");
  avma = ltop;
  return 1;
}

GEN
LS2localimage(GEN nf, GEN gen, GEN pp, long prec)
{
  pari_sp ltop = avma;
  GEN p = gen_0, LS2image = gen_0, ph = gen_0, ival = gen_0, delta = gen_0;
  long l1;
  GEN p2 = gen_0;
  long l3;
  GEN p4 = gen_0;
  GEN p5 = gen_0;	  /* vec */
  long l6;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    starting LS2localimage\n");
  p = icopy(member_p(gel(gel(pp, 1), 1)));
  l1 = glength(gen);
  if (gequalgs(p, 2))
  {
    l3 = glength(pp);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      p4 = gen_0;
      for (i = 1; i <= l3; ++i)
      {
        p4 = gaddgs(p4, (1 + lg(member_cyc(gel(gel(pp, i), 3))))-1);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          p4 = gerepilecopy(btop, p4);
      }
    }
    p2 = p4;
  }
  else
    p2 = stoi(2*glength(pp));
  {
    long l7, l8;
    p5 = cgetg(l1+1, t_MAT);
    for (l8 = 1; l8 <= l1; ++l8)
    {
      gel(p5, l8) = cgetg(gtos(p2)+1, t_COL);
      for (l7 = 1; gcmpsg(l7, p2) <= 0; ++l7)
        gcoeff(p5, l7, l8) = gen_0;
    }
  }
  LS2image = p5;
  l6 = glength(gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long j, l9;
    for (j = 1; j <= l6; ++j)
    {
      ph = cgetg(1, t_VEC);
      l9 = glength(pp);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        GEN p10 = gen_0, p11 = gen_0;	  /* vec */
        for (i = 1; i <= l9; ++i)
        {
          ival = stoi(idealval(nf, gel(gen, j), gel(gel(pp, i), 1)));
          p10 = cgetg(2, t_VEC);
          gel(p10, 1) = gcopy(ival);
          ph = concat(ph, p10);
          delta = gdiv(gel(gen, j), gpow(gel(gel(pp, i), 2), ival, prec));
          if (gequalgs(p, 2))
            ph = concat(ph, gtrans(ideallog(nf, delta, gel(gel(pp, i), 3))));
          else
          {
            p11 = cgetg(2, t_VEC);
            gel(p11, 1) = stoi(1 - nfpsquareoddQ(nf, delta, gel(gel(pp, i), 4), prec));
            ph = concat(ph, p11);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 5, &ival, &p10, &ph, &delta, &p11);
        }
      }
      gel(LS2image, j) = gtrans(ph);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &ph, &ival, &delta, &LS2image);
    }
  }
  LS2image = gmul(LS2image, gmodulss(1, 2));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    LS2image = %Ps\n", lift(LS2image));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of LS2localimage\n");
  LS2image = gerepilecopy(ltop, LS2image);
  return LS2image;
}

GEN
ellhalf(GEN ell, GEN P, long prec)
{
  pari_sp ltop = avma;
  GEN pol2 = gen_0, ratroots = gen_0, half = gen_0, x2 = gen_0, y2 = gen_0, P2 = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  long l3;
  GEN p4 = gen_0, p5 = gen_0, p6 = gen_0, p7 = gen_0;	  /* vec */
  long l8;
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = stoi(4);
  gel(p1, 2) = gcopy(ell_get_b2(ell));
  gel(p1, 3) = gmulsg(2, ell_get_b4(ell));
  gel(p1, 4) = gcopy(ell_get_b6(ell));
  pol2 = gtopoly(p1, -1);
  /* 2-division polynomial */
  
  p2 = cgetg(2, t_VEC);
  gel(p2, 1) = gen_0;
  if (gequal(P, p2))
  {
    ratroots = polratroots(pol2);
    l3 = glength(ratroots);
    {
      long i;
      GEN p9 = gen_0;	  /* vec */
      p4 = cgetg(l3+1, t_VEC);
      for (i = 1; i <= l3; ++i)
      {
        p9 = cgetg(3, t_VEC);
        gel(p9, 1) = gcopy(gel(ratroots, i));
        gel(p9, 2) = gdivgs(gneg(gadd(gmul(ell_get_a1(ell), gel(ratroots, i)), ell_get_a3(ell))), 2);
        gel(p4, i) = p9;
      }
    }
    half = p4;
    p5 = cgetg(2, t_VEC);
    p6 = cgetg(2, t_VEC);
    gel(p6, 1) = gen_0;
    gel(p5, 1) = p6;
    half = concat(p5, half);
    half = gerepilecopy(ltop, half);
    return half;
  }
  p7 = cgetg(6, t_VEC);
  gel(p7, 1) = gen_1;
  gel(p7, 2) = gen_0;
  gel(p7, 3) = gneg(ell_get_b4(ell));
  gel(p7, 4) = gmulsg(-2, ell_get_b6(ell));
  gel(p7, 5) = gneg(ell_get_b8(ell));
  x2 = gtopoly(p7, -1);
  /* x(2P) = x2/pol2  */
  
  half = cgetg(1, t_VEC);
  ratroots = polratroots(gsub(x2, gmul(gel(P, 1), pol2)));
  if (glength(ratroots) == 0)
  {
    half = gerepilecopy(ltop, half);
    return half;
  }
  l8 = glength(ratroots);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i, l10;
    for (i = 1; i <= l8; ++i)
    {
      y2 = ellordinate(ell, gel(ratroots, i), prec);
      l10 = glength(y2);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        GEN p11 = gen_0, p12 = gen_0;	  /* vec */
        for (j = 1; j <= l10; ++j)
        {
          p11 = cgetg(3, t_VEC);
          gel(p11, 1) = gcopy(gel(ratroots, i));
          gel(p11, 2) = gcopy(gel(y2, j));
          P2 = p11;
          if (gequal(powell(ell, P2, gen_2), P))
          {
            p12 = cgetg(2, t_VEC);
            gel(p12, 1) = gcopy(P2);
            half = concat(half, p12);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &p11, &P2, &p12, &half);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &y2, &P2, &half);
    }
  }
  half = gerepilecopy(ltop, half);
  return half;
}

GEN
elltors2(GEN ell, long prec)
{
  pari_sp ltop = avma;
  GEN tors2 = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0, p6 = gen_0, p7 = gen_0, p8 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   computing the 2-torsion\n");
  p1 = cgetg(2, t_VEC);
  gel(p1, 1) = gen_0;
  tors2 = ellhalf(ell, p1, prec);
  if (glength(tors2) == 1)
  {
    p2 = cgetg(4, t_VEC);
    gel(p2, 1) = gen_1;
    gel(p2, 2) = cgetg(1, t_VEC);
    gel(p2, 3) = cgetg(1, t_VEC);
    tors2 = p2;
  }
  else
  {
    if (glength(tors2) == 2)
    {
      p3 = cgetg(4, t_VEC);
      gel(p3, 1) = gen_2;
      p4 = cgetg(2, t_VEC);
      gel(p4, 1) = gen_2;
      gel(p3, 2) = p4;
      p5 = cgetg(2, t_VEC);
      gel(p5, 1) = gcopy(gel(tors2, 2));
      gel(p3, 3) = p5;
      tors2 = p3;
    }
    else
    {
      p6 = cgetg(4, t_VEC);
      gel(p6, 1) = stoi(4);
      p7 = cgetg(3, t_VEC);
      gel(p7, 1) = gen_2;
      gel(p7, 2) = gen_2;
      gel(p6, 2) = p7;
      p8 = cgetg(3, t_VEC);
      gel(p8, 1) = gcopy(gel(tors2, 2));
      gel(p8, 2) = gcopy(gel(tors2, 3));
      gel(p6, 3) = p8;
      tors2 = p6;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   E[2] = %Ps\n", tors2);
  tors2 = gerepilecopy(ltop, tors2);
  return tors2;
}

GEN
elltorseven(GEN ell, long prec)
{
  pari_sp ltop = avma;
  GEN torseven = gen_0, P2 = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    computing the 2^n-torsion\n");
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  torseven = elltors2(ell, prec);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (!gequalgs(gel(torseven, 1), 1))
    {
      P2 = ellhalf(ell, gel(gel(torseven, 3), 1), prec);
      if (glength(P2) > 0)
      {
        gel(torseven, 1) = gmulgs(gel(torseven, 1), 2);
        gel(gel(torseven, 2), 1) = gmulgs(gel(gel(torseven, 2), 1), 2);
        gel(gel(torseven, 3), 1) = gcopy(gel(P2, 1));
        continue;
      }
      if (glength(gel(torseven, 3)) == 1)
        break;
      P2 = ellhalf(ell, gel(gel(torseven, 3), 2), prec);
      if (glength(P2) > 0)
      {
        gel(torseven, 1) = gmulgs(gel(torseven, 1), 2);
        gel(gel(torseven, 2), 2) = gmulgs(gel(gel(torseven, 2), 2), 2);
        gel(gel(torseven, 3), 2) = gcopy(gel(P2, 1));
        continue;
      }
      P2 = ellhalf(ell, addell(ell, gel(gel(torseven, 3), 1), gel(gel(torseven, 3), 2)), prec);
      if (glength(P2) > 0)
      {
        gel(torseven, 1) = gmulgs(gel(torseven, 1), 2);
        gel(gel(torseven, 2), 1) = gmulgs(gel(gel(torseven, 2), 1), 2);
        gel(gel(torseven, 3), 1) = gcopy(gel(P2, 1));
        continue;
      }
      break;
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &P2, &torseven);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    E[2^n] = %Ps\n", torseven);
  torseven = gerepilecopy(ltop, torseven);
  return torseven;
}

GEN
ellsort(GEN listpts, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN n = gen_0, v = gen_0, aux = gen_0, ord = gen_0, p1 = gen_0;
  GEN p2 = gen_0, p3 = gen_0;	  /* vec */
  p1 = n = stoi(glength(listpts));
  {
    long l4;
    p2 = cgetg(gtos(p1)+1, t_VEC);
    for (l4 = 1; gcmpsg(l4, p1) <= 0; ++l4)
      gel(p2, l4) = gen_0;
  }
  v = p2;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    GEN p5 = gen_0, p6 = gen_0, p7 = gen_0;	  /* vec */
    for (i = gen_1; gcmp(i, n) <= 0; i = gaddgs(i, 1))
    {
      p5 = cgetg(2, t_VEC);
      gel(p5, 1) = gen_0;
      if (gequal(gel(listpts, gtos(i)), p5))
      {
        p6 = cgetg(4, t_VEC);
        gel(p6, 1) = gen_0;
        gel(p6, 2) = gen_0;
        gel(p6, 3) = gen_0;
        gel(v, gtos(i)) = p6;
        continue;
      }
      aux = gdiv(denom(gel(gel(listpts, gtos(i)), 2)), denom(gel(gel(listpts, gtos(i)), 1)));
      p7 = cgetg(4, t_VEC);
      gel(p7, 1) = gmul(gel(gel(listpts, gtos(i)), 1), gsqr(aux));
      gel(p7, 2) = gmul(gel(gel(listpts, gtos(i)), 2), gpowgs(aux, 3));
      gel(p7, 3) = gcopy(aux);
      gel(v, gtos(i)) = vecsort0(gabs(p7, prec), NULL, 4);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &i, &p5, &p6, &v, &aux, &p7);
    }
  }
  ord = gtovec(vecsort0(v, NULL, 3));
  /* MODI Needed for gp2c */
  {
    long i;
    p3 = cgetg(gtos(n)+1, t_VEC);
    for (i = 1; gcmpsg(i, n) <= 0; ++i)
      gel(p3, i) = gcopy(gel(listpts, gtos(gel(ord, i))));
  }
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
ellremovetorsion(GEN ell, GEN listgen)
{
  pari_sp ltop = avma;
  GEN d = gen_0, extra = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     removing torsion from %Ps\n", listgen);
  d = stoi(glength(listgen));
  extra = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    GEN p1 = gen_0, p2 = gen_0;	  /* vec */
    for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
    {
      /* points of order 1 or 2 */
      p1 = cgetg(2, t_VEC);
      gel(p1, 1) = gen_0;
      if (gequal(gel(listgen, gtos(i)), p1) || gequal(gel(listgen, gtos(i)), powell(ell, gel(listgen, gtos(i)), gen_m1)))
      {
        extra = gadd(extra, shifti(gen_1, gtos(gsubgs(i, 1))));
        continue;
      }
      /* detection of infinite order points by looking at */
      /* 8*9*5*7*P modulo the prime 1048583 */
      p2 = cgetg(2, t_VEC);
      gel(p2, 1) = gen_0;
      if ((!gequalgs(gmodgs(member_disc(ell), 1048583), 0) && !gequalgs(gmodgs(denom(gel(listgen, gtos(i))), 1048583), 0)) && !gequal(powell(ell, gmul(gel(listgen, gtos(i)), gmodulss(1, 1048583)), stoi(2520)), p2))
        continue;
      /* detection of torsion points by ellorder() */
      if (!gequal0(ellorder(ell, gel(listgen, gtos(i)), NULL)))
        extra = gadd(extra, shifti(gen_1, gtos(gsubgs(i, 1))));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &i, &p1, &extra, &p2);
    }
  }
  if (!gequal0(extra))
    listgen = extract0(listgen, gsub(subis(shifti(gen_1, glength(listgen)), 1), extra), NULL);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     without torsion = %Ps\n", listgen);
  listgen = gerepilecopy(ltop, listgen);
  return listgen;
}

GEN
ellredgen(GEN ell0, GEN listgen, GEN K, long prec)
{
  pari_sp ltop = avma;
  GEN d = gen_0, ell = gen_0, sqrtK = gen_0, urst = gen_0, extra = gen_0, M = gen_0, U = gen_0, listgen2 = gen_0, tors2 = gen_0, vt = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0;	  /* vec */
  GEN p6 = gen_0;
  GEN p7 = gen_0;	  /* vec */
  long l8;
  GEN p9 = gen_0;	  /* vec */
  if (!K)
    K = gen_1;
  listgen = gcopy(listgen);
  ell = gcopy(ell0);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Reduction of the generators %Ps\n", listgen);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     ell=%Ps\n", ell);
  d = stoi(glength(listgen));
  if (gequal0(d))
  {
    p1 = cgetg(1, t_VEC);
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  /* removing torsion points from listgen */
  listgen = ellremovetorsion(ell0, listgen);
  d = stoi(glength(listgen));
  if (gequal0(d))
  {
    p2 = cgetg(1, t_VEC);
    p2 = gerepilecopy(ltop, p2);
    return p2;
  }
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  if (!gequalgs(K, 1))
  {
    if (!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0))
      pari_err(user, " ellredgen : a1*a3 != 0");
    gel(ell, 2) = gmul(gel(ell, 2), K);
    gel(ell, 4) = gmul(gel(ell, 4), gsqr(K));
    gel(ell, 5) = gmul(gel(ell, 5), gpowgs(K, 3));
    gel(ell, 6) = gmul(gel(ell, 6), K);
    gel(ell, 7) = gmul(gel(ell, 7), gsqr(K));
    gel(ell, 8) = gmul(gel(ell, 8), gpowgs(K, 3));
    gel(ell, 9) = gmul(gel(ell, 9), gpowgs(K, 4));
    gel(ell, 10) = gmul(gel(ell, 10), gsqr(K));
    gel(ell, 11) = gmul(gel(ell, 11), gpowgs(K, 3));
    gel(ell, 12) = gmul(gel(ell, 12), gpowgs(K, 6));
    sqrtK = gsqrt(K, prec);
    if (glength(ell) == 19)
    {
      gel(ell, 14) = gmul(gel(ell, 14), K);
      gel(ell, 15) = gdiv(gel(ell, 15), sqrtK);
      gel(ell, 16) = gdiv(gel(ell, 16), sqrtK);
      gel(ell, 17) = gmul(gel(ell, 17), sqrtK);
      gel(ell, 18) = gmul(gel(ell, 18), sqrtK);
      gel(ell, 19) = gdiv(gel(ell, 19), K);
    }
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      long l10;
      for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
      {
        l10 = glength(gel(listgen, gtos(i)));
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long j;
          for (j = 1; j <= l10; ++j)
          {
            gel(gel(listgen, gtos(i)), j) = gmul(gel(gel(listgen, gtos(i)), j), gpowgs(K, j));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              listgen = gerepilecopy(btop, listgen);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &i, &listgen);
      }
    }
  }
  if (gequal1(d))
  {
    p3 = cgetg(5, t_VEC);
    gel(p3, 1) = gen_1;
    gel(p3, 2) = gen_0;
    gel(p3, 3) = gen_0;
    gel(p3, 4) = gen_0;
    urst = p3;
  }
  else
  {
    if (glength(ell) < 19)
      ell = ellinit(ell, prec);
    ell = ellminimalmodel(ell, &urst);
    listgen = ellchangepoint(listgen, urst);
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     ell = %Ps\n", ell);
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("     listgen = %Ps\n", listgen);
    /* Looking for relations between the points in listgen */
    /* using LLL on the height matrix */
    
    extra = gen_1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN p11 = gen_0;	  /* vec */
      while (!gequal0(extra))
      {
        M = mathell(ell, listgen, prec);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("    height matrix = %Ps\n", M);
        if (gcmp(gabs(det(M), prec), gpowgs(stoi(10), (-getrealprecision()) + 10)) > 0)
          break;
        U = lllkerim(ground(gmul(M, gpowgs(stoi(10), getrealprecision() - 10))));
        U = concat(gel(U, 1), gel(U, 2));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("    change of basis proposed by LLL = %Ps\n", U);
        /* the columns of U that have very small coefficients */
        /* are either exact relations or reductions (coeff <= 20) */
        /* the other ones are irrelevant. */
        extra = gen_0;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN i = gen_0;
          for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
          {
            if (gcmpgs(vecmax(gabs(gel(U, gtos(i)), prec)), 20) > 0)
              extra = gadd(extra, shifti(gen_1, gtos(gsubgs(i, 1))));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &i, &extra);
          }
        }
        U = extract0(U, gsub(subis(shifti(gen_1, gtos(d)), 1), extra), NULL);
        U = completebasis(U, NULL);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("    change of basis 1 = %Ps\n", U);
        {
          long l12;
          p11 = cgetg(gtos(d)+1, t_VEC);
          for (l12 = 1; gcmpsg(l12, d) <= 0; ++l12)
            gel(p11, l12) = gen_0;
        }
        listgen2 = p11;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN i = gen_0;
          GEN p13 = gen_0;	  /* vec */
          for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
          {
            p13 = cgetg(2, t_VEC);
            gel(p13, 1) = gen_0;
            gel(listgen2, gtos(i)) = p13;
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              GEN j = gen_0;
              for (j = gen_1; gcmp(j, d) <= 0; j = gaddgs(j, 1))
              {
                gel(listgen2, gtos(i)) = addell(ell, gel(listgen2, gtos(i)), powell(ell, gel(listgen, gtos(j)), gcoeff(U, gtos(j), gtos(i))));
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 2, &j, &listgen2);
              }
            }
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 3, &i, &p13, &listgen2);
          }
        }
        listgen = gcopy(listgen2);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 6, &M, &U, &extra, &p11, &listgen2, &listgen);
      }
    }
    /* Extracting the points of infinite order */
    
    /* removing torsion points from listgen */
    listgen = ellremovetorsion(ell, listgen);
    d = stoi(glength(listgen));
    if (gequal0(d))
    {
      p4 = cgetg(1, t_VEC);
      p4 = gerepilecopy(ltop, p4);
      return p4;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   infinite order points = %Ps\n", listgen);
  /* Now, the points should be of infinite order and independant */
  /* Reducing the points of infinite order */
  
  if (gcmpgs(d, 1) > 0)
  {
    M = mathell(ell, listgen, prec);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    height matrix = %Ps\n", M);
    U = qflllgram0(M, 0);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    change of basis 2 = %Ps\n", U);
    {
      long l14;
      p5 = cgetg(gtos(d)+1, t_VEC);
      for (l14 = 1; gcmpsg(l14, d) <= 0; ++l14)
        gel(p5, l14) = gen_0;
    }
    listgen2 = p5;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      GEN p15 = gen_0;	  /* vec */
      for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
      {
        p15 = cgetg(2, t_VEC);
        gel(p15, 1) = gen_0;
        gel(listgen2, gtos(i)) = p15;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN j = gen_0;
          for (j = gen_1; gcmp(j, d) <= 0; j = gaddgs(j, 1))
          {
            gel(listgen2, gtos(i)) = addell(ell, gel(listgen2, gtos(i)), powell(ell, gel(listgen, gtos(j)), gcoeff(U, gtos(j), gtos(i))));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &j, &listgen2);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 3, &i, &p15, &listgen2);
      }
    }
    listgen = gcopy(listgen2);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   infinite order points = %Ps\n", listgen);
  listgen = ellchangepointinverse(listgen, urst);
  /* Reducing modulo the 2-torsion */
  
  tors2 = elltorseven(ell0, prec);
  if (gcmpgs(gel(tors2, 1), 1) > 0)
  {
    p6 = gcopy(gel(gel(tors2, 2), 1));
    {
      long j;
      p7 = cgetg(gtos(p6)+1, t_VEC);
      for (j = 1; gcmpsg(j, p6) <= 0; ++j)
        gel(p7, j) = powell(ell0, gel(gel(tors2, 3), 1), stoi(j - 1));
    }
    vt = p7;
    if (glength(gel(tors2, 2)) == 2)
    {
      l8 = glength(vt);
      {
        long j;
        p9 = cgetg(l8+1, t_VEC);
        for (j = 1; j <= l8; ++j)
          gel(p9, j) = addell(ell0, gel(vt, j), gel(gel(tors2, 3), 2));
      }
      vt = concat(vt, p9);
    }
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      long l16;
      GEN p17 = gen_0;	  /* vec */
      for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
      {
        l16 = glength(vt);
        {
          long j;
          p17 = cgetg(l16+1, t_VEC);
          for (j = 1; j <= l16; ++j)
            gel(p17, j) = addell(ell0, gel(listgen, gtos(i)), gel(vt, j));
        }
        gel(listgen, gtos(i)) = gcopy(gel(ellsort(p17, prec), 1));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 3, &i, &p17, &listgen);
      }
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   infinite order points = %Ps\n", listgen);
  if (!gequalgs(K, 1))
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
    {
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        for (j = 1; j <= 2; ++j)
        {
          gel(gel(listgen, gtos(i)), j) = gdiv(gel(gel(listgen, gtos(i)), j), gpowgs(K, j));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            listgen = gerepilecopy(btop, listgen);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &listgen);
    }
  }
  /* keep only the points (x,y) with y >= 0 */
  
  if (gequal0(ell_get_a1(ell0)) && gequal0(ell_get_a3(ell0)))
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, d) <= 0; i = gaddgs(i, 1))
    {
      if (glength(gel(listgen, gtos(i))) == 2)
        gel(gel(listgen, gtos(i)), 2) = gabs(gel(gel(listgen, gtos(i)), 2), prec);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &listgen);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  reduced generators = %Ps\n", listgen);
  listgen = gerepilecopy(ltop, listgen);
  return listgen;
}

GEN
reducemodsquares(GEN delta, GEN d, long prec)
{
  pari_sp ltop = avma;
  GEN deg = gen_0, xx = gen_0, z = gen_0, qd = gen_0, Qd = gen_0, reduc = gen_0, x = pol_x(fetch_user_var("x"));
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  GEN p3 = gen_0;
  deg = stoi(degree(compo(delta, 1)));
  /* MODI to make gp2c happy */
  xx = gmodulo(x, compo(delta, 1));
  {
    long i;
    p1 = cgetg(gtos(deg)+1, t_VEC);
    for (i = 1; gcmpsg(i, deg) <= 0; ++i)
      gel(p1, i) = geval(concat(strtoGENstr("a"), stoi(i)));
  }
  z = gsubst(gtopoly(p1, -1), gvar(x), xx);
  qd = polcoeff0(lift(gmul(delta, gsqr(z))), gtos(d), gvar(x));
  {
    long i, j;
    p2 = cgetg(gtos(deg)+1, t_MAT);
    for (j = 1; gcmpsg(j, deg) <= 0; ++j)
    {
      gel(p2, j) = cgetg(gtos(deg)+1, t_COL);
      for (i = 1; gcmpsg(i, deg) <= 0; ++i)
        gcoeff(p2, i, j) = gdivgs(deriv(deriv(qd, gvar(geval(concat(strtoGENstr("a"), stoi(i))))), gvar(geval(concat(strtoGENstr("a"), stoi(j))))), 2);
    }
  }
  Qd = simplify(p2);
  reduc = IndefiniteLLL(Qd, NULL, NULL, prec);
  if (glength(reduc) == 2)
    reduc = gcopy(gel(gel(reduc, 2), 1));
  p3 = gmul(delta, gsqr(gsubst(gtopoly(reduc, -1), gvar(x), xx)));
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
bnfpSelmer(GEN bnf, GEN S, GEN p, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN S1 = gen_0, oddclass = gen_0, multS = gen_0, Slist = gen_0, LS2gen = gen_0, newprimes = gen_0, newprimesval = gen_0, kerval = gen_0;
  long l1, l2, l3;
  GEN p4 = gen_0;	  /* vec */
  long l5;
  GEN p6 = gen_0, p7 = gen_0, p8 = gen_0;	  /* vec */
  if (!S)
    S = gen_1;
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Constructing the field Selmer group : L(S,%Ps)\n", p);
  S1 = idealhnf0(bnf, S, NULL);
  oddclass = gen_0;
  multS = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(oddclass))
    {
      if (!gequalgs(multS, 1))
        S1 = idealmul(bnf, S1, multS);
      Slist = gtrans(gel(idealfactor(bnf, S1), 1));
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    constructing the S-units \n");
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    S1 = %Ps\n", Slist);
      LS2gen = bnfsunit(bnf, Slist, prec);
      /* If the class group is divisible by p, */
      /* need to enlarge S1. */
      oddclass = gmod(member_no(gel(LS2gen, 5)), p);
      if (gequal0(oddclass))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("    class group divisible by p = %Ps\n", member_no(gel(LS2gen, 5)));
        multS = idealmul(bnf, S, gel(member_gen(gel(LS2gen, 5)), 1));
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 5, &S1, &Slist, &LS2gen, &oddclass, &multS);
    }
  }
  LS2gen = gmodulo(gel(LS2gen, 1), member_pol(bnf));
  /* The valuation of the generators must be divisible by p outside S. */
  newprimes = cgetg(1, t_VEC);
  l1 = glength(Slist);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p9 = gen_0;	  /* vec */
    for (i = 1; i <= l1; ++i)
    {
      if (gequal1(idealadd(bnf, S, gel(Slist, i))))
      {
        p9 = cgetg(2, t_VEC);
        gel(p9, 1) = gcopy(gel(Slist, i));
        newprimes = concat(newprimes, p9);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p9, &newprimes);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    newprimes = %Ps\n", newprimes);
  l2 = glength(LS2gen);
  l3 = glength(newprimes);
  {
    long i, j;
    p4 = cgetg(l2+1, t_MAT);
    for (j = 1; j <= l2; ++j)
    {
      gel(p4, j) = cgetg(l3+1, t_COL);
      for (i = 1; i <= l3; ++i)
        gcoeff(p4, i, j) = stoi(idealval(bnf, gel(LS2gen, j), gel(newprimes, i)));
    }
  }
  newprimesval = p4;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    newprimesval = %Ps\n", newprimesval);
  kerval = lift(matker0(gmul(newprimesval, gmodulsg(1, p)), 0));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    kerval = %Ps\n", kerval);
  l5 = glength(kerval);
  {
    long i, l10;
    GEN p11 = gen_0;
    p6 = cgetg(l5+1, t_VEC);
    for (i = 1; i <= l5; ++i)
    {
      l10 = glength(LS2gen);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        p11 = gen_1;
        for (j = 1; j <= l10; ++j)
        {
          p11 = gmul(p11, gpow(gel(LS2gen, j), gcoeff(kerval, j, i), prec));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            p11 = gerepilecopy(btop, p11);
        }
      }
      gel(p6, i) = p11;
    }
  }
  LS2gen = p6;
  /* Add the units */
  LS2gen = concat(member_fu(bnf), LS2gen);
  /* Add also the torsion unit if its order is divisible by p. */
  if (gequal0(gmod(gel(member_tu(bnf), 1), p)))
  {
    p7 = cgetg(2, t_VEC);
    gel(p7, 1) = gcopy(gel(member_tu(bnf), 2));
    LS2gen = concat(p7, LS2gen);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   #LS2gen = %ld\n", glength(LS2gen));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    LS2gen = %Ps\n", LS2gen);
  p8 = cgetg(3, t_VEC);
  gel(p8, 1) = gcopy(LS2gen);
  gel(p8, 2) = gcopy(Slist);
  p8 = gerepilecopy(ltop, p8);
  return p8;
}

GEN
kersign(GEN gen, GEN rootapprox)
{
  pari_sp ltop = avma;
  GEN signs = gen_0, elt = gen_0, elt2 = gen_0, d = gen_0, st = gen_0, kers = gen_0, compt = gen_0;
  long l1;
  GEN p2 = gen_0;	  /* vec */
  long l3;
  gen = gcopy(gen);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Computing the kernel of the sign %Ps\n", rootapprox);
  l1 = glength(gen);
  {
    long l4;
    p2 = cgetg(l1+1, t_VEC);
    for (l4 = 1; l4 <= l1; ++l4)
      gel(p2, l4) = gen_0;
  }
  /* determination of the signs */
  signs = p2;
  l3 = glength(gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p5 = gen_0;
    for (i = 1; i <= l3; ++i)
    {
      elt = lift(gel(gen, i));
      if (degree(elt) == 0)
      {
        gel(signs, i) = stoi(gsigne(simplify(elt)) < 0);
        continue;
      }
      d = poldisc0(elt, -1);
      if (degree(elt) == 2)
        if (gcmpgs(d, 0) <= 0)
        {
          gel(signs, i) = stoi(gsigne(pollead(elt, -1)) < 0);
          continue;
        }
      if (gequal0(d))
        p5 = gdiv(elt, ggcd(elt, deriv(elt,-1)));
      else
        p5 = elt;
      elt2 = p5;
      st = gen_1;
      compt = gen_0;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (!gequal0(st))
        {
          st = stoi(sturmpart(elt2, gel(rootapprox, 1), gel(rootapprox, 2)));
          if (!gequal0(st))
          {
            rootapprox = polrealrootsimprove(compo(gel(gen, i), 1), rootapprox);
            /* MODI to make gp2c happy */
            /* if the sign of elt is too difficult to determine,  */
            /* try the sign of 1/elt. */
            if (gequal0(gmodgs(compt = gaddgs(compt, 1), 5)))
            {
              gel(gen, i) = ginv(gel(gen, i));
              --i;
              goto label2;
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &st, &rootapprox, &compt, &gen);
        }
      }
      gel(signs, i) = stoi(gsigne(gsubst(elt, gvar(gpolvar(elt)), gel(rootapprox, 2))) < 0);
      label2:;
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 9, &p5, &elt, &signs, &d, &elt2, &st, &compt, &rootapprox, &gen);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    signs = %Ps\n", signs);
  /* construction of the kernel */
  kers = gmul(matker0(gtomat(gmul(signs, gmodulss(1, 2))), 0), gmodulss(1, 2));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    kers = %Ps\n", lift(kers));
  kers = gerepilecopy(ltop, kers);
  return kers;
}

GEN
kernorm(GEN gen, GEN S, GEN p)
{
  pari_sp ltop = avma;
  GEN normgen = gen_0, normmap = gen_0, kern = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2, l3;
  GEN p4 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Computing the kernel of the norm map\n");
  if (gequalgs(p, 2))
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gen_m1;
    S = concat(p1, S);
  }
  normgen = gnorm(gen);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    normgen = %Ps\n", normgen);
  l2 = glength(normgen);
  l3 = glength(S);
  {
    long i, j, l5 = 0;
    p4 = cgetg(l2+1, t_MAT);
    for (j = 1; j <= l2; ++j)
    {
      gel(p4, j) = cgetg(l3+1, t_COL);
      for (i = 1; i <= l3; ++i)
      {
        if ((i == 1) && gequalgs(p, 2))
          l5 = gsigne(gel(normgen, j)) < 0;
        else
          l5 = ggval(gel(normgen, j), gel(S, i));
        gcoeff(p4, i, j) = stoi(l5);
      }
    }
  }
  /* matrix of the norm map */
  normmap = p4;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    normmap = %Ps\n", normmap);
  /* construction of the kernel */
  kern = gmul(matker0(gmul(normmap, gmodulsg(1, p)), 0), gmodulsg(1, p));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    ker = %Ps\n", lift(kern));
  kern = gerepilecopy(ltop, kern);
  return kern;
}

GEN
elllocalimage(GEN nf, GEN pp, GEN K, long prec)
{
  pari_sp ltop = avma;
  GEN X = gen_0, p = gen_0, prank = gen_0, rac = gen_0, pts = gen_0, bound = gen_0, essai = gen_0, mrank = gen_0, r = gen_0, xx = gen_0, delta = gen_0, ph = gen_0, delta2 = gen_0, prec_s = gen_0, ival = gen_0, x = pol_x(fetch_user_var("x"));
  GEN p1 = gen_0;	  /* vec */
  if (!K)
    K = gen_1;
  /* MODI add prec_s, ival */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    starting elllocalimage\n");
  X = gmodulo(x, member_pol(nf));
  p = gcopy(gel(gel(gel(pp, 1), 1), 1));
  prank = stoi(glength(pp) - !gequalgs(p, 2));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    prank = %Ps\n", prank);
  rac = polrootsmodpn(gmul(K, member_pol(nf)), p, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     rac = %Ps\n", rac);
  {
    long l2, l3;
    p1 = cgetg(1, t_MAT);
    for (l3 = 1; l3 <= 0; ++l3)
    {
      gel(p1, l3) = cgetg(1, t_COL);
      for (l2 = 1; l2 <= 0; ++l2)
        gcoeff(p1, l2, l3) = gen_0;
    }
  }
  pts = p1;
  bound = gaddgs(p, 6);
  essai = gen_0;
  mrank = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l4;
    while (gcmp(mrank, prank) < 0)
    {
      essai = gaddgs(essai, 1);
      if (gequal0(gmodgs(essai, 16)))
      {
        pts = matimage0(pts, 0);
        bound = gmul(bound, p);
      }
      r = gaddgs(genrand(stoi(glength(rac))), 1);
      prec_s = gsubgs(genrand(gaddgs(gel(gel(rac, gtos(r)), 2), 3)), 2);
      xx = gadd(gel(gel(rac, gtos(r)), 1), gmul(gpow(p, prec_s, prec), genrand(bound)));
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("     xx = %Ps\n", xx);
      delta = gmul(K, gsub(xx, X));
      /* rem : K*pol(xx) = norm(delta) ( = y^2 for a point on the elliptic curve) */
      if (!psquare(gmul(K, gsubst(member_pol(nf), gvar(x), xx)), p, prec))
        continue;
      ph = cgetg(1, t_VEC);
      l4 = glength(pp);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        GEN p5 = gen_0, p6 = gen_0;	  /* vec */
        for (i = 1; i <= l4; ++i)
        {
          p5 = cgetg(2, t_VEC);
          gel(p5, 1) = gcopy(ival = stoi(idealval(nf, delta, gel(gel(pp, i), 1))));
          ph = concat(ph, p5);
          delta2 = gdiv(delta, gpow(gel(gel(pp, i), 2), ival, prec));
          if (gequalgs(p, 2))
            ph = concat(ph, gtrans(ideallog(nf, delta2, gel(gel(pp, i), 3))));
          else
          {
            p6 = cgetg(2, t_VEC);
            gel(p6, 1) = stoi(1 - nfpsquareoddQ(nf, delta2, gel(gel(pp, i), 4), prec));
            ph = concat(ph, p6);
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 5, &ival, &p5, &ph, &delta2, &p6);
        }
      }
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("     ph = %Ps\n", ph);
      pts = concat(pts, gmul(gtrans(ph), gmodulss(1, 2)));
      mrank = stoi(rank(gmul(pts, gmodulss(1, 2))));
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("     pts = %Ps\n", lift(pts));
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("    matrank = %Ps\n", mrank);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 11, &essai, &pts, &bound, &r, &prec_s, &xx, &delta, &ph, &ival, &delta2, &mrank);
    }
  }
  pts = matimage0(pts, 0);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     essai = %Ps\n", essai);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of elllocalimage\n");
  pts = gerepilecopy(ltop, pts);
  return pts;
}

GEN
ell2descent_gen(GEN ell, GEN bnf, GEN K, GEN help, GEN redflag, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN A = gen_0, B = gen_0, C = gen_0, polrel = gen_0, polprime = gen_0, ttheta = gen_0, badprimes = gen_0, S = gen_0, LS2 = gen_0, selmer = gen_0, rootapprox = gen_0, p = gen_0, pp = gen_0, locimage = gen_0, LS2image = gen_0, listpointstriv = gen_0, listpoints = gen_0, iwhile = gen_0, expo = gen_0, zc = gen_0, liftzc = gen_0, den = gen_0, point = gen_0, idealfactorzc = gen_0, idealzc = gen_0, baseidealzc = gen_0, q2 = gen_0, sol = gen_0, param = gen_0, q1 = gen_0, pol = gen_0, redq = gen_0, q0 = gen_0, pointxx = gen_0, point2 = gen_0, rang = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  long l2;
  GEN p3 = gen_0;	  /* vec */
  long l4, l5;
  GEN y = pol_x(fetch_user_var("y"));
  long l6;
  GEN p7 = gen_0;	  /* vec */
  if (!K)
    K = gen_1;
  if (!help)
    help = cgetg(1, t_VEC);
  if (!redflag)
    redflag = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    starting ell2descent_gen\n");
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  if (!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0))
    pari_err(user, " ell2descent_gen : the curve is not of the form [0,a,0,b,c]");
  if (((gcmpgs(denom(ell_get_a2(ell)), 1) > 0) || (gcmpgs(denom(ell_get_a4(ell)), 1) > 0)) || (gcmpgs(denom(ell_get_a6(ell)), 1) > 0))
    pari_err(user, " ell2descent_gen : non integral coefficients");
  A = gcopy(ell_get_a2(ell));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  A = %Ps\n", A);
  B = gcopy(ell_get_a4(ell));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  B = %Ps\n", B);
  C = gcopy(ell_get_a6(ell));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  C = %Ps\n", C);
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*      Construction of L(S,2)      \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("\n");
    pari_printf("  Computing L(S,2)\n");
  }
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gcopy(A);
  gel(p1, 3) = gcopy(B);
  gel(p1, 4) = gcopy(C);
  polrel = gtopoly(p1, -1);
  polprime = deriv(polrel,-1);
  ttheta = gmodulo(x, polrel);
  if (gequal0(bnf))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   bnfinit(%Ps)\n", polrel);
    bnf = Buchall(polrel, nf_FORCE, prec);
  }
  badprimes = gabs(gmul(K, idealadd(bnf, polprime, member_index(bnf))), prec);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("     badprimes = %Ps\n", gcoeff(badprimes, 1, 1));
  S = bnfpSelmer(bnf, badprimes, gen_2, prec);
  LS2 = gcopy(gel(S, 1));
  S = gcopy(gel(S, 2));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  L(S,2) = %Ps\n", LS2);
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*   Construction of the Selmer group \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("\n");
    pari_printf("  Computing the Selmer group\n");
  }
  l2 = glength(S);
  {
    long i;
    p3 = cgetg(l2+1, t_VEC);
    for (i = 1; i <= l2; ++i)
      gel(p3, i) = icopy(member_p(gel(S, i)));
  }
  /* elements with square norm */
  selmer = kernorm(LS2, p3, gen_2);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   selmer = %Ps\n", lift(selmer));
  /* the first real embedding must be > 0 */
  /* since the norm is a square, this is automatic */
  /* if there is a single real embedding. */
  if (cmpis(member_r1(bnf), 3) == 0)
  {
    rootapprox = gcopy(gel(polrealrootsisolate(polrel), 1));
    selmer = gmul(intersect(selmer, kersign(LS2, rootapprox)), gmodulss(1, 2));
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   selmer = %Ps\n", lift(selmer));
  }
  /* p-adic points */
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   p-adic points\n");
  badprimes = gcopy(gel(factorint(gmulgs(gcoeff(badprimes, 1, 1), 2), 0), 1));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  badprimes = %Ps\n", badprimes);
  l4 = glength(badprimes);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l4; ++i)
    {
      p = gcopy(gel(badprimes, i));
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    p = %Ps\n", p);
      pp = ppinit(member_nf(bnf), p);
      locimage = elllocalimage(member_nf(bnf), pp, K, prec);
      LS2image = LS2localimage(member_nf(bnf), LS2, pp, prec);
      locimage = intersect(LS2image, locimage);
      selmer = intersect(selmer, concat(matker0(LS2image, 0), gmul(inverseimage(LS2image, locimage), gmodulss(1, 2))));
      selmer = matimage0(gmul(selmer, gmodulss(1, 2)), 0);
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    selmer = %Ps\n", selmer);
      if (!glength(selmer))
        break;
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 5, &p, &pp, &locimage, &LS2image, &selmer);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  selmer = %Ps\n", lift(selmer));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  Selmer rank = %ld\n", glength(selmer));
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*   Search for trivial points      \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (glength(selmer))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    {
      pari_printf("\n");
      pari_printf("  Search for trivial points on the curve\n");
    }
    listpointstriv = ratpoint(gmul(gpowgs(K, 3), gsubst(polrel, gvar(x), gdiv(x, K))), LIMTRIV, gen_0, prec);
    l5 = glength(listpointstriv);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      GEN p8 = gen_0;	  /* vec */
      for (i = 1; i <= l5; ++i)
      {
        if (glength(gel(listpointstriv, i)) == 3)
        {
          p8 = cgetg(2, t_VEC);
          gel(p8, 1) = gen_0;
          gel(listpointstriv, i) = p8;
        }
        else
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long j;
          for (j = 1; j <= 2; ++j)
          {
            gel(gel(listpointstriv, i), j) = gdiv(gel(gel(listpointstriv, i), j), gpowgs(K, j));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              listpointstriv = gerepilecopy(btop, listpointstriv);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &p8, &listpointstriv);
      }
    }
    listpointstriv = concat(help, listpointstriv);
    if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
      pari_printf("  Trivial points on the curve = %Ps\n", listpointstriv);
  }
  /* MODI: translate points triviaux */
  
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*   Run through the Selmer group   \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("\n");
    pari_printf("  Run through the Selmer group\n");
  }
  listpoints = cgetg(1, t_VEC);
  selmer = lift(selmer);
  iwhile = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l9;
    GEN p10 = gen_0;	  /* vec */
    long l11;
    GEN p12 = gen_0;
    long l13, l14;
    GEN p15 = gen_0, p16 = gen_0, p17 = gen_0, p18 = gen_0, p19 = gen_0, p20 = gen_0, p21 = gen_0, p22 = gen_0, p23 = gen_0, p24 = gen_0;	  /* vec */
    while (gcmp(iwhile, shifti(gen_1, glength(selmer))) < 0)
    {
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("\n");
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("   iwhile = %Ps\n", iwhile);
      l9 = glength(selmer);
      {
        long i;
        p10 = cgetg(l9+1, t_COL);
        for (i = 1; i <= l9; ++i)
          gel(p10, i) = gbittest(iwhile, i - 1);
      }
      /* the next element zc as an algebraic number modulo squares */
      
      expo = gmul(selmer, p10);
      l11 = glength(LS2);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        p12 = gen_1;
        for (i = 1; i <= l11; ++i)
        {
          p12 = gmul(p12, gpow(gel(LS2, i), gel(expo, i), prec));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            p12 = gerepilecopy(btop, p12);
        }
      }
      zc = p12;
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  zc = %Ps\n", zc);
      liftzc = lift(zc);
      /* Reduction modulo squares */
      
      if (!gequal0(redflag))
      {
        zc = reducemodsquares(zc, gen_2, prec);
        liftzc = lift(zc);
        den = gsqr(denom(content(liftzc)));
        zc = gmul(zc, den);
        liftzc = gmul(liftzc, den);
        if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
          pari_printf("  zc reduced = %Ps\n", zc);
      }
      /* Does it come from a trivial point ? */
      
      l13 = glength(listpointstriv);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        GEN p25 = gen_0;	  /* vec */
        for (i = 1; i <= l13; ++i)
        {
          point = gcopy(gel(listpointstriv, i));
          if (glength(point) == 2)
            if (nfissquare(member_nf(bnf), gmul(gmul(K, gsub(gel(point, 1), x)), liftzc), prec))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("  comes from the trivial point %Ps\n", point);
              p25 = cgetg(2, t_VEC);
              gel(p25, 1) = gcopy(point);
              listpoints = concat(listpoints, p25);
              iwhile = shifti(gen_1, gtos(gaddgs(degre(iwhile), 1)));
              goto label3;
            }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &point, &p25, &listpoints, &iwhile);
        }
      }
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  does not come from a trivial point\n");
      /* Construction of the quadratic form q2 */
      /* Change the basis using the square factors of zc */
      
      idealfactorzc = idealfactor(bnf, zc);
      gel(idealfactorzc, 2) = gmulgs(gel(idealfactorzc, 2), -1);
      gel(idealfactorzc, 2) = gdivent(gel(idealfactorzc, 2), gen_2);
      /*    idealzc = idealfactorback(bnf,idealfactorzc); */
      idealzc = matid(3);
      l14 = glength(gel(idealfactorzc, 1));
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 1; i <= l14; ++i)
        {
          idealzc = idealmul(bnf, idealzc, idealpow0(bnf, gcoeff(idealfactorzc, i, 1), gcoeff(idealfactorzc, i, 2), 0));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            idealzc = gerepilecopy(btop, idealzc);
        }
      }
      {
        long i;
        p15 = cgetg(4, t_VEC);
        for (i = 1; i <= 3; ++i)
          gel(p15, i) = basistoalg(bnf, gel(idealzc, i));
      }
      baseidealzc = p15;
      {
        long i, j;
        p16 = cgetg(4, t_MAT);
        for (j = 1; j <= 3; ++j)
        {
          gel(p16, j) = cgetg(4, t_COL);
          for (i = 1; i <= 3; ++i)
            gcoeff(p16, i, j) = gtrace(gdiv(gmul(gmul(zc, gel(baseidealzc, i)), gel(baseidealzc, j)), polprime));
        }
      }
      q2 = p16;
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    q2 = %Ps\n", q2);
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    q2/content(q2) = %Ps\n", gdiv(q2, content(q2)));
      /* Solution of the quadratic equation q2=0 */
      
      sol = Qfsolve(gdiv(q2, content(q2)), gen_0, prec);
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("    sol = %Ps\n", sol);
      if (typ(sol) == t_INT)
        pari_err(user, " ell2descent_gen : WRONG ELEMENT IN THE SELMER GROUP, please report");
      p17 = cgetg(4, t_COL);
      gel(p17, 1) = gsqr(x);
      gel(p17, 2) = gcopy(x);
      gel(p17, 3) = gen_1;
      /* Parametrizing the solutions of q2=0 */
      
      param = gmul(Qfparam(q2, sol, NULL, prec), p17);
      param = gdiv(param, content(param));
      {
        long i, j;
        p18 = cgetg(4, t_MAT);
        for (j = 1; j <= 3; ++j)
        {
          gel(p18, j) = cgetg(4, t_COL);
          for (i = 1; i <= 3; ++i)
            gcoeff(p18, i, j) = gtrace(gdiv(gmul(gmul(gmul(zc, gel(baseidealzc, i)), gel(baseidealzc, j)), gadd(ttheta, A)), polprime));
        }
      }
      /* Construction of the quartic */
      
      q1 = gneg(p18);
      pol = gmul(gmul(gtrans(param), q1), param);
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  quartic: %Ps*Y^2 = %Ps\n", K, pol);
      redq = redquartic(pol, prec);
      pol = gcopy(gel(redq, 1));
      den = denom(content(gmul(K, pol)));
      pol = gmul(pol, gsqr(den));
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  reduced: %Ps*Y^2 = %Ps\n", K, pol);
      /* Search for points on the quartic */
      
      point = ratpoint(gmul(K, pol), LIM1, gen_1, prec);
      if (gequal(point, cgetg(1, t_VEC)))
        point = ratpoint2(gmul(K, pol), LIM3, gen_1, NULL, prec);
      if (gequal(point, cgetg(1, t_VEC)))
      {
        iwhile = gaddgs(iwhile, 1);
        continue;
      }
      if (glength(point) == 2)
      {
        p19 = cgetg(2, t_VEC);
        gel(p19, 1) = gen_1;
        point = concat(point, p19);
      }
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  point on the reduced quartic = %Ps\n", point);
      p20 = cgetg(3, t_COL);
      gel(p20, 1) = gcopy(gel(point, 1));
      gel(p20, 2) = gcopy(gel(point, 3));
      p21 = cgetg(2, t_COL);
      gel(p21, 1) = gdiv(gel(point, 2), den);
      point = concat(gmul(gel(redq, 2), p20), p21);
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("  point on the quartic = %Ps\n", point);
      /* Construction of the point on the elliptic curve from the point on the quartic */
      
      param = gmul(gsubst(param, gvar(x), gdiv(x, y)), gsqr(y));
      param = gsubst(gsubst(param, gvar(x), gel(point, 1)), gvar(y), gel(point, 2));
      param = gmul(param, gdiv(K, gel(point, 3)));
      if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
        pari_printf("  reconstruction of the point on the curve\n");
      {
        long i, j;
        p22 = cgetg(4, t_MAT);
        for (j = 1; j <= 3; ++j)
        {
          gel(p22, j) = cgetg(4, t_COL);
          for (i = 1; i <= 3; ++i)
            gcoeff(p22, i, j) = gtrace(gdiv(gmul(gmul(gmul(zc, gel(baseidealzc, i)), gel(baseidealzc, j)), gadd(gadd(gsqr(ttheta), gmul(A, ttheta)), B)), polprime));
        }
      }
      q0 = p22;
      pointxx = gdiv(gmul(gmul(gtrans(param), q0), param), K);
      p23 = cgetg(3, t_VEC);
      gel(p23, 1) = gcopy(pointxx);
      gel(p23, 2) = sqrtrat(gdiv(gsubst(polrel, gvar(x), pointxx), K));
      point2 = p23;
      if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
        pari_printf("  point on the curve = %Ps\n", point2);
      p24 = cgetg(2, t_VEC);
      gel(p24, 1) = gcopy(point2);
      listpoints = concat(listpoints, p24);
      iwhile = shifti(gen_1, gtos(gaddgs(degre(iwhile), 1)));
      label3:;
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 31, &p10, &expo, &p12, &zc, &liftzc, &den, &point, &listpoints, &iwhile, &idealfactorzc, &idealzc, &p15, &baseidealzc, &p16, &q2, &sol, &p17, &param, &p18, &q1, &pol, &redq, &p19, &p20, &p21, &p22, &q0, &pointxx, &p23, &point2, &p24);
    }
  }
  /* MODI normalized blanks */
  
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*      Conclusion report           \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  rang = stoi(glength(listpoints));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("\n");
    pari_printf("  rank of found points     = %ld\n", glength(listpoints));
    pari_printf("  rank of the Selmer group = %ld\n", glength(selmer));
  }
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    afficheselmer(rang, stoi(glength(selmer)), gen_0);
  if (!gequal0(gmodgs(gsubsg(glength(selmer), rang), 2)))
  {
    rang = gaddgs(rang, 1);
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf(" III should be a square, hence \n");
      afficheselmer(rang, stoi(glength(selmer)), gen_0);
    }
  }
  /* Verification */
  
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("listpoints = %Ps\n", listpoints);
  l6 = glength(listpoints);
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l6; ++i)
    {
      if (!gequal0(gsub(gsubst(polrel, gvar(x), gel(gel(listpoints, i), 1)), gmul(K, gsqr(gel(gel(listpoints, i), 2))))))
        pari_err(user, " ell2descent_gen : WRONG POINT = %Ps please report", gel(listpoints, i));
      avma = btop;
    }
  }
  /* Reduction of the points */
  
  listpoints = vecsort0(listpoints, NULL, 2);
  if ((glength(listpoints) >= 2) && !gequal0(ELLREDGENFLAG))
    listpoints = ellredgen(ell, listpoints, K, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of ell2descent_gen\n");
  p7 = cgetg(4, t_VEC);
  gel(p7, 1) = gcopy(rang);
  gel(p7, 2) = stoi(glength(selmer));
  gel(p7, 3) = gcopy(listpoints);
  p7 = gerepilecopy(ltop, p7);
  return p7;
}

void
afficheselmer(GEN m1, GEN m2, GEN tors2)	  /* void */
{
  pari_sp ltop = avma;
  pari_printf("#E(Q)[2]      = %Ps\n", shifti(gen_1, gtos(tors2)));
  pari_printf("#S(E/Q)[2]    = %Ps\n", shifti(gen_1, gtos(m2)));
  if (gequal(gadd(m1, tors2), m2))
  {
    pari_printf("#E(Q)/2E(Q)   = %Ps\n", shifti(gen_1, gtos(gadd(m1, tors2))));
    pari_printf("#III(E/Q)[2]  = 1\n");
    pari_printf("rank(E/Q)     = %Ps\n", m1);
  }
  else
  {
    pari_printf("#E(Q)/2E(Q)  >= %Ps\n", shifti(gen_1, gtos(gadd(m1, tors2))));
    pari_printf("#III(E/Q)[2] <= %Ps\n", shifti(gen_1, gtos(gsub(gsub(m2, m1), tors2))));
    pari_printf("rank(E/Q)    >= %Ps\n", m1);
  }
  avma = ltop;
  return;
}

/* MODI: HC added */

GEN
ellrankdebug(GEN ell, GEN lev, GEN help, long prec)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  if (!help)
    help = cgetg(1, t_VEC);
  DEBUGLEVEL_ell = gcopy(lev);
  p1 = ellrank(ell, help, prec);
  gerepileall(ltop, 2, &DEBUGLEVEL_ell, &p1);
  return p1;
}

GEN
ellrank(GEN ell, GEN help, long prec)
{
  pari_sp ltop = avma;
  GEN urst = gen_0, urst1 = gen_0, den = gen_0, eqell = gen_0, tors2 = gen_0, bnf = gen_0, rang = gen_0, time1 = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0, p6 = gen_0;	  /* vec */
  if (!help)
    help = cgetg(1, t_VEC);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   starting ellrank\n");
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gen_0;
  gel(p1, 3) = gen_0;
  gel(p1, 4) = gen_0;
  /* kill the coefficients a1 and a3 */
  urst = p1;
  if (!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0))
  {
    p2 = cgetg(5, t_VEC);
    gel(p2, 1) = gen_1;
    gel(p2, 2) = gen_0;
    gel(p2, 3) = gdivgs(gneg(ell_get_a1(ell)), 2);
    gel(p2, 4) = gdivgs(gneg(ell_get_a3(ell)), 2);
    urst1 = p2;
    ell = ellchangecurve(ell, urst1);
    urst = ellcomposeurst(urst, urst1);
  }
  /* kill denominators */
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p7 = gen_0;	  /* vec */
    long l8;
    GEN p9 = gen_0, p10 = gen_0;	  /* vec */
    for(;;)
    {
      p7 = cgetg(4, t_VEC);
      gel(p7, 1) = gcopy(ell_get_a2(ell));
      gel(p7, 2) = gcopy(ell_get_a4(ell));
      gel(p7, 3) = gcopy(ell_get_a6(ell));
      if (!(gcmpgs(den = denom(p7), 1) > 0))
        break;
      den = factor(den);
      l8 = glength(gel(den, 2));
      {
        long i;
        p9 = cgetg(l8+1, t_COL);
        for (i = 1; i <= l8; ++i)
          gel(p9, i) = gen_1;
      }
      gel(den, 2) = p9;
      den = factorback(den);
      p10 = cgetg(5, t_VEC);
      gel(p10, 1) = ginv(den);
      gel(p10, 2) = gen_0;
      gel(p10, 3) = gen_0;
      gel(p10, 4) = gen_0;
      urst1 = p10;
      ell = ellchangecurve(ell, urst1);
      urst = ellcomposeurst(urst, urst1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 7, &p7, &den, &p9, &p10, &urst1, &ell, &urst);
    }
  }
  help = ellchangepoint(help, urst);
  p3 = cgetg(5, t_VEC);
  gel(p3, 1) = gen_1;
  gel(p3, 2) = gcopy(ell_get_a2(ell));
  gel(p3, 3) = gcopy(ell_get_a4(ell));
  gel(p3, 4) = gcopy(ell_get_a6(ell));
  eqell = gtopoly(p3, -1);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf(" Elliptic curve : Y^2 = %Ps\n", eqell);
  p4 = cgetg(2, t_VEC);
  gel(p4, 1) = gen_0;
  /* Choice of the algorithm depending on the 2-torsion structure */
  
  tors2 = ellhalf(ell, p4, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf(" E[2] = %Ps\n", tors2);
  if (glength(tors2) == 1)
  {
    /* case 1: 2-torsion trivial */
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("   bnfinit(%Ps)", eqell);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      gettime();
    bnf = Buchall(eqell, nf_FORCE, prec);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      time1 = stoi(gettime());
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf(" done\n");
    rang = ell2descent_gen(ell, bnf, gen_1, help, NULL, prec);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    time for bnfinit  = %Ps\n", time1);
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("    time for the rest = %ld\n", gettime());
  }
  else
  {
    if ((glength(tors2) == 2) || (gequal0(COMPLETE)))
    {
      /* case 2: 2-torsion >= Z/2Z */
      if (!gequalgs(ell_get_a6(ell), 0))
      {
        p5 = cgetg(5, t_VEC);
        gel(p5, 1) = gen_1;
        gel(p5, 2) = gcopy(gel(gel(tors2, 2), 1));
        gel(p5, 3) = gen_0;
        gel(p5, 4) = gen_0;
        urst1 = p5;
        ell = ellchangecurve(ell, urst1);
        urst = ellcomposeurst(urst, urst1);
      }
      p6 = cgetg(5, t_VEC);
      gel(p6, 1) = gen_1;
      gel(p6, 2) = gcopy(ell_get_a2(ell));
      gel(p6, 3) = gcopy(ell_get_a4(ell));
      gel(p6, 4) = gcopy(ell_get_a6(ell));
      eqell = gtopoly(p6, -1);
      if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
        pari_printf(" Elliptic curve : Y^2 = %Ps\n", eqell);
      rang = ell2descent_viaisog(ell, help, prec);
    }
    else
      /* case 3: 2-torsion = Z/2Z*Z/2Z */
      rang = ell2descent_complete(gel(gel(tors2, 2), 1), gel(gel(tors2, 3), 1), gel(gel(tors2, 4), 1), gen_0, prec);
  }
  gel(rang, 3) = ellchangepointinverse(gel(rang, 3), urst);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   end of ellrank\n");
  rang = gerepilecopy(ltop, rang);
  return rang;
}

GEN
ell2descent_complete(GEN e1, GEN e2, GEN e3, GEN help, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN ee = gen_0, d32 = gen_0, d31 = gen_0, d21 = gen_0, G1 = gen_0, G2 = gen_0, G3 = gen_0, vect1 = gen_0, vect2 = gen_0, vect3 = gen_0, selmer = gen_0, rang = gen_0, listepoints = gen_0, b1 = gen_0, b2 = gen_0, q1 = gen_0, sol1 = gen_0, param1 = gen_0, param1x = gen_0, quart = gen_0, point = gen_0, z1 = gen_0, solx = gen_0, soly = gen_0, strange = gen_0, ell = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2;
  GEN p3 = gen_0;	  /* vec */
  long l4;
  GEN p5 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  GEN p6 = gen_0, p7 = gen_0;	  /* vec */
  /* local(sol2,q2); */
  /* only if used below */
  /* MODI remove sol2 q2 */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  Algorithm of complete 2-descent\n");
  p1 = cgetg(4, t_VEC);
  gel(p1, 1) = gcopy(e1);
  gel(p1, 2) = gcopy(e2);
  gel(p1, 3) = gcopy(e3);
  /* sort the integers e1, e2, e3 in increasing order */
  
  ee = sort(p1);
  e1 = gcopy(gel(ee, 1));
  e2 = gcopy(gel(ee, 2));
  e3 = gcopy(gel(ee, 3));
  /* Computation of the groups G1 and G2 */
  
  d32 = gsub(e3, e2);
  d31 = gsub(e3, e1);
  d21 = gsub(e2, e1);
  G1 = gcopy(gel(factor(gmul(d31, d21)), 1));
  /* (G1 > 0) */
  G2 = gcopy(gel(factor(gmul(gneg(d32), d21)), 1));
  /* (G2 < 0) */
  G3 = gmul(d31, d32);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   G1 = %Ps\n", G1);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   G2 = %Ps\n", G2);
  l2 = glength(G1);
  {
    long i;
    GEN p8 = gen_0;	  /* vec */
    p3 = cgetg(l2+1, t_VEC);
    for (i = 1; i <= l2; ++i)
    {
      p8 = cgetg(3, t_VEC);
      gel(p8, 1) = gen_0;
      gel(p8, 2) = gen_1;
      gel(p3, i) = p8;
    }
  }
  /* Run through G1*G2 */
  
  vect1 = p3;
  l4 = glength(G2);
  {
    long i;
    GEN p9 = gen_0;	  /* vec */
    p5 = cgetg(l4+1, t_VEC);
    for (i = 1; i <= l4; ++i)
    {
      p9 = cgetg(3, t_VEC);
      gel(p9, 1) = gen_0;
      gel(p9, 2) = gen_1;
      gel(p5, i) = p9;
    }
  }
  vect2 = p5;
  selmer = gen_0;
  rang = gen_0;
  listepoints = cgetg(1, t_VEC);
  {
    GEN fv_data = gen_0;
    GEN (*fv_next)(GEN, GEN);	  /* func_GG */
    GEN X = forvec_start(vect1, 0, &fv_data, &fv_next);	  /* vec */
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long l10;
      GEN p11 = gen_0;
      long l12;
      for (  ; X; X = fv_next(fv_data, X))
      {
        l10 = glength(G1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long i;
          p11 = gen_1;
          for (i = 1; i <= l10; ++i)
          {
            p11 = gmul(p11, gpow(gel(G1, i), gel(X, i), prec));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              p11 = gerepilecopy(btop, p11);
          }
        }
        b1 = p11;
        /* b1*b2*b3 must be a square, where b3 is a divisor of d32*d31 */
        vect3 = gcopy(vect2);
        l12 = glength(G2);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long i;
          GEN p13 = gen_0;	  /* vec */
          for (i = 2; i <= l12; ++i)
          {
            if (!gequalgs(gmod(G3, gel(G2, i)), 0))
            {
              p13 = cgetg(3, t_VEC);
              gel(p13, 1) = gen_1;
              gel(p13, 2) = gen_1;
              gel(vect3, i) = gmulgs(p13, ggval(b1, gel(G2, i)));
            }
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &p13, &vect3);
          }
        }
        {
          GEN fv_data = gen_0;
          GEN (*fv_next)(GEN, GEN);	  /* func_GG */
          GEN Y = forvec_start(vect3, 0, &fv_data, &fv_next);	  /* vec */
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long l14;
            GEN p15 = gen_0;
            GEN p16 = gen_0, p17 = gen_0, p18 = gen_0, p19 = gen_0, p20 = gen_0, p21 = gen_0, p22 = gen_0;	  /* vec */
            long l23;
            GEN p24 = gen_0, p25 = gen_0, p26 = gen_0, p27 = gen_0, p28 = gen_0;	  /* vec */
            for (  ; Y; Y = fv_next(fv_data, Y))
            {
              l14 = glength(G2);
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                long i;
                p15 = gen_1;
                for (i = 1; i <= l14; ++i)
                {
                  p15 = gmul(p15, gpow(gel(G2, i), gel(Y, i), prec));
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    p15 = gerepilecopy(btop, p15);
                }
              }
              b2 = p15;
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
              {
                p16 = cgetg(3, t_VEC);
                gel(p16, 1) = gcopy(b1);
                gel(p16, 2) = gcopy(b2);
                pari_printf("   [b1,b2] = %Ps\n", lift(p16));
              }
              /* Trivial points coming from the 2-torsion */
              
              if (gequal1(b1) && gequal1(b2))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                  pari_printf("    trivial point [0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                continue;
              }
              if (!gequal0(gissquare(gmul(gneg(d21), b2))) && !gequal0(gissquare(gmul(gmul(d31, d21), b1))))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   trivial point [e1,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                p17 = cgetg(2, t_VEC);
                p18 = cgetg(3, t_VEC);
                gel(p18, 1) = gcopy(e1);
                gel(p18, 2) = gen_0;
                gel(p17, 1) = p18;
                listepoints = concat(listepoints, p17);
                continue;
              }
              if (!gequal0(gissquare(gmul(d21, b1))) && !gequal0(gissquare(gmul(gmul(gneg(d32), d21), b2))))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   trivial point [e2,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                p19 = cgetg(2, t_VEC);
                p20 = cgetg(3, t_VEC);
                gel(p20, 1) = gcopy(e2);
                gel(p20, 2) = gen_0;
                gel(p19, 1) = p20;
                listepoints = concat(listepoints, p19);
                continue;
              }
              if (!gequal0(gissquare(gmul(d31, b1))) && !gequal0(gissquare(gmul(d32, b2))))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   trivial point [e3,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                p21 = cgetg(2, t_VEC);
                p22 = cgetg(3, t_VEC);
                gel(p22, 1) = gcopy(e3);
                gel(p22, 2) = gen_0;
                gel(p21, 1) = p22;
                listepoints = concat(listepoints, p21);
                continue;
              }
              /* Trivial points coming from help */
              
              l23 = glength(help);
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                long i;
                GEN p29 = gen_0;	  /* vec */
                for (i = 1; i <= l23; ++i)
                {
                  if ((glength(gel(help, i)) != 2) || gequal0(gel(gel(help, i), 2)))
                    continue;
                  if (!gequal0(gissquare(gmul(b1, gsub(gel(gel(help, i), 1), e1)))) && !gequal0(gissquare(gmul(b2, gsub(gel(gel(help, i), 1), e2)))))
                  {
                    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                      pari_printf("   trivial point from help %Ps\n", gel(help, i));
                    selmer = gaddgs(selmer, 1);
                    rang = gaddgs(rang, 1);
                    p29 = cgetg(2, t_VEC);
                    gel(p29, 1) = gcopy(gel(help, i));
                    listepoints = concat(listepoints, p29);
                    goto label4;
                  }
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    gerepileall(btop, 4, &selmer, &rang, &p29, &listepoints);
                }
              }
              p24 = cgetg(4, t_VEC);
              gel(p24, 1) = gcopy(b1);
              gel(p24, 2) = gneg(b2);
              gel(p24, 3) = gneg(d21);
              /* If one can solve 2 quadratic equations */
              /* (1) q1 : b1*z1^2-b2*z2^2 = e2-e1 */
              /* (2) q2 : b1*z1^2-b1*b2*z3^2 = e3-e1 */
              /* then (x,y) = (b1*z1^2+e1,b1*b2*z1*z2*z3) is a point on E */
              /* we also have */
              /* (3) q3 = q1-q2 : b1*b2*z3^2-b2*z2^2=e2-e3 */
              
              /* Solution of the q1 */
              
              q1 = diagonal(p24);
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("   q1 = %Ps\n", q1);
              sol1 = Qfsolve(q1, gen_0, prec);
              if (typ(sol1) == t_INT)
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   q1 not ELS at %Ps\n", sol1);
                continue;
              }
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("   solution of q1 = %Ps\n", sol1);
              param1 = Qfparam(q1, sol1, gen_1, prec);
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("   parametrization of q1 = %Ps\n", param1);
              p25 = cgetg(4, t_COL);
              gel(p25, 1) = gsqr(x);
              gel(p25, 2) = gcopy(x);
              gel(p25, 3) = gen_1;
              param1x = gmul(param1, p25);
              /* Solution of the q2 */
              /* only useful to detect local non solubility */
              
              /*      q2 = matdiagonal([b1,-b1*b2,-d31]); */
              /*if( DEBUGLEVEL_ell >= 3, print("   q2 = ",q2)); */
              /*      sol2 = Qfsolve(q2); */
              /*      if( type(sol2) == "t_INT", */
              /*if( DEBUGLEVEL_ell >= 3, print("   q2 not ELS at ",sol2)); */
              /*        next); */
              
              /* Construction of the quartic */
              
              quart = gmul(gmul(b1, b2), gsub(gmul(b1, gsqr(gel(param1x, 1))), gmul(d31, gsqr(gel(param1x, 3)))));
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("   quart = %Ps\n", quart);
              /* Local solubility of the quartic */
              
              if (!locallysoluble(quart, prec))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   quartic not ELS \n");
                continue;
              }
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("  y^2 = %Ps\n", quart);
              selmer = gaddgs(selmer, 1);
              /* Search for points on the quartic */
              
              point = ratpoint2(quart, LIM3, gen_1, NULL, prec);
              if (!gequal(point, cgetg(1, t_VEC)))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf("  point found on the quartic !!\n");
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("   %Ps\n", point);
                if (glength(point) == 2)
                  z1 = gdiv(gsubst(gel(param1x, 1), gvar(x), gel(point, 1)), gsubst(gel(param1x, 3), gvar(x), gel(point, 1)));
                else
                  z1 = gdiv(gcoeff(param1, 1, 1), gcoeff(param1, 3, 1));
                solx = gadd(gmul(b1, gsqr(z1)), e1);
                soly = sqrtrat(gmul(gmul(gsub(solx, e1), gsub(solx, e2)), gsub(solx, e3)));
                p26 = cgetg(2, t_VEC);
                p27 = cgetg(3, t_VEC);
                gel(p27, 1) = gcopy(solx);
                gel(p27, 2) = gcopy(soly);
                gel(p26, 1) = p27;
                listepoints = concat(listepoints, p26);
                if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
                {
                  p28 = cgetg(3, t_VEC);
                  gel(p28, 1) = gcopy(solx);
                  gel(p28, 2) = gcopy(soly);
                  pari_printf(" point on the elliptic curve = %Ps\n", p28);
                }
                rang = gaddgs(rang, 1);
              }
              else
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf("  no point found on the quartic\n");
              label4:;
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 27, &p15, &b2, &p16, &selmer, &rang, &p18, &p17, &listepoints, &p20, &p19, &p22, &p21, &p24, &q1, &sol1, &param1, &p25, &param1x, &quart, &point, &z1, &solx, &soly, &p27, &p26, &p28, &Y);
            }
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 17, &p11, &b1, &vect3, &b2, &selmer, &rang, &listepoints, &q1, &sol1, &param1, &param1x, &quart, &point, &z1, &solx, &soly, &X);
      }
    }
  }
  /* end */
  
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("#S^(2)      = %Ps\n", selmer);
  if (gcmp(rang, gdivgs(selmer, 2)) > 0)
    rang = selmer;
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    strange = stoi(!gequal(rang, selmer));
    if (!gequal0(strange))
      pari_printf("#E[K]/2E[K]>= %Ps\n", rang);
    else
      pari_printf("#E[K]/2E[K] = %Ps\n", rang);
    pari_printf("#E[2]       = 4\n");
  }
  rang = gsubgs(gceil(gdiv(glog(rang, prec), glog(gen_2, prec))), 2);
  selmer = stoi(ggval(selmer, gen_2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(strange))
      pari_printf("%Ps >= rank  >= %Ps\n", gsubgs(selmer, 2), rang);
    else
      pari_printf("rank        = %Ps\n", rang);
    if (!gequal0(rang))
      pari_printf("points = %Ps\n", listepoints);
  }
  p6 = cgetg(6, t_VEC);
  gel(p6, 1) = gen_0;
  gel(p6, 2) = gneg(gadd(gadd(e1, e2), e3));
  gel(p6, 3) = gen_0;
  gel(p6, 4) = gadd(gadd(gmul(e1, e2), gmul(e2, e3)), gmul(e3, e1));
  gel(p6, 5) = gmul(gmul(gneg(e1), e2), e3);
  ell = smallellinit(p6);
  listepoints = vecsort0(listepoints, NULL, 2);
  if (!gequal0(ELLREDGENFLAG))
    listepoints = ellredgen(ell, listepoints, NULL, prec);
  listepoints = concat(ellsort(gel(elltorseven(ell, prec), 3), prec), listepoints);
  p7 = cgetg(4, t_VEC);
  gel(p7, 1) = gcopy(rang);
  gel(p7, 2) = gcopy(selmer);
  gel(p7, 3) = gcopy(listepoints);
  p7 = gerepilecopy(ltop, p7);
  return p7;
}

GEN
ellcount(GEN c, GEN d, GEN KS2gen, GEN listpointstriv, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN found = gen_0, listgen = gen_0, listpointscount = gen_0, m1 = gen_0, m2 = gen_0, lastloc = gen_0, mask = gen_0, i = gen_0, d1 = gen_0, iaux = gen_0, j = gen_0, triv = gen_0, pol = gen_0, point = gen_0, qf = gen_0, solqf = gen_0, para = gen_0, point1 = gen_0, v = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x")), t = pol_x(fetch_user_var("t"));
  long l2;
  GEN p3 = gen_0, p4 = gen_0;	  /* vec */
  if (!listpointstriv)
    listpointstriv = cgetg(1, t_VEC);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(c);
    gel(p1, 2) = gcopy(d);
    pari_printf("    starting ellcount %Ps\n", p1);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    KS2gen = %Ps\n", KS2gen);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    listpointstriv = %Ps\n", listpointstriv);
  found = gen_0;
  listgen = gcopy(KS2gen);
  listpointscount = cgetg(1, t_VEC);
  m1 = m2 = gen_0;
  lastloc = gen_m1;
  mask = shifti(gen_1, glength(KS2gen));
  i = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l5;
    GEN p6 = gen_0, p7 = gen_0, p8 = gen_0, p9 = gen_0, p10 = gen_0, p11 = gen_0, p12 = gen_0, p13 = gen_0, p14 = gen_0, p15 = gen_0;	  /* vec */
    while (gcmp(i, mask) < 0)
    {
      d1 = gen_1;
      iaux = i;
      j = gen_1;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (!gequal0(iaux))
        {
          if (!gequal0(gmodgs(iaux, 2)))
            d1 = gmul(d1, gel(listgen, gtos(j)));
          iaux = gshift(iaux, -1);
          j = gaddgs(j, 1);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 3, &d1, &iaux, &j);
        }
      }
      if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
        pari_printf("   d1 = %Ps\n", d1);
      triv = gen_0;
      l5 = glength(listpointstriv);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        GEN p16 = gen_0;	  /* vec */
        for (j = 1; j <= l5; ++j)
        {
          if (!gequal0(gel(gel(listpointstriv, j), 1)) && !gequal0(gissquare(gmul(d1, gel(gel(listpointstriv, j), 1)))))
          {
            p16 = cgetg(2, t_VEC);
            gel(p16, 1) = gcopy(gel(listpointstriv, j));
            listpointscount = concat(listpointscount, p16);
            if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              pari_printf("  trivial point\n");
            triv = gen_1;
            m1 = gaddgs(m1, 1);
            if (gcmp(degre(i), lastloc) > 0)
              m2 = gaddgs(m2, 1);
            found = gen_1;
            lastloc = gen_m1;
            break;
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 7, &p16, &listpointscount, &triv, &m1, &m2, &found, &lastloc);
        }
      }
      if (gequal0(triv))
      {
        p6 = cgetg(6, t_VEC);
        gel(p6, 1) = gcopy(d1);
        gel(p6, 2) = gen_0;
        gel(p6, 3) = gcopy(c);
        gel(p6, 4) = gen_0;
        gel(p6, 5) = gdiv(d, d1);
        pol = gtopoly(p6, -1);
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("   quartic = y^2 = %Ps\n", pol);
        point = ratpoint(pol, LIM1, gen_1, prec);
        if (!gequal(point, cgetg(1, t_VEC)))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf("  point on the quartic\n");
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf("%Ps\n", point);
          m1 = gaddgs(m1, 1);
          p7 = cgetg(2, t_VEC);
          gel(p7, 1) = gmul(gmul(d1, gel(point, 1)), point);
          listpointscount = concat(listpointscount, p7);
          if (gcmp(degre(i), lastloc) > 0)
            m2 = gaddgs(m2, 1);
          found = gen_1;
          lastloc = gen_m1;
        }
        else
          if (locallysoluble(pol, prec))
          {
            if (gcmp(degre(i), lastloc) > 0)
            {
              m2 = gaddgs(m2, 1);
              lastloc = degre(i);
            }
            p8 = cgetg(4, t_MAT);
            gel(p8, 1) = cgetg(4, t_COL);
            gel(p8, 2) = cgetg(4, t_COL);
            gel(p8, 3) = cgetg(4, t_COL);
            gcoeff(p8, 1, 1) = gcopy(d1);
            gcoeff(p8, 1, 2) = gdivgs(c, 2);
            gcoeff(p8, 1, 3) = gen_0;
            gcoeff(p8, 2, 1) = gdivgs(c, 2);
            gcoeff(p8, 2, 2) = gdiv(d, d1);
            gcoeff(p8, 2, 3) = gen_0;
            gcoeff(p8, 3, 1) = gen_0;
            gcoeff(p8, 3, 2) = gen_0;
            gcoeff(p8, 3, 3) = gen_m1;
            /*        point = ratpoint2(pol,LIM3,1); */
            /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
            /* Instead of solving directly y^2 = d1*x^4+c*x^2+d/d1, */
            /* we solve first y^2 = d1*X^2+c*X+d/d1, then solve the quartic X = x^2 */
            /* which gives a new quartic */
            qf = gmulsg(2, p8);
            solqf = Qfsolve(qf, gen_0, prec);
            p9 = cgetg(4, t_COL);
            gel(p9, 1) = gsqr(x);
            gel(p9, 2) = gcopy(x);
            gel(p9, 3) = gen_1;
            para = gmul(Qfparam(qf, solqf, gen_2, prec), p9);
            if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            {
              p10 = cgetg(4, t_VEC);
              gel(p10, 1) = gcopy(d1);
              gel(p10, 2) = gcopy(c);
              gel(p10, 3) = gdiv(d, d1);
              pari_printf("   the conic y^2 = %Ps\n", gtopoly(p10, -1));
              p11 = cgetg(3, t_VEC);
              gel(p11, 1) = gdiv(gel(para, 1), gel(para, 2));
              gel(p11, 2) = gdiv(gel(para, 3), gel(para, 2));
              pari_printf("   is parametrized by [x,y] = %Ps\n", gsubst(p11, gvar(x), t));
            }
            point1 = ratpoint2(gmul(gel(para, 1), gel(para, 2)), LIM3, gen_1, NULL, prec);
            if (!gequal(point1, cgetg(1, t_VEC)))
            {
              if (glength(point1) == 2)
                para = gsubst(para, gvar(x), gel(point1, 1));
              else
              {
                p12 = cgetg(4, t_VEC);
                gel(p12, 1) = gen_1;
                gel(p12, 2) = gdiv(gel(point1, 2), gsqr(gel(point1, 1)));
                gel(p12, 3) = gen_0;
                point1 = p12;
                {
                  long ii;
                  p13 = cgetg(4, t_VEC);
                  for (ii = 1; ii <= 3; ++ii)
                    gel(p13, ii) = polcoeff0(gel(para, ii), 2, -1);
                }
                para = p13;
              }
              p14 = cgetg(3, t_VEC);
              gel(p14, 1) = gdiv(gel(point1, 2), gel(para, 2));
              gel(p14, 2) = gdiv(gel(para, 3), gel(para, 2));
              point = p14;
            }
            else
              point = cgetg(1, t_VEC);
            /*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
            if (!gequal(point, cgetg(1, t_VEC)))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("  point on the quartic\n");
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("%Ps\n", point);
              m1 = gaddgs(m1, 1);
              p15 = cgetg(2, t_VEC);
              gel(p15, 1) = gmul(gmul(d1, gel(point, 1)), point);
              listpointscount = concat(listpointscount, p15);
              if (gcmp(degre(i), lastloc) > 0)
                m2 = gaddgs(m2, 1);
              found = gen_1;
              lastloc = gen_m1;
            }
            else
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("  no point found on the quartic\n");
          }
      }
      if (!gequal0(found))
      {
        found = gen_0;
        v = gen_0;
        iaux = gshift(i, -1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (!gequal0(iaux))
          {
            iaux = gshift(iaux, -1);
            v = gaddgs(v, 1);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &iaux, &v);
          }
        }
        mask = gshift(mask, -1);
        listgen = extract0(listgen, subis(subii(shifti(gen_1, glength(listgen)), shifti(gen_1, gtos(v))), 1), NULL);
        i = shifti(gen_1, gtos(v));
      }
      else
        i = gaddgs(i, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 29, &d1, &iaux, &j, &triv, &listpointscount, &m1, &m2, &found, &lastloc, &p6, &pol, &point, &p7, &p8, &qf, &solqf, &p9, &para, &p10, &p11, &point1, &p12, &p13, &p14, &p15, &v, &mask, &listgen, &i);
    }
  }
  l2 = glength(listpointscount);
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l2; ++i)
    {
      if (glength(gel(listpointscount, i)) > 1)
        if (!gequalgs(gsub(gsubst(gadd(gadd(gpowgs(x, 3), gmul(c, gsqr(x))), gmul(d, x)), gvar(x), gel(gel(listpointscount, i), 1)), gsqr(gel(gel(listpointscount, i), 2))), 0))
          pari_err(user, " ellcount : WRONG POINT, please report %ld", i);
      avma = btop;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("    end of ellcount\n");
  p3 = cgetg(3, t_VEC);
  gel(p3, 1) = gcopy(listpointscount);
  p4 = cgetg(3, t_VEC);
  gel(p4, 1) = gcopy(m1);
  gel(p4, 2) = gcopy(m2);
  gel(p3, 2) = p4;
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
ell2descent_viaisog(GEN ell, GEN help, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN P = gen_0, Pfact = gen_0, tors = gen_0, listpointstriv = gen_0, KS2prod = gen_0, KS2gen = gen_0, listpoints = gen_0, pointgen = gen_0, n1 = gen_0, n2 = gen_0, certain = gen_0, apinit = gen_0, bpinit = gen_0, np1 = gen_0, np2 = gen_0, listpoints2 = gen_0, aux1 = gen_0, aux2 = gen_0, certainp = gen_0, rang = gen_0, strange = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  GEN p2 = gen_0, p3 = gen_0;	  /* vec */
  long l4;
  GEN p5 = gen_0;	  /* vec */
  long l6;
  GEN p7 = gen_0;	  /* vec */
  if (!help)
    help = cgetg(1, t_VEC);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("  Algorithm of 2-descent via isogenies\n");
  if (glength(ell) < 13)
    ell = smallellinit(ell);
  if (gequal0(member_disc(ell)))
    pari_err(user, " ell2descent_viaisog : singular curve !!");
  if ((!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0)) || !gequalgs(ell_get_a6(ell), 0))
    pari_err(user, " ell2descent_viaisog : the curve is not on the form [0,a,0,b,0]");
  if ((gcmpgs(denom(ell_get_a2(ell)), 1) > 0) || (gcmpgs(denom(ell_get_a4(ell)), 1) > 0))
    pari_err(user, " ell2descent_viaisog : non-integral coefficients");
  p1 = cgetg(4, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gcopy(ell_get_a2(ell));
  gel(p1, 3) = gcopy(ell_get_a4(ell));
  /* */
  /* Working with the initial curve */
  /* */
  
  /* Construction of trivial points : torsion */
  
  P = gtopoly(p1, -1);
  Pfact = gcopy(gel(factor(P), 1));
  tors = stoi(glength(Pfact));
  listpointstriv = concat(help, gel(elltorseven(ell, prec), 3));
  /* Construction of trivial points : small naive height */
  
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Search for trivial points on the curve\n");
  P = gmul(P, x);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Y^2 = %Ps\n", P);
  listpointstriv = concat(listpointstriv, ratpoint(P, LIMTRIV, gen_0, prec));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf(" trivial points on E(Q) = %Ps\n", listpointstriv);
    pari_printf("\n");
  }
  KS2prod = gneg(gabs(ell_get_a4(ell), prec));
  if (gcmpgs(gsub(gsqr(ell_get_a2(ell)), gmulsg(4, ell_get_a4(ell))), 0) < 0)
    KS2prod = gmulgs(KS2prod, -1);
  KS2gen = gcopy(gel(factor(KS2prod), 1));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("  #K(b,2)gen          = %ld\n", glength(KS2gen));
    pari_printf("  K(b,2)gen = %Ps\n", KS2gen);
  }
  listpoints = ellcount(ell_get_a2(ell), ell_get_a4(ell), KS2gen, listpointstriv, prec);
  pointgen = gcopy(gel(listpoints, 1));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf(" points on E(Q) = %Ps\n", pointgen);
    pari_printf("\n");
  }
  n1 = gcopy(gel(gel(listpoints, 2), 1));
  n2 = gcopy(gel(gel(listpoints, 2), 2));
  certain = stoi(gequal(n1, n2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certain))
    {
      pari_printf("[E(Q):phi'(E'(Q))]  = %Ps\n", shifti(gen_1, gtos(n1)));
      pari_printf("#S^(phi')(E'/Q)     = %Ps\n", shifti(gen_1, gtos(n2)));
      pari_printf("#III(E'/Q)[phi']    = 1\n");
      pari_printf("\n");
    }
    else
    {
      pari_printf("[E(Q):phi'(E'(Q))] >= %Ps\n", shifti(gen_1, gtos(n1)));
      pari_printf("#S^(phi')(E'/Q)     = %Ps\n", shifti(gen_1, gtos(n2)));
      pari_printf("#III(E'/Q)[phi']   <= %Ps\n", shifti(gen_1, gtos(gsub(n2, n1))));
      pari_printf("\n");
    }
  }
  /* */
  /* Working with the isogeneous curve */
  /* */
  
  apinit = gmulsg(-2, ell_get_a2(ell));
  bpinit = gsub(gsqr(ell_get_a2(ell)), gmulsg(4, ell_get_a4(ell)));
  KS2prod = gneg(gabs(bpinit, prec));
  if (gcmpgs(ell_get_a4(ell), 0) < 0)
    KS2prod = gmulgs(KS2prod, -1);
  KS2gen = gcopy(gel(factor(KS2prod), 1));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("  #K(a^2-4b,2)gen     = %ld\n", glength(KS2gen));
    pari_printf("  K(a^2-4b,2)gen     = %Ps\n", KS2gen);
  }
  p2 = cgetg(4, t_VEC);
  gel(p2, 1) = gen_1;
  gel(p2, 2) = gcopy(apinit);
  gel(p2, 3) = gcopy(bpinit);
  /* Construction of trivial points : torsion */
  
  P = gtopoly(p2, -1);
  p3 = cgetg(6, t_VEC);
  gel(p3, 1) = gen_0;
  gel(p3, 2) = gcopy(apinit);
  gel(p3, 3) = gen_0;
  gel(p3, 4) = gcopy(bpinit);
  gel(p3, 5) = gen_0;
  listpointstriv = gcopy(gel(elltorseven(p3, prec), 3));
  /* Construction of trivial points : small naive height */
  
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   Search for trivial points on the curve\n");
  P = gmul(P, x);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf(" Y^2 = %Ps\n", P);
  listpointstriv = concat(listpointstriv, ratpoint(P, LIMTRIV, gen_0, prec));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf(" trivial points on E'(Q) = %Ps\n", listpointstriv);
    pari_printf("\n");
  }
  listpoints = ellcount(apinit, bpinit, KS2gen, listpointstriv, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf(" points on E'(Q) = %Ps\n", gel(listpoints, 1));
  np1 = gcopy(gel(gel(listpoints, 2), 1));
  np2 = gcopy(gel(gel(listpoints, 2), 2));
  l4 = glength(gel(listpoints, 1));
  {
    long i;
    p5 = cgetg(l4+1, t_VEC);
    for (i = 1; i <= l4; ++i)
      gel(p5, i) = gen_0;
  }
  listpoints2 = p5;
  l6 = glength(gel(listpoints, 1));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p8 = gen_0;	  /* vec */
    for (i = 1; i <= l6; ++i)
    {
      p8 = cgetg(3, t_VEC);
      gel(p8, 1) = gen_0;
      gel(p8, 2) = gen_0;
      gel(listpoints2, i) = p8;
      aux1 = gsqr(gel(gel(gel(listpoints, 1), i), 1));
      if (!gequalgs(aux1, 0))
      {
        aux2 = gcopy(gel(gel(gel(listpoints, 1), i), 2));
        gel(gel(listpoints2, i), 1) = gdivgs(gdiv(gsqr(aux2), aux1), 4);
        gel(gel(listpoints2, i), 2) = gdivgs(gdiv(gmul(aux2, gsub(bpinit, aux1)), aux1), 8);
      }
      else
        gel(listpoints2, i) = gcopy(gel(gel(listpoints, 1), i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p8, &listpoints2, &aux1, &aux2);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf(" points on E(Q) = %Ps\n", listpoints2);
    pari_printf("\n");
  }
  pointgen = concat(pointgen, listpoints2);
  certainp = stoi(gequal(np1, np2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certainp))
    {
      pari_printf("[E'(Q):phi(E(Q))]   = %Ps\n", shifti(gen_1, gtos(np1)));
      pari_printf("#S^(phi)(E/Q)       = %Ps\n", shifti(gen_1, gtos(np2)));
      pari_printf("#III(E/Q)[phi]      = 1\n");
      pari_printf("\n");
    }
    else
    {
      pari_printf("[E'(Q):phi(E(Q))]  >= %Ps\n", shifti(gen_1, gtos(np1)));
      pari_printf("#S^(phi)(E/Q)       = %Ps\n", shifti(gen_1, gtos(np2)));
      pari_printf("#III(E/Q)[phi]     <= %Ps\n", shifti(gen_1, gtos(gsub(np2, np1))));
      pari_printf("\n");
    }
    if ((gequal0(certain)) && (gcmp(np2, np1) > 0))
      pari_printf("%Ps <= ", shifti(gen_1, gtos(gsub(np2, np1))));
    pari_printf("#III(E/Q)[2]       ");
    if (!gequal0(certain) && !gequal0(certainp))
      pari_printf(" ");
    else
      pari_printf("<");
    pari_printf("= %Ps\n", shifti(gen_1, gtos(gsub(gsub(gadd(n2, np2), n1), np1))));
    pari_printf("#E(Q)[2]            = %Ps\n", shifti(gen_1, gtos(tors)));
  }
  rang = gsubgs(gadd(n1, np1), 2);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certain) && !gequal0(certainp))
    {
      pari_printf("#E(Q)/2E(Q)         = %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
      pari_printf("rank                = %Ps\n", rang);
      pari_printf("\n");
    }
    else
    {
      pari_printf("#E(Q)/2E(Q)        >= %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
      pari_printf("\n");
      pari_printf("%Ps <= rank          <= %Ps\n", rang, gsubgs(gadd(n2, np2), 2));
      pari_printf("\n");
    }
  }
  strange = gmodgs(gsub(gsub(gadd(n2, np2), n1), np1), 2);
  if (!gequal0(strange))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf(" !!! III should be a square !!!\n");
      pari_printf("hence\n");
    }
    if (!gequal0(certain))
    {
      np1 = gaddgs(np1, 1);
      certainp = stoi(gequal(np1, np2));
      if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
      {
        if (!gequal0(certainp))
        {
          pari_printf("[E'(Q):phi(E(Q))]   = %Ps\n", shifti(gen_1, gtos(np1)));
          pari_printf("#S^(phi)(E/Q)       = %Ps\n", shifti(gen_1, gtos(np2)));
          pari_printf("#III(E/Q)[phi]      = 1\n");
          pari_printf("\n");
        }
        else
        {
          pari_printf("[E'(Q):phi(E(Q))]  >= %Ps\n", shifti(gen_1, gtos(np1)));
          pari_printf("#S^(phi)(E/Q)       = %Ps\n", shifti(gen_1, gtos(np2)));
          pari_printf("#III(E/Q)[phi]     <= %Ps\n", shifti(gen_1, gtos(gsub(np2, np1))));
          pari_printf("\n");
        }
      }
    }
    else
    {
      if (!gequal0(certainp))
      {
        n1 = gaddgs(n1, 1);
        certain = stoi(gequal(n1, n2));
        if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
        {
          if (!gequal0(certain))
          {
            pari_printf("[E(Q):phi'(E'(Q))]   = %Ps\n", shifti(gen_1, gtos(n1)));
            pari_printf("#S^(phi')(E'/Q)       = %Ps\n", shifti(gen_1, gtos(n2)));
            pari_printf("#III(E'/Q)[phi']      = 1\n");
            pari_printf("\n");
          }
          else
          {
            pari_printf("[E(Q):phi'(E'(Q))]  >= %Ps\n", shifti(gen_1, gtos(n1)));
            pari_printf("#S^(phi')(E'/Q)      = %Ps\n", shifti(gen_1, gtos(n2)));
            pari_printf("#III(E'/Q)[phi']    <= %Ps\n", shifti(gen_1, gtos(gsub(n2, n1))));
            pari_printf("\n");
          }
        }
      }
      else
        n1 = gaddgs(n1, 1);
    }
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf("#S^(2)(E/Q)           = %Ps\n", shifti(gen_1, gtos(gsubgs(gadd(n2, np2), 1))));
      if ((gequal0(certain)) && (gcmp(np2, np1) > 0))
        pari_printf(" %Ps <= ", shifti(gen_1, gtos(gsub(np2, np1))));
      pari_printf("#III(E/Q)[2]       ");
      if (!gequal0(certain) && !gequal0(certainp))
        pari_printf(" ");
      else
        pari_printf("<");
      pari_printf("= %Ps\n", shifti(gen_1, gtos(gsub(gsub(gadd(n2, np2), n1), np1))));
      pari_printf("#E(Q)[2]            = %Ps\n", shifti(gen_1, gtos(tors)));
    }
    rang = gsubgs(gadd(n1, np1), 2);
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      if (!gequal0(certain) && !gequal0(certainp))
      {
        pari_printf("#E(Q)/2E(Q)         = %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
        pari_printf("\n");
        pari_printf("rank                = %Ps\n", rang);
        pari_printf("\n");
      }
      else
      {
        pari_printf("#E(Q)/2E(Q)        >= %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
        pari_printf("\n");
        pari_printf("%Ps <= rank          <= %Ps\n", rang, gsubgs(gadd(n2, np2), 2));
        pari_printf("\n");
      }
    }
  }
  /* end of strange  */
  
  pointgen = vecsort0(pointgen, NULL, 2);
  if (!gequal0(ELLREDGENFLAG))
    pointgen = ellredgen(ell, pointgen, NULL, prec);
  pointgen = concat(ellsort(gel(elltorseven(ell, prec), 3), prec), pointgen);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("points = %Ps\n", pointgen);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("   end of ell2descent_viaisog\n");
  p7 = cgetg(4, t_VEC);
  gel(p7, 1) = gcopy(rang);
  gel(p7, 2) = gadd(gsubgs(gadd(n2, np2), 2), tors);
  gel(p7, 3) = gcopy(pointgen);
  p7 = gerepilecopy(ltop, p7);
  return p7;
}

long
nfsign_s(GEN nf, GEN a, GEN i, long prec)
{
  pari_sp ltop = avma;
  GEN nf_roots = gen_0, ay = gen_0, def = gen_0;
  long l1, l2;
  if (gequal0(a))
  {
    avma = ltop;
    return 0;
  }
  a = lift(a);
  if (typ(a) != t_POL)
  {
    l1 = gsigne(a);
    avma = ltop;
    return l1;
  }
  nf_roots = gcopy(member_roots(nf));
  def = stoi(getrealprecision());
  ay = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(ay) || (cmpis(precision0(ay, 0), 10) < 0))
    {
      ay = gsubst(a, gvar(gpolvar(a)), gel(nf_roots, gtos(i)));
      if (gequal0(ay) || (cmpis(precision0(ay, 0), 10) < 0))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf(" **** Warning: doubling the real precision in nfsign_s **** %ld\n", 2*getrealprecision());
        setrealprecision(2*getrealprecision(), &prec);
        nf_roots = greal(roots0(member_pol(nf), 0, prec));
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &ay, &nf_roots);
    }
  }
  setrealprecision(gtos(def), &prec);
  l2 = gsigne(ay);
  avma = ltop;
  return l2;
}

GEN
nfpolratroots(GEN nf, GEN pol)
{
  pari_sp ltop = avma;
  GEN f = gen_0, ans = gen_0;
  long l1;
  f = gcopy(gel(nffactor(nf, lift(pol)), 1));
  ans = cgetg(1, t_VEC);
  l1 = glength(f);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long j;
    GEN p2 = gen_0;	  /* vec */
    for (j = 1; j <= l1; ++j)
    {
      if (degree(gel(f, j)) == 1)
      {
        p2 = cgetg(2, t_VEC);
        gel(p2, 1) = gdiv(gneg(polcoeff0(gel(f, j), 0, -1)), polcoeff0(gel(f, j), 1, -1));
        ans = concat(ans, p2);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p2, &ans);
    }
  }
  ans = gerepilecopy(ltop, ans);
  return ans;
}

GEN
nfmodid2(GEN nf, GEN a, GEN ideal)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0, p2 = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfmodid2\n");
  /* ideal doit etre sous la forme primedec  */
  if ((lg(member_zk(nf))-1) == 1)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfmodid2\n");
    p1 = gmul(a, gmodulsg(1, member_p(ideal)));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  a = mynfeltmod(nf, a, basistoalg(nf, gel(ideal, 2)));
  if (gequal1(ggcd(denom(content(lift(a))), member_p(ideal))))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfmodid2\n");
    p2 = gmul(a, gmodulsg(1, member_p(ideal)));
    p2 = gerepilecopy(ltop, p2);
    return p2;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfmodid2\n");
  a = gerepilecopy(ltop, a);
  return a;
}

GEN
nfhilb2(GEN nf, GEN a, GEN b, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN res = gen_0, x = pol_x(fetch_user_var("x"));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfhilb2\n");
  if (nfqpsoluble(nf, gadd(gmul(a, gsqr(x)), b), initp(nf, p, prec), prec))
    res = gen_1;
  else
    res = gen_m1;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfhilb2\n");
  res = gerepilecopy(ltop, res);
  return res;
}

GEN
mynfhilbertp(GEN nf, GEN a, GEN b, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN alpha = gen_0, beta = gen_0, sig = gen_0, aux = gen_0, aux2 = gen_0, rep = gen_0, p1 = gen_0;
  GEN p2 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans mynfhilbertp %Ps\n", p);
  if (gequal0(a) || gequal0(b))
    pari_printf("0 argument in mynfhilbertp\n");
  if (cmpis(member_p(p), 2) == 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de mynfhilbertp\n");
    p1 = nfhilb2(nf, a, b, p, prec);
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  if (typ(a) != t_POLMOD)
    a = gmodulo(a, member_pol(nf));
  if (typ(b) != t_POLMOD)
    b = gmodulo(b, member_pol(nf));
  alpha = stoi(idealval(nf, a, p));
  beta = stoi(idealval(nf, b, p));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p2 = cgetg(3, t_VEC);
    gel(p2, 1) = gcopy(alpha);
    gel(p2, 2) = gcopy(beta);
    pari_printf("[alpha,beta] = %Ps\n", p2);
  }
  if (gequal0(gmodgs(alpha, 2)) && gequal0(gmodgs(beta, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de mynfhilbertp\n");
    avma = ltop;
    return gen_1;
  }
  aux2 = gdiventgs(idealnorm(nf, p), 2);
  if ((!gequal0(gmodgs(alpha, 2)) && !gequal0(gmodgs(beta, 2))) && !gequal0(gmodgs(aux2, 2)))
    sig = gen_1;
  else
    sig = gen_m1;
  if (!gequal0(beta))
    aux = nfmodid2(nf, gdiv(gpow(a, beta, prec), gpow(b, alpha, prec)), p);
  else
    aux = nfmodid2(nf, gpow(b, alpha, prec), p);
  aux = gadd(gpow(aux, aux2, prec), sig);
  aux = lift(lift(aux));
  if (gequal0(aux))
    rep = gen_1;
  else
    rep = stoi(idealval(nf, aux, p) >= 1);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de mynfhilbertp\n");
  if (!gequal0(rep))
  {
    avma = ltop;
    return gen_1;
  }
  else
  {
    avma = ltop;
    return gen_m1;
  }
  avma = ltop;
  return gen_0;
}

GEN
ideallistfactor(GEN nf, GEN listfact)
{
  pari_sp ltop = avma;
  GEN Slist = gen_0, S1 = gen_0, test = gen_0, k = gen_0;
  long l1;
  /* MODI remove i,j */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans ideallistfactor\n");
  Slist = cgetg(1, t_VEC);
  test = gen_1;
  l1 = glength(listfact);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i, l2;
    for (i = 1; i <= l1; ++i)
    {
      if (gequal0(gel(listfact, i)))
        continue;
      S1 = gcopy(gel(idealfactor(nf, gel(listfact, i)), 1));
      l2 = glength(S1);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j, l3;
        GEN p4 = gen_0;	  /* vec */
        for (j = 1; j <= l2; ++j)
        {
          k = stoi(glength(Slist));
          l3 = glength(Slist);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long k;
            for (k = 1; k <= l3; ++k)
            {
              if (gequal(gel(Slist, k), gel(S1, j)))
              {
                test = gen_0;
                break;
              }
              if (low_stack(st_lim, stack_lim(btop, 1)))
                test = gerepilecopy(btop, test);
            }
          }
          if (!gequal0(test))
          {
            p4 = cgetg(2, t_VEC);
            gel(p4, 1) = gcopy(gel(S1, j));
            Slist = concat(Slist, p4);
          }
          else
            test = gen_1;
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 4, &k, &test, &p4, &Slist);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &S1, &k, &test, &Slist);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de ideallistfactor\n");
  Slist = gerepilecopy(ltop, Slist);
  return Slist;
}

long
mynfhilbert(GEN nf, GEN a, GEN b, long prec)
{
  pari_sp ltop = avma;
  GEN al = gen_0, bl = gen_0, S = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN p2 = gen_0;	  /* int */
  GEN p3 = gen_0;	  /* vec */
  long l4;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(a);
    gel(p1, 2) = gcopy(b);
    pari_printf("entree dans mynfhilbert %Ps\n", p1);
  }
  if (gequal0(a) || gequal0(b))
    pari_err(user, "mynfhilbert : argument = 0");
  al = lift(a);
  bl = lift(b);
  /* solutions locales aux places reelles  */
  
  p2 = icopy(member_r1(nf));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, p2) <= 0; i = gaddgs(i, 1))
    {
      if ((nfsign_s(nf, al, i, prec) < 0) && (nfsign_s(nf, bl, i, prec) < 0))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("mynfhilbert non soluble a l'infini\n");
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("fin de mynfhilbert\n");
        avma = ltop;
        return -1;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        i = gerepilecopy(btop, i);
    }
  }
  if (typ(a) != t_POLMOD)
    a = gmodulo(a, member_pol(nf));
  if (typ(b) != t_POLMOD)
    b = gmodulo(b, member_pol(nf));
  p3 = cgetg(4, t_VEC);
  gel(p3, 1) = gen_2;
  gel(p3, 2) = gcopy(a);
  gel(p3, 3) = gcopy(b);
  /*  solutions locales aux places finies (celles qui divisent 2ab) */
  
  S = ideallistfactor(nf, p3);
  l4 = glength(S);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    long l5 = -1 > 0;	  /* bool */
    for (i = stoi(l4); l5?gcmpgs(i, 2) <= 0:gcmpgs(i, 2) >= 0; i = gaddgs(i, -1))
    {
      /* d'apres la formule du produit on peut eviter un premier  */
      if (gequalm1(mynfhilbertp(nf, a, b, gel(S, gtos(i)), prec)))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("mynfhilbert non soluble en : %Ps\n", gel(S, gtos(i)));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("fin de mynfhilbert\n");
        avma = ltop;
        return -1;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        i = gerepilecopy(btop, i);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de mynfhilbert\n");
  avma = ltop;
  return 1;
}

GEN
initp(GEN nf, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN idval = gen_0, pp = gen_0;
  GEN p1 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans initp\n");
  idval = stoi(idealval(nf, gen_2, p));
  p1 = cgetg(6, t_VEC);
  gel(p1, 1) = gcopy(p);
  gel(p1, 2) = basistoalg(nf, gel(p, 2));
  gel(p1, 3) = gcopy(idval);
  gel(p1, 4) = gen_0;
  gel(p1, 5) = repres(nf, p, prec);
  pp = p1;
  if (!gequal0(idval))
    gel(pp, 4) = idealstar0(nf, idealpow0(nf, p, gaddsg(1, gmulsg(2, idval)), 0), 1);
  else
    gel(pp, 4) = gdiventgs(gpowgs(member_p(p), pr_get_f(p)), 2);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de initp\n");
  pp = gerepilecopy(ltop, pp);
  return pp;
}

GEN
deno(GEN num)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0, p2 = gen_0;
  if (gequal0(num))
  {
    avma = ltop;
    return gen_1;
  }
  if (typ(num) == t_POL)
  {
    p1 = denom(content(num));
    p1 = gerepilecopy(ltop, p1);
    return p1;
  }
  p2 = denom(num);
  p2 = gerepilecopy(ltop, p2);
  return p2;
}

GEN
nfratpoint(GEN nf, GEN pol, GEN lim, GEN singlepoint, long prec)
{
  pari_sp ltop = avma;
  GEN compt1 = gen_0, compt2 = gen_0, deg = gen_0, n = gen_0, AA = gen_0, point = gen_0, listpoints = gen_0, vectx = gen_0, evpol = gen_0, sq = gen_0, xpol = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  if (!singlepoint)
    singlepoint = gen_1;
  /* MODI remove xx, denoz */
  /* MODI add xpol */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    pari_printf("entree dans nfratpoint avec pol = %Ps\n", pol);
    pari_printf("lim = %Ps\n", lim);
  }
  compt1 = gen_0;
  compt2 = gen_0;
  deg = stoi(degree(pol));
  n = stoi(degree(member_pol(nf)));
  AA = gshift(lim, 1);
  if (gequal0(singlepoint))
    listpoints = cgetg(1, t_VEC);
  /* cas triviaux  */
  sq = nfsqrt(nf, polcoeff0(pol, 0, -1), prec);
  if (!gequal(sq, cgetg(1, t_VEC)))
  {
    p1 = cgetg(4, t_VEC);
    gel(p1, 1) = gen_0;
    gel(p1, 2) = gcopy(gel(sq, 1));
    gel(p1, 3) = gen_1;
    point = p1;
    if (!gequal0(singlepoint))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("fin de nfratpoint\n");
      point = gerepilecopy(ltop, point);
      return point;
    }
    p2 = cgetg(2, t_VEC);
    gel(p2, 1) = gcopy(point);
    listpoints = concat(listpoints, p2);
  }
  sq = nfsqrt(nf, pollead(pol, -1), prec);
  if (!gequal(sq, cgetg(1, t_VEC)))
  {
    p3 = cgetg(4, t_VEC);
    gel(p3, 1) = gen_1;
    gel(p3, 2) = gcopy(gel(sq, 1));
    gel(p3, 3) = gen_0;
    point = p3;
    if (!gequal0(singlepoint))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("fin de nfratpoint\n");
      point = gerepilecopy(ltop, point);
      return point;
    }
    p4 = cgetg(2, t_VEC);
    gel(p4, 1) = gcopy(point);
    listpoints = concat(listpoints, p4);
  }
  /* boucle generale */
  point = cgetg(1, t_VEC);
  {
    long i;
    GEN p6 = gen_0;	  /* vec */
    p5 = cgetg(gtos(n)+1, t_VEC);
    for (i = 1; gcmpsg(i, n) <= 0; ++i)
    {
      p6 = cgetg(3, t_VEC);
      gel(p6, 1) = gneg(lim);
      gel(p6, 2) = gcopy(lim);
      gel(p5, i) = p6;
    }
  }
  vectx = p5;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN denoz = gen_0;
    for (denoz = gen_1; gcmp(denoz, lim) <= 0; denoz = gaddgs(denoz, 1))
    {
      {
        GEN fv_data = gen_0;
        GEN (*fv_next)(GEN, GEN);	  /* func_GG */
        GEN xx = forvec_start(vectx, 0, &fv_data, &fv_next);	  /* vec */
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN p7 = gen_0, p8 = gen_0;	  /* vec */
          for (  ; xx; xx = fv_next(fv_data, xx))
          {
            if (gequal1(denoz) || gequal1(ggcd(content(xx), denoz)))
            {
              xpol = basistoalg(nf, gtrans(xx));
              evpol = gsubst(pol, gvar(x), gdiv(xpol, denoz));
              sq = nfsqrt(nf, evpol, prec);
              if (!gequal(sq, cgetg(1, t_VEC)))
              {
                p7 = cgetg(4, t_VEC);
                gel(p7, 1) = gdiv(xpol, denoz);
                gel(p7, 2) = gcopy(gel(sq, 1));
                gel(p7, 3) = gen_1;
                point = p7;
                if (!gequal0(singlepoint))
                  goto label5;
                p8 = cgetg(2, t_VEC);
                gel(p8, 1) = gcopy(point);
                listpoints = concat(listpoints, p8);
              }
            }
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 8, &xpol, &evpol, &sq, &p7, &point, &p8, &listpoints, &xx);
          }
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &denoz, &xpol, &evpol, &sq, &point, &listpoints);
    }
    label5:;
  }
  if (!gequal0(singlepoint))
    listpoints = point;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("sortie de nfratpoint\n");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("points trouves par nfratpoint = %Ps\n", listpoints);
  listpoints = gerepilecopy(ltop, listpoints);
  return listpoints;
}

GEN
repres(GEN nf, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN fond = gen_0, mat = gen_0, f = gen_0, rep = gen_0, pp = gen_0, ppi = gen_0, pp2 = gen_0, jppi = gen_0, gjf = gen_0;
  long l1;
  GEN p2 = gen_0;
  GEN p3 = gen_0;	  /* vec */
  GEN p4 = gen_0;
  /* MODI remove i,j,k */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans repres\n");
  fond = cgetg(1, t_VEC);
  mat = idealhnf0(nf, p, NULL);
  l1 = glength(mat);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l1; ++i)
    {
      if (!gequalgs(gcoeff(mat, i, i), 1))
        fond = concat(fond, gel(member_zk(nf), i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        fond = gerepilecopy(btop, fond);
    }
  }
  f = stoi(glength(fond));
  pp = icopy(member_p(p));
  p2 = gpow(pp, f, prec);
  {
    long i;
    p3 = cgetg(gtos(p2)+1, t_VEC);
    for (i = 1; gcmpsg(i, p2) <= 0; ++i)
      gel(p3, i) = gen_0;
  }
  rep = p3;
  gel(rep, 1) = gen_0;
  ppi = gen_1;
  pp2 = gdiventgs(pp, 2);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0, p5 = gen_0;
    for (i = gen_1; gcmp(i, f) <= 0; i = gaddgs(i, 1))
    {
      p5 = gsubgs(pp, 1);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        GEN j = gen_0, p6 = gen_0;
        for (j = gen_1; gcmp(j, p5) <= 0; j = gaddgs(j, 1))
        {
          if (gcmp(j, pp2) <= 0)
            gjf = gmul(j, gel(fond, gtos(i)));
          else
            gjf = gmul(gsub(j, pp), gel(fond, gtos(i)));
          jppi = gmul(j, ppi);
          p6 = gsubgs(ppi, 1);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN k = gen_0;
            for (k = gen_0; gcmp(k, p6) <= 0; k = gaddgs(k, 1))
            {
              gel(rep, gtos(gaddgs(gadd(jppi, k), 1))) = gadd(gel(rep, gtos(gaddgs(k, 1))), gjf);
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 2, &k, &rep);
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 5, &j, &gjf, &jppi, &p6, &rep);
        }
      }
      ppi = gmul(ppi, pp);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &i, &p5, &gjf, &jppi, &rep, &ppi);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de repres\n");
  p4 = gmodulo(rep, member_pol(nf));
  p4 = gerepilecopy(ltop, p4);
  return p4;
}

GEN
val(GEN nf, GEN num, GEN p)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  if (gequal0(num))
    p1 = BIGINT;
  else
    p1 = stoi(idealval(nf, lift(num), p));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
nfissquarep(GEN nf, GEN a, GEN p, GEN q, long prec)
{
  pari_sp ltop = avma;
  GEN pherm = gen_0, f = gen_0, aaa = gen_0, n = gen_0, pp = gen_0, qq = gen_0, e = gen_0, z = gen_0, xx = gen_0, yy = gen_0, r = gen_0, aux = gen_0, b = gen_0, m = gen_0, vp = gen_0, inv2x = gen_0, zinit = gen_0, zlog = gen_0, expo = gen_0, id = gen_0;
  long l1;
  /* MODI add id */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfissquarep %Ps%Ps%Ps\n", a, p, q);
  if (gequal0(a) || gequal1(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("fin de nfissquarep\n");
    a = gerepilecopy(ltop, a);
    return a;
  }
  pherm = idealhnf0(nf, p, NULL);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("pherm = %Ps\n", pherm);
  f = stoi(idealval(nf, a, p));
  if (gcmp(f, q) >= 0)
  {
    if (gcmp(f, q) > 0)
      aaa = gpow(basistoalg(nf, gel(p, 2)), gshift(gaddgs(q, 1), -1), prec);
    else
      aaa = gen_0;
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("fin de nfissquarep\n");
    aaa = gerepilecopy(ltop, aaa);
    return aaa;
  }
  if (!gequal0(f))
    aaa = gmul(a, gpow(basistoalg(nf, gdiv(gel(p, 5), member_p(p))), f, prec));
  else
    aaa = gcopy(a);
  if (!gequalgs(gcoeff(pherm, 1, 1), 2))
  {
    /* cas ou p ne divise pas 2  */
    /* algorithme de Shanks  */
    n = nfrandintmodid(nf, pherm);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      while (nfpsquareodd(nf, n, p, prec))
      {
        n = nfrandintmodid(nf, pherm);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          n = gerepilecopy(btop, n);
      }
    }
    pp = gmodulsg(1, member_p(p));
    n = gmul(n, pp);
    qq = gdiventgs(idealnorm(nf, pherm), 2);
    e = gen_1;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      while (gequal0(gmodgs(qq, 2)))
      {
        e = gaddgs(e, 1);
        qq = gdivent(qq, gen_2);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &e, &qq);
      }
    }
    z = mynfeltreduce(nf, lift(lift(gpow(n, qq, prec))), pherm);
    yy = z;
    r = e;
    xx = mynfeltreduce(nf, lift(lift(gpow(gmul(aaa, pp), gdiventgs(qq, 2), prec))), pherm);
    aux = mynfeltreduce(nf, gmul(aaa, xx), pherm);
    b = mynfeltreduce(nf, gmul(aux, xx), pherm);
    xx = aux;
    aux = b;
    m = gen_0;
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      while (gequal0(val(nf, gsubgs(aux, 1), p)))
      {
        m = gaddgs(m, 1);
        aux = mynfeltreduce(nf, gsqr(aux), pherm);
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 2, &m, &aux);
      }
    }
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      while (!gequal0(m))
      {
        if (gequal(m, r))
          pari_err(user, "nfissquarep : m = r");
        yy = gmul(yy, pp);
        aux = mynfeltreduce(nf, lift(lift(powgi(yy, shifti(gen_1, gtos(gsubgs(gsub(r, m), 1)))))), pherm);
        yy = mynfeltreduce(nf, gsqr(aux), pherm);
        r = m;
        xx = mynfeltreduce(nf, gmul(xx, aux), pherm);
        b = mynfeltreduce(nf, gmul(b, yy), pherm);
        aux = b;
        m = gen_0;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gequal0(val(nf, gsubgs(aux, 1), p)))
          {
            m = gaddgs(m, 1);
            aux = mynfeltreduce(nf, gsqr(aux), pherm);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &m, &aux);
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 6, &yy, &aux, &r, &xx, &b, &m);
      }
    }
    /* lift de Hensel */
    /* */
    if (gcmpgs(q, 1) > 0)
    {
      vp = stoi(idealval(nf, gsub(gsqr(xx), aaa), p));
      if (gcmp(vp, gsub(q, f)) < 0)
      {
        yy = gmulsg(2, xx);
        inv2x = gdiv(basistoalg(nf, gel(idealaddtoone0(nf, yy, p), 1)), yy);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gcmp(vp, q) < 0)
          {
            vp = gaddgs(vp, 1);
            xx = gsub(xx, gmul(gsub(gsqr(xx), aaa), inv2x));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &vp, &xx);
          }
        }
      }
      if (!gequal0(f))
        xx = gmul(xx, gpow(basistoalg(nf, gel(p, 2)), gshift(f, -1), prec));
    }
    xx = mynfeltreduce(nf, xx, idealpow0(nf, p, q, 0));
  }
  else
  {
    /* cas ou p divise 2 *\ */
    if (gcmpgs(gsub(q, f), 1) > 0)
      id = idealpow0(nf, p, gsub(q, f), 0);
    else
      id = pherm;
    zinit = idealstar0(nf, id, 2);
    zlog = ideallog(nf, aaa, zinit);
    xx = gen_1;
    l1 = glength(zlog);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 1; i <= l1; ++i)
      {
        expo = gcopy(gel(zlog, i));
        if (!gequal0(expo))
        {
          if (smodss(gequal0(expo), 2))
            expo = gshift(expo, -1);
          else
          {
            aux = gcopy(gel(gel(zinit, 2), i));
            expo = gmod(gmul(expo, gshift(gaddgs(aux, 1), -1)), aux);
          }
          xx = gmul(xx, gpow(basistoalg(nf, gel(gel(gel(zinit, 2), 3), i)), expo, prec));
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 3, &expo, &aux, &xx);
      }
    }
    if (!gequal0(f))
    {
      xx = gmul(xx, gpow(basistoalg(nf, gel(p, 2)), gshift(f, -1), prec));
      id = idealpow0(nf, p, q, 0);
    }
    xx = mynfeltreduce(nf, xx, id);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de nfissquarep %Ps\n", xx);
  xx = gerepilecopy(ltop, xx);
  return xx;
}

long
nfpsquareodd(GEN nf, GEN a, GEN p, long prec)
{
  pari_sp ltop = avma;
  GEN v = gen_0, ap = gen_0, norme = gen_0, den = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfpsquareodd\n");
  if (gequal0(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareodd\n");
    avma = ltop;
    return 1;
  }
  v = stoi(idealval(nf, lift(a), p));
  if (!gequal0(gmodgs(v, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareodd\n");
    avma = ltop;
    return 0;
  }
  ap = gdiv(a, gpow(basistoalg(nf, gel(p, 2)), v, prec));
  norme = gdiventgs(idealnorm(nf, p), 2);
  den = gmod(denom(content(lift(ap))), member_p(p));
  if (gsigne(den))
    ap = gmul(ap, gmodulsg(1, member_p(p)));
  ap = gsubgs(gpow(ap, norme, prec), 1);
  if (gequal0(ap))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareodd\n");
    avma = ltop;
    return 1;
  }
  ap = lift(lift(ap));
  if (idealval(nf, ap, p) > 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareodd\n");
    avma = ltop;
    return 1;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfpsquareodd\n");
  avma = ltop;
  return 0;
}

long
nfpsquare(GEN nf, GEN a, GEN p, GEN zinit, long prec)
{
  pari_sp ltop = avma;
  GEN valap = gen_0, zlog = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2, l3;
  /* MODI remove i */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(4, t_VEC);
    gel(p1, 1) = gcopy(a);
    gel(p1, 2) = gcopy(p);
    gel(p1, 3) = gcopy(zinit);
    pari_printf("entree dans nfpsquare %Ps\n", p1);
  }
  if (gequal0(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquare\n");
    avma = ltop;
    return 1;
  }
  if (cmpis(member_p(p), 2) != 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquare\n");
    l2 = nfpsquareodd(nf, a, p, prec);
    avma = ltop;
    return l2;
  }
  valap = stoi(idealval(nf, a, p));
  if (!gequal0(gmodgs(valap, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquare\n");
    avma = ltop;
    return 0;
  }
  if (!gequal0(valap))
    zlog = ideallog(nf, gmul(a, gpow(gdiv(basistoalg(nf, gel(p, 5)), member_p(p)), valap, prec)), zinit);
  else
    zlog = ideallog(nf, a, zinit);
  l3 = glength(gel(gel(zinit, 2), 2));
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l3; ++i)
    {
      if ((gequal0(gmodgs(gel(gel(gel(zinit, 2), 2), i), 2))) && !gequal0(gmodgs(gel(zlog, i), 2)))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
          pari_printf("fin de nfpsquare\n");
        avma = ltop;
        return 0;
      }
      avma = btop;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfpsquare\n");
  avma = ltop;
  return 1;
}

long
nfpsquareq(GEN nf, GEN a, GEN p, GEN q, long prec)
{
  pari_sp ltop = avma;
  GEN vala = gen_0, zinit = gen_0, zlog = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2;
  /* MODI remove i */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(4, t_VEC);
    gel(p1, 1) = gcopy(a);
    gel(p1, 2) = gcopy(p);
    gel(p1, 3) = gcopy(q);
    pari_printf("entree dans nfpsquareq %Ps\n", p1);
  }
  if (gequal0(a))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareq\n");
    avma = ltop;
    return 1;
  }
  vala = stoi(idealval(nf, a, p));
  if (gcmp(vala, q) >= 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareq\n");
    avma = ltop;
    return 1;
  }
  if (!gequal0(gmodgs(vala, 2)))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfpsquareq\n");
    avma = ltop;
    return 0;
  }
  zinit = idealstar0(nf, idealpow0(nf, p, gsub(q, vala), 0), 2);
  zlog = ideallog(nf, gmul(a, gpow(basistoalg(nf, gdivgs(gel(p, 5), 2)), vala, prec)), zinit);
  l2 = glength(gel(gel(zinit, 2), 2));
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l2; ++i)
    {
      if ((gequal0(gmodgs(gel(gel(gel(zinit, 2), 2), i), 2))) && !gequal0(gmodgs(gel(zlog, i), 2)))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
          pari_printf("fin de nfpsquareq\n");
        avma = ltop;
        return 0;
      }
      avma = btop;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfpsquareq\n");
  avma = ltop;
  return 1;
}

long
nflemma6(GEN nf, GEN pol, GEN p, GEN nu, GEN xx, long prec)
{
  pari_sp ltop = avma;
  GEN gx = gen_0, gpx = gen_0, lambda = gen_0, mu = gen_0, x = pol_x(fetch_user_var("x"));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nflemma6\n");
  gx = gsubst(pol, gvar(x), xx);
  if (nfpsquareodd(nf, gx, p, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nflemma6\n");
    avma = ltop;
    return 1;
  }
  gpx = gsubst(deriv(pol,-1), gvar(x), xx);
  lambda = val(nf, gx, p);
  mu = val(nf, gpx, p);
  if (gcmp(lambda, gmulsg(2, mu)) > 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nflemma6\n");
    avma = ltop;
    return 1;
  }
  if ((gcmp(lambda, gmulsg(2, nu)) >= 0) && (gcmp(mu, nu) >= 0))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nflemma6\n");
    avma = ltop;
    return 0;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nflemma6\n");
  avma = ltop;
  return -1;
}

long
nflemma7(GEN nf, GEN pol, GEN p, GEN nu, GEN xx, GEN zinit, long prec)
{
  pari_sp ltop = avma;
  GEN gx = gen_0, gpx = gen_0, v = gen_0, lambda = gen_0, mu = gen_0, q = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(xx);
    gel(p1, 2) = gcopy(nu);
    pari_printf("entree dans nflemma7 %Ps\n", p1);
  }
  gx = gsubst(pol, gvar(x), xx);
  if (nfpsquare(nf, gx, p, zinit, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nflemma7\n");
    avma = ltop;
    return 1;
  }
  gpx = gsubst(deriv(pol,-1), gvar(x), xx);
  v = gcopy(gel(p, 3));
  lambda = val(nf, gx, p);
  mu = val(nf, gpx, p);
  if (gcmp(lambda, gmulsg(2, mu)) > 0)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nflemma7\n");
    avma = ltop;
    return 1;
  }
  if (gcmp(nu, mu) > 0)
  {
    if (!gequal0(gmodgs(lambda, 2)))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return -1;
    }
    q = gsub(gadd(mu, nu), lambda);
    if (gcmp(q, gmulsg(2, v)) > 0)
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return -1;
    }
    if (nfpsquareq(nf, gmul(gx, gpow(basistoalg(nf, gdivgs(gel(p, 5), 2)), lambda, prec)), p, q, prec))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return 1;
    }
  }
  else
  {
    if (gcmp(lambda, gmulsg(2, nu)) >= 0)
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return 0;
    }
    if (!gequal0(gmodgs(lambda, 2)))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return -1;
    }
    q = gsub(gmulsg(2, nu), lambda);
    if (gcmp(q, gmulsg(2, v)) > 0)
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return -1;
    }
    if (nfpsquareq(nf, gmul(gx, gpow(basistoalg(nf, gdivgs(gel(p, 5), 2)), lambda, prec)), p, q, prec))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("fin de nflemma7\n");
      avma = ltop;
      return 0;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nflemma7\n");
  avma = ltop;
  return -1;
}

long
nfzpsoluble(GEN nf, GEN pol, GEN p, GEN nu, GEN pnu, GEN x0, long prec)
{
  pari_sp ltop = avma;
  GEN result = gen_0, pnup = gen_0, lrep = gen_0;
  GEN p1 = gen_0;	  /* vec */
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = lift(x0);
    gel(p1, 2) = gcopy(nu);
    pari_printf("entree dans nfzpsoluble %Ps\n", p1);
  }
  if (gequal0(gel(p, 3)))
    result = stoi(nflemma6(nf, pol, gel(p, 1), nu, x0, prec));
  else
    result = stoi(nflemma7(nf, pol, gel(p, 1), nu, x0, gel(p, 4), prec));
  if (gequalgs(result, 1))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfzpsoluble\n");
    avma = ltop;
    return 1;
  }
  if (gequalm1(result))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfzpsoluble\n");
    avma = ltop;
    return 0;
  }
  pnup = gmul(pnu, gel(p, 2));
  lrep = stoi(glength(gel(p, 5)));
  nu = gaddgs(nu, 1);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, lrep) <= 0; i = gaddgs(i, 1))
    {
      if (nfzpsoluble(nf, pol, p, nu, pnup, gadd(x0, gmul(pnu, gel(gel(p, 5), gtos(i)))), prec))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
          pari_printf("fin de nfzpsoluble\n");
        avma = ltop;
        return 1;
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        i = gerepilecopy(btop, i);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfzpsoluble\n");
  avma = ltop;
  return 0;
}

GEN
mynfeltmod(GEN nf, GEN a, GEN b)
{
  pari_sp ltop = avma;
  GEN qred = gen_0;
  qred = ground(algtobasis(nf, gdiv(a, b)));
  qred = gsub(a, gmul(b, basistoalg(nf, qred)));
  qred = gerepilecopy(ltop, qred);
  return qred;
}

GEN
mynfeltreduce(GEN nf, GEN a, GEN id)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  p1 = basistoalg(nf, nfreduce(nf, algtobasis(nf, a), id));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
nfrandintmodid(GEN nf, GEN id)
{
  pari_sp ltop = avma;
  GEN res = gen_0;
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfrandintmodid\n");
  res = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(res))
    {
      res = nfrandint(nf, gen_0);
      res = mynfeltreduce(nf, res, id);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        res = gerepilecopy(btop, res);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfrandintmodid\n");
  res = gerepilecopy(ltop, res);
  return res;
}

GEN
nfrandint(GEN nf, GEN borne)
{
  pari_sp ltop = avma;
  GEN l = gen_0, res = gen_0;
  GEN p1 = gen_0;	  /* vec */
  /* MODI remove i */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans nfrandint\n");
  l = stoi(lg(member_zk(nf))-1);
  {
    long i;
    p1 = cgetg(gtos(l)+1, t_COL);
    for (i = 1; gcmpsg(i, l) <= 0; ++i)
      gel(p1, i) = gen_0;
  }
  res = p1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, l) <= 0; i = gaddgs(i, 1))
    {
      if (!gequal0(borne))
        gel(res, gtos(i)) = gsub(genrand(gshift(borne, 1)), borne);
      else
        gel(res, gtos(i)) = genrand(NULL);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &res);
    }
  }
  res = basistoalg(nf, res);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfrandint\n");
  res = gerepilecopy(ltop, res);
  return res;
}

long
nfqpsolublebig(GEN nf, GEN pol, GEN p, GEN ap, GEN b, long prec)
{
  pari_sp ltop = avma;
  GEN deg = gen_0, xx = gen_0, z = gen_0, Px = gen_0, cont = gen_0, pi = gen_0, pol2 = gen_0, Roots = gen_0;
  long l1;
  GEN x = pol_x(fetch_user_var("x"));
  if (!ap)
    ap = gen_0;
  if (!b)
    b = gen_1;
  /* MODI remove i,j */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("entree dans nfqpsolublebig avec %Ps\n", member_p(p));
  deg = stoi(degree(pol));
  if (nfpsquareodd(nf, polcoeff0(pol, 0, -1), p, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("fin de nfqpsolublebig\n");
    avma = ltop;
    return 1;
  }
  if (nfpsquareodd(nf, pollead(pol, -1), p, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("fin de nfqpsolublebig\n");
    avma = ltop;
    return 1;
  }
  /* on tient compte du contenu de pol */
  cont = stoi(idealval(nf, polcoeff0(pol, 0, -1), p));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, deg) <= 0; i = gaddgs(i, 1))
    {
      if (!gequal0(cont))
        cont = gmings(cont, idealval(nf, polcoeff0(pol, gtos(i), -1), p));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &cont);
    }
  }
  if (!gequal0(cont))
    pi = basistoalg(nf, gdiv(gel(p, 5), member_p(p)));
  if (gcmpgs(cont, 1) > 0)
    pol = gmul(pol, gpow(pi, gmulsg(2, gdiventgs(cont, 2)), prec));
  /* On essaye des valeurs de x au hasard */
  if (!gequal0(gmodgs(cont, 2)))
    pol2 = gmul(pol, pi);
  else
  {
    pol2 = gcopy(pol);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0, p2 = gen_0;
      for (i = gen_1; gcmp(i, MAXPROB) <= 0; i = gaddgs(i, 1))
      {
        xx = nfrandint(nf, gen_0);
        z = gen_0;
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gequal0(z))
          {
            z = genrand(NULL);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              z = gerepilecopy(btop, z);
          }
        }
        xx = gadd(gmul(gneg(ap), z), gmul(b, xx));
        Px = polcoeff0(pol, gtos(deg), -1);
        p2 = gsubgs(deg, 1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          GEN j = gen_0;
          long l3 = -1 > 0;	  /* bool */
          for (j = p2; l3?gcmpgs(j, 0) <= 0:gcmpgs(j, 0) >= 0; j = gaddgs(j, -1))
          {
            Px = gadd(gmul(Px, xx), polcoeff0(pol, gtos(j), -1));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &j, &Px);
          }
        }
        Px = gmul(Px, gpow(z, deg, prec));
        if (nfpsquareodd(nf, Px, p, prec))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
            pari_printf("fin de nfqpsolublebig\n");
          avma = ltop;
          return 1;
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 5, &i, &xx, &z, &Px, &p2);
      }
    }
  }
  /* On essaye les racines de pol  */
  Roots = nfpolrootsmod(nf, pol2, p);
  pi = basistoalg(nf, gel(p, 2));
  l1 = glength(Roots);
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l1; ++i)
    {
      if (nfqpsolublebig(nf, gsubst(pol, gvar(x), gadd(gmul(pi, x), gel(Roots, i))), p, NULL, NULL, prec))
      {
        avma = ltop;
        return 1;
      }
      avma = btop;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de nfqpsolublebig\n");
  avma = ltop;
  return 0;
}

GEN
nfpolrootsmod(GEN nf, GEN pol, GEN p)
{
  pari_sp ltop = avma;
  GEN factlist = gen_0, sol = gen_0;
  long l1;
  factlist = gcopy(gel(nffactormod(nf, pol, p), 1));
  sol = cgetg(1, t_VEC);
  l1 = glength(factlist);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p2 = gen_0;	  /* vec */
    for (i = 1; i <= l1; ++i)
    {
      if (degree(gel(factlist, i)) == 1)
      {
        p2 = cgetg(2, t_VEC);
        gel(p2, 1) = gdiv(gneg(polcoeff0(gel(factlist, i), 0, -1)), polcoeff0(gel(factlist, i), 1, -1));
        sol = concat(sol, p2);
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &p2, &sol);
    }
  }
  sol = gerepilecopy(ltop, sol);
  return sol;
}

long
nfqpsoluble(GEN nf, GEN pol, GEN p, long prec)
{
  pari_sp ltop = avma;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("entree dans nfqpsoluble %Ps\n", p);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("pol = %Ps\n", pol);
  if (nfpsquare(nf, pollead(pol, -1), gel(p, 1), gel(p, 4), prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfqpsoluble\n");
    avma = ltop;
    return 1;
  }
  if (nfpsquare(nf, polcoeff0(pol, 0, -1), gel(p, 1), gel(p, 4), prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfqpsoluble\n");
    avma = ltop;
    return 1;
  }
  if (nfzpsoluble(nf, pol, p, gen_0, gen_1, gen_0, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfqpsoluble\n");
    avma = ltop;
    return 1;
  }
  if (nfzpsoluble(nf, polrecip(pol), p, gen_1, gel(p, 2), gen_0, prec))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de nfqpsoluble\n");
    avma = ltop;
    return 1;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("fin de nfqpsoluble\n");
  avma = ltop;
  return 0;
}

long
nflocallysoluble(GEN nf, GEN pol, GEN r, GEN a, GEN b, long prec)
{
  pari_sp ltop = avma;
  GEN pol0 = gen_0, plist = gen_0, add = gen_0, ff = gen_0, p = gen_0, Delta = gen_0, vecpol = gen_0, vecpolr = gen_0, Sturmr = gen_0;
  GEN p1 = gen_0;	  /* vec */
  GEN p2 = gen_0;	  /* int */
  if (!r)
    r = gen_0;
  if (!a)
    a = gen_1;
  if (!b)
    b = gen_1;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    p1 = cgetg(5, t_VEC);
    gel(p1, 1) = gcopy(pol);
    gel(p1, 2) = gcopy(r);
    gel(p1, 3) = gcopy(a);
    gel(p1, 4) = gcopy(b);
    pari_printf("entree dans nflocallysoluble %Ps\n", p1);
  }
  pol0 = gcopy(pol);
  /* */
  /* places finies de plist *\ */
  /* */
  pol = gmul(/* */
  /* places finies de plist *\ */
  /* */
  pol, gsqr(deno(content(lift(pol)))));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long ii, l3;
    for (ii = 1; ii <= 3; ++ii)
    {
      if (ii == 1)
        plist = idealprimedec(nf, gen_2);
      if ((ii == 2) && !gequal0(r))
        plist = gcopy(gel(idealfactor(nf, gdiv(gdiv(poldisc0(gdiv(pol0, pollead(pol0, -1)), -1), gpowgs(pollead(pol0, -1), 6)), gpowgs(gen_2, 12))), 1));
      if ((ii == 2) && (gequal0(r)))
        plist = gcopy(gel(idealfactor(nf, poldisc0(pol0, -1)), 1));
      if (ii == 3)
      {
        add = idealadd(nf, a, b);
        ff = gcopy(gel(factor(idealnorm(nf, add)), 1));
        addprimes(ff);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("liste de premiers = %Ps\n", ff);
        plist = gcopy(gel(idealfactor(nf, add), 1));
      }
      l3 = glength(plist);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 1; i <= l3; ++i)
        {
          p = gcopy(gel(plist, i));
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf("p = %Ps\n", p);
          if (gcmp(member_p(p), LIMBIGPRIME) < 0)
          {
            if (!nfqpsoluble(nf, pol, initp(nf, p, prec), prec))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf(" non ELS en %Ps\n", p);
              if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                pari_printf("fin de nflocallysoluble\n");
              avma = ltop;
              return 0;
            }
          }
          else
            if (!nfqpsolublebig(nf, pol, p, gdiv(r, a), b, prec))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf(" non ELS en %Ps ( = grand premier  )\n", member_p(p));
              if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                pari_printf("fin de nflocallysoluble\n");
              avma = ltop;
              return 0;
            }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            p = gerepilecopy(btop, p);
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &plist, &add, &ff, &p);
    }
  }
  /* places reelles  */
  if (signe(member_r1(nf)))
  {
    Delta = poldisc0(pol, -1);
    vecpol = gtovec(pol);
    p2 = icopy(member_r1(nf));
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      GEN i = gen_0;
      long l4;
      GEN p5 = gen_0;	  /* vec */
      for (i = gen_1; gcmp(i, p2) <= 0; i = gaddgs(i, 1))
      {
        if (nfsign_s(nf, pollead(pol, -1), i, prec) > 0)
          continue;
        if (nfsign_s(nf, polcoeff0(pol, 0, -1), i, prec) > 0)
          continue;
        if (nfsign_s(nf, Delta, i, prec) < 0)
          continue;
        l4 = glength(vecpol);
        {
          long j;
          p5 = cgetg(l4+1, t_VEC);
          for (j = 1; j <= l4; ++j)
            gel(p5, j) = mysubst(gel(vecpol, j), gel(member_roots(nf), gtos(i)));
        }
        vecpolr = p5;
        Sturmr = stoi(sturmpart(gtopoly(vecpolr, -1), NULL, NULL));
        if (gequal0(Sturmr))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf(" non ELS a l'infini\n");
          if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
            pari_printf("fin de nflocallysoluble\n");
          avma = ltop;
          return 0;
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 4, &i, &p5, &vecpolr, &Sturmr);
      }
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf(" quartique ELS \n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de nflocallysoluble\n");
  avma = ltop;
  return 1;
}

GEN
nfellcount(GEN nf, GEN c, GEN d, GEN KS2gen, GEN pointstriv, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN found = gen_0, listgen = gen_0, listpointscount = gen_0, m1 = gen_0, m2 = gen_0, lastloc = gen_0, mask = gen_0, i = gen_0, d1 = gen_0, iaux = gen_0, j = gen_0, triv = gen_0, pol = gen_0, point = gen_0, deuxpoints = gen_0, aux = gen_0, v = gen_0;
  GEN p1 = gen_0;	  /* vec */
  long l2;
  GEN x = pol_x(fetch_user_var("x"));
  GEN p3 = gen_0, p4 = gen_0;	  /* vec */
  /* MODI add aux, v */
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    p1 = cgetg(3, t_VEC);
    gel(p1, 1) = gcopy(c);
    gel(p1, 2) = gcopy(d);
    pari_printf("entree dans nfellcount %Ps\n", p1);
  }
  found = gen_0;
  listgen = gcopy(KS2gen);
  listpointscount = cgetg(1, t_VEC);
  m1 = m2 = gen_0;
  lastloc = gen_m1;
  mask = shifti(gen_1, glength(KS2gen));
  i = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l5;
    GEN p6 = gen_0, p7 = gen_0, p8 = gen_0, p9 = gen_0, p10 = gen_0, p11 = gen_0;	  /* vec */
    while (gcmp(i, mask) < 0)
    {
      d1 = gen_1;
      iaux = i;
      j = gen_1;
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        while (!gequal0(iaux))
        {
          if (!gequal0(gmodgs(iaux, 2)))
            d1 = gmul(d1, gel(listgen, gtos(j)));
          iaux = gshift(iaux, -1);
          j = gaddgs(j, 1);
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 3, &d1, &iaux, &j);
        }
      }
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("d1 = %Ps\n", d1);
      triv = gen_0;
      l5 = glength(pointstriv);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        GEN p12 = gen_0;	  /* vec */
        for (j = 1; j <= l5; ++j)
        {
          if (!gequal0(gmul(gel(gel(pointstriv, j), 3), gel(gel(pointstriv, j), 1))) && nfissquare(nf, gmul(gmul(d1, gel(gel(pointstriv, j), 1)), gel(gel(pointstriv, j), 3)), prec))
          {
            p12 = cgetg(2, t_VEC);
            gel(p12, 1) = gcopy(gel(pointstriv, j));
            listpointscount = concat(listpointscount, p12);
            if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              pari_printf("point trivial\n");
            triv = gen_1;
            m1 = gaddgs(m1, 1);
            if (gcmp(degre(i), lastloc) > 0)
              m2 = gaddgs(m2, 1);
            found = gen_1;
            lastloc = gen_m1;
            break;
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 7, &p12, &listpointscount, &triv, &m1, &m2, &found, &lastloc);
        }
      }
      if (gequal0(triv))
      {
        p6 = cgetg(6, t_VEC);
        gel(p6, 1) = gcopy(d1);
        gel(p6, 2) = gen_0;
        gel(p6, 3) = gcopy(c);
        gel(p6, 4) = gen_0;
        gel(p6, 5) = gdiv(d, d1);
        pol = gtopoly(p6, -1);
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("quartique = y^2 = %Ps\n", pol);
        point = nfratpoint(nf, pol, LIM1, gen_1, prec);
        if (!gequal(point, cgetg(1, t_VEC)))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf("point sur la quartique\n");
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf("%Ps\n", point);
          m1 = gaddgs(m1, 1);
          if (!gequalgs(gel(point, 3), 0))
          {
            aux = gdiv(gmul(d1, gel(point, 1)), gsqr(gel(point, 3)));
            p7 = cgetg(3, t_VEC);
            gel(p7, 1) = gmul(aux, gel(point, 1));
            gel(p7, 2) = gdiv(gmul(aux, gel(point, 2)), gel(point, 3));
            deuxpoints = p7;
          }
          else
          {
            p8 = cgetg(2, t_VEC);
            gel(p8, 1) = gen_0;
            deuxpoints = p8;
          }
          p9 = cgetg(2, t_VEC);
          gel(p9, 1) = gcopy(deuxpoints);
          listpointscount = concat(listpointscount, p9);
          if (gcmp(degre(i), lastloc) > 0)
            m2 = gaddgs(m2, 1);
          found = gen_1;
          lastloc = gen_m1;
        }
        else
          if (nflocallysoluble(nf, pol, NULL, NULL, NULL, prec))
          {
            if (gcmp(degre(i), lastloc) > 0)
            {
              m2 = gaddgs(m2, 1);
              lastloc = degre(i);
            }
            point = nfratpoint(nf, pol, LIM3, gen_1, prec);
            if (!gequal(point, cgetg(1, t_VEC)))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("point sur la quartique\n");
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("%Ps\n", point);
              m1 = gaddgs(m1, 1);
              aux = gdiv(gmul(d1, gel(point, 1)), gsqr(gel(point, 3)));
              p10 = cgetg(3, t_VEC);
              gel(p10, 1) = gmul(aux, gel(point, 1));
              gel(p10, 2) = gdiv(gmul(aux, gel(point, 2)), gel(point, 3));
              deuxpoints = p10;
              p11 = cgetg(2, t_VEC);
              gel(p11, 1) = gcopy(deuxpoints);
              listpointscount = concat(listpointscount, p11);
              if (gcmp(degre(i), lastloc) > 0)
                m2 = gaddgs(m2, 1);
              found = gen_1;
              lastloc = gen_m1;
            }
            else
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("pas de point trouve sur la quartique\n");
          }
      }
      if (!gequal0(found))
      {
        found = gen_0;
        v = gen_0;
        iaux = gshift(i, -1);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (!gequal0(iaux))
          {
            iaux = gshift(iaux, -1);
            v = gaddgs(v, 1);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 2, &iaux, &v);
          }
        }
        mask = gshift(mask, -1);
        listgen = extract0(listgen, subis(subii(shifti(gen_1, glength(listgen)), shifti(gen_1, gtos(v))), 1), NULL);
        i = shifti(gen_1, gtos(v));
      }
      else
        i = gaddgs(i, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 23, &d1, &iaux, &j, &triv, &listpointscount, &m1, &m2, &found, &lastloc, &p6, &pol, &point, &aux, &p7, &deuxpoints, &p8, &p9, &p10, &p11, &v, &mask, &listgen, &i);
    }
  }
  l2 = glength(listpointscount);
  {
    pari_sp btop = avma;
    long i;
    for (i = 1; i <= l2; ++i)
    {
      if (glength(gel(listpointscount, i)) > 1)
        if (!gequalgs(gsub(gsubst(gadd(gadd(gpowgs(x, 3), gmul(c, gsqr(x))), gmul(d, x)), gvar(x), gel(gel(listpointscount, i), 1)), gsqr(gel(gel(listpointscount, i), 2))), 0))
          pari_err(user, "nfellcount : MAUVAIS POINT = %Ps", gel(listpointscount, i));
      avma = btop;
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de nfellcount\n");
  p3 = cgetg(3, t_VEC);
  gel(p3, 1) = gcopy(listpointscount);
  p4 = cgetg(3, t_VEC);
  gel(p4, 1) = gcopy(m1);
  gel(p4, 2) = gcopy(m2);
  gel(p3, 2) = p4;
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

/* To keep gp2c happy */
GEN
gettufu(GEN bnf)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  p1 = concat(gel(member_tu(bnf), 2), member_fu(bnf));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
getfutu(GEN bnf)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;
  p1 = concat(member_fu(bnf), gel(member_tu(bnf), 2));
  p1 = gerepilecopy(ltop, p1);
  return p1;
}

GEN
bnfell2descent_viaisog(GEN bnf, GEN ell, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN P = gen_0, Pfact = gen_0, tors = gen_0, pointstriv = gen_0, apinit = gen_0, bpinit = gen_0, plist = gen_0, KS2prod = gen_0, oddclass = gen_0, KS2gen = gen_0, listpoints = gen_0, pointgen = gen_0, n1 = gen_0, n2 = gen_0, certain = gen_0, np1 = gen_0, np2 = gen_0, listpoints2 = gen_0, aux1 = gen_0, aux2 = gen_0, certainp = gen_0, rang = gen_0, strange = gen_0, y = pol_x(fetch_user_var("y"));
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0, p5 = gen_0, p6 = gen_0, p7 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  long l8, l9;
  GEN p10 = gen_0, p11 = gen_0, p12 = gen_0, p13 = gen_0, p14 = gen_0, p15 = gen_0, p16 = gen_0;	  /* vec */
  long l17;
  GEN p18 = gen_0;	  /* vec */
  long l19;
  GEN p20 = gen_0;	  /* vec */
  /* MODI remove i */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("Algorithme de la 2-descente par isogenies\n");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("entree dans bnfell2descent_viaisog\n");
  if (!gequal(gpolvar(member_pol(bnf)), y))
    pari_err(user, " bnfell2descent_viaisog : la variable du corps de nombres doit etre y ");
  ell = smallellinit(gmodulo(lift(ell), member_pol(bnf)));
  if (gequal0(member_disc(ell)))
    pari_err(user, " bnfell2descent_viaisog : courbe singuliere !!");
  if ((!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0)) || !gequalgs(ell_get_a6(ell), 0))
    pari_err(user, " bnfell2descent_viaisog : la courbe n'est pas sous la forme [0,a,0,b,0]");
  if ((gcmpgs(denom(algtobasis(bnf, ell_get_a2(ell))), 1) > 0) || (gcmpgs(denom(algtobasis(bnf, ell_get_a4(ell))), 1) > 0))
    pari_err(user, " bnfell2descent_viaisog : coefficients non entiers");
  p1 = cgetg(4, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gcopy(ell_get_a2(ell));
  gel(p1, 3) = gcopy(ell_get_a4(ell));
  P = gmul(gtopoly(p1, -1), gmodulsg(1, member_pol(bnf)));
  Pfact = gcopy(gel(polfnf(P, member_pol(bnf)), 1));
  tors = stoi(glength(Pfact));
  if (glength(Pfact) > 1)
  {
    p2 = cgetg(4, t_VEC);
    p3 = cgetg(4, t_VEC);
    gel(p3, 1) = gen_0;
    gel(p3, 2) = gen_0;
    gel(p3, 3) = gen_1;
    gel(p2, 1) = p3;
    p4 = cgetg(4, t_VEC);
    gel(p4, 1) = gneg(polcoeff0(gel(Pfact, 1), 0, -1));
    gel(p4, 2) = gen_0;
    gel(p4, 3) = gen_1;
    gel(p2, 2) = p4;
    p5 = cgetg(4, t_VEC);
    gel(p5, 1) = gneg(polcoeff0(gel(Pfact, 2), 0, -1));
    gel(p5, 2) = gen_0;
    gel(p5, 3) = gen_1;
    gel(p2, 3) = p5;
    pointstriv = p2;
  }
  else
  {
    p6 = cgetg(2, t_VEC);
    p7 = cgetg(4, t_VEC);
    gel(p7, 1) = gen_0;
    gel(p7, 2) = gen_0;
    gel(p7, 3) = gen_1;
    gel(p6, 1) = p7;
    pointstriv = p6;
  }
  apinit = gmulsg(-2, ell_get_a2(ell));
  bpinit = gsub(gsqr(ell_get_a2(ell)), gmulsg(4, ell_get_a4(ell)));
  /* calcul des ideaux premiers de plist  */
  /* et de quelques renseignements associes  */
  plist = gcopy(gel(idealfactor(bnf, gmulsg(6, member_disc(ell))), 1));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf(" Recherche de points triviaux sur la courbe\n");
  P = gmul(P, x);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("Y^2 = %Ps\n", P);
  pointstriv = concat(pointstriv, nfratpoint(member_nf(bnf), P, LIMTRIV, gen_0, prec));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf("points triviaux sur E(K) = \n");
    pari_printf("%Ps\n", lift(pointstriv));
    pari_printf("\n");
  }
  KS2prod = gcopy(ell_get_a4(ell));
  oddclass = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(oddclass))
    {
      KS2gen = bnfsunit(bnf, gtrans(gel(idealfactor(bnf, KS2prod), 1)), prec);
      oddclass = gmodgs(gel(gel(KS2gen, 5), 1), 2);
      if (gequal0(oddclass))
        KS2prod = idealmul(bnf, KS2prod, gel(gel(gel(KS2gen, 5), 3), 1));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &KS2gen, &oddclass, &KS2prod);
    }
  }
  KS2gen = gcopy(gel(KS2gen, 1));
  /*  A CHANGER : KS2gen = matbasistoalg(bnf,KS2gen); */
  l8 = glength(KS2gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l8; ++i)
    {
      gel(KS2gen, i) = basistoalg(bnf, gel(KS2gen, i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        KS2gen = gerepilecopy(btop, KS2gen);
    }
  }
  KS2gen = concat(gmodulo(lift(gettufu(bnf)), member_pol(bnf)), KS2gen);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("#K(b,2)gen          = %ld\n", glength(KS2gen));
    pari_printf("K(b,2)gen = %Ps\n", KS2gen);
  }
  listpoints = nfellcount(member_nf(bnf), ell_get_a2(ell), ell_get_a4(ell), KS2gen, pointstriv, prec);
  pointgen = gcopy(gel(listpoints, 1));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf("points sur E(K) = %Ps\n", lift(pointgen));
    pari_printf("\n");
  }
  n1 = gcopy(gel(gel(listpoints, 2), 1));
  n2 = gcopy(gel(gel(listpoints, 2), 2));
  certain = stoi(gequal(n1, n2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certain))
    {
      pari_printf("[E(K):phi'(E'(K))]  = %Ps\n", shifti(gen_1, gtos(n1)));
      pari_printf("#S^(phi')(E'/K)     = %Ps\n", shifti(gen_1, gtos(n2)));
      pari_printf("#III(E'/K)[phi']    = 1\n");
      pari_printf("\n");
    }
    else
    {
      pari_printf("[E(K):phi'(E'(K))] >= %Ps\n", shifti(gen_1, gtos(n1)));
      pari_printf("#S^(phi')(E'/K)     = %Ps\n", shifti(gen_1, gtos(n2)));
      pari_printf("#III(E'/K)[phi']   <= %Ps\n", shifti(gen_1, gtos(gsub(n2, n1))));
      pari_printf("\n");
    }
  }
  KS2prod = bpinit;
  oddclass = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(oddclass))
    {
      KS2gen = bnfsunit(bnf, gtrans(gel(idealfactor(bnf, KS2prod), 1)), prec);
      oddclass = gmodgs(gel(gel(KS2gen, 5), 1), 2);
      if (gequal0(oddclass))
        KS2prod = idealmul(bnf, KS2prod, gel(gel(gel(KS2gen, 5), 3), 1));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &KS2gen, &oddclass, &KS2prod);
    }
  }
  KS2gen = gcopy(gel(KS2gen, 1));
  /* A CHANGER KS2gen = matbasistoalg(bnf,KS2gen); */
  l9 = glength(KS2gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l9; ++i)
    {
      gel(KS2gen, i) = basistoalg(bnf, gel(KS2gen, i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        KS2gen = gerepilecopy(btop, KS2gen);
    }
  }
  KS2gen = concat(gmodulo(lift(gettufu(bnf)), member_pol(bnf)), KS2gen);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("#K(a^2-4b,2)gen     = %ld\n", glength(KS2gen));
    pari_printf("K(a^2-4b,2)gen     = %Ps\n", KS2gen);
  }
  p10 = cgetg(4, t_VEC);
  gel(p10, 1) = gen_1;
  gel(p10, 2) = gcopy(apinit);
  gel(p10, 3) = gcopy(bpinit);
  P = gmul(gtopoly(p10, -1), gmodulsg(1, member_pol(bnf)));
  Pfact = gcopy(gel(polfnf(P, member_pol(bnf)), 1));
  if (glength(Pfact) > 1)
  {
    p11 = cgetg(4, t_VEC);
    p12 = cgetg(4, t_VEC);
    gel(p12, 1) = gen_0;
    gel(p12, 2) = gen_0;
    gel(p12, 3) = gen_1;
    gel(p11, 1) = p12;
    p13 = cgetg(4, t_VEC);
    gel(p13, 1) = gneg(polcoeff0(gel(Pfact, 1), 0, -1));
    gel(p13, 2) = gen_0;
    gel(p13, 3) = gen_1;
    gel(p11, 2) = p13;
    p14 = cgetg(4, t_VEC);
    gel(p14, 1) = gneg(polcoeff0(gel(Pfact, 2), 0, -1));
    gel(p14, 2) = gen_0;
    gel(p14, 3) = gen_1;
    gel(p11, 3) = p14;
    pointstriv = p11;
  }
  else
  {
    p15 = cgetg(2, t_VEC);
    p16 = cgetg(4, t_VEC);
    gel(p16, 1) = gen_0;
    gel(p16, 2) = gen_0;
    gel(p16, 3) = gen_1;
    gel(p15, 1) = p16;
    pointstriv = p15;
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf(" Recherche de points triviaux sur la courbe\n");
  P = gmul(P, x);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("Y^2 = %Ps\n", P);
  pointstriv = concat(pointstriv, nfratpoint(member_nf(bnf), P, LIMTRIV, gen_0, prec));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf("points triviaux sur E'(K) = \n");
    pari_printf("%Ps\n", lift(pointstriv));
    pari_printf("\n");
  }
  listpoints = nfellcount(member_nf(bnf), apinit, bpinit, KS2gen, pointstriv, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("points sur E'(K) = %Ps\n", lift(gel(listpoints, 1)));
  np1 = gcopy(gel(gel(listpoints, 2), 1));
  np2 = gcopy(gel(gel(listpoints, 2), 2));
  l17 = glength(gel(listpoints, 1));
  {
    long i;
    p18 = cgetg(l17+1, t_VEC);
    for (i = 1; i <= l17; ++i)
      gel(p18, i) = gen_0;
  }
  listpoints2 = p18;
  l19 = glength(gel(listpoints, 1));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    GEN p21 = gen_0;	  /* vec */
    for (i = 1; i <= l19; ++i)
    {
      p21 = cgetg(3, t_VEC);
      gel(p21, 1) = gen_0;
      gel(p21, 2) = gen_0;
      gel(listpoints2, i) = p21;
      aux1 = gsqr(gel(gel(gel(listpoints, 1), i), 1));
      if (!gequalgs(aux1, 0))
      {
        aux2 = gcopy(gel(gel(gel(listpoints, 1), i), 2));
        gel(gel(listpoints2, i), 1) = gdivgs(gdiv(gsqr(aux2), aux1), 4);
        gel(gel(listpoints2, i), 2) = gdivgs(gdiv(gmul(aux2, gsub(bpinit, aux1)), aux1), 8);
      }
      else
        gel(listpoints2, i) = gcopy(gel(gel(listpoints, 1), i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 4, &p21, &listpoints2, &aux1, &aux2);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    pari_printf("points sur E(K) = %Ps\n", lift(listpoints2));
    pari_printf("\n");
  }
  pointgen = concat(pointgen, listpoints2);
  certainp = stoi(gequal(np1, np2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certainp))
    {
      pari_printf("[E'(K):phi(E(K))]   = %Ps\n", shifti(gen_1, gtos(np1)));
      pari_printf("#S^(phi)(E/K)       = %Ps\n", shifti(gen_1, gtos(np2)));
      pari_printf("#III(E/K)[phi]      = 1\n");
      pari_printf("\n");
    }
    else
    {
      pari_printf("[E'(K):phi(E(K))]  >= %Ps\n", shifti(gen_1, gtos(np1)));
      pari_printf("#S^(phi)(E/K)       = %Ps\n", shifti(gen_1, gtos(np2)));
      pari_printf("#III(E/K)[phi]     <= %Ps\n", shifti(gen_1, gtos(gsub(np2, np1))));
      pari_printf("\n");
    }
    if ((gequal0(certain)) && (gcmp(np2, np1) > 0))
      pari_printf("%Ps <= ", shifti(gen_1, gtos(gsub(np2, np1))));
    pari_printf("#III(E/K)[2]       ");
    if (!gequal0(certain) && !gequal0(certainp))
      pari_printf(" ");
    else
      pari_printf("<");
    pari_printf("= %Ps\n", shifti(gen_1, gtos(gsub(gsub(gadd(n2, np2), n1), np1))));
    pari_printf("#E(K)[2]            = %Ps\n", shifti(gen_1, gtos(tors)));
  }
  rang = gsubgs(gadd(n1, np1), 2);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(certain) && !gequal0(certainp))
    {
      pari_printf("#E(K)/2E(K)         = %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
      pari_printf("rang                = %Ps\n", rang);
      pari_printf("\n");
    }
    else
    {
      pari_printf("#E(K)/2E(K)        >= %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
      pari_printf("\n");
      pari_printf("%Ps <= rang          <= %Ps\n", rang, gsubgs(gadd(n2, np2), 2));
      pari_printf("\n");
    }
  }
  strange = gmodgs(gsub(gsub(gadd(n2, np2), n1), np1), 2);
  if (!gequal0(strange))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf(" !!! III doit etre un carre !!!\n");
      pari_printf("donc\n");
    }
    if (!gequal0(certain))
    {
      np1 = gaddgs(np1, 1);
      certainp = stoi(gequal(np1, np2));
      if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
      {
        if (!gequal0(certainp))
        {
          pari_printf("[E'(K):phi(E(K))]   = %Ps\n", shifti(gen_1, gtos(np1)));
          pari_printf("#S^(phi)(E/K)       = %Ps\n", shifti(gen_1, gtos(np2)));
          pari_printf("#III(E/K)[phi]      = 1\n");
          pari_printf("\n");
        }
        else
        {
          pari_printf("[E'(K):phi(E(K))]  >= %Ps\n", shifti(gen_1, gtos(np1)));
          pari_printf("#S^(phi)(E/K)       = %Ps\n", shifti(gen_1, gtos(np2)));
          pari_printf("#III(E/K)[phi]     <= %Ps\n", shifti(gen_1, gtos(gsub(np2, np1))));
          pari_printf("\n");
        }
      }
    }
    else
    {
      if (!gequal0(certainp))
      {
        n1 = gaddgs(n1, 1);
        certain = stoi(gequal(n1, n2));
        if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
        {
          if (!gequal0(certain))
          {
            pari_printf("[E(K):phi'(E'(K))]   = %Ps\n", shifti(gen_1, gtos(n1)));
            pari_printf("#S^(phi')(E'/K)       = %Ps\n", shifti(gen_1, gtos(n2)));
            pari_printf("#III(E'/K)[phi']      = 1\n");
            pari_printf("\n");
          }
          else
          {
            pari_printf("[E(K):phi'(E'(K))]  >= %Ps\n", shifti(gen_1, gtos(n1)));
            pari_printf("#S^(phi')(E'/K)      = %Ps\n", shifti(gen_1, gtos(n2)));
            pari_printf("#III(E'/K)[phi']    <= %Ps\n", shifti(gen_1, gtos(gsub(n2, n1))));
            pari_printf("\n");
          }
        }
      }
      else
        n1 = gaddgs(n1, 1);
    }
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      if ((gequal0(certain)) && (gcmp(np2, np1) > 0))
        pari_printf("%Ps <= ", shifti(gen_1, gtos(gsub(np2, np1))));
      pari_printf("#III(E/K)[2]       ");
      if (!gequal0(certain) && !gequal0(certainp))
        pari_printf(" ");
      else
        pari_printf("<");
      pari_printf("= %Ps\n", shifti(gen_1, gtos(gsub(gsub(gadd(n2, np2), n1), np1))));
      pari_printf("#E(K)[2]            = %Ps\n", shifti(gen_1, gtos(tors)));
    }
    rang = gsubgs(gadd(n1, np1), 2);
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      if (!gequal0(certain) && !gequal0(certainp))
      {
        pari_printf("#E(K)/2E(K)         = %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
        pari_printf("\n");
        pari_printf("rang                = %Ps\n", rang);
        pari_printf("\n");
      }
      else
      {
        pari_printf("#E(K)/2E(K)        >= %Ps\n", shifti(gen_1, gtos(gadd(rang, tors))));
        pari_printf("\n");
        pari_printf("%Ps <= rang          <= %Ps\n", rang, gsubgs(gadd(n2, np2), 2));
        pari_printf("\n");
      }
    }
  }
  /* fin de strange  */
  
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("points = %Ps\n", pointgen);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("fin de bnfell2descent_viaisog\n");
  p20 = cgetg(4, t_VEC);
  gel(p20, 1) = gcopy(rang);
  gel(p20, 2) = gadd(gsubgs(gadd(n2, np2), 2), tors);
  gel(p20, 3) = gcopy(pointgen);
  p20 = gerepilecopy(ltop, p20);
  return p20;
}

GEN
nfchinremain(GEN nf, GEN b, GEN fact)
{
  pari_sp ltop = avma;
  GEN l = gen_0, fact2 = gen_0;
  GEN p1 = gen_0;	  /* vec */
  /* MODI remove i */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("entree dans nfchinremain\n");
  l = stoi(glength(gel(fact, 1)));
  {
    long i;
    p1 = cgetg(gtos(l)+1, t_VEC);
    for (i = 1; gcmpsg(i, l) <= 0; ++i)
      gel(p1, i) = idealdiv(nf, b, idealpow0(nf, gcoeff(fact, i, 1), gcoeff(fact, i, 2), 0));
  }
  fact2 = p1;
  /*  for( i = 1, l, */
  /*    fact2[i] = idealdiv(nf,b,idealpow(nf,fact[i,1],fact[i,2]))); */
  fact2 = idealaddtoone0(nf, fact2, NULL);
  /* A CHANGER : fact2 = matbasistoalg(nf,fact2); */
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN i = gen_0;
    for (i = gen_1; gcmp(i, l) <= 0; i = gaddgs(i, 1))
    {
      gel(fact2, gtos(i)) = basistoalg(nf, gel(fact2, gtos(i)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &i, &fact2);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de nfchinremain\n");
  fact2 = gerepilecopy(ltop, fact2);
  return fact2;
}

GEN
bnfqfsolve2(GEN bnf, GEN aleg, GEN bleg, GEN auto_s, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* vec */
  GEN y = pol_x(fetch_user_var("y")), aux = gen_0, solvepolrel = gen_0, auxsolve = gen_0, solvepolabs = gen_0, exprxy = gen_0, rrrnf = gen_0, bbbnf = gen_0, SL0 = gen_0, SL1 = gen_0, SL = gen_0, sunL = gen_0, fondsunL = gen_0, normfondsunL = gen_0, SK = gen_0, sunK = gen_0, fondsunK = gen_0, vecbleg = gen_0, matnorm = gen_0, matnormmod = gen_0, expsolution = gen_0, solution = gen_0, reste = gen_0, carre = gen_0, verif = gen_0, x0 = gen_0, x1 = gen_0, x = pol_x(fetch_user_var("x"));
  long l2, l3, l4;
  GEN p5 = gen_0;	  /* vec */
  long l6;
  GEN p7 = gen_0;	  /* vec */
  long l8, l9;
  GEN p10 = gen_0;	  /* vec */
  long l11, l12;
  GEN p13 = gen_0;
  long l14;
  GEN p15 = gen_0;
  GEN p16 = gen_0;	  /* vec */
  if (!auto_s)
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(y);
    auto_s = p1;
  }
  /* MODI remove i */
  /* MODI add x0, x1 */
  
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("entree dans bnfqfsolve2\n");
  solvepolrel = gsub(gsqr(x), aleg);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("aleg = %Ps\n", aleg);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bleg = %Ps\n", bleg);
  if (glength(auto_s) > 1)
  {
    if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      pari_printf("factorisation du discriminant avec les auto_smorhpismes de bnf\n");
    l2 = glength(auto_s);
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long i;
      for (i = 2; i <= l2; ++i)
      {
        aux = gabs(polresultant0(gsub(lift(aleg), gsubst(lift(aleg), gvar(y), gel(auto_s, i))), member_pol(bnf), -1, 0), prec);
        if (!gequal0(aux))
          addprimes(gel(factor(aux), 1));
        if (low_stack(st_lim, stack_lim(btop, 1)))
          aux = gerepilecopy(btop, aux);
      }
    }
  }
  auxsolve = rnfequation0(bnf, solvepolrel, 1);
  solvepolabs = gcopy(gel(auxsolve, 1));
  exprxy = gcopy(gel(auxsolve, 2));
  if (!gequal0(gel(auxsolve, 3)))
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf(" CECI EST LE NOUVEAU CAS auxsolve[3] != 0\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf(" bbbnfinit %Ps\n", solvepolabs);
  rrrnf = rnfinit(bnf, solvepolrel);
  bbbnf = Buchall(solvepolabs, nf_FORCE, prec);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf(" done\n");
  SL0 = gen_1;
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("bbbnf.clgp = %Ps\n", member_clgp(bbbnf));
  l3 = glength(gel(member_clgp(bbbnf), 2));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l3; ++i)
    {
      if (gequal0(gmodgs(gel(gel(member_clgp(bbbnf), 2), i), 2)))
        SL0 = idealmul(bbbnf, SL0, gcoeff(gel(gel(member_clgp(bbbnf), 3), i), 1, 1));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        SL0 = gerepilecopy(btop, SL0);
    }
  }
  SL1 = idealmul(bbbnf, SL0, rnfelementup(rrrnf, bleg));
  SL = gtrans(gel(idealfactor(bbbnf, SL1), 1));
  sunL = bnfsunit(bbbnf, SL, prec);
  l4 = glength(gel(sunL, 1));
  {
    long i;
    p5 = cgetg(l4+1, t_VEC);
    for (i = 1; i <= l4; ++i)
      gel(p5, i) = basistoalg(bbbnf, gel(gel(sunL, 1), i));
  }
  /* A CHANGER : fondsunL = concat(bbbnf.futu,matbasistoalg(bbbnf,sunL[1])); */
  fondsunL = concat(getfutu(bbbnf), p5);
  normfondsunL = gnorm(rnfelementabstorel(rrrnf, fondsunL));
  SK = gtrans(gel(idealfactor(bnf, idealnorm(bbbnf, SL1)), 1));
  sunK = bnfsunit(bnf, SK, prec);
  l6 = glength(gel(sunK, 1));
  {
    long i;
    p7 = cgetg(l6+1, t_VEC);
    for (i = 1; i <= l6; ++i)
      gel(p7, i) = basistoalg(bnf, gel(gel(sunK, 1), i));
  }
  /* A CHANGER :  fondsunK = concat(bnf.futu,matbasistoalg(bnf,sunK[1])); */
  fondsunK = concat(getfutu(bnf), p7);
  vecbleg = bnfissunit(bnf, sunK, bleg);
  l8 = glength(normfondsunL);
  l9 = glength(fondsunK);
  {
    long i, j;
    p10 = cgetg(l8+1, t_MAT);
    for (j = 1; j <= l8; ++j)
    {
      gel(p10, j) = cgetg(l9+1, t_COL);
      for (i = 1; i <= l9; ++i)
        gcoeff(p10, i, j) = gen_0;
    }
  }
  matnorm = p10;
  l11 = glength(normfondsunL);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l11; ++i)
    {
      gel(matnorm, i) = lift(bnfissunit(bnf, sunK, gel(normfondsunL, i)));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        matnorm = gerepilecopy(btop, matnorm);
    }
  }
  matnormmod = gmul(matnorm, gmodulss(1, 2));
  expsolution = lift(inverseimage(matnormmod, gmul(vecbleg, gmodulss(1, 2))));
  if (gequal(expsolution, cgetg(1, t_COL)))
    pari_err(user, " bnfqfsolve2 : IL N'Y A PAS DE SOLUTION ");
  l12 = glength(expsolution);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    p13 = gen_1;
    for (i = 1; i <= l12; ++i)
    {
      p13 = gmul(p13, gpow(gel(fondsunL, i), gel(expsolution, i), prec));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        p13 = gerepilecopy(btop, p13);
    }
  }
  solution = p13;
  solution = rnfelementabstorel(rrrnf, solution);
  reste = gdivgs(gsub(lift(vecbleg), gmul(matnorm, expsolution)), 2);
  l14 = glength(vecbleg);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    p15 = gen_1;
    for (i = 1; i <= l14; ++i)
    {
      p15 = gmul(p15, gpow(gel(fondsunK, i), gel(reste, i), prec));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        p15 = gerepilecopy(btop, p15);
    }
  }
  carre = p15;
  solution = gmul(solution, carre);
  x1 = polcoeff0(lift(solution), 1, gvar(x));
  x0 = polcoeff0(lift(solution), 0, gvar(x));
  verif = gsub(gsub(gsqr(x0), gmul(aleg, gsqr(x1))), bleg);
  if (!gequal0(verif))
    pari_err(user, " bnfqfsolve2 : MAUVAIS POINT");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("fin de bnfqfsolve2\n");
  p16 = cgetg(4, t_VEC);
  gel(p16, 1) = gcopy(x0);
  gel(p16, 2) = gcopy(x1);
  gel(p16, 3) = gen_1;
  p16 = gerepilecopy(ltop, p16);
  return p16;
}

GEN
bnfqfsolve(GEN bnf, GEN aleg, GEN bleg, GEN flag3, GEN auto_s, long prec)
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* vec */
  GEN y = pol_x(fetch_user_var("y")), nf = gen_0, aa = gen_0, bb = gen_0, na = gen_0, nb = gen_0, maxnb = gen_0, mat = gen_0, resl = gen_0, t = gen_0, sq = gen_0, pol = gen_0, vecrat = gen_0, alpha = gen_0, xx = gen_0, yy = gen_0, borne = gen_0, test = gen_0, sun = gen_0, fact = gen_0, suni = gen_0, f = gen_0, l = gen_0, aux = gen_0, alpha2 = gen_0, maxnbiter = gen_0, idbb = gen_0, rem = gen_0, nbiter = gen_0, mask = gen_0, oldnb = gen_0, newnb = gen_0, bor = gen_0, testici = gen_0, de = gen_0, xxp = gen_0, yyp = gen_0, rap = gen_0, verif = gen_0;
  GEN p2 = gen_0, p3 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  if (!auto_s)
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(y);
    auto_s = p1;
  }
  /* MODI remove k, maxna */
  
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("entree dans bnfqfsolve\n");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("(a,b) = (%Ps,%Ps)\n", aleg, bleg);
  nf = gcopy(member_nf(bnf));
  aleg = gmodulo(lift(aleg), member_pol(nf));
  aa = gcopy(aleg);
  bleg = gmodulo(lift(bleg), member_pol(nf));
  bb = gcopy(bleg);
  if (gequal0(aa))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de bnfqfsolve\n");
    p2 = cgetg(4, t_COL);
    gel(p2, 1) = gen_0;
    gel(p2, 2) = gen_1;
    gel(p2, 3) = gen_0;
    p2 = gerepilecopy(ltop, p2);
    return p2;
  }
  if (gequal0(bb))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
      pari_printf("fin de bnfqfsolve\n");
    p3 = cgetg(4, t_COL);
    gel(p3, 1) = gen_0;
    gel(p3, 2) = gen_0;
    gel(p3, 3) = gen_1;
    p3 = gerepilecopy(ltop, p3);
    return p3;
  }
  na = gabs(gnorm(aa), prec);
  nb = gabs(gnorm(bb), prec);
  if (gcmp(na, nb) > 0)
    maxnb = na;
  else
    maxnb = nb;
  maxnb = gshift(maxnb, 20);
  mat = gmodulo(matid(3), member_pol(nf));
  borne = gen_1;
  test = gen_0;
  nbiter = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    GEN p4 = gen_0, p5 = gen_0, p6 = gen_0, p7 = gen_0, p8 = gen_0, p9 = gen_0, p10 = gen_0, p11 = gen_0, p12 = gen_0, p13 = gen_0;	  /* vec */
    long l14;
    GEN p15 = gen_0;	  /* vec */
    long l16;
    GEN p17 = gen_0, p18 = gen_0;	  /* vec */
    while (1)
    {
      if (!gequal0(flag3) && (gcmpgs(gel(member_clgp(bnf), 1), 1) > 0))
      {
        resl = gtrans(bnfqfsolve2(bnf, aa, bb, auto_s, prec));
        break;
      }
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      {
        p4 = cgetg(7, t_VEC);
        gel(p4, 1) = gcopy(na);
        gel(p4, 2) = gcopy(nb);
        gel(p4, 3) = gcopy(aa);
        gel(p4, 4) = gcopy(bb);
        gel(p4, 5) = gnorm(aa);
        gel(p4, 6) = gnorm(bb);
        pari_printf("(na,nb,a,b) = %Ps\n", lift(p4));
      }
      if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
        pari_printf("***%Ps*** \n", nb);
      if (gcmp(nb, maxnb) >= 0)
      {
        mat = gmodulo(matid(3), member_pol(nf));
        aa = gcopy(aleg);
        bb = gcopy(bleg);
        na = gabs(gnorm(aleg), prec);
        nb = gabs(gnorm(bleg), prec);
      }
      if (gequal1(aa))
      {
        p5 = cgetg(4, t_COL);
        gel(p5, 1) = gen_1;
        gel(p5, 2) = gen_1;
        gel(p5, 3) = gen_0;
        resl = p5;
        break;
      }
      if (gequal1(bb))
      {
        p6 = cgetg(4, t_COL);
        gel(p6, 1) = gen_1;
        gel(p6, 2) = gen_0;
        gel(p6, 3) = gen_1;
        resl = p6;
        break;
      }
      if (gequal1(gadd(aa, bb)))
      {
        p7 = cgetg(4, t_COL);
        gel(p7, 1) = gen_1;
        gel(p7, 2) = gen_1;
        gel(p7, 3) = gen_1;
        resl = p7;
        break;
      }
      if (gequal0(gadd(aa, bb)))
      {
        p8 = cgetg(4, t_COL);
        gel(p8, 1) = gen_0;
        gel(p8, 2) = gen_1;
        gel(p8, 3) = gen_1;
        resl = p8;
        break;
      }
      if (gequal(aa, bb) && !gequalgs(aa, 1))
      {
        t = gmul(aa, gel(mat, 1));
        gel(mat, 1) = gcopy(gel(mat, 3));
        gel(mat, 3) = gcopy(t);
        aa = gen_m1;
        na = gen_1;
      }
      if (!gequal0(gissquare(na)))
      {
        sq = nfsqrt(nf, aa, prec);
        if (!gequal(sq, cgetg(1, t_VEC)))
        {
          p9 = cgetg(4, t_COL);
          gel(p9, 1) = gcopy(gel(sq, 1));
          gel(p9, 2) = gen_1;
          gel(p9, 3) = gen_0;
          resl = p9;
          break;
        }
      }
      if (!gequal0(gissquare(nb)))
      {
        sq = nfsqrt(nf, bb, prec);
        if (!gequal(sq, cgetg(1, t_VEC)))
        {
          p10 = cgetg(4, t_COL);
          gel(p10, 1) = gcopy(gel(sq, 1));
          gel(p10, 2) = gen_0;
          gel(p10, 3) = gen_1;
          resl = p10;
          break;
        }
      }
      if (gcmp(na, nb) > 0)
      {
        t = aa;
        aa = bb;
        bb = t;
        t = na;
        na = nb;
        nb = t;
        t = gcopy(gel(mat, 3));
        gel(mat, 3) = gcopy(gel(mat, 2));
        gel(mat, 2) = gcopy(t);
      }
      if (gequal1(nb))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        {
          p11 = cgetg(3, t_VEC);
          gel(p11, 1) = gcopy(aa);
          gel(p11, 2) = gcopy(bb);
          pari_printf("(a,b) = %Ps\n", lift(p11));
        }
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        {
          p12 = cgetg(3, t_VEC);
          gel(p12, 1) = gcopy(na);
          gel(p12, 2) = gcopy(nb);
          pari_printf("(na,nb) = %Ps\n", lift(p12));
        }
        if (gequal(aleg, aa) && gequal(bleg, bb))
          mat = gmodulo(matid(3), member_pol(nf));
        if (!gequal0(flag3))
        {
          resl = gtrans(bnfqfsolve2(bnf, aa, bb, auto_s, prec));
          break;
        }
        pol = gadd(gmul(aa, gsqr(x)), bb);
        vecrat = nfratpoint(nf, pol, borne = gaddgs(borne, 1), gen_1, prec);
        if (!gequalgs(vecrat, 0))
        {
          p13 = cgetg(4, t_COL);
          gel(p13, 1) = gcopy(gel(vecrat, 2));
          gel(p13, 2) = gcopy(gel(vecrat, 1));
          gel(p13, 3) = gcopy(gel(vecrat, 3));
          resl = p13;
          break;
        }
        alpha = gen_0;
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("borne = %Ps\n", borne);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gequal0(alpha))
          {
            xx = nfrandint(nf, borne);
            yy = nfrandint(nf, borne);
            borne = gaddgs(borne, 1);
            alpha = gsub(gsqr(xx), gmul(aa, gsqr(yy)));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 4, &xx, &yy, &borne, &alpha);
          }
        }
        bb = gmul(bb, alpha);
        nb = gmul(nb, gabs(gnorm(alpha), prec));
        t = gadd(gmul(xx, gel(mat, 1)), gmul(yy, gel(mat, 2)));
        gel(mat, 2) = gadd(gmul(xx, gel(mat, 2)), gmul(gmul(aa, yy), gel(mat, 1)));
        gel(mat, 1) = gcopy(t);
        gel(mat, 3) = gmul(gel(mat, 3), alpha);
      }
      else
      {
        test = gen_1;
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("on factorise bb = %Ps\n", bb);
        sun = bnfsunit(bnf, gtrans(gel(idealfactor(bnf, bb), 1)), prec);
        fact = lift(bnfissunit(bnf, sun, bb));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("fact = %Ps\n", fact);
        l14 = glength(gel(sun, 1));
        {
          long i;
          p15 = cgetg(l14+1, t_VEC);
          for (i = 1; i <= l14; ++i)
            gel(p15, i) = basistoalg(bnf, gel(gel(sun, 1), i));
        }
        suni = concat(getfutu(bnf), p15);
        l16 = glength(suni);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long i;
          for (i = 1; i <= l16; ++i)
          {
            if (!gequal0(f = gshift(gel(fact, i), -1)))
            {
              test = gen_0;
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                long k;
                for (k = 1; k <= 3; ++k)
                {
                  gcoeff(mat, k, 3) = gdiv(gcoeff(mat, k, 3), gpow(gel(suni, i), f, prec));
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    mat = gerepilecopy(btop, mat);
                }
              }
              nb = gdiv(nb, gpow(gabs(gnorm(gel(suni, i)), prec), gmulsg(2, f), prec));
              bb = gdiv(bb, gpow(gel(suni, i), gmulsg(2, f), prec));
            }
            if (low_stack(st_lim, stack_lim(btop, 1)))
              gerepileall(btop, 5, &f, &test, &mat, &nb, &bb);
          }
        }
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("on factorise bb = %Ps\n", bb);
        fact = idealfactor(nf, bb);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("fact = %Ps\n", fact);
        l = stoi(glength(gel(fact, 1)));
        if (!gequal0(test))
        {
          aux = gen_1;
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN i = gen_0;
            for (i = gen_1; gcmp(i, l) <= 0; i = gaddgs(i, 1))
            {
              if ((!gequal0(f = gshift(gcoeff(fact, gtos(i), 2), -1)) && (gequal0(gmodgs(gel(gcoeff(fact, gtos(i), 1), 1), 2)))) && (!nfpsquareodd(nf, aa, gcoeff(fact, gtos(i), 1), prec)))
                aux = idealmul(nf, aux, idealpow0(nf, gcoeff(fact, gtos(i), 1), f, 0));
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 3, &i, &f, &aux);
            }
          }
          if (!gequalgs(aux, 1))
          {
            test = gen_0;
            alpha = basistoalg(nf, idealappr0(nf, idealinv(nf, aux), 0));
            alpha2 = gsqr(alpha);
            bb = gmul(bb, alpha2);
            nb = gmul(nb, gabs(gnorm(alpha2), prec));
            gel(mat, 3) = gmul(gel(mat, 3), alpha);
          }
        }
        if (!gequal0(test))
        {
          maxnbiter = shifti(gen_1, gtos(l));
          {
            long i;
            p17 = cgetg(gtos(l)+1, t_VEC);
            for (i = 1; gcmpsg(i, l) <= 0; ++i)
              gel(p17, i) = nfissquarep(nf, aa, gcoeff(fact, i, 1), gcoeff(fact, i, 2), prec);
          }
          sq = p17;
          l = stoi(glength(sq));
          if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          {
            pari_printf("sq = %Ps\n", sq);
            pari_printf("fact = %Ps\n", fact);
            pari_printf("l = %Ps\n", l);
          }
          if (gcmpgs(l, 1) > 0)
          {
            idbb = idealhnf0(nf, bb, NULL);
            rem = nfchinremain(nf, idbb, fact);
          }
          test = gen_1;
          nbiter = gen_1;
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN p19 = gen_0, p20 = gen_0, p21 = gen_0;	  /* vec */
            while (!gequal0(test) && (gcmp(nbiter, maxnbiter) <= 0))
            {
              if (gcmpgs(l, 1) > 0)
              {
                mask = nbiter;
                xx = gen_0;
                {
                  pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                  GEN i = gen_0;
                  for (i = gen_1; gcmp(i, l) <= 0; i = gaddgs(i, 1))
                  {
                    if (!gequal0(gmodgs(mask, 2)))
                      xx = gadd(xx, gmul(gel(rem, gtos(i)), gel(sq, gtos(i))));
                    else
                      xx = gsub(xx, gmul(gel(rem, gtos(i)), gel(sq, gtos(i))));
                    mask = gshift(mask, -1);
                    if (low_stack(st_lim, stack_lim(btop, 1)))
                      gerepileall(btop, 3, &i, &xx, &mask);
                  }
                }
              }
              else
              {
                test = gen_0;
                xx = gcopy(gel(sq, 1));
              }
              xx = mynfeltmod(nf, xx, bb);
              alpha = gsub(gsqr(xx), aa);
              if (gequal0(alpha))
              {
                p19 = cgetg(4, t_COL);
                gel(p19, 1) = gcopy(xx);
                gel(p19, 2) = gen_1;
                gel(p19, 3) = gen_0;
                resl = p19;
                goto label6;
              }
              t = gdiv(alpha, bb);
              if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
              {
                p20 = cgetg(3, t_VEC);
                gel(p20, 1) = gcopy(alpha);
                gel(p20, 2) = gcopy(bb);
                pari_printf("[alpha,bb] = %Ps\n", p20);
              }
              oldnb = nb;
              newnb = gabs(gnorm(t), prec);
              if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
              {
                p21 = cgetg(4, t_VEC);
                gel(p21, 1) = gcopy(oldnb);
                gel(p21, 2) = gcopy(newnb);
                gel(p21, 3) = gadd(gdiv(oldnb, newnb), real_0(prec));
                pari_printf("[oldnb,newnb,oldnb/newnb] = %Ps\n", p21);
              }
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                while (gcmp(nb, newnb) > 0)
                {
                  gel(mat, 3) = gmul(gel(mat, 3), t);
                  bb = t;
                  nb = newnb;
                  t = gadd(gmul(xx, gel(mat, 1)), gel(mat, 2));
                  gel(mat, 2) = gadd(gmul(aa, gel(mat, 1)), gmul(xx, gel(mat, 2)));
                  gel(mat, 1) = gcopy(t);
                  xx = mynfeltmod(nf, gneg(xx), bb);
                  alpha = gsub(gsqr(xx), aa);
                  t = gdiv(alpha, bb);
                  newnb = gabs(gnorm(t), prec);
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    gerepileall(btop, 7, &mat, &bb, &nb, &t, &xx, &alpha, &newnb);
                }
              }
              if (gequal(nb, oldnb))
                nbiter = gaddgs(nbiter, 1);
              else
                test = gen_0;
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 15, &mask, &xx, &test, &alpha, &p19, &resl, &t, &p20, &oldnb, &newnb, &p21, &mat, &bb, &nb, &nbiter);
            }
          }
          if (gequal(nb, oldnb))
          {
            if (!gequal0(flag3))
            {
              resl = gtrans(bnfqfsolve2(bnf, aa, bb, auto_s, prec));
              break;
            }
            pol = gadd(gmul(aa, gsqr(x)), bb);
            vecrat = nfratpoint(nf, pol, gshift(borne = gaddgs(borne, 1), 1), gen_1, prec);
            if (!gequalgs(vecrat, 0))
            {
              p18 = cgetg(4, t_COL);
              gel(p18, 1) = gcopy(gel(vecrat, 2));
              gel(p18, 2) = gcopy(gel(vecrat, 1));
              gel(p18, 3) = gcopy(gel(vecrat, 3));
              resl = p18;
              break;
            }
            bor = stoi(1000);
            yy = gen_1;
            testici = gen_1;
            {
              pari_sp btop = avma, st_lim = stack_lim(btop, 1);
              long i, l22;
              GEN p23 = gen_0;	  /* vec */
              for (i = 1; i <= 10000; ++i)
              {
                l22 = degree(member_pol(nf));
                {
                  long j;
                  p23 = cgetg(l22+1, t_COL);
                  for (j = 1; j <= l22; ++j)
                    gel(p23, j) = genrand(bor);
                }
                de = basistoalg(nf, p23);
                if (!gequal(idealadd(bnf, de, bb), matid(degree(member_pol(bnf)))))
                  continue;
                xxp = mynfeltmod(bnf, gmul(de, xx), bb);
                yyp = mynfeltmod(bnf, gmul(de, yy), bb);
                rap = gadd(gdiv(gnorm(gsub(gsqr(xxp), gmul(aa, gsqr(yyp)))), gsqr(nb)), real_0(prec));
                if (gcmpgs(gabs(rap, prec), 1) < 0)
                {
                  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                    pari_printf("********** \n \n MIRACLE %Ps \n \n ***\n", rap);
                  t = gdiv(gsub(gsqr(xxp), gmul(aa, gsqr(yyp))), bb);
                  gel(mat, 3) = gmul(gel(mat, 3), t);
                  bb = t;
                  nb = gabs(gnorm(bb), prec);
                  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                    pari_printf("newnb = %Ps\n", nb);
                  t = gadd(gmul(xxp, gel(mat, 1)), gmul(yyp, gel(mat, 2)));
                  gel(mat, 2) = gadd(gmul(gmul(aa, yyp), gel(mat, 1)), gmul(xxp, gel(mat, 2)));
                  gel(mat, 1) = gcopy(t);
                  xx = xxp;
                  yy = gneg(yyp);
                  testici = gen_0;
                }
                if (low_stack(st_lim, stack_lim(btop, 1)))
                  gerepileall(btop, 12, &p23, &de, &xxp, &yyp, &rap, &t, &mat, &bb, &nb, &xx, &yy, &testici);
              }
            }
            if (!gequal0(testici))
            {
              alpha = gen_0;
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                while (gequal0(alpha))
                {
                  xx = nfrandint(nf, gmulsg(4, borne));
                  yy = nfrandint(nf, gmulsg(4, borne));
                  borne = gaddgs(borne, 1);
                  alpha = gsub(gsqr(xx), gmul(aa, gsqr(yy)));
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    gerepileall(btop, 4, &xx, &yy, &borne, &alpha);
                }
              }
              bb = gmul(bb, alpha);
              nb = gmul(nb, gabs(gnorm(alpha), prec));
              t = gadd(gmul(xx, gel(mat, 1)), gmul(yy, gel(mat, 2)));
              gel(mat, 2) = gadd(gmul(xx, gel(mat, 2)), gmul(gmul(aa, yy), gel(mat, 1)));
              gel(mat, 1) = gcopy(t);
              gel(mat, 3) = gmul(gel(mat, 3), alpha);
            }
          }
        }
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 48, &resl, &p4, &mat, &aa, &bb, &na, &nb, &p5, &p6, &p7, &p8, &t, &sq, &p9, &p10, &p11, &p12, &pol, &borne, &vecrat, &p13, &alpha, &xx, &yy, &test, &sun, &fact, &p15, &suni, &f, &l, &aux, &alpha2, &maxnbiter, &p17, &idbb, &rem, &nbiter, &mask, &oldnb, &newnb, &p18, &bor, &testici, &de, &xxp, &yyp, &rap);
    }
    label6:;
  }
  resl = lift(gmul(mat, resl));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("resl1 = %Ps\n", resl);
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("content = %Ps\n", content(resl));
  resl = gdiv(resl, content(resl));
  resl = gmodulo(lift(resl), member_pol(nf));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("resl3 = %Ps\n", resl);
  fact = idealadd(nf, idealadd(nf, gel(resl, 1), gel(resl, 2)), gel(resl, 3));
  fact = bnfisprincipal0(bnf, fact, 3);
  resl = gmul(resl, ginv(basistoalg(nf, gel(fact, 2))));
  if (gcmpgs(DEBUGLEVEL_ell, 5) >= 0)
    pari_printf("resl4 = %Ps\n", resl);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("resl = %Ps\n", resl);
  verif = stoi(gequal0(gsub(gsub(gsqr(gel(resl, 1)), gmul(aleg, gsqr(gel(resl, 2)))), gmul(bleg, gsqr(gel(resl, 3))))));
  if ((gequal0(verif)) && (gcmpgs(DEBUGLEVEL_ell, 0) >= 0))
    pari_err(user, " bnfqfsolve : MAUVAIS POINT");
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("fin de bnfqfsolve\n");
  resl = gerepilecopy(ltop, resl);
  return resl;
}

GEN
bnfredquartique2(GEN bnf, GEN pol, GEN r, GEN a, GEN b)	  /* vec */
{
  pari_sp ltop = avma;
  GEN gcc = gen_0, princ = gen_0, rp = gen_0, pol2 = gen_0;
  GEN p1 = gen_0, p2 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  GEN p3 = gen_0;	  /* vec */
  /* MODI remove ap, den */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("entree dans bnfredquartique2\n");
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
  {
    p1 = cgetg(4, t_VEC);
    gel(p1, 1) = gcopy(r);
    gel(p1, 2) = gcopy(a);
    gel(p1, 3) = gcopy(b);
    pari_printf("%Ps\n", p1);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf(" reduction de la quartique %Ps\n", pol);
  if (gequal0(a))
    rp = gen_0;
  else
  {
    gcc = idealadd(bnf, b, a);
    if (gequal1(gcc))
    {
      rp = gdiv(basistoalg(bnf, gel(idealaddtoone0(member_nf(bnf), a, b), 1)), a);
      rp = mynfeltmod(bnf, gmul(r, rp), b);
    }
    else
    {
      princ = bnfisprincipal0(bnf, gcc, 3);
      if (gequal0(gel(princ, 1)))
        gcc = basistoalg(bnf, gel(princ, 2));
      else
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf(" quartique non reduite\n");
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf("fin de bnfredquartique2\n");
        p2 = cgetg(4, t_VEC);
        gel(p2, 1) = gcopy(pol);
        gel(p2, 2) = gen_0;
        gel(p2, 3) = gen_1;
        p2 = gerepilecopy(ltop, p2);
        return p2;
      }
      rp = gdiv(basistoalg(bnf, gel(idealaddtoone0(member_nf(bnf), gdiv(a, gcc), gdiv(b, gcc)), 1)), gdiv(a, gcc));
      rp = gdiv(mynfeltmod(bnf, gmul(r, rp), b), gcc);
      b = gdiv(b, gcc);
    }
  }
  pol2 = gdiv(gsubst(gdiv(pol, b), gvar(x), gadd(rp, gmul(b, x))), gpowgs(b, 3));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf(" quartique reduite = %Ps\n", pol2);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de bnfredquartique2\n");
  p3 = cgetg(4, t_VEC);
  gel(p3, 1) = gcopy(pol2);
  gel(p3, 2) = gcopy(rp);
  gel(p3, 3) = gcopy(b);
  p3 = gerepilecopy(ltop, p3);
  return p3;
}

GEN
bnfell2descent_gen(GEN bnf, GEN ell, GEN ext, GEN help, GEN bigflag, GEN flag3, GEN auto_s, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* vec */
  GEN y = pol_x(fetch_user_var("y")), nf = gen_0, unnf = gen_0, ellnf = gen_0, A = gen_0, B = gen_0, C = gen_0, S = gen_0, plist = gen_0, Lrnf = gen_0, SLprod = gen_0, oddclass = gen_0, SLlist = gen_0, LS2gen = gen_0, polrel = gen_0, alpha = gen_0, ttheta = gen_0, KS2gen = gen_0, LS2genunit = gen_0, normcoord = gen_0, LS2coordtilda = gen_0, LS2tilda = gen_0, aux = gen_0, listgen = gen_0, listpoints = gen_0, listpointstriv = gen_0, listpointsmwr = gen_0, list = gen_0, m1 = gen_0, m2 = gen_0, loc = gen_0, lastloc = gen_0, maskwhile = gen_0, iwhile = gen_0, zc = gen_0, iaux = gen_0, liftzc = gen_0, ispointtriv = gen_0, point = gen_0, c = gen_0, b = gen_0, a = gen_0, sol = gen_0, found = gen_0, alphac = gen_0, r = gen_0, denc = gen_0, dena = gen_0, cp = gen_0, alphacp = gen_0, beta = gen_0, mattr = gen_0, vec = gen_0, z1 = gen_0, ff = gen_0, cont = gen_0, d = gen_0, e = gen_0, polorig = gen_0, pol = gen_0, redq = gen_0, transl = gen_0, multip = gen_0, UVW = gen_0, pointxx = gen_0, point2 = gen_0, v = gen_0, rang = gen_0, normLS2gen = gen_0, listELS = gen_0, listnotELS = gen_0, listlistELS = gen_0, x = pol_x(fetch_user_var("x"));
  long l2;
  GEN p3 = gen_0;	  /* vec */
  long l4, l5;
  GEN p6 = gen_0;	  /* vec */
  long l7;
  long l8;	  /* lg */
  GEN p9 = gen_0;	  /* vec */
  long l10;	  /* lg */
  GEN p11 = gen_0, p12 = gen_0, p13 = gen_0;	  /* vec */
  long l14;
  GEN p15 = gen_0;	  /* vec */
  if (!help)
    help = cgetg(1, t_VEC);
  if (!bigflag)
    bigflag = gen_1;
  if (!flag3)
    flag3 = gen_1;
  if (!auto_s)
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(y);
    auto_s = p1;
  }
  /* MODI remove i,j,normLS2, add normLS2gen */
  /* MODI add listELS,listnotELS,listlistELS */
  
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("entree dans bnfell2descent_gen\n");
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*      construction de L(S,2)         \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  nf = gcopy(member_nf(bnf));
  unnf = gmodulsg(1, member_pol(nf));
  ellnf = gmul(ell, unnf);
  if (glength(ellnf) <= 5)
    ellnf = smallellinit(ellnf);
  A = gcopy(ell_get_a2(ellnf));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("A = %Ps\n", A);
  B = gcopy(ell_get_a4(ellnf));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("B = %Ps\n", B);
  C = gcopy(ell_get_a6(ellnf));
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("C = %Ps\n", C);
  S = gmulsg(6, lift(member_disc(ellnf)));
  plist = gcopy(gel(idealfactor(nf, S), 1));
  Lrnf = gcopy(gel(ext, 3));
  SLprod = gsubst(lift(deriv(gel(ext, 1),-1)), gvar(y), lift(gel(gel(ext, 2), 2)));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("%Ps\n", gel(ext, 2));
  oddclass = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(oddclass))
    {
      /* Constructoin de S: */
      SLlist = gtrans(gel(idealfactor(Lrnf, SLprod), 1));
      /* Construction des S-unites */
      LS2gen = bnfsunit(Lrnf, SLlist, prec);
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        pari_printf("LS2gen = %Ps\n", LS2gen);
      /* on ajoute la partie paire du groupe de classes. */
      oddclass = gmodgs(gel(gel(LS2gen, 5), 1), 2);
      if (gequal0(oddclass))
      {
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf("2-class group %Ps\n", gcoeff(gel(gel(gel(LS2gen, 5), 3), 1), 1, 1));
        S = gmul(S, gcoeff(gel(gel(gel(LS2gen, 5), 3), 1), 1, 1));
        SLprod = idealmul(Lrnf, SLprod, gel(gel(gel(LS2gen, 5), 3), 1));
      }
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 5, &SLlist, &LS2gen, &oddclass, &S, &SLprod);
    }
  }
  polrel = gcopy(gel(ext, 1));
  alpha = gmodulo(gmodulo(y, member_pol(nf)), polrel);
  /* alpha est l'element primitif de K */
  ttheta = gmodulo(x, polrel);
  /* ttheta est la racine de P(x)  */
  
  KS2gen = bnfsunit(bnf, gtrans(gel(idealfactor(nf, S), 1)), prec);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("#KS2gen = %ld\n", glength(gel(KS2gen, 1)));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("KS2gen = %Ps\n", gel(KS2gen, 1));
  LS2genunit = lift(getfutu(Lrnf));
  l2 = glength(gel(LS2gen, 1));
  {
    long i;
    p3 = cgetg(l2+1, t_VEC);
    for (i = 1; i <= l2; ++i)
      gel(p3, i) = lift(basistoalg(Lrnf, gel(gel(LS2gen, 1), i)));
  }
  /* A CHANGER : LS2genunit = concat(LS2genunit,lift(matbasistoalg(Lrnf,LS2gen[1]))); */
  LS2genunit = concat(LS2genunit, p3);
  LS2genunit = gsubst(LS2genunit, gvar(x), ttheta);
  LS2genunit = gmul(LS2genunit, gmodulsg(1, polrel));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("#LS2genunit = %ld\n", glength(LS2genunit));
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("LS2genunit = %Ps\n", LS2genunit);
  /* dans LS2gen, on ne garde que ceux dont la norme est un carre. */
  
  normLS2gen = gnorm(LS2genunit);
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("normLS2gen = %Ps\n", normLS2gen);
  l4 = glength(normLS2gen);
  l5 = (glength(gel(KS2gen, 1)) + glength(gel(gel(bnf, 8), 5))) + 1;
  {
    long i, j;
    p6 = cgetg(l4+1, t_MAT);
    for (j = 1; j <= l4; ++j)
    {
      gel(p6, j) = cgetg(l5+1, t_COL);
      for (i = 1; i <= l5; ++i)
        gcoeff(p6, i, j) = gen_0;
    }
  }
  /* matrice de l'application norme */
  
  normcoord = p6;
  l7 = glength(normLS2gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l7; ++i)
    {
      gel(normcoord, i) = bnfissunit(bnf, KS2gen, gel(normLS2gen, i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        normcoord = gerepilecopy(btop, normcoord);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("normcoord = %Ps\n", normcoord);
  /* construction du noyau de la norme */
  
  LS2coordtilda = lift(matker0(gmul(normcoord, gmodulss(1, 2)), 0));
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("LS2coordtilda = %Ps\n", LS2coordtilda);
  l8 = lg(rowcopy(LS2coordtilda, 1));
  {
    long i;
    p9 = cgetg(l8, t_VEC);
    for (i = 1; i < l8; ++i)
      gel(p9, i) = gen_0;
  }
  LS2tilda = p9;
  l10 = lg(rowcopy(LS2coordtilda, 1));
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i, l16;
    for (i = 1; i < l10; ++i)
    {
      aux = gen_1;
      l16 = glength(gel(LS2coordtilda, i));
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long j;
        for (j = 1; j <= l16; ++j)
        {
          if (gsigne(gcoeff(LS2coordtilda, j, i)))
            aux = gmul(aux, gel(LS2genunit, j));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            aux = gerepilecopy(btop, aux);
        }
      }
      gel(LS2tilda, i) = gcopy(aux);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 2, &aux, &LS2tilda);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("LS2tilda = %Ps\n", LS2tilda);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("norm(LS2tilda) = %Ps\n", gnorm(LS2tilda));
  /* Fin de la construction de L(S,2) */
  
  listgen = gcopy(LS2tilda);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("LS2gen = %Ps\n", listgen);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("#LS2gen = %ld\n", glength(listgen));
  listpoints = cgetg(1, t_VEC);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
  {
    p11 = cgetg(4, t_VEC);
    gel(p11, 1) = gcopy(A);
    gel(p11, 2) = gcopy(B);
    gel(p11, 3) = gcopy(C);
    pari_printf("(A,B,C) = %Ps\n", p11);
  }
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*   Recherche de points triviaux   \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf(" Recherche de points triviaux sur la courbe \n");
  listpointstriv = nfratpoint(nf, gadd(gadd(gadd(gpowgs(x, 3), gmul(A, gsqr(x))), gmul(B, x)), C), LIMTRIV, gen_0, prec);
  listpointstriv = concat(help, listpointstriv);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("points triviaux sur la courbe = %Ps\n", listpointstriv);
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  /*          parcours de L(S,2)         \\ */
  /* \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ */
  
  listpointsmwr = cgetg(1, t_VEC);
  p12 = cgetg(4, t_VEC);
  gel(p12, 1) = stoi(6);
  gel(p12, 2) = gcopy(member_disc(ellnf));
  gel(p12, 3) = gen_0;
  list = p12;
  m1 = gen_0;
  m2 = gen_0;
  lastloc = gen_m1;
  maskwhile = shifti(gen_1, glength(listgen));
  p13 = cgetg(2, t_VEC);
  gel(p13, 1) = gen_0;
  listELS = p13;
  listnotELS = cgetg(1, t_VEC);
  iwhile = gen_1;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l17, l18, l19;
    GEN p20 = gen_0;	  /* vec */
    long l21;
    GEN p22 = gen_0;
    long l23;
    GEN p24 = gen_0;	  /* vec */
    long l25;
    GEN p26 = gen_0, p27 = gen_0, p28 = gen_0, p29 = gen_0, p30 = gen_0, p31 = gen_0, p32 = gen_0, p33 = gen_0, p34 = gen_0, p35 = gen_0, p36 = gen_0;	  /* vec */
    while (gcmp(iwhile, maskwhile) < 0)
    {
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      {
        pari_printf("iwhile = %Ps\n", iwhile);
        pari_printf("listgen = %Ps\n", listgen);
      }
      /* utilise la structure de groupe pour detecter une eventuelle solubilite locale. */
      if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
      {
        pari_printf("listELS = %Ps\n", listELS);
        pari_printf("listnotELS = %Ps\n", listnotELS);
      }
      sol = gen_1;
      loc = gen_0;
      l17 = glength(listELS);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i, l37;
        for (i = 1; i <= l17; ++i)
        {
          l37 = glength(listnotELS);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long j;
            GEN p38 = gen_0;	  /* vec */
            for (j = 1; j <= l37; ++j)
            {
              if (gequal(gbitxor(gel(listELS, i), gel(listnotELS, j)), iwhile))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf(" Non ELS d'apres la structure de groupe\n");
                p38 = cgetg(2, t_VEC);
                gel(p38, 1) = gcopy(iwhile);
                listnotELS = concat(listnotELS, p38);
                sol = gen_0;
                goto label7;
              }
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 3, &p38, &listnotELS, &sol);
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &listnotELS, &sol);
        }
        label7:;
      }
      if (gequal0(sol))
      {
        iwhile = gaddgs(iwhile, 1);
        continue;
      }
      l18 = glength(listELS);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i, l39, l40;
        for (i = 1; i <= l18; ++i)
        {
          l39 = i + 1;
          l40 = glength(listELS);
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            GEN j = gen_0;
            GEN p41 = gen_0;	  /* vec */
            for (j = stoi(l39); gcmpgs(j, l40) <= 0; j = gaddgs(j, 1))
            {
              if (gequal(gbitxor(gel(listELS, i), gel(listELS, gtos(j))), iwhile))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf(" ELS d'aptres la structure de \n");
                p41 = cgetg(2, t_VEC);
                gel(p41, 1) = gcopy(iwhile);
                listELS = concat(listELS, p41);
                loc = gen_2;
                goto label8;
              }
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 4, &j, &p41, &listELS, &loc);
            }
          }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 2, &listELS, &loc);
        }
        label8:;
      }
      l19 = glength(listgen);
      {
        long i;
        p20 = cgetg(l19+1, t_VEC);
        for (i = 1; i <= l19; ++i)
          gel(p20, i) = gbittest(iwhile, i - 1);
      }
      iaux = gtrans(p20);
      iaux = gmodgs(gmul(LS2coordtilda, iaux), 2);
      l21 = glength(LS2genunit);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        p22 = gen_1;
        for (i = 1; i <= l21; ++i)
        {
          p22 = gmul(p22, gpow(gel(LS2genunit, i), gel(iaux, i), prec));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            p22 = gerepilecopy(btop, p22);
        }
      }
      zc = gmul(unnf, p22);
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("zc = %Ps\n", zc);
      liftzc = lift(zc);
      /* Est-ce un point trivial ? */
      ispointtriv = gen_0;
      l23 = glength(listpointstriv);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        GEN p42 = gen_0, p43 = gen_0;	  /* vec */
        for (i = 1; i <= l23; ++i)
        {
          point = gcopy(gel(listpointstriv, i));
          if ((glength(point) == 2) || !gequalgs(gel(point, 3), 0))
            if (nfissquare(member_nf(Lrnf), gsubst(gmul(gsub(lift(gel(point, 1)), x), lift(liftzc)), gvar(y), lift(gel(gel(ext, 2), 2))), prec))
            {
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf(" vient du point trivial %Ps\n", point);
              p42 = cgetg(2, t_VEC);
              gel(p42, 1) = gcopy(point);
              listpointsmwr = concat(listpointsmwr, p42);
              m1 = gaddgs(m1, 1);
              p43 = cgetg(2, t_VEC);
              gel(p43, 1) = gcopy(iwhile);
              listELS = concat(listELS, p43);
              if (gcmp(degre(iwhile), lastloc) > 0)
                m2 = gaddgs(m2, 1);
              sol = found = ispointtriv = gen_1;
              break;
            }
          if (low_stack(st_lim, stack_lim(btop, 1)))
            gerepileall(btop, 10, &point, &p42, &listpointsmwr, &m1, &p43, &listELS, &m2, &ispointtriv, &found, &sol);
        }
      }
      /* Ce n'est pas un point trivial */
      if (gequal0(ispointtriv))
      {
        c = polcoeff0(liftzc, 2, -1);
        b = gneg(polcoeff0(liftzc, 1, -1));
        a = polcoeff0(liftzc, 0, -1);
        sol = gen_0;
        found = gen_0;
        /* \\\\\\\\\\\\\ */
        /* On cherche a ecrire zc sous la forme a-b*theta */
        /* \\\\\\\\\\\\\ */
        if (gequal0(c))
          sol = gen_1;
        else
        {
          alphac = gadd(gmul(gsub(gadd(gmul(A, b), gmul(B, c)), a), c), gsqr(b));
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf("alphac = %Ps\n", alphac);
          r = gcopy(gel(nfsqrt(nf, gnorm(zc), prec), 1));
          if (gequal0(alphac))
          {
            /* cas particulier */
            if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
              pari_printf(" on continue avec 1/zc\n");
            sol = gen_1;
            zc = gmul(gnorm(zc), ginv(zc));
            if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              pari_printf(" zc = %Ps\n", zc);
          }
          else
          {
            /* Il faut resoudre une forme quadratique */
            /* Existence (locale = globale) d'une solution : */
            denc = deno(lift(c));
            if (!gequalgs(denc, 1))
              cp = gmul(c, gsqr(denc));
            else
              cp = c;
            dena = deno(lift(alphac));
            if (!gequalgs(dena, 1))
              alphacp = gmul(alphac, gsqr(dena));
            else
              alphacp = alphac;
            if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              pari_printf(" symbole de Hilbert (%Ps,%Ps) = ", alphacp, cp);
            sol = stoi(!gequal0(loc) || (mynfhilbert(nf, alphacp, cp, prec) + 1));
            if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              pari_printf("%Ps\n", gsubgs(sol, 1));
            if (!gequal0(sol))
            {
              beta = gadd(gsub(gmul(A, gadd(gadd(gmul(gmul(A, b), c), gmul(B, gsqr(c))), gsqr(b))), gmul(C, gsqr(c))), gmul(a, b));
              mattr = matid(3);
              gcoeff(mattr, 1, 1) = gcopy(c);
              gcoeff(mattr, 2, 2) = gcopy(alphac);
              gcoeff(mattr, 3, 3) = gcopy(r);
              gcoeff(mattr, 2, 3) = gneg(beta);
              gcoeff(mattr, 1, 2) = gneg(gadd(b, gmul(A, c)));
              gcoeff(mattr, 1, 3) = gadd(gsub(a, gmul(B, c)), gmul(A, gadd(gmul(A, c), b)));
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf(" sol de Legendre = ");
              vec = bnfqfsolve(bnf, alphacp, cp, flag3, auto_s, prec);
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("%Ps\n", lift(vec));
              aux = gmul(gel(vec, 2), dena);
              gel(vec, 2) = gcopy(gel(vec, 1));
              gel(vec, 1) = gcopy(aux);
              gel(vec, 3) = gmul(gel(vec, 3), denc);
              vec = gmul(ginv(mattr), vec);
              vec = gdiv(vec, content(lift(vec)));
              z1 = gadd(gmul(gadd(gmul(gel(vec, 3), ttheta), gel(vec, 2)), ttheta), gel(vec, 1));
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf(" z1 = %Ps\n", z1);
              zc = gmul(zc, gsqr(z1));
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf(" zc*z1^2 = %Ps\n", zc);
            }
          }
        }
      }
      if (gequal0(sol))
      {
        p24 = cgetg(2, t_VEC);
        gel(p24, 1) = gcopy(iwhile);
        listnotELS = concat(listnotELS, p24);
        iwhile = gaddgs(iwhile, 1);
        continue;
      }
      /* \\\\\\\\\\ */
      /* Maintenant zc est de la forme a-b*theta */
      /* \\\\\\\\\\ */
      if (gequal0(ispointtriv))
      {
        liftzc = lift(zc);
        if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
          pari_printf(" zc = %Ps\n", liftzc);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" N(zc) = %Ps\n", gnorm(zc));
        if (degree(liftzc) >= 2)
          pari_err(user, " bnfell2descent_gen : c <> 0");
        b = gneg(polcoeff0(liftzc, 1, -1));
        a = polcoeff0(liftzc, 0, -1);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" on factorise (a,b) = %Ps\n", idealadd(nf, a, b));
        ff = idealfactor(nf, idealadd(nf, a, b));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" ff = %Ps\n", ff);
        cont = gen_1;
        l25 = glength(gel(ff, 1));
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long i;
          for (i = 1; i <= l25; ++i)
          {
            cont = idealmul(nf, cont, idealpow0(nf, gcoeff(ff, i, 1), gdiventgs(gcoeff(ff, i, 2), 2), 0));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              cont = gerepilecopy(btop, cont);
          }
        }
        cont = idealinv(nf, cont);
        cont = gsqr(basistoalg(nf, gel(bnfisprincipal0(bnf, cont, 3), 2)));
        a = gmul(a, cont);
        b = gmul(b, cont);
        zc = gmul(zc, cont);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
        {
          p26 = cgetg(3, t_VEC);
          gel(p26, 1) = gcopy(a);
          gel(p26, 2) = gcopy(b);
          pari_printf(" [a,b] = %Ps\n", p26);
        }
        if (nfissquare(nf, b, prec))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf(" b est un carre\n");
          p27 = cgetg(3, t_VEC);
          gel(p27, 1) = gdiv(a, b);
          gel(p27, 2) = gcopy(gel(nfsqrt(nf, gadd(gadd(gadd(gpowgs(gdiv(a, b), 3), gmul(A, gsqr(gdiv(a, b)))), gmul(B, gdiv(a, b))), C), prec), 1));
          point = p27;
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf("point trouve = %Ps\n", point);
          p28 = cgetg(2, t_VEC);
          gel(p28, 1) = gcopy(point);
          listpointsmwr = concat(listpointsmwr, p28);
          m1 = gaddgs(m1, 1);
          if (gcmp(degre(iwhile), lastloc) > 0)
            m2 = gaddgs(m2, 1);
          found = ispointtriv = gen_1;
        }
      }
      /* \\\\\\\\\\\ */
      /* Construction de la quartique  */
      /* \\\\\\\\\\\ */
      if (gequal0(ispointtriv))
      {
        r = gcopy(gel(nfsqrt(nf, gnorm(zc), prec), 1));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" r = %Ps\n", r);
        c = gmulsg(-2, gadd(gmul(A, b), gmulsg(3, a)));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" c = %Ps\n", c);
        d = gmulsg(8, r);
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" d = %Ps\n", d);
        e = gsub(gsub(gsub(gmul(gsqr(A), gsqr(b)), gmul(gmul(gmulsg(2, A), a), b)), gmul(gmulsg(4, B), gsqr(b))), gmulsg(3, gsqr(a)));
        if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
          pari_printf(" e = %Ps\n", e);
        polorig = gmul(gmul(b, gadd(gadd(gadd(gpowgs(x, 4), gmul(c, gsqr(x))), gmul(d, x)), e)), unnf);
        if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
          pari_printf(" quartique : (%Ps)*Y^2 = %Ps\n", lift(b), lift(gdiv(polorig, b)));
        gel(list, 3) = gcopy(b);
        pol = polorig;
        if (!gequal0(bigflag))
        {
          redq = bnfredquartique2(bnf, pol, r, a, b);
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf(" reduite: Y^2 = %Ps\n", lift(gel(redq, 1)));
          pol = gcopy(gel(redq, 1));
          transl = gcopy(gel(redq, 2));
          multip = gcopy(gel(redq, 3));
        }
        point = nfratpoint(nf, pol, LIM1, gen_1, prec);
        if (!gequal(point, cgetg(1, t_VEC)))
        {
          if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
            pari_printf("point = %Ps\n", point);
          m1 = gaddgs(m1, 1);
          if (!gequal0(bigflag))
          {
            gel(point, 1) = gadd(gmul(gel(point, 1), multip), transl);
            gel(point, 2) = gcopy(gel(nfsqrt(nf, gsubst(polorig, gvar(x), gdiv(gel(point, 1), gel(point, 3))), prec), 1));
          }
          mattr = matid(3);
          gcoeff(mattr, 1, 1) = gmulsg(-2, gsqr(b));
          gcoeff(mattr, 1, 2) = gmul(gadd(gmul(A, b), a), b);
          gcoeff(mattr, 1, 3) = gadd(gsqr(a), gmul(gsub(gmulsg(2, B), gsqr(A)), gsqr(b)));
          gcoeff(mattr, 2, 2) = gneg(b);
          gcoeff(mattr, 2, 3) = gadd(a, gmul(A, b));
          gcoeff(mattr, 3, 3) = gcopy(r);
          p29 = cgetg(4, t_COL);
          gel(p29, 1) = gsqr(gel(point, 1));
          gel(p29, 2) = gsqr(gel(point, 3));
          gel(p29, 3) = gmul(gel(point, 1), gel(point, 3));
          UVW = p29;
          vec = gmul(ginv(mattr), UVW);
          z1 = gadd(gmul(gadd(gmul(gel(vec, 3), ttheta), gel(vec, 2)), ttheta), gel(vec, 1));
          zc = gmul(zc, gsqr(z1));
          zc = gdiv(zc, gneg(polcoeff0(lift(zc), 1, -1)));
          if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
            pari_printf("zc*z1^2 = %Ps\n", zc);
          pointxx = polcoeff0(lift(zc), 0, -1);
          p30 = cgetg(3, t_VEC);
          gel(p30, 1) = gcopy(pointxx);
          gel(p30, 2) = gcopy(gel(nfsqrt(nf, gsubst(gadd(gadd(gadd(gpowgs(x, 3), gmul(A, gsqr(x))), gmul(B, x)), C), gvar(x), pointxx), prec), 1));
          point2 = p30;
          if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
            pari_printf(" point trouve = %Ps\n", point2);
          p31 = cgetg(2, t_VEC);
          gel(p31, 1) = gcopy(point2);
          listpointsmwr = concat(listpointsmwr, p31);
          if (gcmp(degre(iwhile), lastloc) > 0)
            m2 = gaddgs(m2, 1);
          found = gen_1;
          lastloc = gen_m1;
        }
        else
        {
          if ((!gequal0(loc) || ((gequal0(bigflag)) && nflocallysoluble(nf, pol, r, a, b, prec))) || (!gequal0(bigflag) && nflocallysoluble(nf, pol, gen_0, gen_1, gen_1, prec)))
          {
            if (gequal0(loc))
            {
              p32 = cgetg(2, t_VEC);
              gel(p32, 1) = gcopy(iwhile);
              listlistELS = concat(listELS, p32);
            }
            if (gcmp(degre(iwhile), lastloc) > 0)
            {
              m2 = gaddgs(m2, 1);
              lastloc = degre(iwhile);
            }
            point = nfratpoint(nf, pol, LIM3, gen_1, prec);
            if (!gequal(point, cgetg(1, t_VEC)))
            {
              m1 = gaddgs(m1, 1);
              if (!gequal0(bigflag))
              {
                gel(point, 1) = gadd(gmul(gel(point, 1), multip), transl);
                gel(point, 2) = gcopy(gel(nfsqrt(nf, gsubst(polorig, gvar(x), gdiv(gel(point, 1), gel(point, 3))), prec), 1));
              }
              mattr = matid(3);
              gcoeff(mattr, 1, 1) = gmulsg(-2, gsqr(b));
              gcoeff(mattr, 1, 2) = gmul(gadd(gmul(A, b), a), b);
              gcoeff(mattr, 1, 3) = gadd(gsqr(a), gmul(gsub(gmulsg(2, B), gsqr(A)), gsqr(b)));
              gcoeff(mattr, 2, 2) = gneg(b);
              gcoeff(mattr, 2, 3) = gadd(a, gmul(A, b));
              gcoeff(mattr, 3, 3) = gcopy(r);
              p33 = cgetg(4, t_COL);
              gel(p33, 1) = gsqr(gel(point, 1));
              gel(p33, 2) = gsqr(gel(point, 3));
              gel(p33, 3) = gmul(gel(point, 1), gel(point, 3));
              UVW = p33;
              vec = gmul(ginv(mattr), UVW);
              z1 = gadd(gmul(gadd(gmul(gel(vec, 3), ttheta), gel(vec, 2)), ttheta), gel(vec, 1));
              zc = gmul(zc, gsqr(z1));
              zc = gdiv(zc, gneg(polcoeff0(lift(zc), 1, -1)));
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf(" zc*z1^2 = %Ps\n", zc);
              pointxx = polcoeff0(lift(zc), 0, -1);
              p34 = cgetg(3, t_VEC);
              gel(p34, 1) = gcopy(pointxx);
              gel(p34, 2) = gcopy(gel(nfsqrt(nf, gsubst(gadd(gadd(gadd(gpowgs(x, 3), gmul(A, gsqr(x))), gmul(B, x)), C), gvar(x), pointxx), prec), 1));
              point2 = p34;
              if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
                pari_printf(" point trouve = %Ps\n", point2);
              p35 = cgetg(2, t_VEC);
              gel(p35, 1) = gcopy(point2);
              listpointsmwr = concat(listpointsmwr, p35);
              found = gen_1;
              lastloc = gen_m1;
            }
          }
          else
          {
            p36 = cgetg(2, t_VEC);
            gel(p36, 1) = gcopy(iwhile);
            listnotELS = concat(listnotELS, p36);
          }
        }
      }
      if (!gequal0(found))
      {
        found = gen_0;
        lastloc = gen_m1;
        v = degre(iwhile);
        iwhile = shifti(gen_1, gtos(v));
        maskwhile = gshift(maskwhile, -1);
        LS2coordtilda = extract0(LS2coordtilda, gsubgs(gsub(shifti(gen_1, glength(listgen)), iwhile), 1), NULL);
        listgen = extract0(listgen, gsubgs(gsub(shifti(gen_1, glength(listgen)), iwhile), 1), NULL);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (gcmp(gel(listELS, glength(listELS)), iwhile) >= 0)
          {
            listELS = extract0(listELS, subis(shifti(gen_1, glength(listELS) - 1), 1), NULL);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              listELS = gerepilecopy(btop, listELS);
          }
        }
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          while (glength(listnotELS) && (gcmp(gel(listnotELS, glength(listnotELS)), iwhile) >= 0))
          {
            listnotELS = extract0(listnotELS, subis(shifti(gen_1, glength(listnotELS) - 1), 1), NULL);
            if (low_stack(st_lim, stack_lim(btop, 1)))
              listnotELS = gerepilecopy(btop, listnotELS);
          }
        }
      }
      else
        iwhile = gaddgs(iwhile, 1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 61, &sol, &loc, &listnotELS, &iwhile, &listELS, &p20, &iaux, &p22, &zc, &liftzc, &ispointtriv, &point, &listpointsmwr, &m1, &m2, &found, &c, &b, &a, &alphac, &r, &denc, &cp, &dena, &alphacp, &beta, &mattr, &vec, &aux, &z1, &p24, &ff, &cont, &p26, &p27, &p28, &d, &e, &polorig, &list, &pol, &redq, &transl, &multip, &p29, &UVW, &pointxx, &p30, &point2, &p31, &lastloc, &p32, &listlistELS, &p33, &p34, &p35, &p36, &v, &maskwhile, &LS2coordtilda, &listgen);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("m1 = %Ps\n", m1);
    pari_printf("m2 = %Ps\n", m2);
  }
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("#S(E/K)[2]    = %Ps\n", shifti(gen_1, gtos(m2)));
  if (gequal(m1, m2))
  {
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf("#E(K)/2E(K)   = %Ps\n", shifti(gen_1, gtos(m1)));
      pari_printf("#III(E/K)[2]  = 1\n");
      pari_printf("rang(E/K)     = %Ps\n", m1);
    }
    rang = m1;
  }
  else
  {
    if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    {
      pari_printf("#E(K)/2E(K)  >= %Ps\n", shifti(gen_1, gtos(m1)));
      pari_printf("#III(E/K)[2] <= %Ps\n", shifti(gen_1, gtos(gsub(m2, m1))));
      pari_printf("rang(E/K)    >= %Ps\n", m1);
    }
    rang = m1;
    if (!gequal0(gmodgs(gsub(m2, m1), 2)))
    {
      if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
      {
        pari_printf(" III devrait etre un carre, donc \n");
        if (gcmpgs(gsub(m2, m1), 1) > 0)
        {
          pari_printf("#E(K)/2E(K)  >= %Ps\n", shifti(gen_1, gtos(gaddgs(m1, 1))));
          pari_printf("#III(E/K)[2] <= %Ps\n", shifti(gen_1, gtos(gsubgs(gsub(m2, m1), 1))));
          pari_printf("rang(E/K)    >= %Ps\n", gaddgs(m1, 1));
        }
        else
        {
          pari_printf("#E(K)/2E(K)  = %Ps\n", shifti(gen_1, gtos(gaddgs(m1, 1))));
          pari_printf("#III(E/K)[2] = 1\n");
          pari_printf("rang(E/K)    = %Ps\n", gaddgs(m1, 1));
        }
      }
      rang = gaddgs(m1, 1);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("listpointsmwr = %Ps\n", listpointsmwr);
  l14 = glength(listpointsmwr);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l14; ++i)
    {
      if (glength(gel(listpointsmwr, i)) == 3)
        gel(listpointsmwr, i) = extract0(gel(listpointsmwr, i), stoi(3), NULL);
      if (gequal0(ellisoncurve(ellnf, gel(listpointsmwr, i))))
        pari_err(user, "bnfell2descent : MAUVAIS POINT ");
      if (low_stack(st_lim, stack_lim(btop, 1)))
        listpointsmwr = gerepilecopy(btop, listpointsmwr);
    }
  }
  if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
    pari_printf("fin de bnfell2descent_gen\n");
  p15 = cgetg(4, t_VEC);
  gel(p15, 1) = gcopy(rang);
  gel(p15, 2) = gcopy(m2);
  gel(p15, 3) = gcopy(listpointsmwr);
  p15 = gerepilecopy(ltop, p15);
  return p15;
}

GEN
bnfellrank(GEN bnf, GEN ell, GEN help, GEN bigflag, GEN flag3, long prec)
{
  pari_sp ltop = avma;
  GEN urst = gen_0, urst1 = gen_0, den = gen_0, factden = gen_0, eqtheta = gen_0, rnfeq = gen_0, bbnf = gen_0, ext = gen_0, rang = gen_0, f = gen_0;
  GEN p1 = gen_0, p2 = gen_0, p3 = gen_0, p4 = gen_0;	  /* vec */
  GEN y = pol_x(fetch_user_var("y")), x = pol_x(fetch_user_var("x"));
  GEN p5 = gen_0, p6 = gen_0;	  /* vec */
  if (!help)
    help = cgetg(1, t_VEC);
  if (!bigflag)
    bigflag = gen_1;
  if (!flag3)
    flag3 = gen_1;
  /* MODI add f */
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("entree dans bnfellrank\n");
  if (glength(ell) <= 5)
    ell = smallellinit(ell);
  p1 = cgetg(5, t_VEC);
  gel(p1, 1) = gen_1;
  gel(p1, 2) = gen_0;
  gel(p1, 3) = gen_0;
  gel(p1, 4) = gen_0;
  /* removes the coefficients a1 and a3 */
  urst = p1;
  if (!gequalgs(ell_get_a1(ell), 0) || !gequalgs(ell_get_a3(ell), 0))
  {
    p2 = cgetg(5, t_VEC);
    gel(p2, 1) = gen_1;
    gel(p2, 2) = gen_0;
    gel(p2, 3) = gdivgs(gneg(ell_get_a1(ell)), 2);
    gel(p2, 4) = gdivgs(gneg(ell_get_a3(ell)), 2);
    urst1 = p2;
    ell = ellchangecurve(ell, urst1);
    urst = ellcomposeurst(urst, urst1);
  }
  /* removes denominators */
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long l7;
    GEN p8 = gen_0;	  /* vec */
    while (gcmpgs(gcoeff(den = idealinv(bnf, idealadd(bnf, idealadd(bnf, gen_1, ell_get_a2(ell)), idealadd(bnf, ell_get_a4(ell), ell_get_a6(ell)))), 1, 1), 1) > 0)
    {
      factden = gcopy(gel(idealfactor(bnf, den), 1));
      den = gen_1;
      l7 = glength(factden);
      {
        pari_sp btop = avma, st_lim = stack_lim(btop, 1);
        long i;
        for (i = 1; i <= l7; ++i)
        {
          den = idealmul(bnf, den, gel(factden, i));
          if (low_stack(st_lim, stack_lim(btop, 1)))
            den = gerepilecopy(btop, den);
        }
      }
      den = gcopy(gcoeff(den, 1, 1));
      p8 = cgetg(5, t_VEC);
      gel(p8, 1) = ginv(den);
      gel(p8, 2) = gen_0;
      gel(p8, 3) = gen_0;
      gel(p8, 4) = gen_0;
      urst1 = p8;
      ell = ellchangecurve(ell, urst1);
      urst = ellcomposeurst(urst, urst1);
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 6, &den, &factden, &p8, &urst1, &ell, &urst);
    }
  }
  help = ellchangepoint(help, urst);
  /* choix de l'algorithme suivant la 2-torsion */
  ell = gmul(/* choix de l'algorithme suivant la 2-torsion */
  ell, gmodulsg(1, member_pol(bnf)));
  p3 = cgetg(5, t_VEC);
  gel(p3, 1) = gen_1;
  gel(p3, 2) = gcopy(ell_get_a2(ell));
  gel(p3, 3) = gcopy(ell_get_a4(ell));
  gel(p3, 4) = gcopy(ell_get_a6(ell));
  eqtheta = gtopoly(p3, -1);
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("courbe elliptique : Y^2 = %Ps\n", eqtheta);
  f = nfpolratroots(bnf, eqtheta);
  if (glength(f) == 0)
  {
    /* cas 1: 2-torsion triviale */
    rnfeq = rnfequation0(bnf, eqtheta, 1);
    p4 = cgetg(5, t_VEC);
    gel(p4, 1) = gen_1;
    gel(p4, 2) = gmul(gneg(gel(rnfeq, 3)), gmodulo(y, member_pol(bnf)));
    gel(p4, 3) = gen_0;
    gel(p4, 4) = gen_0;
    urst1 = p4;
    if (!gequalgs(gel(rnfeq, 3), 0))
    {
      ell = ellchangecurve(ell, urst1);
      urst = ellcomposeurst(urst, urst1);
      eqtheta = gsubst(eqtheta, gvar(x), gsub(x, gmul(gel(rnfeq, 3), gmodulo(y, member_pol(bnf)))));
      rnfeq = rnfequation0(bnf, eqtheta, 1);
      if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
        pari_printf("translation : on travaille avec Y^2 = %Ps\n", eqtheta);
    }
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("bbnfinit ");
    bbnf = Buchall(gel(rnfeq, 1), nf_FORCE, prec);
    if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
      pari_printf("done\n");
    p5 = cgetg(4, t_VEC);
    gel(p5, 1) = gcopy(eqtheta);
    gel(p5, 2) = gcopy(rnfeq);
    gel(p5, 3) = gcopy(bbnf);
    ext = p5;
    rang = bnfell2descent_gen(bnf, ell, ext, help, bigflag, flag3, NULL, prec);
  }
  else
  {
    if (glength(f) == 1)
    {
      /* cas 2: 2-torsion = Z/2Z */
      if (!gequalgs(gel(f, 1), 0))
      {
        p6 = cgetg(5, t_VEC);
        gel(p6, 1) = gen_1;
        gel(p6, 2) = gcopy(gel(f, 1));
        gel(p6, 3) = gen_0;
        gel(p6, 4) = gen_0;
        urst1 = p6;
        ell = ellchangecurve(ell, urst1);
        urst = ellcomposeurst(urst, urst1);
      }
      rang = bnfell2descent_viaisog(bnf, ell, prec);
    }
    else
      /* cas 3: 2-torsion = Z/2Z*Z/2Z */
      rang = bnfell2descent_complete(bnf, gel(f, 1), gel(f, 2), gel(f, 3), flag3, NULL, prec);
  }
  gel(rang, 3) = ellchangepointinverse(gel(rang, 3), urst);
  if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
    pari_printf("fin de bnfellrank\n");
  rang = gerepilecopy(ltop, rang);
  return rang;
}

GEN
bnfell2descent_complete(GEN bnf, GEN e1, GEN e2, GEN e3, GEN flag3, GEN auto_s, long prec)	  /* vec */
{
  pari_sp ltop = avma;
  GEN p1 = gen_0;	  /* vec */
  GEN y = pol_x(fetch_user_var("y")), KS2prod = gen_0, oddclass = gen_0, KS2gen = gen_0, vect = gen_0, selmer = gen_0, rang = gen_0, b1 = gen_0, b2 = gen_0, vec = gen_0, z1 = gen_0, z2 = gen_0, d31 = gen_0, quart0 = gen_0, quart = gen_0, cont = gen_0, fa = gen_0, point = gen_0, solx = gen_0, soly = gen_0, listepoints = gen_0, strange = gen_0;
  long l2, l3;
  GEN p4 = gen_0;	  /* vec */
  GEN x = pol_x(fetch_user_var("x"));
  GEN p5 = gen_0;	  /* vec */
  if (!flag3)
    flag3 = gen_1;
  if (!auto_s)
  {
    p1 = cgetg(2, t_VEC);
    gel(p1, 1) = gcopy(y);
    auto_s = p1;
  }
  /* MODI remove i,X,Y */
  /* MODI add strange */
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
    pari_printf("Algorithme de la 2-descente complete\n");
  /* calcul de K(S,2) */
  
  KS2prod = gmulgs(gmul(gmul(gsub(e1, e2), gsub(e2, e3)), gsub(e3, e1)), 2);
  oddclass = gen_0;
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    while (gequal0(oddclass))
    {
      KS2gen = bnfsunit(bnf, gtrans(gel(idealfactor(bnf, KS2prod), 1)), prec);
      oddclass = gmodgs(gel(gel(KS2gen, 5), 1), 2);
      if (gequal0(oddclass))
        KS2prod = idealmul(bnf, KS2prod, gel(gel(gel(KS2gen, 5), 3), 1));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        gerepileall(btop, 3, &KS2gen, &oddclass, &KS2prod);
    }
  }
  KS2gen = gcopy(gel(KS2gen, 1));
  /* A CHANGER : KS2gen = matbasistoalg(bnf,KS2gen); */
  l2 = glength(KS2gen);
  {
    pari_sp btop = avma, st_lim = stack_lim(btop, 1);
    long i;
    for (i = 1; i <= l2; ++i)
    {
      gel(KS2gen, i) = basistoalg(bnf, gel(KS2gen, i));
      if (low_stack(st_lim, stack_lim(btop, 1)))
        KS2gen = gerepilecopy(btop, KS2gen);
    }
  }
  KS2gen = concat(gmodulo(lift(gettufu(bnf)), member_pol(bnf)), KS2gen);
  if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
  {
    pari_printf("#K(S,2)gen          = %ld\n", glength(KS2gen));
    pari_printf("K(S,2)gen = %Ps\n", KS2gen);
  }
  l3 = glength(KS2gen);
  {
    long i;
    GEN p6 = gen_0;	  /* vec */
    p4 = cgetg(l3+1, t_VEC);
    for (i = 1; i <= l3; ++i)
    {
      p6 = cgetg(3, t_VEC);
      gel(p6, 1) = gen_0;
      gel(p6, 2) = gen_1;
      gel(p4, i) = p6;
    }
  }
  /* parcours de K(S,2)*K(S,2) */
  
  vect = p4;
  selmer = gen_0;
  rang = gen_0;
  listepoints = cgetg(1, t_VEC);
  {
    GEN fv_data = gen_0;
    GEN (*fv_next)(GEN, GEN);	  /* func_GG */
    GEN X = forvec_start(vect, 0, &fv_data, &fv_next);	  /* vec */
    {
      pari_sp btop = avma, st_lim = stack_lim(btop, 1);
      long l7;
      GEN p8 = gen_0;
      for (  ; X; X = fv_next(fv_data, X))
      {
        l7 = glength(KS2gen);
        {
          pari_sp btop = avma, st_lim = stack_lim(btop, 1);
          long i;
          p8 = gen_1;
          for (i = 1; i <= l7; ++i)
          {
            p8 = gmul(p8, gpow(gel(KS2gen, i), gel(X, i), prec));
            if (low_stack(st_lim, stack_lim(btop, 1)))
              p8 = gerepilecopy(btop, p8);
          }
        }
        b1 = p8;
        {
          GEN fv_data = gen_0;
          GEN (*fv_next)(GEN, GEN);	  /* func_GG */
          GEN Y = forvec_start(vect, 0, &fv_data, &fv_next);	  /* vec */
          {
            pari_sp btop = avma, st_lim = stack_lim(btop, 1);
            long l9;
            GEN p10 = gen_0;
            GEN p11 = gen_0, p12 = gen_0;	  /* vec */
            long l13;
            GEN p14 = gen_0, p15 = gen_0, p16 = gen_0;	  /* vec */
            for (  ; Y; Y = fv_next(fv_data, Y))
            {
              l9 = glength(KS2gen);
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                long i;
                p10 = gen_1;
                for (i = 1; i <= l9; ++i)
                {
                  p10 = gmul(p10, gpow(gel(KS2gen, i), gel(Y, i), prec));
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    p10 = gerepilecopy(btop, p10);
                }
              }
              b2 = p10;
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
              {
                p11 = cgetg(3, t_VEC);
                gel(p11, 1) = gcopy(b1);
                gel(p11, 2) = gcopy(b2);
                pari_printf("[b1,b2] = %Ps\n", lift(p11));
              }
              /* points triviaux provenant de la 2-torsion */
              
              if (gequal1(b1) && gequal1(b2))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf(" point trivial [0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                continue;
              }
              if (nfissquare(member_nf(bnf), gmul(gsub(e2, e1), b1), prec) && nfissquare(member_nf(bnf), gmul(gmul(gsub(e2, e3), gsub(e2, e1)), b2), prec))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf(" point trivial [e2,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                continue;
              }
              if (nfissquare(member_nf(bnf), gmul(gsub(e1, e2), b2), prec) && nfissquare(member_nf(bnf), gmul(gmul(gsub(e1, e3), gsub(e1, e2)), b1), prec))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf(" point trivial [e1,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                continue;
              }
              if (nfissquare(member_nf(bnf), gmul(gsub(e3, e1), b1), prec) && nfissquare(member_nf(bnf), gmul(gsub(e3, e2), b2), prec))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf(" point trivial [e3,0]\n");
                selmer = gaddgs(selmer, 1);
                rang = gaddgs(rang, 1);
                continue;
              }
              /* premier critere local : sur les formes quadratiques */
              
              if (((mynfhilbert(member_nf(bnf), gmul(b1, b2), gmul(b1, gsub(e2, e1)), prec) < 0) || (mynfhilbert(member_nf(bnf), b2, gmul(b1, gsub(e3, e1)), prec) < 0)) || (mynfhilbert(member_nf(bnf), b1, gmul(b2, gsub(e3, e2)), prec) < 0))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("non ELS\n");
                continue;
              }
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
              {
                p12 = cgetg(3, t_VEC);
                gel(p12, 1) = gcopy(b1);
                gel(p12, 2) = gcopy(b2);
                pari_printf("[b1,b2] = %Ps\n", lift(p12));
              }
              if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                pari_printf("qf loc soluble\n");
              /* solution de la premiere forme quadratique */
              
              if (!gequal(b1, b2))
              {
                vec = bnfqfsolve(bnf, gmul(b1, b2), gmul(b1, gsub(e2, e1)), flag3, NULL, prec);
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("sol part = %Ps\n", vec);
                if (gequal0(gel(vec, 3)))
                  pari_err(user, "bnfell2descent_complete : BUG !!! : vec[3]=0 ");
                z1 = gdiv(gdiv(gel(vec, 1), gel(vec, 3)), b1);
                z2 = gdiv(gel(vec, 2), gel(vec, 3));
              }
              else
              {
                z1 = gdivgs(gaddsg(1, gdiv(gsub(e2, e1), b1)), 2);
                z2 = gsubgs(z1, 1);
              }
              d31 = gsub(e3, e1);
              quart0 = gadd(gsub(gadd(gsub(gmul(gmul(gsqr(b2), gsub(gmul(gsqr(z1), b1), d31)), gpowgs(x, 4)), gmul(gmul(gmul(gmul(gmulsg(4, z1), gsqr(b2)), z2), b1), gpowgs(x, 3))), gmul(gmul(gmul(gmulsg(2, b1), b2), gadd(gadd(gmul(gsqr(z1), b1), gmul(gmulsg(2, b2), gsqr(z2))), d31)), gsqr(x))), gmul(gmul(gmul(gmul(gmulsg(4, z1), b2), z2), gsqr(b1)), x)), gmul(gsqr(b1), gsub(gmul(gsqr(z1), b1), d31)));
              quart = gmul(gmul(quart0, b1), b2);
              if (gcmpgs(DEBUGLEVEL_ell, 4) >= 0)
                pari_printf("quart = %Ps\n", quart);
              quart = gmul(quart, gsqr(denom(simplify(content(quart)))));
              cont = simplify(content(lift(quart)));
              fa = factor(cont);
              l13 = glength(gel(fa, 1));
              {
                pari_sp btop = avma, st_lim = stack_lim(btop, 1);
                long i;
                for (i = 1; i <= l13; ++i)
                {
                  quart = gdiv(quart, gpow(gcoeff(fa, i, 1), gmulsg(2, gdiventgs(gcoeff(fa, i, 2), 2)), prec));
                  if (low_stack(st_lim, stack_lim(btop, 1)))
                    quart = gerepilecopy(btop, quart);
                }
              }
              if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                pari_printf("quart red = %Ps\n", quart);
              /* la quartique est-elle localement soluble ? */
              
              if (!nflocallysoluble(member_nf(bnf), quart, NULL, NULL, NULL, prec))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf(" quartique non ELS \n");
                continue;
              }
              selmer = gaddgs(selmer, 1);
              /* recherche de points sur la quartique. */
              
              point = nfratpoint(member_nf(bnf), quart, LIM3, gen_1, prec);
              if (!gequal(point, cgetg(1, t_VEC)))
              {
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf("point trouve sur la quartique !!\n");
                if (gcmpgs(DEBUGLEVEL_ell, 3) >= 0)
                  pari_printf("%Ps\n", point);
                if (!gequal0(gel(point, 3)))
                {
                  point = gdiv(point, gel(point, 3));
                  z1 = gdiv(gsub(gmul(gmul(gmulsg(2, b2), gel(point, 1)), z2), gmul(z1, gadd(b1, gmul(b2, gsqr(gel(point, 1)))))), gsub(b1, gmul(b2, gsqr(gel(point, 1)))));
                  solx = gadd(gmul(b1, gsqr(z1)), e1);
                  soly = gcopy(gel(nfsqrt(member_nf(bnf), gmul(gmul(gsub(solx, e1), gsub(solx, e2)), gsub(solx, e3)), prec), 1));
                  p14 = cgetg(2, t_VEC);
                  p15 = cgetg(3, t_VEC);
                  gel(p15, 1) = gcopy(solx);
                  gel(p15, 2) = gcopy(soly);
                  gel(p14, 1) = p15;
                  listepoints = concat(listepoints, p14);
                  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
                  {
                    p16 = cgetg(3, t_VEC);
                    gel(p16, 1) = gcopy(solx);
                    gel(p16, 2) = gcopy(soly);
                    pari_printf("point sur la courbe elliptique =%Ps\n", p16);
                  }
                }
                rang = gaddgs(rang, 1);
              }
              else
                if (gcmpgs(DEBUGLEVEL_ell, 2) >= 0)
                  pari_printf("aucun point trouve sur la quartique\n");
              if (low_stack(st_lim, stack_lim(btop, 1)))
                gerepileall(btop, 22, &p10, &b2, &p11, &selmer, &rang, &p12, &vec, &z1, &z2, &d31, &quart0, &quart, &cont, &fa, &point, &solx, &soly, &p15, &p14, &listepoints, &p16, &Y);
            }
          }
        }
        if (low_stack(st_lim, stack_lim(btop, 1)))
          gerepileall(btop, 18, &p8, &b1, &b2, &selmer, &rang, &vec, &z1, &z2, &d31, &quart0, &quart, &cont, &fa, &point, &solx, &soly, &listepoints, &X);
      }
    }
  }
  /* fin */
  
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
    pari_printf("#S^(2)      = %Ps\n", selmer);
  if (gcmp(rang, gdivgs(selmer, 2)) > 0)
    rang = selmer;
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    strange = stoi(!gequal(rang, selmer));
    if (!gequal0(strange))
      pari_printf("#E[K]/2E[K]>= %Ps\n", rang);
    else
      pari_printf("#E[K]/2E[K] = %Ps\n", rang);
    pari_printf("#E[2]       = 4\n");
  }
  rang = gsubgs(gceil(gdiv(glog(rang, prec), glog(gen_2, prec))), 2);
  selmer = stoi(ggval(selmer, gen_2));
  if (gcmpgs(DEBUGLEVEL_ell, 1) >= 0)
  {
    if (!gequal0(strange))
      pari_printf("%Ps >= rang  >= %Ps\n", gsubgs(selmer, 2), rang);
    else
      pari_printf("rang        = %Ps\n", rang);
    if (!gequal0(rang))
      pari_printf("points = %Ps\n", listepoints);
  }
  p5 = cgetg(4, t_VEC);
  gel(p5, 1) = gcopy(rang);
  gel(p5, 2) = gcopy(selmer);
  gel(p5, 3) = gcopy(listepoints);
  p5 = gerepilecopy(ltop, p5);
  return p5;
}
