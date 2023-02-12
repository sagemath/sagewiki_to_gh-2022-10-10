

# Implement multivariate factorization over finite fields

<a class="http" href="http://magma.maths.usyd.edu.au/magma/htmlhelp/text315.htm">This page</a> is very important:   In case they delete it, it says: 
```txt
For bivariate polynomials, a polynomial-time algorithm in the same spirit as van Hoeij's Knapsack factoring algorithm [vH02] is used.

For polynomials over the integers or rationals, an algorithm similar to that presented in [Wan78] and [GCL92, section 6.8], based on evaluation and sparse ideal-adic multivariate Hensel lifting, is used.

For polynomials over any finite field, a similar algorithm is used, with a few special modifications for non-zero characteristic (see, for example, [BM97]).

For polynomials over algebraic number fields and affine algebras, a multivariate version of the norm-based algorithm of Trager [Tra76] is used, which performs a suitable substitution and multivariate resultant computation, and then factors the resulting integral multivariate polynomial.

Each of these algorithms reduces to univariate factorization over the base ring; for details of how this factorization is done in each case, see the function Factorization in the univariate polynomial rings chapter.
```