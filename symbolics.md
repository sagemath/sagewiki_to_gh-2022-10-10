

## Symbolics in Sage

These pages are aimed at developers of symbolics functionality in Sage. If you're interested in helping out with any of the items below please contact the <a class="http" href="http://groups.google.com/group/sage-devel">sage-devel googlegroup</a> or the people already working on your item of interest.  
For more up-to-date information, see the <a class="http" href="http://trac.sagemath.org/wiki/symbolics">trac wiki page on symbolics</a>.


### TODO

* Integration 
   * <a class="http" href="http://www-sop.inria.fr/cafe/Manuel.Bronstein/pmint/index.html">Poor man's integrator</a> 
      * Minh Van Nguyen is working on this. 
   * <a class="http" href="http://books.google.at/books?id=9fOUwkkRxT4C&amp;pg=PR2&amp;hl=en#PPA473,M1">A summary of heuristics used in Maple</a> from Algorithms in Computer Algebra by Geddes, Czapor and Labahn 
   * A survey by Keith Geddes: <a class="http" href="http://www.cs.uwaterloo.ca/~kogeddes/papers/Integration/IntSurvey.html">Algorithms for Indefinite and Definite Integration in Maple</a>  
   * Heuristics from maxima (relevant parts of the <a class="http" href="http://maxima.sourceforge.net/docs/manual/en/maxima_20.html#Item_003a-integrate">maxima manual</a> have some documentation) 
   * Transcendental Risch (from <a class="http" href="http://www-sop.inria.fr/cafe/Manuel.Bronstein/publications/symbint1.html">Bronstein's book</a>) 
* Solve 
   * <a class="http" href="http://www.unk.edu/uploadedFiles/facstaff/profiles/willisb/solve-talk(3).pdf">Talk by Barton Willis</a> on Maxima's to_poly solve function 
   * <a class="http" href="http://maxima.cvs.sourceforge.net/viewvc/maxima/maxima/share/contrib/rtest_to_poly_solver.mac?view=markup">test suite</a> for Maxima's to_poly solver 
* Limits 
* Differential equation solver 
   * documentation of <a class="http" href="http://www-sop.inria.fr/cafe/Manuel.Bronstein/sumit/sumit.html">Sum^it library</a> might be useful 
* Basic simplification routines 
   * trig 
   * radical 
   * rational 
   * binomial/factorial? 
      * <a class="http" href="http://maxima.sourceforge.net/docs/manual/en/maxima_93.html#Category_003a-Simplification-functions">maxima documentation</a> 
* Transforms 
   * laplace, inverse_laplace, hilbert, mellin, etc. 
   * Some discussion on the sage-support list in <a class="http" href="http://groups.google.com/group/sage-support/browse_thread/thread/7b48e5dbd06f9f46">this thread</a>. 
* Orthogonal polynomials 
   * The orthogonal polynomials defined by sage in the module `sage.functions.orthogonal_polys` are wrappers to maxima, we should provide native implementations of these, preferably with an argument to specify the parent of the resulting polynomial 
      * Stefan Reiterer (<a href="mailto:stefan.reiterer@uni-graz.at">stefan.reiterer@uni-graz.at</a>) is working on this 
Some of the functionality listed above is provided by Maxima wrappers at the moment. 

* Summation 
   * Burcin Erocal (<a href="mailto:burcin@erocal.org">burcin@erocal.org</a>) is working on this 
* Hypergeometric functions 
   * <a class="http" href="http://www.mat.univie.ac.at/~kratt/hyp_hypq/hyp.html">HYP</a> from Christian Krattenthaler for MMA 
   * <a class="http" href="http://www-igm.univ-mlv.fr/~gauthier/HYPERG.html">HYPERG</a> from Bruno Gauthier for Maple 
      * This should let us do the following: 
$$\sum_{s \ge m} {s \choose m} \frac{(n)_s}{(\frac{n}{2} + 1)_s 2<sup>{s}} = \frac{(n)_m}{2</sup>{m}(\frac{n}{2}+1)_m} \,_2 F_1 \left( \begin{array}{cc} m+1, m+n \\ m+ \frac{n}{2} +1 \end{array} ; \frac{1}{2} \right) = \frac{2^{n-1} \Gamma(\frac{n}{2} +1) \Gamma(\frac{m}{2} + \frac{n}{2})}{\Gamma(\frac{m}{2} + 1)\Gamma(n)}$$ 

* Meijer G-Functions 
* Generating functions 
   * This is a building block for many things. A prerequisite for this is linear algebra over polynomial rings, Burcin Erocal is working on this. 
   * <a class="http" href="http://algo.inria.fr/libraries/">gfun</a> by Bruno Salvy and Paul Zimmermann included in Maple 
   * <a class="http" href="http://www.risc.uni-linz.ac.at/research/combinat/software/GeneratingFunctions/index.php">GeneratingFunctions</a> by Christian Mallinger for MMA 