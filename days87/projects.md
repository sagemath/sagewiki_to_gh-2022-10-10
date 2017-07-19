<<TableOfContents>>

A list of tickets we're working on can be found [[https://trac.sagemath.org/query?keywords=~sd87&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|here]].  If you work on a ticket, please add `sd87` to the list of keywords so that it appears!

Most of the code for working with p-adics can be found [[https://git.sagemath.org/sage.git/tree/src/sage/rings/padics|here]] and [[https://git.sagemath.org/sage.git/tree/src/sage/libs/linkages/padics|here]] if you want to browse.

== Big Sage projects ==

 * Add general extensions of p-adic fields in Sage [[https://trac.sagemath.org/ticket/23218|#23218]] (David Roe)
 * Add Julian's Mac Lane package which provides a general framework for discrete valuations to Sage [[https://trac.sagemath.org/ticket/21869|#21869]] (Julian)
 * Add Julian's Completion package, for general p-adic extension backed by number fields, to Sage [[https://trac.sagemath.org/ticket/22956|#22956]] (Julian)
 * Polynomial factorization, using Julian's Mac Lane package and/or Brian Sinclair's ticket [[https://trac.sagemath.org/ticket/12561|#12561]] (Brian - meeting in UHS 115)
  * make sure simpler factoring methods are in good shape, like Hensel lifting and Panayi's root finding.
 * Precision models for p-adic matrices, polynomials (Xavier)
  * implement Smith normal form [[https://trac.sagemath.org/ticket/23450|#23450]] (ticket ready for review), Hermite normal form
  * implement classes for lattices in p-adic vector spaces
 * Power series via p-adic templates (Adriana)
 * Linkage files for p=2 and/or using longs for the case that $p^{\text{prec}} < 2^{62}$
 * Implementation of Gröbner bases and tropical Gröbner bases algorithm (F4, F5, FGLM), doctest and submission (Tristan)
  * We might finish reviewing the inclusion of openf4 at [[https://trac.sagemath.org/ticket/18749|#18749]] and patch it to avoid going through strings all the time
  * And also look at the performance of Singular, polybori, giac, ...
 * Zeta function tickets [[https://trac.sagemath.org/ticket/20264|#20264]], [[https://trac.sagemath.org/ticket/20265|#20265]], [[https://trac.sagemath.org/ticket/19865|#19865]] (Edgar)
 * Roadmap for regular models in Sage using Mac Lane package, [[http://www-personal.umich.edu/~psuchand/projects.html|Suchandan Pal's code]] and Stefan Wewers' work. (Julian)
 * Etale algebras (maybe see also ticket [[https://trac.sagemath.org/ticket/21413|#21413]]) (Ricky)
 * For an old list of possible projects, see [[padics]]

== Smallish Sage projects ==

 * Norms, traces, frobenius, matrix mod pn for relative p-adic extensions (David)
 * Add more black-box testing to p-adics, performance benchmarketing (Aly)
 * nth roots, square roots that create extensions (extend=True as for integers) [[https://trac.sagemath.org/ticket/12567|#12567]] (Marc)
 * Artin-Hasse exponentials [[https://trac.sagemath.org/ticket/12560|#12560]] (Xavier)
 * Gauss sums via the Gross-Koblitz formula, which uses code on p-adic gamma functions (Adriana)
 * Better coercion/conversion to and from residue fields (Aly, Marc)
 * Optimized implementation of Frobenius automorphism [[https://trac.sagemath.org/ticket/12657|#12657]] (Ander)
 * p-adic polylogarithms [[https://trac.sagemath.org/ticket/20260|#20260]] (Alex)
 * bug in matrix of Frobenius when p = 3 [[https://trac.sagemath.org/ticket/11960|#11960]] (Jen)
 * Switching to exact defining polynomials for p-adic extensions [[https://trac.sagemath.org/ticket/23331|#23331]] (David)
 * Change p-adic constructors to not care about the base ring of a defining polynomial [[https://trac.sagemath.org/ticket/18606|#18606]] (David)
 * Investigate slowness in unramified extensions [[https://trac.sagemath.org/ticket/23172|#23172]] (Xavier)
 * Review Xavier's fast exponential code [[https://trac.sagemath.org/ticket/23235|#23235]] (Xavier)
 * Ray class groups and Hecke characters [[https://trac.sagemath.org/ticket/15829|#15829]] (Rob)
 * Add Monge-reduction for Eisenstein polynomials (first over $\mathbb{Q}_p$, then over unramified extensions) (Sebastian)
 * Generic zeta function method for schemes [[https://trac.sagemath.org/ticket/20308|#20308]] (Edgar)
 * Elliptic curve point counting over F_q using PARI [[https://trac.sagemath.org/ticket/16931|#16931]] (J-P Flori)
 * Expose PARI code for Frobenius matrix on hyperelliptic curves [[https://trac.sagemath.org/ticket/20309|#20309]] (Marc)
 * Raise coverage of schemes/hyperelliptic_curves/monsky_washnitzer.py to 100% [[https://trac.sagemath.org/ticket/15645|#15645]] (Edgar)
 * Requested by Anna Haensch: A weak approximation function

== Beginner Sage projects ==

 * Change root_field to return a p-adic field [[https://trac.sagemath.org/ticket/14893|#14893]], [[https://trac.sagemath.org/ticket/20244|#20244]] (Aly)
 * Update and improve the p-adic tutorial (Rob)
 * Add more thematic tutorials in number theory (Rob)

== LMFDB projects ==
 * Fix polredabs related issues https://github.com/LMFDB/lmfdb/issues/2135  (JJ)
 * Display Hecke eigenvalues in terms of an integral basis. See: https://github.com/LMFDB/lmfdb/issues/975 (note see also https://github.com/LMFDB/lmfdb/issues/2135 and talk to JJ for how it is related) (Edgar, Sam Schiavone) 
 * Work on the isogeny classes of abelian varieties over finite fields. See http://beta.lmfdb.org/Variety/Abelian/Fq/ (Christelle)
 * Work on Hypergeometric Motives over ℚ. See http://beta.lmfdb.org/Motive/Hypergeometric/Q/ (Dave Roberts)
 * Finish up: https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017, precisely: https://github.com/LMFDB/lmfdb/issues/414, https://github.com/LMFDB/lmfdb/issues/418, and https://github.com/LMFDB/lmfdb/issues/396 (Edgar)
 * --(Sanitize API interface: https://github.com/LMFDB/lmfdb/issues/2053 (Edgar) )--
 * Prototype a Sage/LMFDB interface. See https://github.com/LMFDB/lmfdb/issues/1360  and https://github.com/LMFDB/lmfdb/issues/2169 (Edgar, Simon Brandhorst and David Lowry-Duda)
 * Use Monge-reduced polynomials (and ones related to them) for defining polynomials (JJ)
 * Hecke algebras: see https://github.com/sanni85/HeckeAlgebras and https://github.com/sanni85/lmfdb/tree/hecke_alg (Anni)
 * Dirichlet characters modulo l: see https://github.com/sanni85/Dirichlet_modL (Anni)
 * Galois representations modulo l: see https://github.com/sanni85/Mod-l-galois-representations and http://beta.lmfdb.org/Representation/Galois/ModL/ (Anni)
 * Display local algebras (JJ)
 * Better handling of character tables (JJ)
