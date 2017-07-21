<<TableOfContents>>

A list of tickets we're working on can be found [[https://trac.sagemath.org/query?keywords=~sd87&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|here]].  If you work on a ticket, please add `sd87` to the list of keywords so that it appears!

Most of the code for working with p-adics can be found [[https://git.sagemath.org/sage.git/tree/src/sage/rings/padics|here]] and [[https://git.sagemath.org/sage.git/tree/src/sage/libs/linkages/padics|here]] if you want to browse.

== Big Sage projects ==

 * Add general extensions of p-adic fields in Sage [[https://trac.sagemath.org/ticket/23218|#23218]] (David Roe)
 * Add Julian's Mac Lane package which provides a general framework for discrete valuations to Sage [[https://trac.sagemath.org/ticket/21869|#21869]] (Julian)
 * Add Julian's Completion package, for general p-adic extension backed by number fields, to Sage [[https://trac.sagemath.org/ticket/22956|#22956]] (Julian)
 * Polynomial factorization, using Julian's Mac Lane package and/or Brian Sinclair's ticket [[https://trac.sagemath.org/ticket/12561|#12561]] (Ticket needs review)
 (Brian - meeting in UHS 115)
  * make sure simpler factoring methods are in good shape, like Hensel lifting and Panayi's root finding.
 * Lattice precision for p-adics (in particular p-adic matrices, polynomials) (Xavier)
  * Smith normal form [[https://trac.sagemath.org/ticket/23450|#23450]] (ready for review), determinant [[https://trac.sagemath.org/ticket/23478|#23478]] (ready for review)
  * Hermite normal form [[https://trac.sagemath.org/ticket/23486|#23486]] (ready for review)
  * Lattices in p-adic vector spaces: this is handled by the generic code for modules over PID (after the implementation of HNF above and this simple ticket [[https://trac.sagemath.org/ticket/23503|#23503]])
  * Design a framework for lattice precision [[https://trac.sagemath.org/ticket/23505|#23505]]
 * Power series via p-adic templates (Adriana)
 * Linkage files for p=2 and/or using longs for the case that $p^{\text{prec}} < 2^{62}$
 * Implementation of Gröbner bases and tropical Gröbner bases algorithm (F4, F5, FGLM), doctest and submission (Tristan). A ticket on F5 has been posted ([[https://trac.sagemath.org/ticket/23461|#23461]], needs review). A ticket on a Tropical F5 is in progress ([[https://trac.sagemath.org/ticket/23501|#23501]]).
  * We might finish reviewing the inclusion of openf4 at [[https://trac.sagemath.org/ticket/18749|#18749]] and patch it to avoid going through strings all the time
  * And also look at the performance of Singular, polybori, giac, ...
 * Zeta function tickets 
  * [[https://trac.sagemath.org/ticket/20264|#20264]] (Edgar, Vishal Aru, Nicholas Triantafillou)
  * [[https://trac.sagemath.org/ticket/20265|#20265]] (Edgar, JP) 
  * [[https://trac.sagemath.org/ticket/19865|#19865]] 
 * Roadmap for regular models in Sage using Mac Lane package, [[http://www-personal.umich.edu/~psuchand/projects.html|Suchandan Pal's code]] and Stefan Wewers' work. (Julian)
 * Etale algebras (maybe see also ticket [[https://trac.sagemath.org/ticket/21413|#21413]]) (Ricky)
 * For an old list of possible projects, see [[padics]]

== Smallish Sage projects ==

 * Norms, traces, frobenius, matrix mod pn for relative p-adic extensions (David)
 * Add more black-box testing to p-adics, performance benchmarketing (Aly)
 * nth roots, square roots that create extensions (extend=True as for integers) [[https://trac.sagemath.org/ticket/12567|#12567]] (Marc, David)
 * Artin-Hasse exponentials [[https://trac.sagemath.org/ticket/12560|#12560]] (Xavier)
 * --(Gauss sums via the Gross-Koblitz formula, which uses code on p-adic gamma functions [[https://trac.sagemath.org/ticket/23456|#23456]] (Adriana and Ander))-- 
 * Better coercion/conversion to and from residue fields (Aly, Marc)
 * --(Optimized implementation of Frobenius automorphism [[https://trac.sagemath.org/ticket/12657|#12657]] (Ander))--
 * p-adic polylogarithms [[https://trac.sagemath.org/ticket/20260|#20260]] (Alex)
 * --(bug in matrix of Frobenius when p = 3 [[https://trac.sagemath.org/ticket/11960|#11960]] (Jen))--
 * Switching to exact defining polynomials for p-adic extensions [[https://trac.sagemath.org/ticket/23331|#23331]] (David)
 * Change p-adic constructors to not care about the base ring of a defining polynomial [[https://trac.sagemath.org/ticket/18606|#18606]] (David)
 * Investigate slowness in unramified extensions [[https://trac.sagemath.org/ticket/23172|#23172]] (Xavier)
 * Review Xavier's fast exponential code [[https://trac.sagemath.org/ticket/23235|#23235]] (Xavier)
 * Ray class groups and Hecke characters [[https://trac.sagemath.org/ticket/15829|#15829]] (Rob)
 * Add Monge-reduction for Eisenstein polynomials (first over $\mathbb{Q}_p$, then over unramified extensions) (Sebastian)
 * Generic zeta function method for schemes [[https://trac.sagemath.org/ticket/20308|#20308]] (Edgar)
 * Elliptic curve point counting over F_q using PARI [[https://trac.sagemath.org/ticket/16931|#16931]] [[https://trac.sagemath.org/ticket/16949|#16949]] (J-P Flori, Kevin)
 * Expose PARI code for Frobenius matrix on hyperelliptic curves [[https://trac.sagemath.org/ticket/20309|#20309]] (Marc)
 * Raise coverage of schemes/hyperelliptic_curves/monsky_washnitzer.py to 100% [[https://trac.sagemath.org/ticket/15645|#15645]] (Edgar)
 * Requested by Anna Haensch: A weak approximation function

== Non Beginner Sage tickets needing review ==

  * [[https://trac.sagemath.org/ticket/23204|#23204]]
  * [[https://trac.sagemath.org/ticket/23203|#23203]]
  * [[https://trac.sagemath.org/ticket/23185|#23185]]
  * [[https://trac.sagemath.org/ticket/23190|#23190]]
  * [[https://trac.sagemath.org/ticket/23484|#23484]]
  * [[https://trac.sagemath.org/ticket/23461|#23461]]
  * [[https://trac.sagemath.org/ticket/20265|#20265]]


== Beginner Sage projects ==

 * Change root_field to return a p-adic field [[https://trac.sagemath.org/ticket/14893|#14893]], --([[https://trac.sagemath.org/ticket/20073|#20073]])--,--([[https://trac.sagemath.org/ticket/20244|#20244]])-- (Aly)
 * Add an `exact_ring` method for p-adic rings and fields [[https://trac.sagemath.org/ticket/23507|#23507]]
 * Update and improve the p-adic tutorial (Rob)
 * Add more thematic tutorials in number theory (Rob)
 * Here are some tickets that should be easy to review (feel free to add more!):
  * --([[https://trac.sagemath.org/ticket/12657|#12657]] (GaYee))--
  * --([[https://trac.sagemath.org/ticket/16949|#16949]] (GaYee))--
  * [[https://trac.sagemath.org/ticket/23190|#23190]] (possible dependencies for global tests -- Adele)
  * [[https://trac.sagemath.org/ticket/23185|#23185]] (Need to wait until Need to wait until [[https://trac.sagemath.org/ticket/23204|#23204]] is done -- Sara)
  * --([[https://trac.sagemath.org/ticket/23482|#23482]] (Claire))--
  * --([[https://trac.sagemath.org/ticket/23483|#23483]] (Adele))--
  * [[https://trac.sagemath.org/ticket/23484|#23484]] (Need to wait until [[https://trac.sagemath.org/ticket/23204|#23204]] is done -- David A.)
  * [[https://trac.sagemath.org/ticket/23376|#23376]] (Samuel)
  * [[https://trac.sagemath.org/ticket/23479|#23479]] (Sara)
    * This one needs to be re-reviewed due to an update 
  * --([[https://trac.sagemath.org/ticket/23473|#23473]] (This tickets now needs a review ! -- David A.) (Freda))--
  * --([[https://trac.sagemath.org/ticket/23456|#23456]] (Adele))--
  * --([[https://trac.sagemath.org/ticket/23495|#23495]] (Adele))--
  * [[https://trac.sagemath.org/ticket/23499|#23499]]
  * [[https://trac.sagemath.org/ticket/23193|#23193]]
  * [[https://trac.sagemath.org/ticket/23194|#23194]]
  * [[https://trac.sagemath.org/ticket/23235|#23235]]
  * [[https://trac.sagemath.org/ticket/23479|#23479]] (Sara)
  * --([[https://trac.sagemath.org/ticket/23503|#23503]] (Angie))--
  * [[https://trac.sagemath.org/ticket/12657|#12657]]
  * [[https://trac.sagemath.org/ticket/20308|#20308]] (David A.)
  * [[https://trac.sagemath.org/ticket/23509|#23509]] 


== LMFDB projects ==
 * Fix polredabs related issues [[https://github.com/LMFDB/lmfdb/issues/2135|#2135]]  (JJ)
 * Finish up: https://github.com/LMFDB/lmfdb-collab/wiki//Warwick-workshop-June-2017, precisely: 
  * Compute Elliptic Curves over number fields L-functions [[https://github.com/LMFDB/lmfdb/issues/396 | #396]] (Edgar)
  * Compute Hilbert Modular Form L-functions [[https://github.com/LMFDB/lmfdb/issues/418 | #418]] (Edgar)
  * Compute the Asai L-functions [[https://github.com/LMFDB/lmfdb/issues/414 | #414]] 
 * Doc-Testing utilities (David Lowry-Duda)
 * Hecke algebras: see https://github.com/sanni85/HeckeAlgebras and https://github.com/sanni85/lmfdb/tree/hecke_alg (Samuele) pull request [[https://github.com/LMFDB/lmfdb/pull/2189|#2189]]
 * Dirichlet characters modulo l: see https://github.com/sanni85/Dirichlet_modL (Samuele)
 * Galois representations modulo l: see https://github.com/sanni85/Mod-l-galois-representations and http://beta.lmfdb.org/Representation/Galois/ModL/ (Samuele)
 * Display Hecke eigenvalues in terms of an integral basis. See: [[https://github.com/LMFDB/lmfdb/issues/975 | #975]], pull request [[https://github.com/LMFDB/lmfdb/pull/2197 | #2197]] (Edgar, Sam Schiavone, Michael Musty)
 * --(Display local algebras (JJ))--
 * Better handling of character tables (JJ)
 * Some finished work:
  * --(Sanitize API interface: https://github.com/LMFDB/lmfdb/issues/2053 (Edgar) )--
  * --(Prototype a Sage/LMFDB interface. See https://github.com/LMFDB/lmfdb/issues/1360  and https://github.com/LMFDB/lmfdb/issues/2169 (Edgar, Simon Brandhorst and David Lowry-Duda))--
  * --(PR [[https://github.com/LMFDB/lmfdb/pull/2184|#2184]])--
  * --(Issue [[https://github.com/LMFDB/lmfdb/issues/1959|#1959]] pull request [[https://github.com/LMFDB/lmfdb/pull/2190 |#2190]])--
  * --(Issue [[https://github.com/LMFDB/lmfdb/issues/2187|#2187]] pull request [[https://github.com/LMFDB/lmfdb/pull/2188 |#2188]])--
  * --(Moving import scripts: pull request [[https://github.com/LMFDB/lmfdb/pull/2186 |#2186]])--
  * --(Issue [[https://github.com/LMFDB/lmfdb/issues/2172|#2172]] pull request [[https://github.com/LMFDB/lmfdb/pull/2176 |#2176]])--


 * Idle:
  * Work on the isogeny classes of abelian varieties over finite fields. See http://beta.lmfdb.org/Variety/Abelian/Fq/ (Christelle)
  * Work on Hypergeometric Motives over ℚ. See http://beta.lmfdb.org/Motive/Hypergeometric/Q/ (Dave Roberts)
  * Use Monge-reduced polynomials (and ones related to them) for defining polynomials (JJ)
