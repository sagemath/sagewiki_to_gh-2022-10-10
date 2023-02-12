

# Bugs We're Working On (Status)

For <a href="/days35.5">Sage Days 35.5</a>. 

This is as accurate as we've made it.  The list of appropriately tagged <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=closed&amp;status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;status=positive_review&amp;group=status&amp;order=priority&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;keywords=~sd35.5">Trac tickets</a> is probably the most accurate list possible for reporting purposes. 


## Bugs to work on and/or solve

* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11201">#11201</a> Point users of solve() to the to_poly_solve option 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11143">#11143</a> Finish ticket defining symbolic functions for exponential integral special functions 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12074">#12074</a> symbolic nth root function for plotting, etc. 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12094">#12094</a> update Maxima 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12220">#12220</a> Updated CBC package 

## Pages on Trac with lots more bugs of relevance

* <a class="http" href="http://trac.sagemath.org/sage_trac/wiki/symbolics">symbolics and calculus bugs on Trac wiki</a> 
* <a class="http" href="http://code.google.com/p/sagenb/issues/list">sagenb Google code</a> issue list 

## Not really a bug

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12060">#12060</a> Add formatting option to slider's displayed value  

## Bugs actually worked on and/or solved


### Sage library bugs

* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1173">#1173</a> implement numerical evaluation of erf at complex arguments 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2956">#2956</a> generic multivariate polynomials are buggy on exponent overflow 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4498">#4498</a> Implement a symbolic version of the arg function 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6442">#6442</a> Random(?) index error with determinant method 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9129">#9129</a> sqrt memory leaks 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9130">#9130</a> Access to beta function 
* (positive_review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9248">#9248</a> Doc fix for factorial function (types of accepted input) 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9362">#9362</a> Invalidate None as a vertex label. 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9411">#9411</a> Given points on an elliptic curve, this finds a LLL reduced ZZ-independent set 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9874">#9874</a> add a function for the derivative of ceil and floor 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10075">#10075</a> Make log gamma symbolic 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10057">#10057</a> Change import location for decorator_defaults in sagenb interact.py 
* (needs info) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10193">#10193</a> Create the category of <a href="/GradedEnumeratedSets">GradedEnumeratedSets</a> 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10489">#10489</a> Slope fields and python lambdas: Rebasing outdated patch, needs review 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10750">#10750</a> Fix solve so that additional args are properly handled 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10757#comment:5">#10757</a> Laplacian matrix: Created patch fixing and documenting div-by-0 error 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10895">#10895</a> add qitensor spkg (tensors for quantum information) 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10899">#10899</a> is_chordal can raise <a href="/TypeError">TypeError</a> 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10923">#10923</a> Bad sign in integral() 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10965">#10965</a> fix minor polygon doc stuff 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11462#comment:5">#11462</a> @parallel documentation update: Created patch updating the documentation 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11513">#11513</a> add is_trivial_zero() method to symbolic expressions 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11652">#11652</a> MPolynomial_libsingular reports the wrong degree 
* (needs info) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11666">#11666</a> Upgrade MPFR to 3.1.0 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11705">#11705</a> Port Sage to SUSE Linux Power 7 (ppc64). 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11739">#11739</a> add_vertex w/o params should return the new vertex 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11771">#11771</a> sage crashes on some degenerate flint xgcd's 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11888">#11888</a> Sage is missing the lambert_w function conversion from Maxima 
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11970">#11970</a> problem with R under Ubuntu 11.10 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12075">#12075</a> function notation for callable matrices 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12220">#12220</a> Updated CBC package 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12282">#12282</a> Fix strcmp() with NULL argument in termcap library 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12286">#12286</a> Doc fix for factorial function (algorithm parameter)  
* (positive review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12288">#12288</a> unset HGPLAIN when appropriate 
* (needs work) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12289">#12289</a> pass algorithm argument to custom numeric evalution methods 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12292">#12292</a> charpoly is recomputed when called with a different variable 
* (new) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12293">#12293</a> Graph(n) is not documented 
* (needs review) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12298">#12298</a> minor <a href="/CallableSymbolicExpressionRing">CallableSymbolicExpressionRing</a> display bug 

### Sage notebook and cell server bugs

* (merged) <a class="https" href="https://github.com/sagemath/sagenb/issues/6">Sagenb - 6</a> Mirror changes to the old sagenb in the flask notebook since the last fork 
* (merged) <a class="https" href="https://github.com/sagemath/sagenb/issues/13">Sagenb - 13</a> Ensure JMol is loaded in the new flask notebook 
* (merged) <a class="https" href="https://github.com/sagemath/sagenb/pull/15">Sagenb - 15</a> Remove GnuTLS and changed protocol so secure HTTPS connections can be started 
* (needs review) <a class="https" href="https://github.com/sagemath/sagenb/pull/19">Sagenb - 19</a> Cache public worksheets for performance improvements 
* (needs review) <a class="https" href="https://github.com/jasongrout/simple-python-db-compute/pull/222">Single Cell Server - 222</a> Fix updating of multiple interacts 
* (needs review) <a class="https" href="https://github.com/jasongrout/simple-python-db-compute/pull/220">Single Cell Server - 220</a> Expand embedding API 
* (needs review) <a class="https" href="https://github.com/jasongrout/simple-python-db-compute/pull/219">Single Cell Server - 219</a> Sage 4.7.2, IPython 0.10 compatibility 