== Big Sage projects ==

 * Add general extensions of p-adic fields in Sage [[https://trac.sagemath.org/ticket/23218|#23218]]
 * Add Julian's Mac Lane package to Sage [[https://trac.sagemath.org/ticket/21869|#21869]]
 * Add Julian's Completion package to Sage [[https://trac.sagemath.org/ticket/22956|#22956]]
 * Polynomial factorization, using Julian's Mac Lane package and/or Brian Sinclair's ticket [[https://trac.sagemath.org/ticket/12561|#12561]]
  * make sure simpler factoring methods are in good shape, like Hensel lifting and Panayi's root finding.
 * Precision models for p-adic matrices, polynomials
 * Power series via p-adic templates
 * Linkage files for p=2 and/or using longs for the case that p^prec < 2^62
 * Implementation of Gröbner bases and tropical Gröbner bases algorithm (F4, F5, FGLM), doctest and submission
  * We might finish reviewing the inclusion of openf4 at [[https://trac.sagemath.org/ticket/18749|#18749]] and patch it to avoid going through strings all the time
  * And also look at the performance of Singular, polybori, giac, ...
 * For an old list of possible projects, see [[padics]]

== Smallish Sage projects ==

 * Norms, traces, frobenius, matrix mod pn for relative p-adic extensions
 * Switching to exact defining polynomials for p-adic extensions
 * Add more black-box testing to p-adics, performance benchmarketing
 * nth roots, square roots that create extensions (extend=True as for integers)
 * Artin-Hasse exponentials, p-adic gamma functions
 * Better coercion/conversion to and from residue fields
 * Optimized implementation of Frobenius automorphism [[https://trac.sagemath.org/ticket/12657|#12657]]
 
== LMFDB projects ==

 * Work on the isogeny classes of abelian varieties over finite fields. See http://beta.lmfdb.org/Variety/Abelian/Fq/
 * Work on Hypergeometric Motives over ℚ. See http://beta.lmfdb.org/Motive/Hypergeometric/Q/
 * Finish up: https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017
 * Sanitize API interface: https://github.com/LMFDB/lmfdb/issues/2053
 * Prototype a Sage/LMFDB interface. See https://github.com/LMFDB/lmfdb/issues/1360 
 * Display Hecke eigenvalues in terms of an integral basis. See: https://github.com/LMFDB/lmfdb/issues/975
