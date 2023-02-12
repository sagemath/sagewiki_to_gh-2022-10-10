

# Sage Days 32 High Priority Wishlist

**This is being moved to TRAC, since nobody can edit the wiki.   Please do not edit this page.** 

USE THIS PAGE INSTEAD:   

      * <a href="http://trac.sagemath.org/sage_trac/wiki/days32wishlist">http://trac.sagemath.org/sage_trac/wiki/days32wishlist</a> 
      * <a href="http://trac.sagemath.org/sage_trac/report/42?asc=1&amp;sort=status">http://trac.sagemath.org/sage_trac/report/42?asc=1&sort=status</a> 

# OLD -- do not edit or use


## Super-duper High Priority

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8254">#8254</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11040">#11040</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11043">#11043</a> faster startup time;  see also <a class="https" href="https://github.com/jasongrout/sage-forker">the Sage forker</a>, and see <a class="http" href="http://artificialcode.blogspot.com/2009/04/short-circuiting-python-module-lookup.html">this article</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11705">#11705</a> Port Sage to Power 7 (ppc64) -- there is a machine "silius" on skynet that should be used for this.  Only problem is building Maxima... 

## High Priority

* Upgrade MPIR (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8664">#8664</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11616">#11616</a>), MPFR (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11666">#11666</a>), MPFI to latest stable releases 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5847">#5847</a> Update GMP-ECM to 6.3 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11351">#11351</a> make flintqs-20070817 spkg build with -m64 rather than 
* latest jmol source (also <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9238">#9238</a>) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6329">#6329</a> optional doctest failure -- breakage in the sage<-->magma   
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10975">#10975</a> creation of certain prime finite fields is double dog slow 

## Medium Priority

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10826">#10826</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10827">#10827</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10828">#10828</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11197">#11197</a> SAGE_SPKG_INSTALL_DOCS 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10152">#10152</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10973">#10973</a> integral points 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9668">#9668</a> Fix hardcoding of paths in R binary 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11710">#11710</a> Experimental package Macaulay2 fails to build (also <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10117">#10117</a>) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10976">#10976</a> computing order of subgroup of a permutation group is slow 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10801">#10801</a> Create a new option: "sage -strip" 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8783">#8783</a> frobby optional spkg doesn't build with newer GCC's 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11427">#11427</a> optional spkg database_gap-4.4.12.p0.spkg fails test 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11433">#11433</a> optional spkg graphviz-2.16.1.p0.spkg fails to build 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11438">#11438</a> optional package libtheora-1.1.1.spkg does not build 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11439">#11439</a> optional package mpi4py-1.1.0.spkg does not build 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11444">#11444</a> optional package cbc-2.3.p2.spkg does not build 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10981">#10981</a> algebraic real field partial_fraction_decomposition bug 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7879">#7879</a> Remove unnecessary signal handling for low prec mpfr operations 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8896">#8896</a> 0.0000000000000000000000000000 is parsed completely differently 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10635">#10635</a> refactor polynomial_element.pyx factor function 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4949">#4949</a> Optionally build spkgs in $SAGE_BUILD_TMPDIR 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10970">#10970</a> Remove pipestatus from spkg/install 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10271">#10271</a> Make big_oh notation work for any element that has degree() 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5903">#5903</a> Remove dist directories from Sage distribution 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10231">#10231</a> Don't repackage examples and extcode on sage-*dist 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10952">#10952</a> better numerical accuracy testing (in-progress, Beezer) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6284">#6284</a> fix the numerous broken optional magma doctests 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8469">#8469</a> add "Number Theory and the RSA Public Key Cryptosystem" (review in-progress, Beezer) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9487">#9487</a> Have an acurate description of what "supported platforms" are 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9494">#9494</a> Add a doctest to benchmark.py (in-progress, Beezer) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10910">#10910</a> Avoid nfinit while factoring polynomials 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10951">#10951</a> ecmfactor should take as optional argument the sigma value 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5187">#5187</a> fix optional magma doctests that changed in magma-2.15 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6315">#6315</a> optional doctest failure -- caused by mistakes in lectures 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11421">#11421</a> upgrade optional package NZMATH to version 1.1.0 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7344">#7344</a> New libjpeg package 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7345">#7345</a> New libtiff package 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9975">#9975</a> Update GnuTLS and clean up the package 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11354">#11354</a> remove dist directory from eclib spkg 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11169">#11169</a> Make testcc.sh exit with an exit code of 1 if attempting 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8321">#8321</a> numerical integration with arbitrary precision 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11036">#11036</a> improve solve_mod performance 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6495">#6495</a> build reference manual more quickly 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7494">#7494</a> remove/move the examples directory stuff already 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6743">#6743</a> make more progress on making Sage build automatically on Cygwin 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4260">#4260</a> use <a href="/LinBox">LinBox</a> as native matrix representation for dense matrices over GF(p) 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9562">#9562</a> add M4RIE to Sage (== fast linear algebra over GF(2^n) for n in 2..10 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11574">#11574</a> update M4RI 

## Lower Priority (not from sponsor)

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11680">#11680</a> support extra_compile_args (e.g., C99) when loading/attaching .pyx (cython) files, and when using %cython in the notebook 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11712">#11712</a> Make it so typing `cython?` results in one seeing documentation for all pragma's for %cython mode and load/attach .pyx file 