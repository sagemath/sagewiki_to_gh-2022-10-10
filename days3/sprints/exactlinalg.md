=  William Stein: Optimized exact sparse and dense linear algebra (especially for computing modular forms) =
== Tasks ==

 * Finish writing sage/matrix/benchmark.py
 * Create some modular symbols benchmarks.
 * Sparse matrices over QQ (fast). 
 * Basic matrix arithmetic speed ups:
     * copy, compare, negation, etc. 

== Notes ==

[:LinBox/LinBox: tips for using Linbox]

== Benchmarks ==
From sage-2.1.2 do 
{{{
   import sage.matrix.benchmark as b
   b.[tab]
}}}
to see some of the benchmarks that we would like to optimize.  Currently exact linear
algebra in SAGE is still, in some cases, a serious embarrassment. 

== Matrix multiplication over ZZ ==

Robert Bradshaw implemented multimodular matrix multiply over ZZ.  
    1. This seems to work fine on 32-bit machines, but is totally broken on 64-bit machines, so is currently disabled (in sage-2.1.2).
    2. It is interesting to fine tune the algorithm, and decide when to switch over to a multimodular method.
    3. Why is this so much '''slower''' than linbox? 
    4. Why is it slower than MAGMA? (How much slower?)

== Charpoly and minpoly over ZZ ==

The linbox versions *sometimes* hang on 32-bit Debian Linux 9with libgslcblas) and on sage.math, so are disabled in the sage-2.1.2.  The seem to work perfectly on OS X and other LInux installs. 

=== Smith Normal Form ===

The SmithForm (or invariant factors) algorithm, which gives the invariant factors, is literally a hundred times slower than MAGMA. 
It's even slower than PARI for small n.

=== IML -- Integer Matrix Library ===

This has optimized dense echelon form over finite fields and a very fast implementation of the p-adic nullspace algorithm (which is very useful for echelon forms over QQ!).  Problems:

   1. the p-adic nullspace algorithm is only implemented for matrices whose entries are C long's.  But looking at the source code very strongly suggests it could easily be extended to the general case.

   2. IML currently depends on atlas, so we have to rewrite it so it doesn't.  This is probably not too hard. 
