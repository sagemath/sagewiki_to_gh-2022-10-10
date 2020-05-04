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

== Manifolds ==

 * [[https://sagemanifolds.obspm.fr/changelog.html|Changes in the manifold part]]


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

 * Sage 9.0 may not compile from source on some cutting edge Linux distributions such as Ubuntu 20.04 LTS ([[https://groups.google.com/d/msg/sage-devel/gUMOFL7eY1M/Rqz_FMICAQAJ|workaround]]) and Fedora 32.  Use either a distribution package of Sage if that is available in your distribution, a binary distribution of 9.0, or compile a development version of Sage leading to the Sage 9.1 release.

== More details ==

 * [[https://trac.sagemath.org/query?milestone=sage-9.0&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.0]]
