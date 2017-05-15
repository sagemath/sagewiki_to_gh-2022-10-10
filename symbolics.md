== Symbolics in Sage ==

These pages are aimed at developers of symbolics functionality in Sage. If you're interested in helping out with any of the items below please contact the [[http://groups.google.com/group/sage-devel|sage-devel googlegroup]] or the people already working on your item of interest. 

||<#FFFF66>For more up-to-date information, see the [[http://trac.sagemath.org/wiki/symbolics|trac wiki page on symbolics]].||


=== TODO ===

 * Integration
  * [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/pmint/index.html|Poor man's integrator]]
   * Minh Van Nguyen is working on this.
  * [[http://books.google.at/books?id=9fOUwkkRxT4C&pg=PR2&hl=en#PPA473,M1|A summary of heuristics used in Maple]] from Algorithms in Computer Algebra by Geddes, Czapor and Labahn
  * A survey by Keith Geddes: [[http://www.cs.uwaterloo.ca/~kogeddes/papers/Integration/IntSurvey.html|Algorithms for Indefinite and Definite Integration in Maple]] 
  * Heuristics from maxima (relevant parts of the [[http://maxima.sourceforge.net/docs/manual/en/maxima_20.html#Item_003a-integrate|maxima manual]] have some documentation)
  * Transcendental Risch (from [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/publications/symbint1.html|Bronstein's book]])

 * Solve
  * [[http://www.unk.edu/uploadedFiles/facstaff/profiles/willisb/solve-talk(3).pdf|Talk by Barton Willis]] on Maxima's to_poly solve function
  * [[http://maxima.cvs.sourceforge.net/viewvc/maxima/maxima/share/contrib/rtest_to_poly_solver.mac?view=markup|test suite]] for Maxima's to_poly solver

 * Limits

 * Differential equation solver
  * documentation of [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/sumit/sumit.html|Sum^it library]] might be useful

 * Basic simplification routines
  * trig
  * radical
  * rational
  * binomial/factorial?
   [[http://maxima.sourceforge.net/docs/manual/en/maxima_93.html#Category_003a-Simplification-functions|maxima documentation]]

 * Transforms
  * laplace, inverse_laplace, hilbert, mellin, etc.
  * Some discussion on the sage-support list in [[http://groups.google.com/group/sage-support/browse_thread/thread/7b48e5dbd06f9f46|this thread]].

 * Orthogonal polynomials
  * The orthogonal polynomials defined by sage in the module `sage.functions.orthogonal_polys` are wrappers to maxima, we should provide native implementations of these, preferably with an argument to specify the parent of the resulting polynomial
   * Stefan Reiterer (stefan.reiterer@uni-graz.at) is working on this

Some of the functionality listed above is provided by Maxima wrappers at the moment.

 * Summation
  * Burcin Erocal (burcin@erocal.org) is working on this

 * Hypergeometric functions
  * [[http://www.mat.univie.ac.at/~kratt/hyp_hypq/hyp.html|HYP]] from Christian Krattenthaler for MMA
  * [[http://www-igm.univ-mlv.fr/~gauthier/HYPERG.html|HYPERG]] from Bruno Gauthier for Maple
   This should let us do the following:
$$\sum_{s \ge m} {s \choose m} \frac{(n)_s}{(\frac{n}{2} + 1)_s 2^{s}} = \frac{(n)_m}{2^{m}(\frac{n}{2}+1)_m} \,_2 F_1 \left( \begin{array}{cc} m+1, m+n \\ m+ \frac{n}{2} +1 \end{array} ; \frac{1}{2} \right) = \frac{2^{n-1} \Gamma(\frac{n}{2} +1) \Gamma(\frac{m}{2} + \frac{n}{2})}{\Gamma(\frac{m}{2} + 1)\Gamma(n)}$$


 * Meijer G-Functions

 * Generating functions
  This is a building block for many things. A prerequisite for this is linear algebra over polynomial rings, Burcin Erocal is working on this.
  * [[http://algo.inria.fr/libraries/|gfun]] by Bruno Salvy and Paul Zimmermann included in Maple
  * [[http://www.risc.uni-linz.ac.at/research/combinat/software/GeneratingFunctions/index.php|GeneratingFunctions]] by Christian Mallinger for MMA

 
