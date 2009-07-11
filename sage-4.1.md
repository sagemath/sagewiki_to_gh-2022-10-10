= Sage 4.1 Release Tour =

Sage 4.1 was released on FIXME. For the official, comprehensive release note, please refer to FIXME. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * 


== Algebra ==


 * FIXME: summarize #6362


== Algebraic Geometry ==


 * FIXME: summarize #4290


== Basic Arithmetic ==


 * FIXME: summarize #6083


== Combinatorics ==

 1. '''Irreducible matrix representations of symmetric groups (Ticket #5878)'''. FrancoSaliola, based on the [[http://www-igm.univ-mlv.fr/~al|Alain Lascoux]] article 
 [[http://phalanstere.univ-mlv.fr/~al/ARTICLES/ProcCrac.ps.gz|Young representations of the symmetric group]], 
 added support for constructing irreducible representations of the symmetric group.

 Three types of representations have been implemented.

    * '''Specht representations'''. The matrices have integer entries.
    {{{#!python numbers=off
sage: chi = SymmetricGroupRepresentation([3,2])
Specht representation of the symmetric group corresponding to [3, 2]

sage: chi([5,4,3,2,1])
[ 1 -1  0  1  0]
[ 0  0 -1  0  1]
[ 0  0  0 -1  1]
[ 0  1 -1 -1  1]
[ 0  1  0 -1  1]
}}}

    * '''Young's seminormal representation'''. The matrices have rational entries.
    {{{#!python numbers=off
sage: snorm = SymmetricGroupRepresentation([2,1], "seminormal")
sage: snorm
Seminormal representation of the symmetric group corresponding to [2, 1]

sage: snorm([1,3,2])
[-1/2  3/2]
[ 1/2  1/2]
}}}

    * '''Young's orthogonal representation''' (the matrices are orthogonal). These matrices are defined over Sage's {{{Symbolic Ring}}}.
    {{{#!python numbers=off
sage: ortho = SymmetricGroupRepresentation([3,2], "orthogonal")
sage: ortho
Orthogonal representation of the symmetric group corresponding to [3, 2]

sage: ortho([1,3,2,4,5])
[          1           0           0           0           0]
[          0        -1/2 1/2*sqrt(3)           0           0]
[          0 1/2*sqrt(3)         1/2           0           0]
[          0           0           0        -1/2 1/2*sqrt(3)]
[          0           0           0 1/2*sqrt(3)         1/2]
}}}

 One can also create the {{{CombinatorialClass}}} of all irreducible matrix representations of a given symmetric group.
 Then particular representations can be created by providing partitions. For example:
    {{{#!python numbers=off
sage: chi = SymmetricGroupRepresentations(5)
sage: chi
Specht representations of the symmetric group of order 5! over Integer Ring

sage: chi([5]) # the trivial representation
Specht representation of the symmetric group corresponding to [5]
sage: chi([5])([2,1,3,4,5])
[1]

sage: chi([1,1,1,1,1]) # the sign representation
Specht representation of the symmetric group corresponding to [1, 1, 1, 1, 1]
sage: chi([1,1,1,1,1])([2,1,3,4,5])
[-1]

sage: chi([3,2])
Specht representation of the symmetric group corresponding to [3, 2]
sage: chi([3,2])([5,4,3,2,1])
[ 1 -1  0  1  0]
[ 0  0 -1  0  1]
[ 0  0  0 -1  1]
[ 0  1 -1 -1  1]
[ 0  1  0 -1  1]
}}}

 See the documentation {{{SymmetricGroupRepresentation?}}} and
 {{{SymmetricGroupRepresentations?}}} for more information and examples.

 1. '''Yang-Baxter Graphs (Ticket #5878)'''.
 Ticket #5878 (irreducible matrix representations of the symmetric group) also
 introduced support for Yang-Baxter graphs. Besides being used for constructing
 those representations, they can also be used to construct the Cayley graph
 of a finite group:
    {{{#!python numbers=off
sage: def left_multiplication_by(g):
...       return lambda h : h*g

sage: G = AlternatingGroup(4)
sage: operators = [ left_multiplication_by(gen) for gen in G.gens() ]
sage: Y = YangBaxterGraph(root=G.identity(), operators=operators); Y
Yang-Baxter graph with root vertex ()
sage: Y.plot(edge_labels=False)
}}}

 and to construct the permutahedron:
    {{{#!python numbers=off
sage: from sage.combinat.yang_baxter_graph import SwapIncreasingOperator
sage: operators = [SwapIncreasingOperator(i) for i in range(3)]
sage: Y = YangBaxterGraph(root=(1,2,3,4), operators=operators); Y
Yang-Baxter graph with root vertex (1, 2, 3, 4)
sage: Y.plot()
}}}

 See the documentation {{{YangBaxterGraph?}}} for more information and
 examples.


== Commutative Algebra ==


== Cryptography ==


 * FIXME: summarize #6164


== Geometry ==


== Graph Theory ==


  1. FIXME: summarize #6085


  1.  '''Improve accuracy of graph eigenvalues  (Ticket #6258)''', Rob Beezer.  New routines compute eigenvalues and eigenvectors of integer matrices more precisely than before.  Rather than convert adjacency matrices of graphs to computations over the reals or complexes, this patch retains adjacency matrices as matrices over the integers, yielding more accurate and informative results for eigenvalues, eigenvectors, and eigenspaces.

    *  Examples follow for a circuit on 8 vertices:
    {{{#!python numbers=off
g = graphs.CycleGraph(8)
    }}}

    *  Integer eigenvalues are exact, irrational eigenvalues are more precise, making multiplicities easier to determine.
    {{{#!python numbers=off
sage: g.spectrum()

[2, 1.414213562373095?, 1.414213562373095?, 0, 0, -1.414213562373095?, -1.414213562373095?, -2]
    }}}

    *  Similar comments apply to eigenvectors.
    {{{#!python numbers=off
sage: g.eigenvectors()

[(2, [
(1, 1, 1, 1, 1, 1, 1, 1)
], 1),
 (-2, [
(1, -1, 1, -1, 1, -1, 1, -1)
], 1),
 (0, [
(1, 0, -1, 0, 1, 0, -1, 0),
(0, 1, 0, -1, 0, 1, 0, -1)
], 2),
 (-1.414213562373095?,
  [(1, 0, -1, 1.414213562373095?, -1, 0, 1, -1.414213562373095?),
   (0, 1, -1.414213562373095?, 1, 0, -1, 1.414213562373095?, -1)],
  2),
 (1.414213562373095?,
  [(1, 0, -1, -1.414213562373095?, -1, 0, 1, 1.414213562373095?),
   (0, 1, 1.414213562373095?, 1, 0, -1, -1.414213562373095?, -1)],
  2)]
   }}}

    *  Eigenspaces are exact, in that they can be expressed as vector spaces over number fields.  When the defining polynomial has several roots, the eigenspaces are not repeated.  Previously eigenspaces were "fractured" owing to slight computational differences in identical eigenvalues.  In concert with {{{eigenvectors()}}} this command illuminates the structure of a graph's eigenspaces more than purely numerical results.
    {{{#!python numbers=off
sage: g.eigenspaces()

[
(2, Vector space of degree 8 and dimension 1 over Rational Field
User basis matrix:
[1 1 1 1 1 1 1 1]),
(-2, Vector space of degree 8 and dimension 1 over Rational Field
User basis matrix:
[ 1 -1  1 -1  1 -1  1 -1]),
(0, Vector space of degree 8 and dimension 2 over Rational Field
User basis matrix:
[ 1  0 -1  0  1  0 -1  0]
[ 0  1  0 -1  0  1  0 -1]),
(a3, Vector space of degree 8 and dimension 2 over Number Field in a3 with defining polynomial x^2 - 2
User basis matrix:
[  1   0  -1 -a3  -1   0   1  a3]
[  0   1  a3   1   0  -1 -a3  -1])
    }}}

    *  Complex eigenvalues (of digraphs) previously were missing their imaginary parts.  This bug has been fixed as part of this ticket.


== Graphics ==


 * FIXME: summarize #6162


== Group Theory ==


== Interfaces ==


 * FIXME: summarize #4313


== Linear Algebra ==


 * FIXME: summarize #6261
 * FIXME: summarize #5882


== Miscellaneous ==


 * FIXME: summarize #3084

 * FIXME: summarize #6097

 * FIXME: summarize #6417


== Modular Forms ==


== Notebook ==


 * FIXME: summarize #5637


== Number Theory ==


 * FIXME: summarize #6273
 * FIXME: summarize #5854
 * FIXME: summarize #6386


== Numerical ==


 * FIXME: summarize #6200


== Packages ==


 * FIXME: summarize #6359
 * FIXME: summarize #6196
 * FIXME: summarize #6276
 * FIXME: summarize #5517
 * FIXME: summarize #5854
 * FIXME: summarize #5866
 * FIXME: summarize #5867
 * FIXME: summarize #5868
 * FIXME: summarize #5869
 * FIXME: summarize #5870
 * FIXME: summarize #5872
 * FIXME: summarize #5874
 * FIXME: summarize #5875
 * FIXME: summarize #6281
 * FIXME: summarize #6470
 * FIXME: summarize #6470
 * FIXME: summarize #6492
 * FIXME: summarize #6408


== P-adics ==


== Quadratic Forms ==


== Symbolics ==


 * FIXME: summarize #6421


== Topology ==
