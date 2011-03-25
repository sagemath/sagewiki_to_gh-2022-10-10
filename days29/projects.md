= Sage Days 29 Coding Sprint Projects =

<<TableOfContents>>


'''For the main SD 29 wiki page go [[days29|here]]'''

Below a list of proposed projects.

== Bug Days Challenges ==

The sponsor of the bug-fixing days part of this workshop has the following high-priority challenges for us.  It would be great if we could resolve them all.

  * Improve the startup time of Sage (ticket?)
  * [[http://trac.sagemath.org/sage_trac/ticket/10975|10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)]] (patch up by stein; positive review -- David Roe)
  * [[http://trac.sagemath.org/sage_trac/ticket/10801|10801 -- create a new option: "sage -strip" which deletes things that aren't needed for a binary distribution of sage, or for people that will never develop or upgrade]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10912|10912 -- add order setters and Tate and ate pairings]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10976|10976 -- computing order of a certain subgroup of a permutation group is double dog slow (compared to Magma)]]
  * [[http://trac.sagemath.org/sage_trac/ticket/10933|10933 -- time of magma command fails inside function]] (patch up by derickx; positive review -- Martin Raum)

== Fixing modular form/symbols related bugs and the linear algebra it uses ==

PEOPLE: Maarten Derickx, William Stein, Martin Raum

 * [[http://trac.sagemath.org/sage_trac/ticket/10548|10548]]	!ModularSymbols_clear_cache() not clearing everything
 * [[http://trac.sagemath.org/sage_trac/ticket/10510|10510]]	!ModularSymbols(Gamma1(29), 2).cuspidal_subspace().hecke_algebra().basis() doesn't terminate
 * [[http://trac.sagemath.org/sage_trac/ticket/10262|10262]]	memory leak in scalar*vector multiplication
 * [[http://trac.sagemath.org/sage_trac/ticket/8998|8998]] galois_action on cusps has a bug (positively reviewed -- JEC)
 * [[http://trac.sagemath.org/sage_trac/ticket/9526|9526]] Atkin-Lehner operators on modular abelian varieties
 * [[http://trac.sagemath.org/sage_trac/ticket/8614|8614 -- Optimize creation of modular symbols spaces by speeding up quotienting out by 2-term relations]] (needs review)
 * [[http://trac.sagemath.org/sage_trac/ticket/4578|4578 -- Optimize modular symbols decomposition algorithm]] (needs review)
 * [[http://trac.sagemath.org/sage_trac/ticket/10987|10987 -- Add optional arguement to decomposition_of_subspace making restrict not check the subspace]] (needs review)

== Binary quadratic forms ==
PEOPLE: Justin Walker
 * [[http://trac.sagemath.org/sage_trac/ticket/4120|4120]]        Make progress on getting this patch to pass muster
   New patch posted and ready for review.

== Number Theory/Elliptic Curves ==
PEOPLE: Justin Walker, Gagan Sekhon, William Stein, Rado Kirov, John Cremona, Aly Deines, Jen Balakrishnan, Jamie Weigandt
 *   [[http://trac.sagemath.org/sage_trac/ticket/10973|10973]]      Integer points for curves over number fields: Import Nook/Cremona/Kirov/Anderson code into Sage
 *  [[http://trac.sagemath.org/sage_trac/ticket/10832|10832]] Bug in simon_two_descent() (positively reviewed -- Weigandt)
 *  [[http://trac.sagemath.org/sage_trac/ticket/10745|10745]] Bug in Elliptic curves gens()
 *  [[http://trac.sagemath.org/sage_trac/ticket/10581|10581]] Change Large Cremona Database to mongodb format and extend it.
 *  [[http://trac.sagemath.org/sage_trac/ticket/10152|10152]] Bug in integral_points (for elliptic curves over Q)
 *  [[http://trac.sagemath.org/sage_trac/ticket/9371|9371]] 2-torsion rank over arbitrary fields
 
At Sage Days22, Rado Kirov and Jackie Anderson ported Magma code by John Cremona's student Nook (Thotsaphon Thongjunthug), to Sage.  The code adds support to Sage for finding integral points on elliptic curves over a number field.  This week, we moved this code into the Sage library, and made minor changes to support curves defined over the rationals as well. This code seems to fix #10152, and has been added to #10973 as a patch.  There are currently issues with performance, when compared with existing Magma code (when processing curves over Q).  We are looking at the performance issues (John, Gagan) and working on Nook's Magma code to add support for curves over Q (John, Justin).  Jen is working on her thesis.

== Descent ==

PEOPLE: Jamie Weigandt, Robert Miller, John Cremona, William Stein, Justin Walker
         
== Convert GP scripts in data/extcode/pari to pari library interface ==

  *  Simon's scripts qfsolve.gp, ellQ.gp, ell.gp (2-descent on elliptic curves over Q and over number fields)
     *  [[attachment:ellQ2.gp|revised script]]
     *  [[attachment:ellQ2.gp.c|C version of the produced by gp2c]]
     *  [[attachment:letter1.txt|Letter from Cohen to Simon explaining what he did]]
     *  See [[http://trac.sagemath.org/sage_trac/ticket/11005|11005]]  for an spkg and two patches (extcode and library) needing review.

  *  Dokchitser's scrip computel.gp (L-functions)
     *  [[attachment:TOSEND.tar|tar file contain rsults of all Cohen's work so far and usage instructions]]

PEOPLE: John Cremona, William Stein, Jamie Weigandt

== Exact and Double Dense (RDF/CDF) Linear Algebra ==

PEOPLE: Rob Beezer, John Palmieri

  * [[http://trac.sagemath.org/sage_trac/ticket/10752|10752]]  make pivots of matrices immutable (positive review)
  * [[http://trac.sagemath.org/sage_trac/ticket/4983|4983]]  subdivision attribute is public (positive review)
  * [[http://trac.sagemath.org/sage_trac/ticket/10595|10595]]  vector constructor and complex numbers (positive review)
  * [[http://trac.sagemath.org/sage_trac/ticket/7392|7392]]  rank of CDF/RDF matrices
  * [[http://trac.sagemath.org/sage_trac/ticket/10974|10974]] matrix stack(), augment() methods (positive review)
  * [[http://trac.sagemath.org/sage_trac/ticket/11004|11004]] tensor product subdivisions, docstring (needs review)
  * Wrap `NumPy/SciPy` Schur factorization, linear system solving routines

Many patches needing review at [[http://wiki.sagemath.org/devel/LatexToWorksheet]]

== Python 3 ==
 
 * Evaluating which python packages in Sage are ready for Python 3. ([[https://spreadsheets.google.com/ccc?key=0AqIElKUDQl8tdC1lR29XZFlxZUxOU1VlZ1JRQ3ZRanc&hl=en_GB#gid=0|Google Spreadsheet]], [[http://sagemath.org/packages/standard/|Packages in Sage]])

== IPython activity ==

PEOPLE: Fernando Perez, Min Ragan-Kelley, Thomas Kluyver

 * SQLite based history ([[https://github.com/ipython/ipython/pull/282|Pull request]])
 * Torpedøing unicode related bugs ([[https://github.com/ipython/ipython/pull/252|Pull request]])
 * Allow %time magic command to work within functions ([[http://trac.sagemath.org/sage_trac/ticket/10933|10933]])
 * General bug sorting and squashing ([[https://github.com/ipython/ipython/issues|bug list]], [[http://githubissues.heroku.com/#ipython/ipython|better bug list]])

Issues Identified
 * [[https://github.com/ipython/ipython/issues/291|291]] Rename special display methods and put them lower in priority then display functions
 * [[https://github.com/ipython/ipython/issues/296|296]] Automatic PDB via %pdb doesn't work
 * [[https://github.com/ipython/ipython/issues/297|297]] Shouldn't use pexpect for subprocesses in in-process terminal frontend


== matplotlib activity ==

PEOPLE: Michael Droettboom, Paul Ivanov

 * Fix memory leaks in Nose so that matplotlib's unit tests can be run on modest hardware with Python 3.x
 * See status of matplotlib on Python 3.x here [[https://github.com/matplotlib/matplotlib-py3/wiki]]
 * Win pub quiz competition [completed]
[[http://pirsquared.org/seattle/03212011523.jpg|{{http://pirsquared.org/seattle/03212011523.jpg|alt Team Scrappies in all their glory!|width=400}}]]
[[http://pirsquared.org/seattle/03212011522.jpg|{{http://pirsquared.org/seattle/03212011522.jpg|alt The winning sheet|width=400}}]]

== Algebraic Curves / Function Fields ==

PEOPLE: Moritz Minzlaff, Maarten Derickx, William Stein, Rado Kirov

Picking up things where [[http://wiki.sagemath.org/daysff/curves|Sage Days 21]] left them.

 * positive review: [[http://trac.sagemath.org/sage_trac/ticket/9053|9053]] fixes row echelon form over general PIDs
 * positive review: [[http://trac.sagemath.org/sage_trac/ticket/9094|9094]] is_square and sqrt for polynomials and fraction fields
 * [[http://trac.sagemath.org/sage_trac/ticket/9054|9054]] create a class for basic function_field arithmetic for Sage

== Sage Notebook (Server) ==

PEOPLE: William Stein, Rado Kirov, Alex Leone, Rob Beezer, Jason Grout

 * [[http://code.google.com/r/rkirov-flask/|Flask notebook]] (Rado Kirov)
 * [[http://code.google.com/p/sage-aleph|Sage Aleph]] (William Stein and Rado Kirov)
 * [[http://aleph.sagemath.org/|http://aleph.sagemath.org]] Aleph - simple single cell testing server, being served by apache + mod_wsgi.  
 * `MathJax` 1.1: [[http://trac.sagemath.org/sage_trac/ticket/9774|#9774]] (Rob Beezer)
 * Simple Compute Server (William Stein, Rado Kirov)
 * [[http://code.google.com/p/simple-python-db-compute/| Simple Python Compute Server]] (enhanced from January): 

== libGAP ==

PEOPLE: Volker Braun, (Dmitrii Pasechnik), Ivan Andrus

 * Trac ticket [[http://trac.sagemath.org/sage_trac/ticket/6391|#6391]]
 * Documentation: [[http://www.stp.dias.ie/~vbraun/Sage/html/en/reference/sage/libs/gap/gap.html]]
 * Code cleanup
 * Interact with GASMAN (GAP memory manager) to keep alive Gap Objects as long as needed. (Volker)
 * Use libtool to build shared library (Volker)
 * remove hardcoded input/output buffer sizes
 * trap GAP errors (Dima, Volker)
 * Test on various platforms, OSX needs work (Ivan Andrus)
 * Implement GAP List and rec (Volker)

== Riemann Theta Functions and Algebraic Curves ==

PEOPLE: Chris Swierczewski, Simon Spicer

 * Trac ticket [[http://trac.sagemath.org/sage_trac/ticket/6371|#6371]] (Chris, needs review)
 * Use non-GSL_BLAS for computing finite sum for Riemann theta. (Chris)
 * For better performance, determine eccentricity of bounding ellipsoid and apply Siegel transformation.
 * Riemann Matrices: (prerequisites)
   * Resultants over polynomial rings [[http://trac.sagemath.org/sage_trac/ticket/10799|#10799]] (positive review)
   * Singularities of algebraic curves (elements of polynomial rings over two vars?)
   * Puiseux series. Dependent on Dirichlet series. (Simon)
