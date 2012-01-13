= Bugs We're Working On (Status) =

For [[days35.5|Sage Days 35.5]].

This is as accurate as we've made it.  The list of appropriately tagged [[http://trac.sagemath.org/sage_trac/query?status=closed&status=needs_info&status=needs_review&status=needs_work&status=new&status=positive_review&group=status&order=priority&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&keywords=~sd35.5|Trac tickets]] is probably the most accurate list possible for reporting purposes.

== Bugs to work on and/or solve ==

 * (new) [[http://trac.sagemath.org/sage_trac/ticket/11201|#11201]] Point users of solve() to the to_poly_solve option
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/11143|#11143]] Finish ticket defining symbolic functions for exponential integral special functions
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/12074|#12074]] symbolic nth root function for plotting, etc.
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/12094|#12094]] update Maxima
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/12220|#12220]] Updated CBC package
 
== Pages on Trac with lots more bugs of relevance ==
 * [[http://trac.sagemath.org/sage_trac/wiki/symbolics|symbolics and calculus bugs on Trac wiki]]
 * [[http://code.google.com/p/sagenb/issues/list|sagenb Google code]] issue list

== Not really a bug ==

 * [[http://trac.sagemath.org/sage_trac/ticket/12060|#12060]] Add formatting option to slider's displayed value 

== Bugs actually worked on and/or solved ==

 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/10923|#10923]] Bad sign in integral()
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/1173|#1173]] implement numerical evaluation of erf at complex arguments
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/12289|#12289]] pass algorithm argument to custom numeric evalution methods
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/4498|#4498]] Implement a symbolic version of the arg function
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/9130|#9130]] Access to beta function
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/9874|#9874]] add a function for the derivative of ceil and floor
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/10075|#10075]] Make log gamma symbolic
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/10489|#10489]] Slope fields and python lambdas: Rebasing outdated patch, needs review
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/10757#comment:5|#10757]] Laplacian matrix: Created patch fixing and documenting div-by-0 error
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/11462#comment:5|#11462]] @parallel documentation update: Created patch updating the documentation
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/11888|#11888]] Sage is missing the lambert_w function conversion from Maxima
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/11513|#11513]] Finish ticket adding _is_numerically_zero() to symbolic expressions
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/12075|#12075]] function notation for callable matrices
 * (positive_review) [[http://trac.sagemath.org/sage_trac/ticket/9248|#9248]] Doc fix for factorial function (types of accepted input)
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/12286|#12286]] Doc fix for factorial function (algorithm parameter) 
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/12288|#12288]] unset HGPLAIN when appropriate
 * (neeeds work) [[http://trac.sagemath.org/sage_trac/ticket/12075|#12075]] function notation for callable matrices
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/10965|#10965]] fix minor polygon doc stuff
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/11970|#11970]] problem with R under Ubuntu 11.10
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/12282|#12282]] Fix strcmp() with NULL argument in termcap library
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/9129|#9129]] sqrt memory leaks
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/11771|#11771]] sage crashes on some degenerate flint xgcd's
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/2956|#2956]] generic multivariate polynomials are buggy on exponent overflow
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/6442|#6442]] Random(?) index error with determinant method
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/9362|#9362]] Invalidate None as a vertex label.
 * (neews review) [[http://trac.sagemath.org/sage_trac/ticket/10057|#10057]] Change import location for decorator_defaults in sagenb interact.py
 * (needs info) [[http://trac.sagemath.org/sage_trac/ticket/10193|#10193]] Create the category of GradedEnumeratedSets
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/10750|#10750]] Fix solve so that additional args are properly handled
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/10895|#10895]] add qitensor spkg (tensors for quantum information)
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/10899|#10899]] is_chordal can raise TypeError
 * (positive review) [[http://trac.sagemath.org/sage_trac/ticket/11513|#11513]] add is_trivial_zero() method to symbolic expressions
 * (needs info) [[http://trac.sagemath.org/sage_trac/ticket/11666|#11666]] Upgrade MPFR to 3.1.0
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/11705|#11705]] Port Sage to SUSE Linux Power 7 (ppc64).
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/9411|#9411]] Given points on an elliptic curve, this finds a LLL reduced ZZ-independent set
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/11652|#11652]] MPolynomial_libsingular reports the wrong degree
 * (needs work) [[http://trac.sagemath.org/sage_trac/ticket/11739|#11739]] add_vertex w/o params should return the new vertex
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/12292|#12292]] charpoly is recomputed when called with a different variable
 * (new) [[http://trac.sagemath.org/sage_trac/ticket/12293|#12293]] Graph(n) is not documented
 * (merged) [[https://github.com/sagemath/sagenb/issues/6|Sagenb - 6]] Mirror changes to the old sagenb in the flask notebook since the last fork
 * (merged) [[https://github.com/sagemath/sagenb/issues/13|Sagenb - 13]] Ensure JMol is loaded in the new flask notebook
 * (merged) [[https://github.com/sagemath/sagenb/pull/15|Sagenb - 15]] Remove GnuTLS and changed protocol so secure HTTPS connections can be started
 * (needs review) [[https://github.com/sagemath/sagenb/pull/19|Sagenb - 19]] Cache public worksheets for performance improvements
 * (needs review) [[https://github.com/jasongrout/simple-python-db-compute/pull/222|Single Cell Server - 222]] Fix updating of multiple interacts
 * (needs review) [[https://github.com/jasongrout/simple-python-db-compute/pull/220|Single Cell Server - 220]] Expand embedding API
 * (needs review) [[https://github.com/jasongrout/simple-python-db-compute/pull/219|Single Cell Server - 219]] Sage 4.7.2, IPython 0.10 compatibility
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/12298|#12298]] minor CallableSymbolicExpressionRing display bug
 * (needs review) [[http://trac.sagemath.org/sage_trac/ticket/12220|#12220]] Updated CBC package
