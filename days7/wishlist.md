This wishlist should be a list of features, software, algorithms, databases, or anything else you'd like to see in Sage.

Back to the [:days7: main conference page].

== Features ==
=== Combinatorial Species ===
=== Infinite-dimensional polynomial rings ===

NickAlexander: Along these lines, I would like to be able to view a polynomial ring {{{R[x]}}} as an additive abelian group or an {{{R}}}-module and define a linear operator on it.  This is my preferred way to think about the umbral calculus.

=== Graphs ===
 * Applet / javascript for dragging/repositioning vertices
 * Edge-labeled isomorphism checking
 * a nauty interface
 * a graph category in Sage
 * Graphs on surfaces
{{{
From Robert Miller:
> Comments: Emily Kirkman has done some extensive work on embedding
> graphs in surfaces, and I'd love to see some conversation about this
> at Sage Days 7.}}}
=== Incidence Structures ===
See http://trac.sagemath.org/sage_trac/ticket/1305 

=== Interactive widgets in the notebook ===
See http://trac.sagemath.org/sage_trac/ticket/1322

=== Lie algebras ===
KiranKedlaya: I'd like to be able to manipulate representations of Lie algebras. Here I'm thinking of representations as lists of highest weights (indicating irreducibles) with multiplicities. I'd like to be able to perform representation-theoretic operations (tensor products, exterior powers, symmetric powers, maybe other Schur functors) on such lists. This may be accomplished by wrapping LiE, which we currently provide as an optional spkg. (Some of this may also be provided by Symmetrica.) I plan to discuss this with Mike Hansen before and during the workshop.

DanielBump: Perhaps representations of Lie algebras should be elements of a ring, the free abelian group on the set of irreducibles, with the multiplication being tensor product. In addition to the operations that Kiran listed, there should be branching rules, for example Br->Dr for common embeddings of Lie groups.

=== Crystal Graphs ===

DanielBump: I have some C programs to draw rank crystal graphs to metapost for types A2 and B2, and Justin Walker ported the A2 program to Sage. At least for the rank 2 crystal graphs I believe that it is a good idea to draw the graph so that vertices contributing the same weight should be placed near each other. See http://match.stanford.edu/bump/xtal/

It would be good if the operation of tensor product as described by Kashiwara and Nakashima, Journal of Algebra 165, were implemented for crystal graphs.

MikeHansen: Anne Schilling will be at SD7 on the coding sprint days, and I plan to spend at least one of them focusing on crystals.

=== Posets ===

== Algorithms ==
 * Xin's partial fraction algorithm for MacMahon's partition analysis
== Programs ==
== Databases ==
 * Graph databases
   * See http://trac.sagemath.org/sage_trac/ticket/1307
   * and http://trac.sagemath.org/sage_trac/ticket/1308
