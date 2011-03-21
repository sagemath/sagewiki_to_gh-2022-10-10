= Sage Days 29 Coding Sprint Projects =

<<TableOfContents>>


'''For the main SD 29 wiki page go [[days29|here]]'''

Below a list of proposed projects.

== Bug Days Challenges ==

The sponsor of the bug-fixing days part of this workshop has the following high-priority challenges for us.  It would be great if we could resolve them all.

  * Improve the startup time of Sage (ticket?)
  * [[http://trac.sagemath.org/sage_trac/ticket/10975|10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10801|10801 -- create a new option: "sage -strip" which deletes things that aren't needed for a binary distribution of sage, or for people that will never develop or upgrade]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10912|10912 -- add order setters and Tate and ate pairings]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10976|10976 -- computing order of a certain subgroup of a permutation group is double dog slow (compared to Magma)]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10933|10933 -- time of magma command fails inside function]]

== Fixing modular form/symbols related bugs and the linear algebra it uses ==

PEOPLE: Maarten Derickx, William Stein

 * [[http://trac.sagemath.org/sage_trac/ticket/10548|10548]]	!ModularSymbols_clear_cache() not clearing everything
 * [[http://trac.sagemath.org/sage_trac/ticket/10510|10510]]	!ModularSymbols(Gamma1(29), 2).cuspidal_subspace().hecke_algebra().basis() doesn't terminate
 * [[http://trac.sagemath.org/sage_trac/ticket/10262|10262]]	memory leak in scalar*vector multiplication
 * [[http://trac.sagemath.org/sage_trac/ticket/8998|8998]] galois_action on cusps has a bug
 * [[http://trac.sagemath.org/sage_trac/ticket/9526|9526]] Atkin-Lehner operators on modular abelian varieties

== Binary quadratic forms ==
PEOPLE: Justin Walker
 * [[http://trac.sagemath.org/sage_trac/ticket/4120|4120]]        Make progress on getting this patch to pass muster

== Number Theory/Elliptic Curves ==
PEOPLE: Justin Walker, Gagan Sekhon, William Stein, Rado Kirov, John Cremona, Aly Deines, Jen Balakrishnan, Jamie Weigandt
 *   [[http://trac.sagemath.org/sage_trac/ticket/10973|10973]]      Integer points for curves over number fields: Import Nook/Cremona/Kirov/Anderson code into Sage
 *  [[http://trac.sagemath.org/sage_trac/ticket/10832|10832]] Bug in simon_two_descent() -- patch exists, needs very little work
 *  [[http://trac.sagemath.org/sage_trac/ticket/10745|10745]] Bug in Elliptic curves gens()
 *  [[http://trac.sagemath.org/sage_trac/ticket/10581|10581]] Change Large Cremona to mongodb format and extend it.
 *  [[http://trac.sagemath.org/sage_trac/ticket/10152|10152]] Bug in integral_points (for elliptic curves over Q)

== Descent ==

PEOPLE: Jamie Weigandt, Robert Miller, John Cremona, William Stein, Justin Walker
         
== Convert GP scripts in data/extcode/pari to pari library interface ==

  *  Simon's scripts qfsolve.gp, ellQ.gp, ell.gp (2-descent on elliptic curves over Q and over number fields)
     *  [[attachment:ellQ2.gp|revised script]]
     *  [[attachment:ellQ2.gp.c|C version of the produced by gp2c]]
     *  [[attachment:letter1.txt|Letter from Cohen to Simon explaining what he did]]

  *  Dokchitser's scrip computel.gp (L-functions)
     *  [[attachment:TOSEND.tar|tar file contain rsults of all Cohen's work so far and usage instructions]]

PEOPLE: John Cremona, William Stein, Jamie Weigandt

== Exact and Double Dense (RDF/CDF) Linear Algebra ==

PEOPLE: Rob Beezer

  * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752]]  make pivots of matrices immutable (needs review)
  * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983]]  subdivision attibute is public (needs review)
  * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]]  vector constructor and complex numbers (needs review)
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
