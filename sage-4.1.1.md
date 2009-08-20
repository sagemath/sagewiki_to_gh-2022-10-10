= Sage 4.1.1 Release Tour =


== Algebra ==


 * Adds method {{{__nonzero__()}}} to abelian groups (Taylor Sutton) [[http://trac.sagemath.org/sage_trac/ticket/6510|#6510]] --- New method {{{__nonzero__()}}} for the class {{{AbelianGroup_class}}} in {{{sage/groups/abelian_gps/abelian_group.py}}}. This method returns {{{True}}} if the abelian group in question is non-trivial:
 {{{#!python numbers=off
sage: E = EllipticCurve([0, 82])
sage: T = E.torsion_subgroup()
sage: bool(T)
False
sage: T.__nonzero__()
False
 }}}


== Basic Arithmetic ==


 * Implement {{{real_part()}}} and {{{imag_part()}}} for {{{CDF}}} and {{{CC}}} (Alex Ghitza) [[http://trac.sagemath.org/sage_trac/ticket/6159|#6159]] --- The name {{{real_part}}} is now an alias to the method {{{real()}}}; similarly, {{{imag_part}}} is now an alias to the method {{{imag()}}}.
 {{{#!python numbers=off
sage: a = CDF(3, -2)
sage: a.real()
3.0
sage: a.real_part()
3.0
sage: a.imag()
-2.0
sage: a.imag_part()
-2.0
sage: i = ComplexField(100).0
sage: z = 2 + 3*i
sage: z.real()
2.0000000000000000000000000000
sage: z.real_part()
2.0000000000000000000000000000
sage: z.imag()
3.0000000000000000000000000000
sage: z.imag_part()
3.0000000000000000000000000000
 }}}


 * Efficient summing using balanced sum (Jason Grout, Mike Hansen) [[http://trac.sagemath.org/sage_trac/ticket/2737|#2737]] --- New function {{{balanced_sum()}}} in the module {{{sage/misc/misc_c.pyx}}} for summing the elements in a list. In some cases, {{{balanced_sum()}}} is more efficient than the built-in Python {{{sum()}}} function, where the efficiency can range from 26x up to 1410x faster than {{{sum()}}}. The following timing statistics were obtained using the machine sage.math:
 {{{#!python numbers=off
sage: R.<x,y> = QQ["x,y"]
sage: L = [x^i for i in xrange(1000)]
sage: %time sum(L);
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.01 s
sage: %time balanced_sum(L);
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.00 s
sage: %timeit sum(L);
100 loops, best of 3: 8.66 ms per loop
sage: %timeit balanced_sum(L);
1000 loops, best of 3: 324 µs per loop
sage: 
sage: L = [[i] for i in xrange(10e4)]
sage: %time sum(L, []);
CPU times: user 84.61 s, sys: 0.00 s, total: 84.61 s
Wall time: 84.61 s
sage: %time balanced_sum(L, []);
CPU times: user 0.06 s, sys: 0.00 s, total: 0.06 s
Wall time: 0.06 s
 }}}


== Calculus ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5996|#5996]]


== Combinatorics ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6519|#6519]]. Many BEFORE-AFTER examples are available a the bottom of [[http://wiki.sagemath.org/WordDesign|WordDesign]] page. Those could be copy and pasted here.


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6621|#6621]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5790|#5790]]


== Cryptography ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6454|#6454]]


== Documentation ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/4460|#4460]]


== Elliptic Curves ==


 *  [[http://trac.sagemath.org/sage_trac/ticket/6381|#6381]] (bug in integral_points when rank is large):

The function integral_x_coords_in_interval() for finding all integral points on an elliptic curve defined over the rationals whose x-coordinate lies in an interval is now more efficient when the interval is large.

 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6407|#6407]]


== Graphics ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6098|#6098]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5649|#5649]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5651|#5651]]


== Graph Theory ==


 * Inclusion of Cliquer as a standard package (Trac[[http://trac.sagemath.org/sage_trac/ticket/6355|#6355]])
   [[http://users.tkk.fi/pat/cliquer.html|Cliquer]] is a set of C routines for finding cliques in an arbitrary weighted graph. It uses an exact branch-and-bound algorithm recently developed by Patric Ostergard and mainly written by Sampo Niskanen. It is published under the GPL license.


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6540|#6540]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6552|#6552]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6578|#6578]]


 * New algorithm for all Graph functions related to the computation of maximum Cliques (Trac [[http://trac.sagemath.org/sage_trac/ticket/5793|#5793]])
   With the inclusion of  Cliquer as a standard SPKG, the following functions can now use the cliquer Algorithm :
       * Graph.max_clique()
         Returns the vertex set of a maximum complete subgraph
       * Graph.cliques_maximum()
         Returns the list of all maximum cliques, with each clique represented by a list of vertices. A clique is an induced complete subgraph, and a maximal clique is one of maximal order. 
       * Graph.clique_number()
         Returns the size of the largest clique of the graph
       * Graph.cliques_vertex_clique_number()
         Returns a list of sizes of the largest maximal cliques containing each vertex. (Returns a single value if only one input vertex).
       * Graph.independent_set()
         Returns a maximal independent set, which is a set of vertices which induces an empty subgraph.
   These functions already existed in Sage : Cliquer does not bring to SAGE any new feature, but a huge improvement of its efficiency in the computation of clique number. The previous NetworkX algorithm was very slow in its computations of these functions, even though it remains faster than Cliquer for the computation of Graph.cliques_vertex_clique_number(). 

   Here is what happens when comparing Cliquer to NetworkX
   {{{
sage: g=graphs.RandomGNP(200,.4)
sage: time g.clique_number(algorithm="networkx")
CPU times: user 14.63 s, sys: 0.04 s, total: 14.68 s
Wall time: 14.68 s
9
sage: time g.clique_number(algorithm="cliquer")
CPU times: user 0.11 s, sys: 0.00 s, total: 0.11 s
Wall time: 0.11 s
9
   }}}

== Interfaces ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6395|#6395]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6591|#6591]]


== Linear Algebra ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5081|#5081]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6553|#6553]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6554|#6554]]


 * Elementwise (Hadamard) product of matrices (Rob Beezer)  (Trac [[http://trac.sagemath.org/sage_trac/ticket/6301|#6301]])

   Given matrices A and B of the same size, {{{C = A.elementwise_product(B)}}} creates the new matrix C, of the same size, with entries given by C[i,j]=A[i,j]*B[i,j].  The multiplication occurs in a ring defined by Sage's coercion model, as appropriate for the base rings of A and B (or an error is raised if there is no sensible common ring).  In particular, if A and B are defined over a noncommutative ring, then the operation is also noncommutative.  The implementation is different for dense matrices versus sparse matrices, but there are probably further optimizations available for specific rings.  This operation is often call the Hadamard product.

   {{{
sage: G = matrix(GF(3),2,[0,1,2,2]) 
sage: H = matrix(ZZ,2,[1,2,3,4]) 
sage: J = G.elementwise_product(H) 
sage: J 
[0 2] 
[0 2] 
sage: J.parent() 
Full MatrixSpace of 2 by 2 dense matrices over Finite Field of size 
   }}}


== Modular Forms ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6606|#6606]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6071|#6071]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6534|#6534]]


== Notebook ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/5653|#5653]]


== Number Theory ==


 * [[http://trac.sagemath.org/sage_trac/ticket/6457|#6457]] (Intersection of ideals in a number field)

Intersection of ideals in number fields is now implemented.

 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6045|#6045]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6396|#6396]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6458|#6458]]


== Numerical ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6506|#6506]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/4571|#4571]]


== Packages ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6558|#6558]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6380|#6380]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6443|#6443]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6445|#6445]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6451|#6451]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6453|#6453]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6528|#6528]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6143|#6143]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6438|#6438]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6493|#6493]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6563|#6563]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6602|#6602]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6302|#6302]]


 * new optional package [[http://sage.math.washington.edu/home/SimonKing/Cohomology/|p_group_cohomology]] (Simon A. King, David J. Green)

   * Compute the cohomology ring with coefficients in GF(p) for any finite p-group, in terms of a minimal generating set and a minimal set of algebraic relations. We use Benson's criterion to prove the completeness of the ring structure.
   * Compute depth, dimension, Poincare series and a-invariants of the cohomology rings. 
   * Compute the nil radical
   * Construct induced homomorphisms.
   * The package includes a list of cohomology rings for all groups of order 64.
   * With the package, the cohomology for all groups of order 128 and for the Sylow 2-subgroup of the third Conway group (order 1024) was computed for the first time. The result of these and many other computations (e.g., all but 6 groups of order 243) is accessible in a repository on sage.math.

 __Examples__:

   * Data that are included with the package:
   {{{
sage: from pGroupCohomology import CohomologyRing
sage: H = CohomologyRing(64,132) # this is included in the package, hence, the ring structure is already there
sage: print H

Cohomology ring of Small Group number 132 of order 64 with coefficients in GF(2)

Computation complete
Minimal list of generators:
[a_2_4, a 2-Cochain in H^*(SmallGroup(64,132); GF(2)),
 c_2_5, a 2-Cochain in H^*(SmallGroup(64,132); GF(2)),
 c_4_12, a 4-Cochain in H^*(SmallGroup(64,132); GF(2)),
 a_1_0, a 1-Cochain in H^*(SmallGroup(64,132); GF(2)),
 a_1_1, a 1-Cochain in H^*(SmallGroup(64,132); GF(2)),
 b_1_2, a 1-Cochain in H^*(SmallGroup(64,132); GF(2))]
Minimal list of algebraic relations:
[a_1_0*a_1_1,
 a_1_0*b_1_2,
 a_1_1^3+a_1_0^3,
 a_2_4*a_1_0,
 a_1_1^2*b_1_2^2+a_2_4*a_1_1*b_1_2+a_2_4^2+c_2_5*a_1_1^2]
sage: H.depth()
2
sage: H.a_invariants()
[-Infinity, -Infinity, -3, -3]
sage: H.poincare_series()
(-t^2 - t - 1)/(t^6 - 2*t^5 + t^4 - t^2 + 2*t - 1)
sage: H.nil_radical()

a_1_0,
a_1_1,
a_2_4
   }}}
   * Data from the repository on sage.math:
   {{{
sage: H = CohomologyRing(128,562) # if there is internet connection, the ring data are downloaded behind the scenes
sage: len(H.gens())
35
sage: len(H.rels())
486
sage: H.depth()
1
sage: H.a_invariants()
[-Infinity, -4, -3, -3]
sage: H.poincare_series()
(t^14 - 2*t^13 + 2*t^12 - t^11 - t^10 + t^9 - 2*t^8 + 2*t^7 - 2*t^6 + 2*t^5 - 2*t^4 + t^3 - t^2 - 1)/(t^17 - 3*t^16 + 4*t^15 - 4*t^14 + 4*t^13 - 4*t^12 + 4*t^11 - 4*t^10 + 4*t^9 - 4*t^8 + 4*t^7 - 4*t^6 + 4*t^5 - 4*t^4 + 4*t^3 - 4*t^2 + 3*t - 1)
   }}}
   * Some computation from scratch, involving different ring presentations and induced maps:
   {{{
sage: tmp_root = tmp_filename()
sage: CohomologyRing.set_user_db(tmp_root)
sage: H0 = CohomologyRing.user_db(8,3,websource=False)
sage: print H0

Cohomology ring of Dihedral group of order 8 with coefficients in GF(2)

Computed up to degree 0
Minimal list of generators:
[]
Minimal list of algebraic relations:
[]

sage: H0.make()
sage: print H0

Cohomology ring of Dihedral group of order 8 with coefficients in GF(2)

Computation complete
Minimal list of generators:
[c_2_2, a 2-Cochain in H^*(D8; GF(2)),
 b_1_0, a 1-Cochain in H^*(D8; GF(2)),
 b_1_1, a 1-Cochain in H^*(D8; GF(2))]
Minimal list of algebraic relations:
[b_1_0*b_1_1]

sage: G = gap('DihedralGroup(8)')
sage: H1 = CohomologyRing.user_db(G,GroupName='GapD8',websource=False)
sage: H1.make()
sage: print H1  # the ring presentation is different ...

Cohomology ring of GapD8 with coefficients in GF(2)

Computation complete
Minimal list of generators:
[c_2_2, a 2-Cochain in H^*(GapD8; GF(2)),
 b_1_0, a 1-Cochain in H^*(GapD8; GF(2)),
 b_1_1, a 1-Cochain in H^*(GapD8; GF(2))]
Minimal list of algebraic relations:
[b_1_1^2+b_1_0*b_1_1]

sage: phi = G.IsomorphismGroups(H0.group())
sage: phi_star = H0.hom(phi,H1)
sage: phi_star_inv = phi_star^(-1) # ... but the rings are isomorphic
sage: [X==phi_star_inv(phi_star(X)) for X in H0.gens()]
[True, True, True, True]
sage: [X==phi_star(phi_star_inv(X)) for X in H1.gens()]
[True, True, True, True]
   }}}
   * An example with an odd prime:
   {{{
sage: H = CohomologyRing(81,8) # this needs to be computed from scratch
sage: H.make()
sage: H.gens()

[1,
 a_2_1, a 2-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_2_2, a 2-Cochain in H^*(SmallGroup(81,8); GF(3)),
 b_2_0, a 2-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_4_1, a 4-Cochain in H^*(SmallGroup(81,8); GF(3)),
 b_4_2, a 4-Cochain in H^*(SmallGroup(81,8); GF(3)),
 b_6_3, a 6-Cochain in H^*(SmallGroup(81,8); GF(3)),
 c_6_4, a 6-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_1_0, a 1-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_1_1, a 1-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_3_2, a 3-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_5_2, a 5-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_5_3, a 5-Cochain in H^*(SmallGroup(81,8); GF(3)),
 a_7_5, a 7-Cochain in H^*(SmallGroup(81,8); GF(3))]
sage: len(H.rels())
59
sage: H.depth()
1
sage: H.a_invariants()
[-Infinity, -3, -2]
sage: H.poincare_series()
(t^4 - t^3 + t^2 + 1)/(t^6 - 2*t^5 + 2*t^4 - 2*t^3 + 2*t^2 - 2*t + 1)
sage: H.nil_radical()

a_1_0,
a_1_1,
a_2_1,
a_2_2,
a_3_2,
a_4_1,
a_5_2,
a_5_3,
b_2_0*b_4_2,
a_7_5,
b_2_0*b_6_3,
b_6_3^2+b_4_2^3
   }}}


== Symbolics ==


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6195|#6195]]


 * FIXME: summarize [[http://trac.sagemath.org/sage_trac/ticket/6243|#6243]]
