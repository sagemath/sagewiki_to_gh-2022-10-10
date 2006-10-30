== William Stein ==
http://sage.math.washington.edu

== Working On ==
Getting SAGE-1.5 released.

 1. New PolynomialRing constructor code
    Get rid of the R.< > = PolynomialRing ... notation (fix lots of doctests)
 1. Make all (most) parent structures unique.
 1. Matrices - implement all the classes using the new carefully *designed* structure.
 1. (for matrices)  -- the coverage is bad (write way more doctests).


Mostly David H:

 1. extend what I've been working on to ModuleElement, including _sub_ and _neg_
 1. then do _mul_, with fast pathways for both algebra and ring multiplication
 1. use polynomials as a testbed, i.e. give them proper scalar multiplication semantics
 1. after lots of discussion, a fairly hefty rewrite of the coercion module, both to clarify exactly what's supposed to happen, and also to aim for greater efficiency
----------

== Programming ==
 * Modular forms
 * Optimization of exact linear algebra
 * Modular abelian varieties
 * p-adic Modular Forms
 * p-adic L-functions
 * Quaternion algebra arithmetic
== Non-programming ==
 * Fund raising
 * Documentation
 * Organizing workshops
