= Sage Days 86.5: PIMS Workshop on Computational Arithmetic Geometry =

June 5-9, 2017, Simon Fraser University, Burnaby, Canada

http://www.cecm.sfu.ca/~nbruin/WCAG2017/

This SageDays/workshop emphasizes on computational arithmetic geometry. So far we have 4 programming projects:

1. Basic arithmetic in function fields

2. Fast point adding on Jacobians of genus 2 imaginary hyperelliptic curves

3. Riemann surfaces: Numerical computation of endomorphism rings

4. P-adic computation in divisor class groups

'''3. Riemann surfaces'''

We have code that implements a "RiemannSurface" class that allows computation of period matrices (currently, Singular is used to compute the basis of differentials). The homology basis is derived from a Voronoi cell decomposition based on the branch locus and monodromy computation uses certified continuation. Integration uses Gauss-Legendre to get accurate integral values.

We compute endomorphism ring generators by using LLL to recognize relations, largely in analogy to what Paul van Wamelen has done for hyperelliptic curves.

Tasks left:

 a. Figure out if, where, and how to integrate this class into Sage

 a. Allow for an alternative option to certified continuation: Heuristically this can be done pretty reliably, and in many cases answers aren't proven anyway, so having unproven monodromy doesn't make much difference. One heuristic would be to try to extrapolate (by order 0 or 1) over a distance that is a given fraction of the distance to the closest singularity and see if Newton iteration for each value converges to a value that's close. If not, halve distance and try again.

 a. Find a good place to put the numerical integration routine. The code presently is basically that of mpmath, but partially cythonized for enhanced performance. High performance, high order integration methods are nice to have ... See also [[https://trac.sagemath.org/ticket/21198|#21198]] for improving fast_callable for multiprecision complex numbers.

 a. Other integration methods: Probably Gauss-Legendre is best for these integrals in terms of number of evaluations, but efficient evaluation schemes for finding the evaluation points (which are zeros of Legendre polynomials) get problematic, meaning that for very high order the precomputation of the evaluation points might become dominant. Clenshaw-Curtis probably needs more evaluation points, but finding which points should be used is a little easier, since the evaluation points are zeros of Chebyshev polynomials, which can be computed more efficiently using a Discrete Cosine Transform (which can be encoded with an FFT). All of this doesn't seem to be available in Sage in multiprecision, but it could lead to high order integration routines with better runtimes.

 a. Find cool examples ...

'''4.P-adic computation in divisor class groups'''

One idea here is to just use characteristic 0 approaches, with some measures to improve numerical stability a bit. For this, the approach taken by Kamal Khuri-Makdisi is perhaps more attractive, because it only needs linear algebra rather than computing polynomial GCDs. There is some code at [[https://trac.sagemath.org/ticket/15113|#15113]] that is a proof of concept, which can be made to work over p-adics as well. Presently, it leaks precision in a horrible way, but this can likely be improved considerably by using pivoting strategies that take numerical stability into account at least a little bit.

We should probably integrate [[https://trac.sagemath.org/ticket/15104|#15104]] as well, because it considerably improves matrix computation over finite fields (a different case).
