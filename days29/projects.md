= Sage Days 29 Coding Sprint Projects =

<<TableOfContents>>


'''For the main SD 29 wiki page go [[days29|here]]'''

Below a list of proposed projects.


== Fixing modular form/symbols related bugs and the linear algebra it uses ==

PEOPLE: Maarten Derickx

 * #10548	!ModularSymbols_clear_cache() not clearing everything
 * #10510	!ModularSymbols(Gamma1(29), 2).cuspidal_subspace().hecke_algebra().basis() doesn't terminate
 * #10262	memory leak in scalar*vector multiplication

== Binary quadratic forms ==
PEOPLE: Justin Walker
 * #4120        Make progress on getting this patch to pass muster

== Number Theory/Elliptic Curves ==
PEOPLE: Justin Walker
 *              Integer points for curves over number fields: Import Nook/Cremona/Kirov code into Sage

== Exact and Double Dense (RDF/CDF) Linear Algebra ==

PEOPLE: Rob Beezer

  * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752]]  make pivots of matrices immutable
  * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983]]  subdivision attibute is public
  * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]]  vector constructor and complex numbers
  * [[http://trac.sagemath.org/sage_trac/ticket/7392|7392]]  rank of CDF/RDF matrices
  * Duplicate [[http://trac.sagemath.org/sage_trac/ticket/10424|10424]] for matrix stack() method
  * Wrap `NumPy/SciPy` Schur factorization, linear system solving routines

Many patches needing review at [[http://wiki.sagemath.org/devel/LatexToWorksheet]]
