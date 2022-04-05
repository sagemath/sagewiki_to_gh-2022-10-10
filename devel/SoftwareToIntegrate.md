## page was renamed from Software
== Ideas for Software to Integrate with Sage ==
This is a list of programs and packages for mathematics that might possibly be included with or at least have an interface with Sage someday.

 * [[http://control.ee.ethz.ch/~hpeyrl/Projects/SOS/rational_sos.php|Sums of Squares via Macaulay2]]. This is related to http://www.cds.caltech.edu/sostools/
 * http://www-sop.inria.fr/galaad/software/synaps/ -- It's a GPL'd C++ library for doing numerical and algebraic stuff together and seems mature.  It requires FORTRAN and is very hard to build.  I skimmed some source code and it seemed relatively readable at first glance, and maybe there is something useful in there.   It's focused on numerical over algebraic.
 * http://www.yacas.org/ --   		YACAS is an easy to use, general purpose Computer Algebra System. It uses 		its own programming language (a sort of Lisp dialect) designed for symbolic as well as 		arbitrary-precision numerical computations (it can be linked to GMP library). YACAS comes with 		extensive documentation (320+ pages) covering the scripting language, 		the functionality that is already implemented in the system, and the 		algorithms used.
 * [[http://servus.math.su.se/bergman/|Bergman]] (non-commutative Groebner bases).
 * [[http://www.mit.edu/~ibaran/kseg.html|kseg]] (dynamic Euclidean geometry, a la Geometer's Sketchpad; relevant for educational users). (This is [[http://packages.debian.org/changelogs/pool/main/k/kseg/kseg_0.4.0.3-2/kseg.copyright|GPLV2+]])
 * [[http://www-swiss.ai.mit.edu/~gjs/6946/linux-install.htm|scmutils]], an MIT-Scheme package for symbolic manipulation, mostly with differential geometry. Created for the [[http://www-swiss.ai.mit.edu/~gjs/6946/sicm-html/index.html|SICM]]: Structure and Interpretation of Classical Mechanics course
 * [[http://cristal.univ-lille.fr/~boulier/pmwiki/pmwiki.php/Main/BLAD|blad]]: BLAD is an acronym standing for Bibliothèques Lilloises d'Algèbre Différentielle. BLAD is actually sort of a standalone C analogue of the MAPLE diffalg package. BLAD is LGPL. 

== Software that is free and tries to do what Sage does ==
 * http://www.mathemagix.org/mmxweb/web/welcome.en.html -- Their overall goal is very similar to Sage's.  However, they make different design choices than we have with Sage in almost every way:
  * They build everything around [[http://www.texmacs.org/|texmacs]], which is a "beautiful" yet aggravating program.
  * They use C++ *very* very heavily.
  * They write their own new custom interpreter language for mathematics (though they describe it as general purpose, and strongly emphasize it shouldn't be for just math).
