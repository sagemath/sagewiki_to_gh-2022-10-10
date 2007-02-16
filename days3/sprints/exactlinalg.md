=  William Stein: Optimized exact sparse and dense linear algebra (especially for computing modular forms) =

== Issues to address ==

 * Robert Bradshaw implemented multimodular matrix multiply over ZZ.  
    1. This seems to work fine on 32-bit machines, but is totally broken on 64-bit machines, so is currently disabled (in sage-2.1.2).
    2. It is interesting to fine tune the algorithm, and decide when to switch over to a multimodular method.
    3. Why is this so much '''slower''' than linbox? 
    4. Why is it slower than MAGMA? (How much slower?)

 * Linbox: Charpoly and minpoly over ZZ.
    1. They hang on 32-bit Debian Linux and on sage.math, so are disabled in the sage-2.1.2.

== Benchmarks to help direct our work ==

=== New code written from scratch in C/SageX/Python ===

=== IML -- Integer Matrix Library ===

=== Linbox ===

The SmithForm (or invariant factors) algorithm, which gives the invariant factors, is literally a hundred times slower than MAGMA. 
