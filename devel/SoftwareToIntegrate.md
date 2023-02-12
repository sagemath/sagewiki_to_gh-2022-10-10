

## Ideas for Software to Integrate with Sage

This is a list of programs and packages for mathematics that might possibly be included with or at least have an interface with Sage someday. 

* <a class="http" href="http://control.ee.ethz.ch/~hpeyrl/Projects/SOS/rational_sos.php">Sums of Squares via Macaulay2</a>. This is related to <a href="http://www.cds.caltech.edu/sostools/">http://www.cds.caltech.edu/sostools/</a> 
* <a href="http://www-sop.inria.fr/galaad/software/synaps/">http://www-sop.inria.fr/galaad/software/synaps/</a> -- It's a GPL'd C++ library for doing numerical and algebraic stuff together and seems mature.  It requires FORTRAN and is very hard to build.  I skimmed some source code and it seemed relatively readable at first glance, and maybe there is something useful in there.   It's focused on numerical over algebraic. 
* <a href="http://www.yacas.org/">http://www.yacas.org/</a> --             YACAS is an easy to use, general purpose Computer Algebra System. It uses               its own programming language (a sort of Lisp dialect) designed for symbolic as well as          arbitrary-precision numerical computations (it can be linked to GMP library). YACAS comes with          extensive documentation (320+ pages) covering the scripting language,           the functionality that is already implemented in the system, and the            algorithms used. 
* <a class="http" href="http://servus.math.su.se/bergman/">Bergman</a> (non-commutative Groebner bases). 
* <a class="http" href="http://www.mit.edu/~ibaran/kseg.html">kseg</a> (dynamic Euclidean geometry, a la Geometer's Sketchpad; relevant for educational users). (This is <a class="http" href="http://packages.debian.org/changelogs/pool/main/k/kseg/kseg_0.4.0.3-2/kseg.copyright">GPLV2+</a>) 
* <a class="http" href="http://www-swiss.ai.mit.edu/~gjs/6946/linux-install.htm">scmutils</a>, an MIT-Scheme package for symbolic manipulation, mostly with differential geometry. Created for the <a class="http" href="http://www-swiss.ai.mit.edu/~gjs/6946/sicm-html/index.html">SICM</a>: Structure and Interpretation of Classical Mechanics course 
* <a class="http" href="http://cristal.univ-lille.fr/~boulier/pmwiki/pmwiki.php/Main/BLAD">blad</a>: BLAD is an acronym standing for Bibliothèques Lilloises d'Algèbre Différentielle. BLAD is actually sort of a standalone C analogue of the MAPLE diffalg package. BLAD is LGPL.  

## Software that is free and tries to do what Sage does

* <a href="http://www.mathemagix.org/mmxweb/web/welcome.en.html">http://www.mathemagix.org/mmxweb/web/welcome.en.html</a> -- Their overall goal is very similar to Sage's.  However, they make different design choices than we have with Sage in almost every way: 
   * They build everything around <a class="http" href="http://www.texmacs.org/">texmacs</a>, which is a "beautiful" yet aggravating program. 
   * They use C++ *very* very heavily. 
   * They write their own new custom interpreter language for mathematics (though they describe it as general purpose, and strongly emphasize it shouldn't be for just math). 