 * ''Goal'' -- Define Hensel lifting for roots and factorizations of polynomials over Henselian rings.
 * ''Type'' -- basic features
 * ''Priority'' -- High
 * ''Difficulty'' -- Medium-Easy
 * ''Prerequisites'' -- [[../PolynomialPrecision | p-adic polynomial precision]]
 * ''Background'' -- 
 * ''Contributors'' -- David Roe
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

This is easy once the implementation of polynomials stabilizes...

== Tasks ==

 1. Write a category HenslianRings (or maybe HenselianRingsWithUniformizer) as a place to write C2-C5.

 1. Write a function that lifts a root of a polynomial (defined to sufficient precision) up one precision.

 1. Write a function that lifts a root of a polynomial (defined to sufficient precision) to double precision.

 1. Write a function that lifts a coprime factorization up one precision.

 1. Write a function that lifts a coprime factorization to double precision.

 1. Write functions that determine precisions of the resulting objects given the precision of the original polynomial.

 1. Write optimized versions of C1-C4 for polynomials over Zp and Qp.
