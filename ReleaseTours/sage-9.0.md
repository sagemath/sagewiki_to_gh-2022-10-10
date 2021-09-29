= Sage 9.0 Release Tour =

released Jan 1, 2020

<<TableOfContents>>

== Python 3 transition ==

Just in time for the new decade, this is the first version of Sage running on Python 3 by default. 

See [[Python3-Switch]] for more details

== Three.js is the new default 3D viewer ==

[[https://doc.sagemath.org/html/en/reference/plot3d/threejs.html|Three.js]] has become the default viewer for 3D plots, in replacement of Jmol. Note that Jmol is still available, via the option ''viewer='jmol' '' in the plot functions. 

== New plotting capabilities ==

 * [[https://doc.sagemath.org/html/en/reference/plotting/sage/plot/plot.html#sage.plot.plot.multi_graphics|multi-graphics]]

 * [[https://doc.sagemath.org/html/en/reference/plotting/sage/plot/graphics.html#sage.plot.graphics.Graphics.inset|graphic insets]]

== Polyhedral Geometry ==

Sage uses a new algorithm to obtain the f-vector for polyhedra. This is the only memory efficient implementation for the f-vector at the time of writing and it is as fast or faster as other implementations:
{{{
sage: P = polytopes.permutahedron(7)
sage: %time P.incidence_matrix()
CPU times: user 679 ms, sys: 4.01 ms, total: 683 ms
Wall time: 682 ms
5040 x 127 dense matrix over Integer Ring (use the '.str()' method to see the entries)
sage: %time P.f_vector()
CPU times: user 901 ms, sys: 16 ms, total: 917 ms
Wall time: 916 ms
(1, 5040, 15120, 16800, 8400, 1806, 126, 1)
}}}
There is ongoing work to improve this implementation. It is implemented in the combinatorial polyhedron of `P`, which is newly exposed:
{{{
sage: P.combinatorial_polyhedron()
A 6-dimensional combinatorial polyhedron with 126 facets
}}}

Sage has the classical construction of the 120-cell of Coxeter from 1969.
This construction is much faster than to realize it as generalized permutahedron so that even without the optional package `normaliz` you won't waste much time:
{{{
sage: %time P = polytopes.one_hundred_twenty_cell(backend='normaliz')
CPU times: user 942 ms, sys: 81.8 ms, total: 1.02 s
Wall time: 457 ms
sage: %time P = polytopes.one_hundred_twenty_cell(backend='field')
CPU times: user 15.9 s, sys: 87.2 ms, total: 16 s
Wall time: 16 s
sage: %time P = polytopes.one_hundred_twenty_cell(backend='normaliz', construction='as_permutahedron')
CPU times: user 18.6 s, sys: 137 ms, total: 18.8 s
Wall time: 18 s
}}}

Ehrhart polynomials are computable for lattice polytopes defined with base ring `QQ`:
{{{
sage: P = polytopes.cube()*1/1
sage: P.base_ring()
Rational Field
sage: P.ehrhart_polynomial()
8*t^3 + 12*t^2 + 6*t + 1
}}}
Note that this computation requires optional package `latte_int` or `normaliz`.

There is a new method to obtain the boundary of complex simplicial polytopes:
{{{
sage: oc = polytopes.octahedron()
sage: oc.boundary_complex()
Simplicial complex with vertex set (0, 1, 2, 3, 4, 5) and 8 facets
}}}

Hyperplane arrangements have a new method `center`:
{{{
sage: H.<x,y> = HyperplaneArrangements(QQ)
sage: A = H()
sage: A.center()
A 2-dimensional polyhedron in QQ^2 defined as the convex hull of 1 vertex and 2 lines
}}}

There are also some bug fixes and other improvements. For more details see the [[https://trac.sagemath.org/wiki/SagePolyhedralGeometry#release_9.0|release notes for optimization and polyhedral geometry softwares interactions in Sage]].

== Group Theory ==

=== Cubic Braid Groups ===

Factor groups of the Artin braid groups such that their generators have order three can easily be declared, now. They show a lot of their known properties:

{{{
sage: C4 = CubicBraidGroup(4)
sage: C4Cl = C4.as_classical_group(); C4Cl
Subgroup with 3 generators (
[  E(3)^2        0        0]  [       1 -E(12)^7        0]
[-E(12)^7        1        0]  [       0   E(3)^2        0]
[       0        0        1], [       0 -E(12)^7        1],

[       1        0        0]
[       0        1 -E(12)^7]
[       0        0   E(3)^2]
) of General Unitary Group of degree 3 over Universal Cyclotomic Field with respect to positive definite hermitian form
[-E(12)^7 + E(12)^11                  -1                   0]
[                 -1 -E(12)^7 + E(12)^11                  -1]
[                  0                  -1 -E(12)^7 + E(12)^11]
}}}

See also the [[https://doc.sagemath.org/html/en/reference/groups/sage/groups/cubic_braid.html|reference manual]].


== Manifolds ==

The main novelty is the introduction of vector bundles (ticket [[https://trac.sagemath.org/ticket/28159|#28159]]). For instance:
{{{
sage: M = Manifold(2, 'M')
sage: X.<x,y> = M.chart()
sage: TM = M.tangent_bundle(); TM
Tangent bundle TM over the 2-dimensional differentiable manifold M
sage: v = TM.section([-y, x], name='v'); v
Vector field v on the 2-dimensional differentiable manifold M
sage: v.display()
v = -y d/dx + x d/dy
sage: p = M((2,3), name='p'); p
Point p on the 2-dimensional differentiable manifold M
sage: TM.fiber(p)
Tangent space at Point p on the 2-dimensional differentiable manifold M
sage: v.at(p) in TM.fiber(p)
True
sage: v.at(p).display()
v = -3 d/dx + 2 d/dy
}}}
Other new features are
 * characteristic classes (ticket [[https://trac.sagemath.org/ticket/27784|#27784]])
 * the construction of a vector frame from a family of predefined vector fields (ticket [[https://trac.sagemath.org/ticket/28716|#28716]])
 * the handling of multiple symmetries and multiple contractions with index notation (ticket [[https://trac.sagemath.org/ticket/28784|#28784]])
 * more control on the numerical ODE solver for integrated curves and geodesics (ticket [[https://trac.sagemath.org/ticket/28707|#28707]])
See the [[https://sagemanifolds.obspm.fr/changelog.html|full changelog]] for details, as well as the list of improvements and bug fixes in this release.

== EdgesView for graphs ==

An `EdgesView` is a read-only iterable container of edges enabling operations like `for e in E` and `e in E`. An `EdgesView` can be iterated multiple times, and checking membership is done in constant time. It avoids the construction of edge lists and so consumes little memory. It is updated as the graph is updated. Hence, the graph should not be updated while iterating through an `EdgesView`.

{{{
sage: G = Graph([(0, 1, 'C'), (0, 2, 'A'), (1, 2, 'B')])
sage: E = G.edges()
sage: E
[(0, 1, 'C'), (0, 2, 'A'), (1, 2, 'B')]
sage: type(E)
<class 'sage.graphs.views.EdgesView'>
sage: (0, 2) in E
False
sage: (0, 2, 'A') in E
True
sage: (2, 0, 'A') in E
True
sage: for e in E:
....:     for ee in E:
....:         print(e, ee)
....:         
(0, 1, 'C') (0, 1, 'C')
(0, 1, 'C') (0, 2, 'A')
(0, 1, 'C') (1, 2, 'B')
(0, 2, 'A') (0, 1, 'C')
(0, 2, 'A') (0, 2, 'A')
(0, 2, 'A') (1, 2, 'B')
(1, 2, 'B') (0, 1, 'C')
(1, 2, 'B') (0, 2, 'A')
(1, 2, 'B') (1, 2, 'B')
}}}

See http://doc.sagemath.org/html/en/reference/graphs/sage/graphs/views.html for more details.


== Availability of Sage 9.0 and installation help ==

 * Release announcements: See [[https://groups.google.com/forum/#!forum/sage-release|sage-release]], [[https://groups.google.com/forum/#!forum/sage-announce|sage-announce]]

 * Availability in distributions: see [[https://repology.org/project/sagemath/versions|repology.org: sagemath]]

 * [[http://www.sagemath.org/download.html|sagemath.org download page]]

=== Installation FAQ ===

 * See [[https://groups.google.com/forum/#!forum/sage-support|sage-support]], [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]].

 * Debian/Ubuntu: [[https://wiki.sagemath.org/prerequisites/Ubuntu|Installation prerequisites]], [[https://groups.google.com/forum/#!msg/sage-devel/ZGEeuoTtbh4/bvSrf1jHCgAJ|Recommended installation]]

 * Sage 9.0 (and earlier) does not support compilation within a conda environment. Deactivate conda before building Sage.

 * Sage 9.0 (and earlier) may not compile from source on some cutting edge Linux distributions such as Ubuntu 20.04 LTS ([[https://groups.google.com/d/msg/sage-devel/gUMOFL7eY1M/Rqz_FMICAQAJ|workaround]]) and Fedora 32.  Use either a distribution package of Sage if that is available in your distribution, a binary distribution of 9.0, or compile a development version of Sage leading to the [[ReleaseTours/sage-9.1|Sage 9.1 release]].

== More details ==

 * [[https://trac.sagemath.org/query?milestone=sage-9.0&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.0]]
