== Symbolics in Sage ==

These pages are aimed at developers of symbolics functionality in Sage. If you're interested in helping out with any of the items below please contact the [[http://groups.google.com/group/sage-devel|sage-devel googlegroup]] or the people already working on your item of interest.

=== Pynac and Maxima based symbolics ===

Most symbolics functionality in Sage relies on [[http://maxima.sf.net|Maxima]]. While Maxima is a very mature and capable software package, there are some problems with using it in Sage. Namely,
  * the pexpect interface to Maxima is slow, and
  * Sage developers cannot fix problems in Maxima or enhance its functionality.

To provide a better framework for symbolics in Sage, and to make implementation of new symbolics functionality that relies on components of Sage easier; we created a fork of the C++ library [[http://www.ginac.de|GiNaC]], called Pynac, which works with Python types. There are still some low level changes required in Pynac before it can be used as a basis for symbolics in Sage, we keep track of these at the [[symbolics/pynac_todo|Pynac todo list]].

With the switch to Pynac based symbolics, it will be possible to implement native functionality in Sage. Here is a brief list of areas that need work.

=== TODO ===

 * Integration
  * [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/pmint/index.html|Poor man's integrator]]
  * Heuristics from maxima (relevant parts of the [[http://maxima.sourceforge.net/docs/manual/en/maxima_20.html#Item_003a-integrate|maxima manual]] have some documentation)
  * Transcendental Risch (from [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/publications/symbint1.html|Bronstein's book]])

 * Solve

 * Limits

 * Differential equation solver
  * documentation of [[http://www-sop.inria.fr/cafe/Manuel.Bronstein/sumit/sumit.html|Sum^it library]] might be useful

 * Basic simplification routines
  * trig
  * radical
  * rational
  * binomial/factorial?
   [[http://maxima.sourceforge.net/docs/manual/en/maxima_93.html#Category_003a-Simplification-functions|maxima documentation]]

Some of the functionality listed above is provided by Maxima wrappers at the moment.

 * Summation
  * Burcin Erocal (burcin@erocal.org) is working on this

 * Hypergeometric functions
  * [[http://www.mat.univie.ac.at/~kratt/hyp_hypq/hyp.html|HYP]] from Christian Krattenthaler for MMA
  * [[http://www-igm.univ-mlv.fr/~gauthier/HYPERG.html|HYPERG]] from Bruno Gauthier for Maple
   This should let us do the following:
   $$ \sum_{s \ge m} \binom{s}{m} \frac{(n)_s}{(\frac{n}{2} + 1)_s 2^{s}} = \frac{(n)_m}{2^{
m}(\frac{n}{2}+1)_m} \,_2 F_1 \left( \begin{array}{cc} m+1, m+n \\ m+ \frac{n}{2} +1 \end{array} ; \frac{1}{2} \right) = \frac{2^{n-1} \Gamma(\frac{n}{2} +1) \Gamma(\frac{m}{2} + \frac{n}{2})}{\Gamma(\frac{m}{2} + 1)\Gamma(n)}$$
 * Meijer G-Functions

 * Generating functions
  This is a building block for many things. A prerequisite for this is linear algebra over polynomial rings, Burcin Erocal is working on this.
  * [[http://algo.inria.fr/libraries/|gfun]] by Bruno Salvy and Paul Zimmermann included in Maple
  * [[http://www.risc.uni-linz.ac.at/research/combinat/software/GeneratingFunctions/index.php|GeneratingFunctions]] by Christian Mallinger for MMA

  
