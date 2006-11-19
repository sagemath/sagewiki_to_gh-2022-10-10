== Ideas for Software to Integrate with SAGE ==
This is a list of programs and packages for mathematics that might possibly be included with or at least have an interface with SAGE someday.

 * [http://control.ee.ethz.ch/~hpeyrl/Projects/SOS/rational_sos.php Sums of Squares via Macaulay2]. This is related to http://www.cds.caltech.edu/sostools/
 * http://www.4ti2.de/ --  A software package for algebraic, geometric and combinatorial problems on linear spaces; I (=william) have made optional SAGE packages for this and written a very preliminary interface.  This depends on a linear programming package, which SAGE needs.
 * http://www.gnu.org/software/glpk/ -- Linear programming.  It's 1MB, and very easy to build.
 * http://www-sop.inria.fr/galaad/software/synaps/ -- It's a GPL'd C++ library for doing numerical and algebraic stuff together and seems mature.  It requires FORTRAN and is very hard to build.  I skimmed some source code and it seemed relatively readable at first glance, and maybe there is something useful in there.   It's focused on numerical over algebraic.
 * http://yacas.sourceforge.net/ --   		YACAS is an easy to use, general purpose Computer Algebra System. It uses 		its own programming language (a sort of Lisp dialect) designed for symbolic as well as 		arbitrary-precision numerical computations (it can be linked to GMP library). YACAS comes with 		extensive documentation (320+ pages) covering the scripting language, 		the functionality that is already implemented in the system, and the 		algorithms used.
 * [http://sage.math.washington.edu:9001/graph_survey NetworkX] (graph theory).
 * [http://servus.math.su.se/bergman/ Bergman] (non-commutative Groebner bases).
 * [http://www.mathe2.uni-bayreuth.de/axel/symneu_engl.html Symmetrica] (combinatorial representation theory).

== Software that is free and tries to do what SAGE does ==
 * http://www.mathemagix.org/mmxweb/web/welcome.en.html -- Their overall goal is very similar to SAGE's.  However, they make different design choices than we have with SAGE in almost every way:
  * They build everything around [http://www.texmacs.org/ texmacs], which is a "beautiful" yet aggravating program.
  * They use C++ *very* very heavily.
  * They write their own new custom interpreter language for mathematics (though they describe it as general purpose, and strongly emphasize it shouldn't be for just math).
