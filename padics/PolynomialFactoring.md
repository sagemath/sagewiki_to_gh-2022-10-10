 * ''Goal'' -- Implement algorithms for factoring polynomials over local fields.  Define extensions of local fields using any polynomial.
 * ''Type'' -- basic features
 * ''Priority'' -- High
 * ''Difficulty'' -- High
 * ''Prerequisites'' -- [[../PolynomialPrecision | p-Adic polynomial precision]] and [[../HenselLifting | Hensel lifting]].  In addition, the second half of the project depends on [[../GeneralExtensions | General extension rings]]
 * ''Background'' -- Hensel lifting, newton polygons, p-adic factoring algorithms.
 * ''Contributors'' -- David Roe, Sebastian Pauli, Brian Sinclair
 * ''Progress'' - 
 * ''Related Tickets'' -- [[http://trac.sagemath.org/sage_trac/ticket/12561|#12561]]

== Discussion ==

== Tasks ==

 1. Implement round 4 (or some other p-adic factoring algorithm) for polynomials over Zp.  Compare results against results from pari.  Find right precisions for factors.

 1. Write functions to extract the unramified and Eisenstein pieces from an irreducible polynomial over Zp using the internals of the factoring algorithm.

 1. Write a new p-adic parent class and printer that allows the "generator" of an extension to be arbitrary (rather than a uniformizer for an Eisenstein extension).

 1. Change the extension factory in `sage.rings.padics.factory` to allow creation of such extensions.

 1. Implement factoring for polynomials over other Henselian rings.
