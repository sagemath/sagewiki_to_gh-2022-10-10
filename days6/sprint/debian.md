
Legend:  

-- .... doesn't apply 

no .... the package is not in Debian 

yes ... the package is in Debian, sometimes there is more information about it in brackets (i.e. older, newer) 

Tags: 

[OPT] ... this package is optional 

POSTED ... a debian/ directory is available in <a href="http://web.mit.edu/sage/www/debian-dirs/">http://web.mit.edu/sage/www/debian-dirs/</a> 

Debian status for packaging of SAGE: 
```txt
- All new packages still need Copyright information, and a fixed changelog
- Several libdev packages should depend on the library versions.
yes blas-20070724
no  cddlib-094b STATUS: package created; should perhaps have dynamic library; POSTED
yes clisp-2.41.p11
no  conway_polynomials-0.2 STATUS: unpackaged.  I don't know where this should get installed.
yes cvxopt-0.8.2.p4  [0.9-3]
no  cython-0.9.6.8.b STATUS: packaged.; POSTED (also in Lenny)
--  doc-2.8.12 STATUS: no progress
yes ecm-6.1.3
--  elliptic_curves-0.1 STATUS: no progress
--  examples-2.8.12 STATUS: no progress
--  extcode-2.8.12 STATUS: no progress
yes f2c-20070816
no  flint-0.2.p4 STATUS: libflint-dev has no .a file; no soname; POSTED
no  flintqs-20070817.p1 STATUS: packaged; POSTED
yes fortran-20070912
yes freetype-2.1.10
yes gap-4.4.10 [but old version]
yes gd-2.0.33.p5
yes gdmodule-0.56.p4  [python 2.4 only]
no  genus2reduction-0.3 STATUS: packaged; POSTED
no  gfan-0.2.2.p1 STATUS: packaged; POSTED
no  givaro-3.2.6.p3 STATUS: packaged, though based on SAGE upstream.; POSTED
yes gmp-4.2.1.p11
yes gnutls-1.6.3 [better version]
--  graphs-20070722 STATUS: no progress
yes gsl-1.9 [better version, GPLv3]
no  iml-1.0.1.p7 STATUS: packaged; POSTED
yes ipython-0.8.1.p1
no  ipython1-20070130 STATUS: Not essential for SAGE.
no  java3d-20070901 STATUS: Not essential for SAGE. - Has also been been removed and replaced by jmol
yes lapack-20070723
no  lcalc-20070107.p0 STATUS: packaged; though based on SAGE upstream; POSTED
no  libfplll-2.1-20071024 STATUS: packaged; POSTED (as fplll)
yes libgcrypt-1.2.4
yes libgpg_error-1.5
no  linbox-20070915.p1 STATUS: packaged but has automake issues?; based on SAGE upstream
no  linbox-wrap STATUS: blocking on linbox
yes matplotlib-0.90.0.p5 [debian, better]
yes maxima-5.13.0.p1
yes mercurial-0.9.5
yes moin-1.5.7.p1
yes mpfi-1.3.4-rc3.p9 [but old buggy version]
yes mpfr-2.3.0p4 [yes]
no  mwrank-20070913 STATUS: packaged; libmwrank lacks soname; POSTED [replace by eclib]
yes networkx-0.35.1  [same version]
no  ntl-5.4.1.p6 STATUS: Should have doc package?  libntl lacks soname.; POSTED
yes numpy-20070816
yes opencdk-0.5.9  [debian; better version]
no  palp-1.1 STATUS: packaged; POSTED
yes pari-2.3.2.p4
yes pexpect-2.0.p1 [debian; newer crap version]
yes pycrypto-2.0.1.p1 [yes]
yes python-2.5.1.p8
yes python_gnutls-1.1.1
yes quaddouble-2.2.p7 STATUS: In debian with earlier version named qd.
yes readline-5.2
no  sage-2.8.12 STATUS: no progress
no  sage_scripts-2.8.12 STATUS: no progress
yes scipy-20070817
yes scons-0.97
no  singular-3-0-4 STATUS: Fails to configure ...
yes sqlite-3.3.17.p1
no  symmetrica-2.0.p0 STATUS: libsymmetrica-dev package works.  Should package symmetrica itself and a dynamic library too?  Docs? ; POSTED
no  sympow-1.018.1.p3 STATUS: packaged.; POSTED
yes sympy-0.5.6
no  tachyon-0.98beta.p3 STATUS: Not essential for SAGE
yes termcap-1.3.1
yes twisted-2.5.0.p8
yes weave-0.4.9
yes zlib-1.2.3.p2
yes zodb3-3.7.0

New spkgs since 2.8.12
yes r-2.6.1.p14 [in Lenny]
no eclib-20080127
no polybori-0.1-r7
no jmol-11.5.2.p0
no libm4ri-20071224
```
I'm creating a new list below here with links to the packages in Debian: 
 yes  |  <a class="http" href="http://packages.debian.org/gimp">gimp</a>  |  2.4.2-1  |  
 yes  |  <a class="http" href="http://packages.debian.org/maxima">maxima</a>  |  5.13.0-3  |  
 yes  |  <a class="http" href="http://packages.debian.org/lie">lie</a>  |  2.2.2+dfsg-1  |  [OPT] 

Maybe the list could be automatically generated? The version info changes quite often. --Ondrej 

dpkg-awk is a good tool for auto-generating such data. -- Tim 
