= Sage 9.4 Release Tour =

current development cycle (2021)

<<TableOfContents>>

== Symbolics ==

=== Extended interface with SymPy ===

The [[https://www.sympy.org/en/index.html|SymPy]] package has been updated to version 1.8.

!SageMath has a bidirectional interface with !SymPy. Symbolic expressions in Sage provide a `_sympy_` method, which converts to !SymPy; also, Sage attaches `_sage_` methods to various !SymPy classes, which provide the opposite conversion.

In Sage 9.4, several conversions have been added. Now there is a bidirectional interface as well for 
matrices and vectors. [[https://trac.sagemath.org/ticket/31942|#31942]]
{{{
sage: M = matrix([[sin(x), cos(x)], [-cos(x), sin(x)]]); M
[ sin(x)  cos(x)]
[-cos(x)  sin(x)]
sage: sM = M._sympy_(); sM
Matrix([
[ sin(x), cos(x)],
[-cos(x), sin(x)]])
sage: sM.subs(x, pi/4)           # computation in SymPy
Matrix([
[ sqrt(2)/2, sqrt(2)/2],
[-sqrt(2)/2, sqrt(2)/2]])
}}}
Work is underway to make !SymPy's symbolic linear algebra methods available in Sage via this route.

Callable symbolic expressions, such as those created using the Sage preparser's `f(...) = ...` syntax, now convert to a !SymPy `Lambda`. [[https://trac.sagemath.org/ticket/32130|#32130]]
{{{
sage: f(x, y) = x^2 + y^2; f
(x, y) |--> x^2 + y^2
sage: f._sympy_()
Lambda((x, y), x**2 + y**2)
}}}

Sage has added a formal set membership function `element_of` for use in symbolic expressions; it converts to a !SymPy's `Contains` expression. [[https://trac.sagemath.org/ticket/24171|#24171]]

Moreover, all sets and algebraic structures (`Parent`s) of !SageMath are now accessible to !SymPy by way of a wrapper class `SageSet`, which implements the [[https://docs.sympy.org/latest/modules/sets.html#set|SymPy Set API]]. [[https://trac.sagemath.org/ticket/31938|#31938]]
{{{
sage: F = Family([2, 3, 5, 7]); F
Family (2, 3, 5, 7)
sage: sF = F._sympy_(); sF
SageSet(Family (2, 3, 5, 7))          # this is how the wrapper prints
sage: sF._sage_() is F
True                                  # bidirectional
sage: bool(sF)
True
sage: len(sF)
4
sage: sF.is_finite_set                # SymPy property
True
}}}
Finite or infinite, we can wrap it:
{{{
sage: W = WeylGroup(["A",1,1])
sage: sW = W._sympy_(); sW
SageSet(Weyl Group of type ['A', 1, 1] (as a matrix group acting on the root space))
sage: sW.is_finite_set
False
sage: sW.is_iterable
True
sage: sB3 = WeylGroup(["B", 3])._sympy_(); sB3
SageSet(Weyl Group of type ['B', 3] (as a matrix group acting on the ambient space))
sage: len(sB3)
48
}}}
Some parents or constructions have a more specific conversion to !SymPy. [[https://trac.sagemath.org/ticket/31931|#31931]], [[https://trac.sagemath.org/ticket/32015|#32015]]
{{{
sage: ZZ3 = cartesian_product([ZZ, ZZ, ZZ])
sage: sZZ3 = ZZ3._sympy_(); sZZ3
ProductSet(Integers, Integers, Integers)
sage: (1, 2, 3) in sZZ3

sage: NN = NonNegativeIntegers()
sage: NN._sympy_()
Naturals0

sage: (RealSet(1, 2).union(RealSet.closed(3, 4)))._sympy_()
Union(Interval.open(1, 2), Interval(3, 4))

sage: X = Set(QQ).difference(Set(ZZ)); X
Set-theoretic difference of
 Set of elements of Rational Field and
 Set of elements of Integer Ring
sage: X._sympy_()
Complement(Rationals, Integers)

sage: X = Set(ZZ).difference(Set(QQ)); X
Set-theoretic difference of
 Set of elements of Integer Ring and
 Set of elements of Rational Field
sage: X._sympy_()
EmptySet
}}}
See [[https://trac.sagemath.org/ticket/31926|Meta-ticket #31926: Connect Sage sets to SymPy sets]]

=== ConditionSet ===

Sage 9.4 introduces a class `ConditionSet` for subsets of a parent (or another set) consisting of elements that satisfy the logical "and" of finitely many predicates. [[https://trac.sagemath.org/ticket/32089|#32089]]
{{{
sage: in_small_oblong(x, y) = x^2 + 3 * y^2 <= 42
sage: SmallOblongUniverse = ConditionSet(QQ^2, in_small_oblong)
sage: SmallOblongUniverse
{ (x, y) ∈ Vector space of dimension 2 over Rational Field : x^2 + 3*y^2 <= 42 }

sage: parity_check(x, y) = abs(sin(pi/2*(x + y))) < 1/1000
sage: EvenUniverse = ConditionSet(ZZ^2, parity_check); EvenUniverse
{ (x, y) ∈ Ambient free module of rank 2 over the principal ideal
           domain Integer Ring : abs(sin(1/2*pi*x + 1/2*pi*y)) < (1/1000) }

sage: SmallOblongUniverse & EvenUniverse
{ (x, y) ∈ Free module of degree 2 and rank 2 over Integer Ring
Echelon basis matrix:
[1 0]
[0 1] : x^2 + 3*y^2 <= 42, abs(sin(1/2*pi*x + 1/2*pi*y)) < (1/1000) }
}}}
The name `ConditionSet` is borrowed from !SymPy. In fact, if the given predicates (condition) are symbolic, a `ConditionSet` can be converted to a !SymPy `ConditionSet`; the `_sympy_` method falls back to creating a `SageSet` wrapper otherwise.


=== symbolic_expression(lambda x, y: ...) ===

Sage 9.4 has added a new way to create callable symbolic expressions. [[https://trac.sagemath.org/ticket/32103|#32103]]

The global function `symbolic_expression` now accepts a callable such as those created by `lambda` expressions. The result is a callable symbolic expression, in which the formal arguments of the callable are the symbolic arguments.

Example:
{{{
symbolic_expression(lambda x,y: x^2+y^2) == (SR.var("x")^2 + SR.var("y")^2).function(SR.var("x"), SR.var("y"))
}}}

This provides a convenient syntax in particular in connection to `ConditionSet`.

Instead of 
{{{
sage: predicate(x, y, z) = sqrt(x^2 + y^2 + z^2) < 12  # preparser syntax, creates globals
sage: ConditionSet(ZZ^3, predicate)
}}}
one is now able to write
{{{
sage: ConditionSet(ZZ^3, symbolic_expression(lambda x, y, z: 
....:     sqrt(x^2 + y^2 + z^2) < 12))
}}}

== Convex geometry ==

=== ABC for convex sets ===

Sage 9.4 has added an abstract base class `ConvexSet_base` (as well as abstract subclasses `ConvexSet_closed`, `ConvexSet_compact`, `ConvexSet_relatively_open`, `ConvexSet_open`) for convex subsets of finite-dimensional real vector spaces.  The abstract methods and default implementations of methods provide a unifying API to the existing classes `Polyhedron_base`, `ConvexRationalPolyhedralCone`, `LatticePolytope`, and `PolyhedronFace`. [[https://trac.sagemath.org/ticket/31919|#31919]], [[https://trac.sagemath.org/ticket/31959|#31959]], [[https://trac.sagemath.org/ticket/31990|#31990]], [[https://trac.sagemath.org/ticket/31993|#31993]]

Several methods previously only available for `Polyhedron_base` instances, are now available for all convex sets.  The method `an_affine_basis` returns a sequence of points that span by affine linear combinations the affine hull, i.e., the smallest affine subspace in which the convex set lies. The method `affine_hull` returns the latter as a polyhedron. The method `affine_hull_projection` (renamed from `affine_hull` in Sage 9.1) computes an affine linear transformation of the convex set to a new ambient vector space, in which the image is full-dimensional. The generalized method also provides additional data: the right inverse (section map) of the projection. [[https://trac.sagemath.org/ticket/27366|#27366]], [[https://trac.sagemath.org/ticket/31963|#31963]], [[https://trac.sagemath.org/ticket/31993|#31993]]

As part of the `ConvexSet_base` API, there are new methods for point-set topology such as `is_open`, `relative_interior`, and `closure`.  For example, taking the `relative_interior` of a polyhedron constructs an instance of `RelativeInterior`, a simple object that provides a `__contains__` method and all other methods of the `ConvexSet_base` API. [[https://trac.sagemath.org/ticket/31916|#31916]]
{{{
sage: P = Polyhedron(vertices=[(1,0), (-1,0)])
sage: ri_P = P.relative_interior(); ri_P
Relative interior of
 a 1-dimensional polyhedron in ZZ^2 defined as the convex hull of 2 vertices
sage: (0, 0) in ri_P
True
sage: (1, 0) in ri_P
False
}}}

`ConvexSet_base` is a subclass of the new abstract base class `Set_base`. [[https://trac.sagemath.org/ticket/32013|#32013]]

This makes various methods that were previously only defined for sets constructed using the `Set` constructor available for polyhedra and other convex sets.  As an example, we can now do:
{{{
sage: polytopes.cube().union(polytopes.tetrahedron())                                                                                                                                                
Set-theoretic union of 
 Set of elements of A 3-dimensional polyhedron in ZZ^3 defined as the convex hull of 8 vertices and 
 Set of elements of A 3-dimensional polyhedron in ZZ^3 defined as the convex hull of 4 vertices
}}}


=== Polyhedral geometry ===

Sage 9.4 defines a new subclass of `GenericCellComplex` for (geometric) polyhedral complexes. [[https://trac.sagemath.org/ticket/31748|#31748]]
{{{
sage: pc = PolyhedralComplex([
....:         Polyhedron(vertices=[(1/3, 1/3), (0, 0), (1/7, 2/7)]),
....:         Polyhedron(vertices=[(1/7, 2/7), (0, 0), (0, 1/4)])])
sage: [p.Vrepresentation() for p in pc.cells_sorted()]
[(A vertex at (0, 0), A vertex at (0, 1/4), A vertex at (1/7, 2/7)),
 (A vertex at (0, 0), A vertex at (1/3, 1/3), A vertex at (1/7, 2/7)),
 (A vertex at (0, 0), A vertex at (0, 1/4)),
 ...
 (A vertex at (1/7, 2/7),),
 (A vertex at (1/3, 1/3),)]
sage: pc.plot()
Graphics object consisting of 10 graphics primitives
sage: pc.is_pure()
True
sage: pc.is_full_dimensional()
True
sage: pc.is_compact()
True
sage: pc.boundary_subcomplex()
Polyhedral complex with 4 maximal cells
sage: pc.is_convex()
True
sage: pc.union_as_polyhedron().Hrepresentation()
(An inequality (1, -4) x + 1 >= 0,
 An inequality (-1, 1) x + 0 >= 0,
 An inequality (1, 0) x + 0 >= 0)
sage: pc.face_poset()
Finite poset containing 11 elements
sage: pc.is_connected()
True
sage: pc.connected_component() == pc
True
}}}


== Knot theory ==

=== Databases ===

A direct access to the contents of the [[https://knotinfo.math.indiana.edu/|KnotInfo]] and [[https://linkinfo.sitehost.iu.edu/|LinkInfo]] databases is available as an optional Sage package, now (see [[https://trac.sagemath.org/ticket/30352|Trac #30352]]). It can be installed via

{{{
sage -i database_knotinfo
}}}

For example, you can obtain the Kauffman polynomial of a link via these databases which has no implementation in Sage, so far:

{{{
sage: B = BraidGroup(8)
sage: L = Link(B([-1, -1, -1, -2, 1, -2, 3, -2, 3]))
sage: K, mirrored  = L.get_knotinfo(); K, mirrored
(<KnotInfo.K8_14: '8_14'>, True)
sage: K.kauffman_polynomial()
z^4 + 2*a^-1*z^5 + 2*a^-2*z^6 + a^-3*z^7 - 2*z^2 - 3*a^-1*z^3 - a^-2*z^4 + 3*a^-3*z^5
 + 5*a^-4*z^6 + a^-5*z^7 + 1 + a^-1*z - a^-2*z^2 - 6*a^-3*z^3 - 7*a^-4*z^4 + 4*a^-5*z^5
 + 3*a^-6*z^6 + 3*a^-3*z + 3*a^-4*z^2 - 8*a^-5*z^3 - 4*a^-6*z^4 + 3*a^-7*z^5 + 3*a^-5*z
 + a^-6*z^2 - 5*a^-7*z^3 + a^-8*z^4 + a^-7*z - a^-8*z^2
}}}

=== Testing isotopy ===

There is a new method `is_isotopic` which allows to check if two links are isotopic to each other:

{{{
sage: l1 = Link([[2, 9, 3, 10], [4, 13, 5, 14], [6, 11, 7, 12],
....:            [8, 1, 9, 2], [10, 7, 11, 8], [12, 5, 13, 6],
....:            [14, 3, 1, 4]])
sage: l2 = Link([[1, 8, 2, 9], [9, 2, 10, 3], [3, 14, 4, 1],
....:            [13, 4, 14, 5], [5, 12, 6, 13], [11, 6, 12, 7],
....:            [7, 10, 8, 11]])
sage: l1 == l2
False
sage: l1.is_isotopic(l2)
True
sage: l3 = l2.mirror_image()
sage: l1.is_isotopic(l3)
False
}}}



== Manifolds ==

=== Defining submanifolds and manifold subsets by pullbacks from Sage sets ===

Given a continuous map `Φ` from a topological or differentiable manifold `N` and a subset `S` of the codomain of `Φ`, we define the pullback (preimage) of `S` as the subset of `N` of points `p` with `Φ(p)` in `S`. [[https://trac.sagemath.org/ticket/31688|#31688]]

Generically, such pullbacks are represented by instances of the new class `ManifoldSubsetPullback`. But because `Φ` is continuous, topological closures and interiors pull back accordingly. Hence, in some cases we are able to give the pullback additional structure, such as creating a submanifold rather than merely a manifold subset.

In addition to the case when `Φ` is a continuous map between manifolds, there are two situations that connect Sage manifolds to sets defined by other components of Sage: 

 * If `Φ: N -> R` is a real scalar field, then any `RealSet` `S` (i.e., a finite union of intervals) can be pulled back.

 * If `Φ` is a chart – viewed as a continuous function from the chart's domain to `R^n` – then any subset of `R^n` can be pulled back to define a manifold subset. This can be a polyhedron, a lattice, a linear subspace, a finite set, or really any object with a `__contains__` method.

   For example, defining a "chart polyhedron" by pulling back a polyhedron:
   {{{
sage: M = Manifold(2, 'R^2', structure='topological')
sage: c_cart.<x,y> = M.chart() # Cartesian coordinates on R^2
sage: P = Polyhedron(vertices=[[0, 0], [1, 2], [2, 1]]); P
A 2-dimensional polyhedron in ZZ^2 defined as the convex hull of 3 vertices
sage: McP = c_cart.preimage(P); McP
Subset x_y_inv_P of the 2-dimensional topological manifold R^2
sage: M((1, 2)) in McP
True
sage: M((2, 0)) in McP
False
   }}}
   Pulling back the interior of a polytope under a chart:
   {{{
sage: int_P = P.interior(); int_P
Relative interior of
 a 2-dimensional polyhedron in ZZ^2 defined as the convex hull of 3 vertices
sage: McInt_P = c_cart.preimage(int_P, name='McInt_P'); McInt_P
Open subset McInt_P of the 2-dimensional topological manifold R^2
sage: M((0, 0)) in McInt_P
False
sage: M((1, 1)) in McInt_P
True
   }}}

In a similar direction, the new method `ConvexSet_base.affine_hull_manifold` makes the affine hull of a convex set available as a Riemannian submanifold embedded into the ambient Euclidean space. [[https://trac.sagemath.org/ticket/31659|#31659]] 

=== Manifold options for RealSet constructors ===

As an application of chart pullbacks, the `RealSet` constructors have been extended so that they can optionally build manifolds or manifolds subsets.  [[https://trac.sagemath.org/ticket/31881|#31881]]

This is activated by passing the manifold keyword `structure='differentiable'`:
{{{
sage: RealSet(-oo, oo, structure='differentiable')
Real number line ℝ

sage: RealSet([0, 1], structure='differentiable')
Subset [0, 1] of the Real number line ℝ
}}}
It is also implied when a coordinate name is given using the keyword `coordinate`:
{{{
sage: RealSet(0, 1, coordinate='λ')
Open subset (0, 1) of the Real number line ℝ
sage: _.category()
Join of
 Category of smooth manifolds over Real Field with 53 bits of precision and
 Category of connected manifolds over Real Field with 53 bits of precision and
 Category of subobjects of sets
}}}
It is also implied by assigning a coordinate name using generator notation:
{{{
sage: R_xi.<ξ> = RealSet.real_line(); R_xi
Real number line ℝ
sage: R_xi.canonical_chart()
Chart (ℝ, (ξ,))
}}}
The above example showed the use of the new constructor `RealSet.real_line`. The manifold keywords work for all other specialized constructors for various types of intervals, as well.

|| Constructor                        || Interval     ||
|| `RealSet.open`                     || `(a, b)`     ||
|| `RealSet.closed`                   || `[a, b]`     ||
|| `RealSet.point`                    || `{a}`        ||
|| `RealSet.open_closed`              || `(a, b]`     ||
|| `RealSet.closed_open`              || `[a, b)`     ||
|| `RealSet.unbounded_below_closed`   || `(-oo, b]`   ||
|| `RealSet.unbounded_below_open`     || `(-oo, b)`   ||
|| `RealSet.unbounded_above_closed`   || `[a, +oo)`   ||
|| `RealSet.unbounded_above_open`     || `(a, +oo)`   ||
|| `RealSet.real_line`                || `(-oo, +oo)` || new in Sage 9.4 ||
|| `RealSet.interval`                 || any          || new in Sage 9.4 ||

The global bindings `RealLine` and `OpenInterval`, which create manifolds, are now deprecated, but these constructors will remain available through the `manifolds` catalog.  The objects made by these constructors are now also valid input for `RealSet`. [[https://trac.sagemath.org/ticket/30832|#30832]]


=== Families and posets of manifold subsets ===

In Sage 9.4, the system for declaring (named) subsets of topological and differentiable manifolds in `sage.manifolds` has become more general and powerful. 

In addition to `declare_union` and `declare_intersection`, there are now methods `declare_empty`, `declare_nonempty`, `declare_disjoint`, `declare_subset`, `declare_superset`, and `declare_equal`. 

The declared subset relations define a quasiorder on the named subsets. 
To visualize the subset relations, methods `subset_digraph` and `superset_digraph` are now available. 

Through a sequence of subset declarations, or directly through `declare_equal`, several named subsets (which are distinct as Python objects) can become necessarily equal as mathematical sets. By quotienting out by this equivalence relation, we obtain a partially ordered set, which is available through the new methods `subset_poset` and `superset_poset`.

The new class `ManifoldSubsetFiniteFamily` serves as a container for storing arbitrary finite families of manifold subsets, indexed by their names. The new methods `subset_family`, `superset_family`, and `open_superset_family` return instances of `ManifoldSubsetFiniteFamily`. Such instances are automatically sorted by name, are hashable, compare with each other lexicographically, and print more compactly than lists/tuples/sets of manifold subsets. 

For more information, see [[https://trac.sagemath.org/ticket/31740|Meta-ticket #31740]].

== Configuration changes ==

=== Support for system gcc/g++/gfortran 11 added ===

Sage can now be built using GCC 11. [[https://trac.sagemath.org/ticket/31786|#31786]]

This enables building Sage using the default compiler on Fedora 34, and on macOS with homebrew using the default compilers. (Previously, in Sage 9.3, specific older versions of the compilers had to be installed.)


=== Support for system Python 3.6 dropped ===

It was already deprecated in Sage 9.3. [[https://trac.sagemath.org/ticket/30551|#30551]]

It is still possible to build the Sage distribution on systems with old Python versions, but Sage will build its own copy of Python 3.9.x in this case.

=== Support for optional packages on systems with gcc 4.x dropped ===

Sage is phasing out its support for building from source using very old compilers from the gcc 4.x series.

As of Sage 9.4, on systems such as `ubuntu-trusty` (Ubuntu 14.04), `debian-jessie` (8), `linuxmint-17`, and `centos-7` that only provide gcc from the outdated 4.x series, it is still supported to build Sage from source with the system compilers.  However, building optional and experimental packages is no longer supported, and we have removed these configurations from our CI.  [[https://trac.sagemath.org/ticket/31526|#31526]]

Users in scientific computing environments using these platforms should urge their system administrators to upgrade to a newer distribution, or at least to a newer toolchain. 

=== For developers: ./configure --prefix=SAGE_LOCAL --with-sage-venv=SAGE_VENV ===

Sage 9.4 makes it possible to configure the build to make a distinction between:

 * the installation tree for non-Python packages (`SAGE_LOCAL`, which defaults to `SAGE_ROOT/local` and can be set using the `configure` option `--prefix`), and

 * the installation tree (virtual environment) for Python packages (`SAGE_VENV`). By default, `SAGE_VENV` is just the same as `SAGE_LOCAL`, but it can be set to an arbitrary directory using the `configure` option `--with-sage-venv`.

Package installation records are kept within each tree, and thus separately. This allows developers to switch between different system Python versions without having to rebuild the whole set of non-Python packages. See [[https://trac.sagemath.org/ticket/29013|#29013]] for details.


== Package upgrades ==

=== FLINT and Arb ===

[[http://www.flintlib.org/|FLINT]] has been upgraded to 2.7.1 in [[https://trac.sagemath.org/ticket/31069|#31069]].  Sage 9.4 has added support for using FLINT 2.8.x on systems that provide it in [[https://trac.sagemath.org/ticket/32175|#32175]]. The minimum supported FLINT version is now 2.6.0 [[https://trac.sagemath.org/ticket/31525|#315125]]. Sage developers can now make use of more FLINT features added in the 2.x development series, see [[https://trac.sagemath.org/ticket/31408|Meta-ticket #31408: Use new features from FLINT 2.x]].

[[https://arblib.org/index.html|Arb]] has been upgraded to [[https://arblib.org/history.html#version-2-19-0|2.19.0]], which brings various performance improvements.


=== NumPy and SciPy ===

Many upgrades were enabled by dropping support for Python 3.6. 

In particular, [[https://numpy.org/|NumPy]] has been upgraded to 1.20.3 in [[https://trac.sagemath.org/ticket/31008|#31008]].  Sage users benefit from many improvements made in the [[https://numpy.org/devdocs/release/1.20.0-notes.html|NumPy 1.20]] series.  The minimum version of !NumPy supported by the Sage library, according to `build/pkgs/numpy/install-requires.txt`, is still 1.19 (slightly ahead of the [[https://numpy.org/neps/nep-0029-deprecation_policy.html#drop-schedule|NEP 29 drop schedule]]).

[[https://www.scipy.org/|SciPy]] has been upgraded to 1.6.3 in [[https://trac.sagemath.org/ticket/31008|#31008]]; the minimum version supported by the Sage library, according to `build/pkgs/scipy/install-requires.txt`, is still 1.5.  The [[https://docs.scipy.org/doc/scipy/release.1.6.0.html|SciPy 1.6 series]] has brought many improvements. Among the many highlights, the integration of the high-performance linear programming library [[https://www.maths.ed.ac.uk/hall/HiGHS/|HiGHS]] stands out. [[https://trac.sagemath.org/ticket/32282|#32282]] tracks the task of making use of it as a backend of `MixedIntegerLinearProgram` in Sage.

=== lrslib and polymake ===

[[http://cgm.cs.mcgill.ca/~avis/C/lrs.html|lrslib]], providing reverse search algorithms for vertex enumeration for polyhedra and equilibrium problems, has been upgraded to version 071b, which promises major speedups thanks to a new hybrid arithmetic. [[https://trac.sagemath.org/ticket/27745|#27745]]

[[https://polymake.org/doku.php/start|polymake]], a powerful system for computations with convex polyhedra, simplicial complexes, matroids, graphs, and tropical hypersurfaces, has been upgraded to version 4.4 in [[https://trac.sagemath.org/ticket/27745|#27745]]. The major upgrade from version 3.4 has brought many improvements made during the polymake 
[[https://polymake.org/doku.php/news/release_3_5|3.5]], [[https://polymake.org/doku.php/news/release_3_6|3.6]], [[https://polymake.org/doku.php/news/release_4_0|4.0]], [[https://polymake.org/doku.php/news/release_4_1|4.1]],
[[https://polymake.org/doku.php/news/release_4_2|4.2]], [[https://polymake.org/doku.php/news/release_4_3|4.3]], and [[https://polymake.org/doku.php/news/release_4_4|4.4]] development cycles. To use polymake from Sage, use `sage -i jupymake`, which activates a more robust interface; the original pexpect-based interfaces is now deprecated. Sage 9.4 also contains a number of interface and packaging improvements for polymake. [[https://trac.sagemath.org/ticket/26368|#26368]], [[https://trac.sagemath.org/ticket/31864|#31864]], [[https://trac.sagemath.org/ticket/31840|#31840]]


=== Other upgrades ===



 * [[https://trac.sagemath.org/query?summary=~update&milestone=sage-9.4&summary=~upgrade&groupdesc=1&group=status&max=1500&col=id&col=summary&col=component&col=time&col=changetime&col=author&col=reviewer&col=keywords&order=component|Upgrade tickets, milestone 9.4]]

 * [[https://repology.org/projects/?inrepo=sagemath_develop|Packages in the SageMath distribution tracked by repology.org]]


== For developers and packagers: Refactoring, modernization, and modularization ==

=== Using type annotations (PEP 563) in the Sage library ===

Dropping support for Python 3.6 has allowed us to start using language and library features introduced in Python 3.7.  [[https://trac.sagemath.org/ticket/29756|Meta-ticket #29756]] tracks such features by Python version.

One notable new feature of Python 3.7 is type annotations for function arguments and return values. Sage 9.4 has started to make use of this feature, in the revised form that [[https://www.python.org/dev/peps/pep-0563|PEP 563]] provides (`from __future__ import annotations`). A new section in the developer's manual added in [[https://trac.sagemath.org/ticket/32067|#32067]] provides guidance on how to use this feature.
See [[https://trac.sagemath.org/ticket/32058|#32058]], [[https://trac.sagemath.org/ticket/32128|#32128]], [[https://trac.sagemath.org/ticket/32164|#32164]] for examples.

=== New location for distribution package sources: SAGE_ROOT/pkgs ===

The Sage source tree contains a number of source trees of Python distribution packages. In Sage 9.4, they have been moved to a new central location. [[https://trac.sagemath.org/ticket/31577|#31577]]
{{{
SAGE_ROOT
- pkgs
  - sage-conf
    - setup.py
    - bin/
    - sage_conf.py.in
  - sage-docbuild
    - setup.py
    - sage_docbuild   -> symlinks to SAGE_ROOT/sage_docbuild/
  - sage-sws2rst
    - setup.py
    - bin/
    - sage_sws2rst/
  - sagemath-standard
    - setup.py
    - bin             -> symlinks to SAGE_ROOT/src/bin/        
    - sage            -> symlinks to SAGE_ROOT/src/sage/
    - sage_setup      -> symlinks to SAGE_ROOT/src/sage_setup/
}}}
that is, the new directory `pkgs` is on the same level as 
{{{
SAGE_ROOT
- src
}}}
the unchanged monolithic sagelib source tree, which will continue to contain subdirectories
{{{
  - bin/ 
  - doc/
  - sage/
  - sage_docbuild/      # was sage_setup/docbuild/ in Sage 9.2
  - sage_setup/ 
}}}
All files that contain Sage doctests (tested with `sage -t` or `make ptest`) remain in the monolithic `src/` source tree; the source trees of the distributions symlink there.

Other modularization tickets will add
{{{
SAGE_ROOT
- pkgs
  - sagemath-core/
  - sagemath-brial/
  - sagemath-giac/
  - sagemath-meataxe/
  - sagemath-tdlib/
}}}
etc.; see [[https://trac.sagemath.org/ticket/29705|Meta-ticket #29705]] for more information.

=== Modern Python packaging metadata for sagemath-standard ===

`./bootstrap` now generates modern Python packaging metadata (`pyproject.toml` and `setup.cfg`, as well as `requirements.txt` and `Pipfile`) for our distribution package `sagemath-standard`. [[https://trac.sagemath.org/ticket/30913|#30913]]

The version information for dependencies comes from the existing files `build/pkgs/*/install-requires.txt`.


== Availability of Sage 9.4 and installation help ==

The first beta of the 9.4 series, 9.4.beta0, was tagged on 2021-05-26.  The first release candidate is 9.4.rc0,  tagged on 2021-07-28.

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.

== More details ==

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.4&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.4]]
