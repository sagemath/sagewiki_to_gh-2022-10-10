== William Stein ==

http://sage.math.washington.edu


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

------------------------------------------------------------------

== Working On ==

Getting SAGE-1.5 released.

Mostly William S:

 * get rid of mutability for parent structures
 * Make all (most) parent structures unique 
 * Get rid of the R.< > = PolynomialRing ... notation (fix lots of doctests)
 * Matrices - implement all the classes using the new carefully *designed* structure.
 * (for matrices)  -- the coverage is bad (write way more doctests).

Mostly David H:
 * extend what I've been working on to ModuleElement, including _sub_ and _neg_
 * then do _mul_, with fast pathways for both algebra and ring multiplication
 * use polynomials as a testbed, i.e. give them proper scalar multiplication semantics
 * after lots of discussion, a fairly hefty rewrite of the coercion module, both to clarify exactly what's supposed to happen, and also to aim for greater efficiency
