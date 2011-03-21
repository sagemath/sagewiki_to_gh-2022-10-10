= Sage Days 29 Coding Sprint Projects =

<<TableOfContents>>


'''For the main SD 29 wiki page go [[days29|here]]'''

Below a list of proposed projects.


== Fixing modular form/symbols related bugs and the linear algebra it uses ==

PEOPLE: Maarten Derickx

 * [[http://trac.sagemath.org/sage_trac/ticket/10548|10548]]	!ModularSymbols_clear_cache() not clearing everything
 * [[http://trac.sagemath.org/sage_trac/ticket/10510|10510]]	!ModularSymbols(Gamma1(29), 2).cuspidal_subspace().hecke_algebra().basis() doesn't terminate
 * [[http://trac.sagemath.org/sage_trac/ticket/10262|10262]]	memory leak in scalar*vector multiplication

== Binary quadratic forms ==
PEOPLE: Justin Walker
 * [[http://trac.sagemath.org/sage_trac/ticket/4120|4120]]        Make progress on getting this patch to pass muster

== Number Theory/Elliptic Curves ==
PEOPLE: Justin Walker, Gagan Sekhon, William Stein, Rado Kirov, John Cremona, Aly Deines, Jen Balakrishnan, Jamie Weigandt
 *   [[http://trac.sagemath.org/sage_trac/ticket/10983|10983]]      Integer points for curves over number fields: Import Nook/Cremona/Kirov/Anderson code into Sage
 *  [[http://trac.sagemath.org/sage_trac/ticket/10832|10832]] Bug in simon_two_descent()
 *  [[http://trac.sagemath.org/sage_trac/ticket/10745|10745]] Bug in Elliptic curves gens()
 *  [[http://trac.sagemath.org/sage_trac/ticket/10581|10581]] Change Large Cremona to mongodb format and extend it.
 *  [[http://trac.sagemath.org/sage_trac/ticket/10152|10152]] Bug in integral_points (for elliptic curves over Q)
 *  [[http://trac.sagemath.org/sage_trac/ticket/10973|10973]] integral_ points over Number fields

== Descent ==

PEOPLE: Jamie Weigandt, Robert Miller, John Cremona, William Stein, Justin Walker
         
== Exact and Double Dense (RDF/CDF) Linear Algebra ==

PEOPLE: Rob Beezer

  * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752]]  make pivots of matrices immutable
  * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983]]  subdivision attibute is public
  * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]]  vector constructor and complex numbers
  * [[http://trac.sagemath.org/sage_trac/ticket/7392|7392]]  rank of CDF/RDF matrices
  * Duplicate [[http://trac.sagemath.org/sage_trac/ticket/10424|10424]] for matrix stack() method
  * Wrap `NumPy/SciPy` Schur factorization, linear system solving routines

Many patches needing review at [[http://wiki.sagemath.org/devel/LatexToWorksheet]]

== IPython activity ==

PEOPLE: Fernando Perez, Min Ragan-Kelley, Thomas Kluyver

 * SQLite based history ([[https://github.com/ipython/ipython/pull/282|Pull request]])

== matplotlib activity ==

PEOPLE: Michael Droettboom

 * Fix memory leaks in Nose so that matplotlib's unit tests can be run on modest hardware with Python 3.x
 * See status of matplotlib on Python 3.x here [[https://github.com/matplotlib/matplotlib-py3/wiki]]
