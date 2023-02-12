

# Sage Days 29 Coding Sprint Projects

[[_TOC_]] 

**For the main SD 29 wiki page go <a href="/days29">here</a>** 

Below a list of proposed projects. 


## Bug Days Challenges

The sponsor of the bug-fixing days part of this workshop has the following high-priority challenges for us.  It would be great if we could resolve them all. 

   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8254">8254 -- Improve the startup time of Sage</a> 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10975">10975 -- creation of certain prime finite fields is double dog slow (compared to Magma)</a> (patch up by stein; positive review -- David Roe) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10801">10801 -- create a new option: "sage -strip" which deletes things that aren't needed for a binary distribution of sage, or for people that will never develop or upgrade</a> 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10912">10912 -- add order setters and Tate and ate pairings</a> 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10976">10976 -- computing order of a certain subgroup of a permutation group is double dog slow (compared to Magma)</a> 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10933">10933 -- time of magma command fails inside function</a> (patch up by derickx; positive review -- Martin Raum) 

## Fixing modular form/symbols related bugs and the linear algebra it uses

PEOPLE: Maarten Derickx, William Stein, Martin Raum 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10548">10548</a>    ModularSymbols_clear_cache() not clearing everything (positive review) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10510">10510</a>    ModularSymbols(Gamma1(29), 2).cuspidal_subspace().hecke_algebra().basis() doesn't terminate 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10262">10262</a>    memory leak in scalar*vector multiplication 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8998">8998</a> galois_action on cusps has a bug (positively reviewed -- JEC) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9526">9526</a> Atkin-Lehner operators on modular abelian varieties 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8614">8614 -- Optimize creation of modular symbols spaces by speeding up quotienting out by 2-term relations</a> (needs review) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4578">4578 -- Optimize modular symbols decomposition algorithm</a> (needs review) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10987">10987 -- Add optional arguement to decomposition_of_subspace making restrict not check the subspace</a> (needs review) 

## Binary quadratic forms

PEOPLE: Justin Walker 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4120">4120</a>        Make progress on getting this patch to pass muster 
      * New patch posted and ready for review. 

## Number Theory/Elliptic Curves

PEOPLE: Justin Walker, Gagan Sekhon, William Stein, Rado Kirov, John Cremona, Aly Deines, Jen Balakrishnan, Jamie Weigandt 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10973">10973</a>      Integer points for curves over number fields: Import Nook/Cremona/Kirov/Anderson code into Sage 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10832">10832</a> Bug in simon_two_descent() (positive review) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10745">10745</a> Bug in Elliptic curves gens() 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10581">10581</a> Change Large Cremona Database to mongodb format and extend it. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10152">10152</a> Bug in integral_points (for elliptic curves over Q) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9371">9371</a> 2-torsion rank over arbitrary fields (positive review) 
At Sage Days22, Rado Kirov and Jackie Anderson ported Magma code by John Cremona's student Nook (Thotsaphon Thongjunthug), to Sage.  The code adds support to Sage for finding integral points on elliptic curves over a number field.  This week, we moved this code into the Sage library, and made minor changes to support curves defined over the rationals as well. This code seems to fix #10152, and has been added to #10973 as a patch.  There are currently issues with performance, when compared with existing Magma code (when processing curves over Q).  We are looking at the performance issues (John, Gagan) and working on Nook's Magma code to add support for curves over Q (John, Justin).  Jen is working on her thesis. 


## Descent

PEOPLE: Jamie Weigandt, Robert Miller, John Cremona, William Stein, Justin Walker 


## Convert GP scripts in data/extcode/pari to pari library interface

   * Simon's scripts qfsolve.gp, ellQ.gp, ell.gp (2-descent on elliptic curves over Q and over number fields) 
            * <a href="days29/projects/ellQ2.gp">revised script</a> 
            * <a href="days29/projects/ellQ2.gp.c">C version of the produced by gp2c</a> 
            * <a href="days29/projects/letter1.txt">Letter from Cohen to Simon explaining what he did</a> 
            * See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11005">11005</a>  for an spkg and two patches (extcode and library) needing review. 
   * Dokchitser's scrip computel.gp (L-functions) 
            * <a href="days29/projects/TOSEND.tar">tar file contain rsults of all Cohen's work so far and usage instructions</a> 
            * You can find a trac ticket with spkg and a refactored wrapper at <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11024">11024</a> 
PEOPLE: John Cremona, William Stein, Jamie Weigandt 


## Exact and Double Dense (RDF/CDF) Linear Algebra

PEOPLE: Rob Beezer, John Palmieri 

   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10752">10752</a>  make pivots of matrices immutable (positive review) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4983">4983</a>  subdivision attribute is public (positive review) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10595">10595</a>  vector constructor and complex numbers (positive review) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7392">7392</a>  rank of CDF/RDF matrices 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10974">10974</a> matrix stack(), augment() methods (positive review) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11004">11004</a> tensor product subdivisions, docstring (needs review) 
   * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11007">11007</a> wrap `NumPy/SciPy` Schur factorization (needs review) 
   * linear system solving routines, RDF/CDF matrix decompositions 
Many patches needing review at <a class="http" href="http://wiki.sagemath.org/devel/LatexToWorksheet">http://wiki.sagemath.org/devel/LatexToWorksheet</a> 


