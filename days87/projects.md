== Big Sage projects ==

 * Add general extensions of p-adic fields in Sage [[https://trac.sagemath.org/ticket/23218|#23218]]
 * Add Julian's Mac Lane package to Sage [[https://trac.sagemath.org/ticket/21869|#21869]]
 * Add Julian's Completion package to Sage [[https://trac.sagemath.org/ticket/22956|#22956]]
 * Polynomial factorization, using Julian's Mac Lane package and/or Brian Sinclair's ticket [[https://trac.sagemath.org/ticket/12561|#12561]]
  * make sure simpler factoring methods are in good shape, like Hensel lifting and Panayi's root finding.
 * Precision models for p-adic matrices, polynomials
 * Power series via p-adic templates
 * Linkage files for p=2 and/or using longs for the case that $p^{\text{prec}} < 2^{62}$
 * Implementation of Gröbner bases and tropical Gröbner bases algorithm (F4, F5, FGLM), doctest and submission
  * We might finish reviewing the inclusion of openf4 at [[https://trac.sagemath.org/ticket/18749|#18749]] and patch it to avoid going through strings all the time
  * And also look at the performance of Singular, polybori, giac, ...
 * Zeta function tickets [[https://trac.sagemath.org/ticket/20264|#20264]], [[https://trac.sagemath.org/ticket/20265|#20265]]
 * Roadmap for regular models in Sage using Mac Lane package, [[http://www-personal.umich.edu/~psuchand/projects.html|Suchandan Pal's code]] and Stefan Wewers' work.
 * Etale algebras
 * For an old list of possible projects, see [[padics]]

== Smallish Sage projects ==

 * Norms, traces, frobenius, matrix mod pn for relative p-adic extensions
 * Add more black-box testing to p-adics, performance benchmarketing
 * nth roots, square roots that create extensions (extend=True as for integers) [[https://trac.sagemath.org/ticket/12567|#12567]]
 * Artin-Hasse exponentials [[https://trac.sagemath.org/ticket/12560|#12560]]
 * p-adic gamma functions
 * Better coercion/conversion to and from residue fields
 * Optimized implementation of Frobenius automorphism [[https://trac.sagemath.org/ticket/12657|#12657]]
 * p-adic polylogarithms [[https://trac.sagemath.org/ticket/20260|#20260]]
 * bug in matrix of Frobenius when p = 3 [[https://trac.sagemath.org/ticket/11960|#11960]]
 * Switching to exact defining polynomials for p-adic extensions [[https://trac.sagemath.org/ticket/23331|#23331]]
 * Change p-adic constructors to not care about the base ring of a defining polynomial [[https://trac.sagemath.org/ticket/18606|#18606]]
 * Investigate slowness in unramified extensions [[https://trac.sagemath.org/ticket/23172|#23172]]
 * Review Xavier's fast exponential code [[https://trac.sagemath.org/ticket/23235|#23235]]
 * Ray class groups and Hecke characters [[https://trac.sagemath.org/ticket/15829|#15829]]
 * Add Monge-reduction for Eisenstein polynomials (first over $\mathbb{Q}_p$, then over unramified extensions)

== Beginner Sage projects ==

 * Change root_field to return a p-adic field [[https://trac.sagemath.org/ticket/14893|#14893]], [[https://trac.sagemath.org/ticket/20244|#20244]]
 * Update and improve the p-adic tutorial
 * Add more thematic tutorials in number theory
 
== LMFDB projects ==

 * Display Hecke eigenvalues in terms of an integral basis. See: https://github.com/LMFDB/lmfdb/issues/975 (note see also https://github.com/LMFDB/lmfdb/issues/2135 and talk to JJ for how it is related)
 * Work on the isogeny classes of abelian varieties over finite fields. See http://beta.lmfdb.org/Variety/Abelian/Fq/
 * Work on Hypergeometric Motives over ℚ. See http://beta.lmfdb.org/Motive/Hypergeometric/Q/
 * Finish up: https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017, precisely: https://github.com/LMFDB/lmfdb/issues/414, https://github.com/LMFDB/lmfdb/issues/418, and https://github.com/LMFDB/lmfdb/issues/396
 * Sanitize API interface: https://github.com/LMFDB/lmfdb/issues/2053
 * Prototype a Sage/LMFDB interface. See https://github.com/LMFDB/lmfdb/issues/1360  and https://github.com/LMFDB/lmfdb/issues/2169
 * Use Monge-reduced polynomials (and ones related to them) for defining polynomials
 * Hecke algebras: see https://github.com/sanni85/HeckeAlgebras and https://github.com/sanni85/lmfdb/tree/hecke_alg
 * Dirichlet characters modulo l: see https://github.com/sanni85/Dirichlet_modL
 * Galois representations modulo l: see https://github.com/sanni85/Mod-l-galois-representations and http://beta.lmfdb.org/Representation/Galois/ModL/ 
