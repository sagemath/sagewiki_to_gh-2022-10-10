

# MSRI 2007 Parallel Computation Problem List


## Specific SAGE-related Problems

1. <a href="/msri07/threadsafety">Thread Safety of the SAGE Libraries</a> 
1. <a href="/msri07/pthread_sagex">Add Pthread support to SageX</a> 
1. <a href="/msri07/anlist">Implementation in SAGE parallel computation of elliptic curve a_p for all p up to some bound</a> 
1. <a href="/msri07/matrixadd">Implementation in SAGE matrix ADDITION over the rational numbers (say) using a multithreaded approach.</a> 
1. <a href="/msri07/pointcount">Brute force count points on a variety over a finite field in parallel.</a> 

## Parallel Implementations

For each of the following, make remarks about how **specific practical implementable** parallel algorithms could be used to enhance mathematics software libraries (e.g., SAGE). 

   * Arithmetic in Global Commutative Rings 
            * The ring ${Z}$ of Integers 
            * The ring ${Q}$ of Rational Numbers 
            * Arbitrary Precision Real (and Complex) Numbers 
            * Univariate Polynomial Rings 
            * Number Fields 
            * Multivariate Polynomial Rings 
   * Arithmetic in Local Commutative Rings 
            * Univariate Power series rings 
            * $p$-adic numbers 
   * Linear Algebra 
            * Arithmetic of Vectors 
                           * Addition 
                           * Scalar Multiplication 
                           * Vector times Matrix 
            * Rational reconstruction of a matrix 
            * Echelon form 
                           * Echelon form over Finite Field 
                           * Echelon form over ${Q}$ 
                           * Echelon form over Cyclotomic Fields 
                           * Echelon form (Hermite form) over ${Z}$ 
            * Kernel 
                           * Kernel over Finite Field 
                           * Kernel over ${Q}$ 
                           * Kernel over ${Z}$ 
            * Matrix multiplication 
                           * Matrix multiplication over Finite Fields 
                           * Matrix multiplication over ${Z}$ 
                           * Matrix multiplication over Extensions of ${Z}$ 
   * Noncommutative Rings 
   * Group Theory 
   * Groebner Basis Computation 
   * Elliptic Curves 
            * Generic elliptic curve operations 
                           * Group Law 
                           * Invariants 
                           * Division Polynomials 
            * Elliptic curves over finite fields 