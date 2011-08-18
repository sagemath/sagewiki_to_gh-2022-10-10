= Sage Days 32 High Priority Wishlist =

== Super-duper High Priority ==
 * [[http://trac.sagemath.org/sage_trac/ticket/8254|#8254]] [[http://trac.sagemath.org/sage_trac/ticket/11040|#11040]] [[http://trac.sagemath.org/sage_trac/ticket/11043|#11043]] faster startup time;  see also [[https://github.com/jasongrout/sage-forker|the Sage forker]].
 * Port Sage to Power 7 (ppc64) -- there is a machine "silius" on skynet that should be used for this.


== High Priority ==

 * Upgrade MPIR ([[http://trac.sagemath.org/sage_trac/ticket/8664|#8664]], [[http://trac.sagemath.org/sage_trac/ticket/11616|#11616]]), MPFR ([[http://trac.sagemath.org/sage_trac/ticket/11666|#11666]]), MPFI to latest stable releases

 * [[http://trac.sagemath.org/sage_trac/ticket/5847|#5847]] Update GMP-ECM to 6.3

 * [[http://trac.sagemath.org/sage_trac/ticket/11351|#11351]] make flintqs-20070817 spkg build with -m64 rather than

 * latest jmol source (also [[http://trac.sagemath.org/sage_trac/ticket/9238|#9238]])

 * [[http://trac.sagemath.org/sage_trac/ticket/6329|#6329]] optional doctest failure -- breakage in the sage<-->magma  

 * [[http://trac.sagemath.org/sage_trac/ticket/10975|#10975]] creation of certain prime finite fields is double dog slow

== Medium Priority ==

 * [[http://trac.sagemath.org/sage_trac/ticket/10826|#10826]], [[http://trac.sagemath.org/sage_trac/ticket/10827|#10827]], [[http://trac.sagemath.org/sage_trac/ticket/10828|#10828]], [[http://trac.sagemath.org/sage_trac/ticket/11197|#11197]] SAGE_SPKG_INSTALL_DOCS

 * [[http://trac.sagemath.org/sage_trac/ticket/10152|#10152]] [[http://trac.sagemath.org/sage_trac/ticket/10973|#10973]] integral points
 * [[http://trac.sagemath.org/sage_trac/ticket/9668|#9668]] Fix hardcoding of paths in R binary

 * experimental packages macaulay2 fails to build (also [[http://trac.sagemath.org/sage_trac/ticket/10117|#10117]])

 * [[http://trac.sagemath.org/sage_trac/ticket/10976|#10976]] computing order of subgroup of a permutation group is slow
 * [[http://trac.sagemath.org/sage_trac/ticket/10801|#10801]] Create a new option: "sage -strip"
 * [[http://trac.sagemath.org/sage_trac/ticket/8783|#8783]] frobby optional spkg doesn't build with newer GCC's
 * [[http://trac.sagemath.org/sage_trac/ticket/11427|#11427]] optional spkg database_gap-4.4.12.p0.spkg fails test
 * [[http://trac.sagemath.org/sage_trac/ticket/11433|#11433]] optional spkg graphviz-2.16.1.p0.spkg fails to build
 * [[http://trac.sagemath.org/sage_trac/ticket/11438|#11438]] optional package libtheora-1.1.1.spkg does not build
 * [[http://trac.sagemath.org/sage_trac/ticket/11439|#11439]] optional package mpi4py-1.1.0.spkg does not build
 * [[http://trac.sagemath.org/sage_trac/ticket/11444|#11444]] optional package cbc-2.3.p2.spkg does not build
 * [[http://trac.sagemath.org/sage_trac/ticket/10981|#10981]] algebraic real field partial_fraction_decomposition bug
 * [[http://trac.sagemath.org/sage_trac/ticket/7879|#7879]] Remove unnecessary signal handling for low prec mpfr operations
 * [[http://trac.sagemath.org/sage_trac/ticket/8896|#8896]] 0.0000000000000000000000000000 is parsed completely differently
 * [[http://trac.sagemath.org/sage_trac/ticket/10635|#10635]] refactor polynomial_element.pyx factor function
 * [[http://trac.sagemath.org/sage_trac/ticket/4949|#4949]] Optionally build spkgs in $SAGE_BUILD_TMPDIR
 * [[http://trac.sagemath.org/sage_trac/ticket/10970|#10970]] Remove pipestatus from spkg/install
 * [[http://trac.sagemath.org/sage_trac/ticket/10271|#10271]] Make big_oh notation work for any element that has degree()
 * [[http://trac.sagemath.org/sage_trac/ticket/5903|#5903]] Remove dist directories from Sage distribution
 * [[http://trac.sagemath.org/sage_trac/ticket/10231|#10231]] Don't repackage examples and extcode on sage-*dist
 * [[http://trac.sagemath.org/sage_trac/ticket/10952|#10952]] better numerical accuracy testing
 * [[http://trac.sagemath.org/sage_trac/ticket/6284|#6284]] fix the numerous broken optional magma doctests
 * [[http://trac.sagemath.org/sage_trac/ticket/8469|#8469]] add "Number Theory and the RSA Public Key Cryptosystem"
 * [[http://trac.sagemath.org/sage_trac/ticket/9487|#9487]] Have an acurate description of what "supported platforms" are
 * [[http://trac.sagemath.org/sage_trac/ticket/9494|#9494]] Add a doctest to benchmark.py
 * [[http://trac.sagemath.org/sage_trac/ticket/10910|#10910]] Avoid nfinit while factoring polynomials
 * [[http://trac.sagemath.org/sage_trac/ticket/10951|#10951]] ecmfactor should take as optional argument the sigma value
 * [[http://trac.sagemath.org/sage_trac/ticket/5187|#5187]] fix optional magma doctests that changed in magma-2.15
 * [[http://trac.sagemath.org/sage_trac/ticket/6315|#6315]] optional doctest failure -- caused by mistakes in lectures
 * [[http://trac.sagemath.org/sage_trac/ticket/11421|#11421]] upgrade optional package NZMATH to version 1.1.0
 * [[http://trac.sagemath.org/sage_trac/ticket/7344|#7344]] New libjpeg package
 * [[http://trac.sagemath.org/sage_trac/ticket/7345|#7345]] New libtiff package
 * [[http://trac.sagemath.org/sage_trac/ticket/9975|#9975]] Update GnuTLS and clean up the package
 * [[http://trac.sagemath.org/sage_trac/ticket/11354|#11354]] remove dist directory from eclib spkg
 * [[http://trac.sagemath.org/sage_trac/ticket/11169|#11169]] Make testcc.sh exit with an exit code of 1 if attempting
 * [[http://trac.sagemath.org/sage_trac/ticket/8321|#8321]] numerical integration with arbitrary precision
 * [[http://trac.sagemath.org/sage_trac/ticket/11036|#11036]] improve solve_mod performance
 * [[http://trac.sagemath.org/sage_trac/ticket/6495|#6495]] build reference manual more quickly
 * [[http://trac.sagemath.org/sage_trac/ticket/7494|#7494]] remove/move the examples directory stuff already
 * [[http://trac.sagemath.org/sage_trac/ticket/6743|#6743]] make more progress on making Sage build automatically on Cygwin

 * [[http://trac.sagemath.org/sage_trac/ticket/4260|#4260]] use LinBox as native matrix representation for dense matrices over GF(p)
 * [[http://trac.sagemath.org/sage_trac/ticket/9562|#9562]] add M4RIE to Sage (== fast linear algebra over GF(2^n) for n in 2..10
 * [[http://trac.sagemath.org/sage_trac/ticket/11574|#11574]] update M4RI