## Python 3

* Evaluating which python packages in Sage are ready for Python 3. (<a class="https" href="https://spreadsheets.google.com/ccc?key=0AqIElKUDQl8tdC1lR29XZFlxZUxOU1VlZ1JRQ3ZRanc&amp;hl=en_GB#gid=0">Google Spreadsheet</a>, <a class="http" href="http://sagemath.org/packages/standard/">Packages in Sage</a>) 

## IPython activity

PEOPLE: Fernando Perez, Min Ragan-Kelley, Thomas Kluyver 

* SQLite based history (<a class="https" href="https://github.com/ipython/ipython/pull/282">Pull request</a>) 
* Torpedøing unicode related bugs (<a class="https" href="https://github.com/ipython/ipython/pull/252">Pull request</a>) 
* Allow %time magic command to work within functions (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10933">10933</a>) 
* General bug sorting and squashing (<a class="https" href="https://github.com/ipython/ipython/issues">bug list</a>, <a class="http" href="http://githubissues.heroku.com/#ipython/ipython">better bug list</a>) 
Issues Identified 

* <a class="https" href="https://github.com/ipython/ipython/issues/291">291</a> Rename special display methods and put them lower in priority then display functions 
* <a class="https" href="https://github.com/ipython/ipython/issues/296">296</a> Automatic PDB via %pdb doesn't work 
* <a class="https" href="https://github.com/ipython/ipython/issues/297">297</a> Shouldn't use pexpect for subprocesses in in-process terminal frontend 

## matplotlib activity

PEOPLE: Michael Droettboom, Paul Ivanov 

* Fix memory leaks in Nose so that matplotlib's unit tests can be run on modest hardware with Python 3.x 
* See status of matplotlib on Python 3.x here <a class="https" href="https://github.com/matplotlib/matplotlib-py3/wiki">https://github.com/matplotlib/matplotlib-py3/wiki</a> 
* Win pub quiz competition [completed] 
<a class="http" href="http://pirsquared.org/seattle/03212011523.jpg">![alt Team Scrappies in all their glory!](http://pirsquared.org/seattle/03212011523.jpg)</a> <a class="http" href="http://pirsquared.org/seattle/03212011522.jpg">![alt The winning sheet](http://pirsquared.org/seattle/03212011522.jpg)</a> 


## Algebraic Curves / Function Fields

PEOPLE: Moritz Minzlaff, Maarten Derickx, William Stein, Rado Kirov 

Picking up things where <a class="http" href="http://wiki.sagemath.org/daysff/curves">Sage Days 21</a> left them. 

* positive review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9053">9053</a> fixes row echelon form over general PIDs 
* positive review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9094">9094</a> is_square and sqrt for polynomials and fraction fields 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">9054</a> create a class for basic function_field arithmetic for Sage 

## Sage Notebook (Server)

PEOPLE: William Stein, Rado Kirov, Alex Leone, Rob Beezer, Jason Grout, Robert Bradshaw 

* <a class="http" href="http://code.google.com/r/rkirov-flask/">Flask notebook</a> (Rado Kirov) 
* <a class="http" href="http://code.google.com/p/sage-aleph">Sage Aleph</a> (William Stein and Rado Kirov) 
* <a class="http" href="http://aleph.sagemath.org/">http://aleph.sagemath.org</a> Aleph - simple single cell testing server, being served by apache + mod_wsgi.   
* `MathJax` 1.1: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9774">#9774</a> (Rob Beezer) 
* Simple Compute Server (William Stein, Rado Kirov) 
* <a class="http" href="http://code.google.com/p/simple-python-db-compute/">Simple Python Compute Server</a> (enhanced from January):  

## libGAP

PEOPLE: Volker Braun, (Dmitrii Pasechnik), Ivan Andrus 

* Trac ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6391">#6391</a> 
* Documentation: <a class="http" href="http://www.stp.dias.ie/~vbraun/Sage/html/en/reference/sage/libs/gap/libgap.html">http://www.stp.dias.ie/~vbraun/Sage/html/en/reference/sage/libs/gap/libgap.html</a> 
* Code cleanup (Volker, Ivan) 
* Interact with GASMAN (GAP memory manager) to keep alive Gap Objects as long as needed. (Volker) 
* Use libtool to build shared library (Volker) 
* remove hardcoded input/output buffer sizes 
* trap GAP errors (Dima, Volker) 
* Test on various platforms, Linux+OSX works (Volker, Ivan Andrus) 
* Implemented special classes for GAP lists, records, and functions (Volker) 
* Implemented conversion GAP->Sage for booleans, integers, rationals, cyclotomics, permutations (Volker) 

## Riemann Theta Functions and Algebraic Curves

PEOPLE: Chris Swierczewski, Simon Spicer 

* Trac ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6371">#6371</a> (Chris, needs review) 
* Use non-GSL_BLAS for computing finite sum for Riemann theta. (Chris) 
* For better performance, determine eccentricity of bounding ellipsoid and apply Siegel transformation. 
* Riemann Matrices: (prerequisites) 
      * Resultants over polynomial rings <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10799">#10799</a> (positive review) 
      * Singularities of algebraic curves (elements of polynomial rings over two vars?) 
      * Puiseux series. Dependent on Dirichlet series. (Simon) 