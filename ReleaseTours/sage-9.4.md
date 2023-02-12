

# Sage 9.4 Release Tour

released Aug 22, 2021 

[[_TOC_]] 


## Symbolics


### Extended interface with SymPy

The <a class="https" href="https://www.sympy.org/en/index.html">SymPy</a> package has been updated to version 1.8. 

SageMath has a bidirectional interface with SymPy. Symbolic expressions in Sage provide a `_sympy_` method, which converts to SymPy; also, Sage attaches `_sage_` methods to various SymPy classes, which provide the opposite conversion. 

In Sage 9.4, several conversions have been added. Now there is a bidirectional interface as well for  matrices and vectors. <a class="https" href="https://trac.sagemath.org/ticket/31942">#31942</a> 
```txt
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
```
Work is underway to make SymPy's symbolic linear algebra methods available in Sage via this route. 

Callable symbolic expressions, such as those created using the Sage preparser's `f(...) = ...` syntax, now convert to a SymPy `Lambda`. <a class="https" href="https://trac.sagemath.org/ticket/32130">#32130</a> 
```txt
sage: f(x, y) = x^2 + y^2; f
(x, y) |--> x^2 + y^2
sage: f._sympy_()
Lambda((x, y), x**2 + y**2)
```
Sage has added a formal set membership function <a class="https" href="https://doc.sagemath.org/html/en/reference/functions/sage/functions/other.html#sage.functions.other.Function_elementof">element_of</a> for use in symbolic expressions; it converts to a SymPy's `Contains` expression. <a class="https" href="https://trac.sagemath.org/ticket/24171">#24171</a> 

Moreover, all sets and algebraic structures (`Parent`s) of SageMath are now accessible to SymPy by way of a wrapper class `SageSet`, which implements the <a class="https" href="https://docs.sympy.org/latest/modules/sets.html#set">SymPy Set API</a>. <a class="https" href="https://trac.sagemath.org/ticket/31938">#31938</a> 
```txt
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
```
Finite or infinite, we can wrap it: 
```txt
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
```
Some parents or constructions have a more specific conversion to SymPy. <a class="https" href="https://trac.sagemath.org/ticket/31931">#31931</a>, <a class="https" href="https://trac.sagemath.org/ticket/32015">#32015</a> 
```txt
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
```
See <a class="https" href="https://trac.sagemath.org/ticket/31926">Meta-ticket #31926: Connect Sage sets to SymPy sets</a> 


### ConditionSet

Sage 9.4 introduces a class <a class="https" href="https://doc.sagemath.org/html/en/reference/sets/sage/sets/condition_set.html#sage.sets.condition_set.ConditionSet">ConditionSet</a> for subsets of a parent (or another set) consisting of elements that satisfy the logical "and" of finitely many predicates. <a class="https" href="https://trac.sagemath.org/ticket/32089">#32089</a> 
```txt
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
```
The name `ConditionSet` is borrowed from SymPy. In fact, if the given predicates (condition) are symbolic, a `ConditionSet` can be converted to a SymPy `ConditionSet`; the `_sympy_` method falls back to creating a `SageSet` wrapper otherwise. 


### symbolic_expression(lambda x, y: ...)

Sage 9.4 has added a new way to create callable symbolic expressions. <a class="https" href="https://trac.sagemath.org/ticket/32103">#32103</a> 

The global function `symbolic_expression` now accepts a callable such as those created by `lambda` expressions. The result is a callable symbolic expression, in which the formal arguments of the callable are the symbolic arguments. 

Example: 
```txt
symbolic_expression(lambda x,y: x^2+y^2) == (SR.var("x")^2 + SR.var("y")^2).function(SR.var("x"), SR.var("y"))
```
This provides a convenient syntax in particular in connection to `ConditionSet`. 

Instead of  
```txt
sage: predicate(x, y, z) = sqrt(x^2 + y^2 + z^2) < 12  # preparser syntax, creates globals
sage: ConditionSet(ZZ^3, predicate)
```
one is now able to write 
```txt
sage: ConditionSet(ZZ^3, symbolic_expression(lambda x, y, z: 
....:     sqrt(x^2 + y^2 + z^2) < 12))
```

## Convex geometry


### ABC for convex sets

Sage 9.4 has added an abstract base class <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/convex_set.html#sage.geometry.convex_set.ConvexSet_base">ConvexSet_base</a> (as well as abstract subclasses `ConvexSet_closed`, `ConvexSet_compact`, `ConvexSet_relatively_open`, `ConvexSet_open`) for convex subsets of finite-dimensional real vector spaces.  The abstract methods and default implementations of methods provide a unifying API to the existing classes `Polyhedron_base`, `ConvexRationalPolyhedralCone`, `LatticePolytope`, and `PolyhedronFace`. <a class="https" href="https://trac.sagemath.org/ticket/31919">#31919</a>, <a class="https" href="https://trac.sagemath.org/ticket/31959">#31959</a>, <a class="https" href="https://trac.sagemath.org/ticket/31990">#31990</a>, <a class="https" href="https://trac.sagemath.org/ticket/31993">#31993</a> 

Several methods previously only available for `Polyhedron_base` instances, are now available for all convex sets.  The method `an_affine_basis` returns a sequence of points that span by affine linear combinations the affine hull, i.e., the smallest affine subspace in which the convex set lies. The method `affine_hull` returns the latter as a polyhedron. The method <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/convex_set.html#sage.geometry.convex_set.ConvexSet_base.affine_hull_projection">affine_hull_projection</a> (renamed from `affine_hull` in Sage 9.1) computes an affine linear transformation of the convex set to a new ambient vector space, in which the image is full-dimensional. The generalized method also provides additional data: the right inverse (section map) of the projection. <a class="https" href="https://trac.sagemath.org/ticket/27366">#27366</a>, <a class="https" href="https://trac.sagemath.org/ticket/31963">#31963</a>, <a class="https" href="https://trac.sagemath.org/ticket/31993">#31993</a> 

As part of the `ConvexSet_base` API, there are new methods for point-set topology such as `is_open`, `relative_interior`, and `closure`.  For example, taking the `relative_interior` of a polyhedron constructs an instance of <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/relative_interior.html#sage.geometry.relative_interior.RelativeInterior">RelativeInterior</a>, a simple object that provides a `__contains__` method and all other methods of the `ConvexSet_base` API. <a class="https" href="https://trac.sagemath.org/ticket/31916">#31916</a> 
```txt
sage: P = Polyhedron(vertices=[(1,0), (-1,0)])
sage: ri_P = P.relative_interior(); ri_P
Relative interior of
 a 1-dimensional polyhedron in ZZ^2 defined as the convex hull of 2 vertices
sage: (0, 0) in ri_P
True
sage: (1, 0) in ri_P
False
```
`ConvexSet_base` is a subclass of the new abstract base class <a class="https" href="https://doc.sagemath.org/html/en/reference/sets/sage/sets/set.html#sage.sets.set.Set_base">Set_base</a>. <a class="https" href="https://trac.sagemath.org/ticket/32013">#32013</a> 

This makes various methods that were previously only defined for sets constructed using the `Set` constructor available for polyhedra and other convex sets.  As an example, we can now do: 
```txt
sage: polytopes.cube().union(polytopes.tetrahedron())                                                                                                                                                
Set-theoretic union of 
 Set of elements of A 3-dimensional polyhedron in ZZ^3 defined as the convex hull of 8 vertices and 
 Set of elements of A 3-dimensional polyhedron in ZZ^3 defined as the convex hull of 4 vertices
```

### New operations on faces of convex polyhedra

`PolyhedronFace` has a new method <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/polyhedron/face.html#sage.geometry.polyhedron.face.PolyhedronFace.affine_tangent_cone">affine_tangent_cone</a>. <a class="https" href="https://trac.sagemath.org/ticket/29811">#29811</a> 
```txt
sage: c = polytopes.cube()
sage: edge = min(c.faces(1))
sage: edge.vertices()
(A vertex at (1, -1, -1), A vertex at (1, 1, -1))
sage: T_edge = edge.affine_tangent_cone()
sage: T_edge.Vrepresentation()
(A line in the direction (0, 1, 0),
 A ray in the direction (0, 0, 1),
 A vertex at (1, 0, -1),
 A ray in the direction (-1, 0, 0))
```
Sage 9.4 also defines two new `Polyhedron_base` methods that look up a face in the face lattice of a polyhedron. <a class="https" href="https://trac.sagemath.org/ticket/29683">#29683</a> 

* `meet_of_Vrep` (alias: <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/polyhedron/base.html#sage.geometry.polyhedron.base.Polyhedron_base.least_common_superface_of_Vrep">least_common_superface_of_Vrep</a>) finds the smallest face containing specified V-representatives 
* `join_of_Hrep` (alias: `greatest_common_subface_of_Hrep`) finds the largest face contained specified facets 

### Parallel face iterator

The f-vector of polyhedra is now computed in parallel on many platforms. 

For developers: This is done with a parallel face iterator. Instead of just counting the faces, one can also perform different operations in parallel. 


### Polyhedral complexes

Sage 9.4 defines a new subclass of `GenericCellComplex` for (geometric) polyhedral complexes, <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/polyhedral_complex.html#sage.geometry.polyhedral_complex.PolyhedralComplex">PolyhedralComplex</a> <a class="https" href="https://trac.sagemath.org/ticket/31748">#31748</a> 
```txt
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
```
The homogeneous analogue to a polyhedral complex is a polyhedral fan. The constructor `Fan` for instances of the class `RationalPolyhedralFan` has been generalized: If the new keyword `allow_arrangement=True` is passed, the input is allowed to be an arbitrary finite set (arrangement) of rational polyhedral cones; Sage then computes a suitable common refinement that is a fan. <a class="https" href="https://trac.sagemath.org/ticket/25122">#25122</a> 


### More details

Some smaller improvements that are listed in the <a class="https" href="https://trac.sagemath.org/wiki/SagePolyhedralGeometry#release_9.4">release notes for optimization and polyhedral geometry software interactions in Sage</a>. 


## Knot theory


### Databases

A direct access to the contents of the <a class="https" href="https://knotinfo.math.indiana.edu/">KnotInfo</a> and <a class="https" href="https://linkinfo.sitehost.iu.edu/">LinkInfo</a> databases is available as an optional Sage package, now (see <a class="https" href="https://trac.sagemath.org/ticket/30352">Trac #30352</a>). It can be installed via 


```txt
sage -i database_knotinfo
```
For example, you can obtain the Kauffman polynomial of a link via these databases which has no implementation in Sage, so far: 


```txt
sage: B = BraidGroup(8)
sage: L = Link(B([-1, -1, -1, -2, 1, -2, 3, -2, 3]))
sage: K, mirrored  = L.get_knotinfo(); K, mirrored
(<KnotInfo.K8_14: '8_14'>, True)
sage: K.kauffman_polynomial()
z^4 + 2*a^-1*z^5 + 2*a^-2*z^6 + a^-3*z^7 - 2*z^2 - 3*a^-1*z^3 - a^-2*z^4 + 3*a^-3*z^5
 + 5*a^-4*z^6 + a^-5*z^7 + 1 + a^-1*z - a^-2*z^2 - 6*a^-3*z^3 - 7*a^-4*z^4 + 4*a^-5*z^5
 + 3*a^-6*z^6 + 3*a^-3*z + 3*a^-4*z^2 - 8*a^-5*z^3 - 4*a^-6*z^4 + 3*a^-7*z^5 + 3*a^-5*z
 + a^-6*z^2 - 5*a^-7*z^3 + a^-8*z^4 + a^-7*z - a^-8*z^2
```
See also the <a class="https" href="https://doc.sagemath.org/html/en/reference/knots/sage/knots/knotinfo.html">reference manual</a>. 


### Testing isotopy

There is a new method `is_isotopic` which allows to check if two links are isotopic to each other: 


```txt
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
```

## Manifolds

The full list of changes is available in this <a class="https" href="https://sagemanifolds.obspm.fr/changelog.html">changelog</a>. 


### Unicode characters for various symbols in plain text outputs

In plain text mode, various symbols are now displayed by means of Unicode characters instead of ASCII workarounds (<a class="https" href="https://trac.sagemath.org/ticket/30473">#30473</a>). This regards  

* arrows for maps on manifolds: 
      * ```txt
sage: M = Manifold(2, 'M')
sage: X.<x,y> = M.chart()
sage: M.identity_map().display()
Id_M: M → M
   (x, y) ↦ (x, y)
sage: f = M.scalar_field(x^2 + y^2, name='f')
sage: f.display()
f: M → ℝ
   (x, y) ↦ x^2 + y^2
   
```
* partial derivatives for coordinate vector fields: 
      * ```txt
sage: v = M.vector_field(-y, x, name='v')
sage: v.display()
v = -y ∂/∂x + x ∂/∂y
sage: X.frame()
Coordinate frame (M, (∂/∂x,∂/∂y))
   
```
* circled times for tensor products: 
      * ```txt
sage: (v*diff(f)).display()
v⊗df = -2*x*y ∂/∂x⊗dx - 2*y^2 ∂/∂x⊗dy + 2*x^2 ∂/∂y⊗dx + 2*x*y ∂/∂y⊗dy
   
```
* wedge symbol for exterior products: 
      * ```txt
sage: v.wedge(X.frame()[0]).display()
v∧∂/∂x = -x ∂/∂x∧∂/∂y
   
```

### Specifying coordinate restrictions while declaring a new chart

The manifold method <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/manifold.html#sage.manifolds.manifold.TopologicalManifold.chart">chart</a> has been endowed with the new argument `coord_restrictions`, allowing to define conditions restricting the range of coordinates (<a class="https" href="https://trac.sagemath.org/ticket/32102">#32102</a>). For instance to define a half disk above the diagonal x+y=0: 
```txt
sage: M = Manifold(2, 'M')                                                                         
sage: X.<x,y> = M.chart(coord_restrictions=lambda x,y: [x^2+y^2<1, x+y>0]) 
sage: X.plot(max_range=1, number_values=41)                
```
![releasetours/sage-9.4/slanted_half_disk.png](releasetours/sage-9.4/slanted_half_disk.png) 

Previously, to achieve the same result, one had to invoke `X.add_restrictions([x^2+y^2<1, x+y>0])` after the declaration of the chart `X`. The method `add_restrictions` is now deprecated. 


### Defining submanifolds and manifold subsets by pullbacks from Sage sets

Given a continuous map `Φ` from a topological or differentiable manifold `N` and a subset `S` of the codomain of `Φ`, we define the <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/continuous_map.html#sage.manifolds.continuous_map.ContinuousMap.preimage">pullback (preimage)</a> of `S` as the subset of `N` of points `p` with `Φ(p)` in `S`. <a class="https" href="https://trac.sagemath.org/ticket/31688">#31688</a> 

Generically, such pullbacks are represented by instances of the new class <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subsets/pullback.html#sage.manifolds.subsets.pullback.ManifoldSubsetPullback">ManifoldSubsetPullback</a>. But because `Φ` is continuous, topological closures and interiors pull back accordingly. Hence, in some cases we are able to give the pullback additional structure, such as creating a submanifold rather than merely a manifold subset. 

In addition to the case when `Φ` is a continuous map between manifolds, there are two situations that connect Sage manifolds to sets defined by other components of Sage:  

* If `Φ: N -> R` is a real scalar field, then any `RealSet` `S` (i.e., a finite union of intervals) can be pulled back. 
* If `Φ` is a chart – viewed as a continuous function from the chart's domain to `R^n` – then any subset of `R^n` can be pulled back to define a manifold subset. This can be a polyhedron, a lattice, a linear subspace, a finite set, or really any object with a `__contains__` method. 
      * For example, defining a "chart polyhedron" by pulling back a polyhedron: ```txt
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
   
```Pulling back the interior of a polytope under a chart: ```txt
sage: int_P = P.interior(); int_P
Relative interior of
 a 2-dimensional polyhedron in ZZ^2 defined as the convex hull of 3 vertices
sage: McInt_P = c_cart.preimage(int_P, name='McInt_P'); McInt_P
Open subset McInt_P of the 2-dimensional topological manifold R^2
sage: M((0, 0)) in McInt_P
False
sage: M((1, 1)) in McInt_P
True
   
```
In a similar direction, the new method <a class="https" href="https://doc.sagemath.org/html/en/reference/discrete_geometry/sage/geometry/polyhedron/base.html#sage.geometry.polyhedron.base.Polyhedron_base.affine_hull_manifold">ConvexSet_base.affine_hull_manifold</a> makes the affine hull of a convex set available as a Riemannian submanifold embedded into the ambient Euclidean space. <a class="https" href="https://trac.sagemath.org/ticket/31659">#31659</a>  


### Manifold options for RealSet constructors

As an application of chart pullbacks, the <a class="https" href="https://doc.sagemath.org/html/en/reference/sets/sage/sets/real_set.html#sage.sets.real_set.RealSet">RealSet</a> constructors have been extended so that they can optionally build manifolds or manifolds subsets.  <a class="https" href="https://trac.sagemath.org/ticket/31881">#31881</a> 

This is activated by passing the manifold keyword `structure='differentiable'`: 
```txt
sage: RealSet(-oo, oo, structure='differentiable')
Real number line ℝ

sage: RealSet([0, 1], structure='differentiable')
Subset [0, 1] of the Real number line ℝ
```
It is also implied when a coordinate name is given using the keyword `coordinate`: 
```txt
sage: RealSet(0, 1, coordinate='λ')
Open subset (0, 1) of the Real number line ℝ
sage: _.category()
Join of
 Category of smooth manifolds over Real Field with 53 bits of precision and
 Category of connected manifolds over Real Field with 53 bits of precision and
 Category of subobjects of sets
```
It is also implied by assigning a coordinate name using generator notation: 
```txt
sage: R_xi.<ξ> = RealSet.real_line(); R_xi
Real number line ℝ
sage: R_xi.canonical_chart()
Chart (ℝ, (ξ,))
```
The above example showed the use of the new constructor `RealSet.real_line`. The manifold keywords work for all other specialized constructors for various types of intervals, as well. 
 Constructor                         |  Interval     
 `RealSet.open`                      |  `(a, b)`     
 `RealSet.closed`                    |  `[a, b]`     
 `RealSet.point`                     |  `{a}`        
 `RealSet.open_closed`               |  `(a, b]`     
 `RealSet.closed_open`               |  `[a, b)`     
 `RealSet.unbounded_below_closed`    |  `(-oo, b]`   
 `RealSet.unbounded_below_open`      |  `(-oo, b)`   
 `RealSet.unbounded_above_closed`    |  `[a, +oo)`   
 `RealSet.unbounded_above_open`      |  `(a, +oo)`   
 `RealSet.real_line`                 |  `(-oo, +oo)`  |  new in Sage 9.4 
 `RealSet.interval`                  |  any           |  new in Sage 9.4 

The global bindings `RealLine` and `OpenInterval`, which create manifolds, are now deprecated, but these constructors will remain available through the `manifolds` catalog, via <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/examples/real_line.html#sage.manifolds.differentiable.examples.real_line.RealLine">manifolds.RealLine</a> and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/examples/real_line.html#sage.manifolds.differentiable.examples.real_line.OpenInterval">manifolds.OpenInterval</a>. The objects made by these constructors are now also valid input for `RealSet`. <a class="https" href="https://trac.sagemath.org/ticket/30832">#30832</a> 


### Families and posets of manifold subsets

In Sage 9.4, the system for declaring (named) subsets of topological and differentiable manifolds has become more general and powerful.  

In addition to <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_union">declare_union</a> and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_intersection">declare_intersection</a>, there are now methods  <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_empty">declare_empty</a>,  <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_nonempty">declare_nonempty</a>,  <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_subset">declare_subset</a>, <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_superset">declare_superset</a>, and  <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.declare_equal">declare_equal</a>.  

The declared subset relations define a quasiorder on the named subsets.  To visualize the subset relations, methods <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.subset_digraph">subset_digraph</a> and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.superset_digraph">superset_digraph</a> are now available.  

Through a sequence of subset declarations, or directly through `declare_equal`, several named subsets (which are distinct as Python objects) can become necessarily equal as mathematical sets. By quotienting out by this equivalence relation, we obtain a partially ordered set, which is available through the new methods <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.subset_poset">subset_poset</a> and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.superset_poset">superset_poset</a>. 

The new class <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/family.html#sage.manifolds.family.ManifoldObjectFiniteFamily">ManifoldSubsetFiniteFamily</a> serves as a container for storing arbitrary finite families of manifold subsets, indexed by their names. The new methods <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.subset_family">subset_family</a>, <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.superset_family">superset_family</a>, and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/subset.html#sage.manifolds.subset.ManifoldSubset.open_superset_family">open_superset_family</a> return instances of `ManifoldSubsetFiniteFamily`. Such instances are automatically sorted by name, are hashable, compare with each other lexicographically, and print more compactly than lists/tuples/sets of manifold subsets.  

For more information, see <a class="https" href="https://trac.sagemath.org/ticket/31740">Meta-ticket #31740</a>. 


### New method for constructing a tangent vector

Manifolds have been endowed with the method <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/manifold.html#sage.manifolds.differentiable.manifold.DifferentiableManifold.tangent_vector">tangent_vector</a> (shortcut alias `vector`) for the direct construction of a tangent vector at a given point (<a class="https" href="https://trac.sagemath.org/ticket/31609">#31609</a>): 
```txt
sage: M = Manifold(2, 'M')                                                                          
sage: X.<x,y> = M.chart()                                                                           
sage: p = M((1, 2), name='p')                                                                       
sage: v = M.tangent_vector(p, -1, 3); v                                                             
Tangent vector at Point p on the 2-dimensional differentiable manifold M
sage: v.display()                                                                                   
-∂/∂x + 3 ∂/∂y
```
Previously, tangent vectors could only be constructed as elements of the tangent space at the given point: 
```txt
sage: Tp = M.tangent_space(p)                                                                       
sage: v = Tp((-1, 3))                                                                               
```

### De Rham cohomology

De Rham cohomology has been implemented via the new classes <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/de_rham_cohomology.html#sage.manifolds.differentiable.de_rham_cohomology.DeRhamCohomologyRing">DeRhamCohomologyRing</a> and <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/de_rham_cohomology.html#sage.manifolds.differentiable.de_rham_cohomology.DeRhamCohomologyClass">DeRhamCohomologyClass</a>; the <a class="https" href="https://doc.sagemath.org/html/en/reference/manifolds/sage/manifolds/differentiable/mixed_form_algebra.html">algebra of mixed differential forms</a> has been turned into a de Rham complex (<a class="https" href="https://trac.sagemath.org/ticket/31691">#31691</a>) 


### Internal code improvements and bug fixes

Various improvements/refactoring of the code have been performed in this release: 

* topological part: <a class="https" href="https://trac.sagemath.org/ticket/30311">#30311</a>, <a class="https" href="https://trac.sagemath.org/ticket/31704">#31704</a>, <a class="https" href="https://trac.sagemath.org/ticket/31854">#31854</a>, <a class="https" href="https://trac.sagemath.org/ticket/31883">#31883</a>, <a class="https" href="https://trac.sagemath.org/ticket/32009">#32009</a>, <a class="https" href="https://trac.sagemath.org/ticket/32116">#32116</a> 
* differentiable part: <a class="https" href="https://trac.sagemath.org/ticket/31658">#31658</a>, <a class="https" href="https://trac.sagemath.org/ticket/31633">#31633</a>, <a class="https" href="https://trac.sagemath.org/ticket/31692">#31692</a>, <a class="https" href="https://trac.sagemath.org/ticket/31706">#31706</a> 
In addition, various bugs have been fixed: <a class="https" href="https://trac.sagemath.org/ticket/31784">#31784</a>, <a class="https" href="https://trac.sagemath.org/ticket/31904">#31904</a>, <a class="https" href="https://trac.sagemath.org/ticket/31923">#31923</a>, <a class="https" href="https://trac.sagemath.org/ticket/32112">#32112</a>. 


## Coding theory


### AG codes

Algebraic geometry codes (shortly AG codes) and their decoders are now available in Sage 9.4 (see <a class="https" href="https://trac.sagemath.org/ticket/27957">#27957</a>). 

It is first time that all AG codes as originally defined by Goppa in 1981 are equipped with an efficient decoding algorithm implemented in free software. This has become possible when global function fields machinery was implemented in Sage 8. Most famous error correcting codes such as Reed-Solomon codes and Goppa codes (the workhorse of the McEliece cryptosystem which is a candidate of the NIST standardization process for post-quantum cryptography) are special cases of AG codes. 

A user should be warned that creating a decoder for a long AG code may take a long time, but decoding with the created decoder should be quick.   


```txt
sage: F.<a> = GF(64)
sage: A1 = AffineSpace(F,1)
sage: C = Curve(A1)
sage: C
Affine Line over Finite Field in a of size 2^6
sage: pls = C.places()
sage: Q, = C.places_at_infinity()
sage: pls.remove(Q)
sage: code = codes.EvaluationAGCode(pls, 31*Q)  # creating a Reed-Solomon code; be patient
sage: code
[64, 32] evaluation AG code over GF(64)
sage: decoder = code.decoder('K')               # be patient once more
sage: tau = decoder.decoding_radius()
sage: tau
16
sage: channel = channels.StaticErrorRateChannel(code.ambient_space(), tau)  # let's try decoding
sage: message_space = decoder.message_space()
sage: encoder = decoder.connected_encoder()
sage: message = message_space.random_element()  # a random message
sage: codeword = encoder.encode(message)        # codeword encoding the message
sage: received_vector = channel(codeword)       # codeword sent through the noisy channel
sage: (received_vector - codeword).hamming_weight()
16
sage: decoder.decode_to_code(received_vector) == codeword    # recovered the codeword
True
sage: decoder.decode_to_message(received_vector) == message  # recovered the message
True
```

## Algebra


### New algebraic objects

* The alternating central extension of the Onsager (Lie) algebra <a class="https" href="https://trac.sagemath.org/ticket/32142">#32142</a> 
* Invariant module of a finite-dimensional module under a semigroup action <a class="https" href="https://trac.sagemath.org/ticket/31939">#31939</a> 
* The twisted invariant module of a finite-dimensional module under a group action <a class="https" href="https://trac.sagemath.org/ticket/32145">#32145</a> 
* The quantum Clifford algebra <a class="https" href="https://trac.sagemath.org/ticket/32094">#32094</a> 

### Bug fixes and improvements

* Creating submodules of the module of matrices <a class="https" href="https://trac.sagemath.org/ticket/31995">#31995</a> 
* Class functions are now hashable <a class="https" href="https://trac.sagemath.org/ticket/32190">#32190</a> 
* `float^complex` now works <a class="https" href="https://trac.sagemath.org/ticket/11323">#11323</a> 
* `x * ((3*i + 4)*x - 5)` no longer segfaults <a class="https" href="https://trac.sagemath.org/ticket/31869">#31869</a> 
* Improve computation of sign for QQbar elements <a class="https" href="https://trac.sagemath.org/ticket/31767">#31767</a> 
* Implement special class for quadratic number field elements to improve coefficient computations <a class="https" href="https://trac.sagemath.org/ticket/31810">#31810</a> 
* `AdditiveAbelianGroupWrapper._discrete_log()` now uses a proper black-box group algorithm rather than brute force. <a class="https" href="https://trac.sagemath.org/ticket/23940">#23940</a> 

## Hyperbolic geometry

Bug fixed with computing the Möbius transform, midpoint, and perpendicular bisector in the hyperbolic plane. Now the computation of midpoint and perp. bisector is order independent. <a class="https" href="https://trac.sagemath.org/ticket/29936">#29936</a> 


## Configuration changes


### Support for system gcc/g++/gfortran 11 added

Sage can now be built using GCC 11. <a class="https" href="https://trac.sagemath.org/ticket/31786">#31786</a> 

This enables building Sage using the default compiler on Fedora 34, and on macOS with homebrew using the default compilers. (Previously, in Sage 9.3, specific older versions of the compilers had to be installed.) 


### Support for system Python 3.6 dropped

It was already deprecated in Sage 9.3. <a class="https" href="https://trac.sagemath.org/ticket/30551">#30551</a> 

It is still possible to build the Sage distribution on systems with old Python versions, but Sage will build its own copy of Python 3.9.x in this case. 


### Support for optional packages on systems with gcc 4.x dropped

Sage is phasing out its support for building from source using very old compilers from the gcc 4.x series. 

As of Sage 9.4, on systems such as `ubuntu-trusty` (Ubuntu 14.04), `debian-jessie` (8), `linuxmint-17`, and `centos-7` that only provide gcc from the outdated 4.x series, it is still supported to build Sage from source with the system compilers.  However, building optional and experimental packages is no longer supported, and we have removed these configurations from our CI.  <a class="https" href="https://trac.sagemath.org/ticket/31526">#31526</a> 

Users in scientific computing environments using these platforms should urge their system administrators to upgrade to a newer distribution, or at least to a newer toolchain.  


### For developers: ./configure --prefix=SAGE_LOCAL --with-sage-venv=SAGE_VENV

Sage 9.4 makes it possible to configure the build to make a distinction between: 

* the installation tree for non-Python packages (`SAGE_LOCAL`, which defaults to `SAGE_ROOT/local` and can be set using the `configure` option `--prefix`), and 
* the installation tree (virtual environment) for Python packages (`SAGE_VENV`). By default, `SAGE_VENV` is just the same as `SAGE_LOCAL`, but it can be set to an arbitrary directory using the `configure` option `--with-sage-venv`. 
Package installation records are kept within each tree, and thus separately. This allows developers to switch between different system Python versions without having to rebuild the whole set of non-Python packages. See <a class="https" href="https://trac.sagemath.org/ticket/29013">#29013</a> for details. 


## Package upgrades


### FLINT and Arb

<a class="http" href="http://www.flintlib.org/">FLINT</a> has been upgraded to 2.7.1 in <a class="https" href="https://trac.sagemath.org/ticket/31069">#31069</a>.  Sage 9.4 has added support for using FLINT 2.8.x on systems that provide it in <a class="https" href="https://trac.sagemath.org/ticket/32175">#32175</a>. The minimum supported FLINT version is now 2.6.0 <a class="https" href="https://trac.sagemath.org/ticket/31525">#31525</a>. Sage developers can now make use of more FLINT features added in the 2.x development series, see <a class="https" href="https://trac.sagemath.org/ticket/31408">Meta-ticket #31408: Use new features from FLINT 2.x</a>. 

<a class="https" href="https://arblib.org/index.html">Arb</a> has been upgraded to <a class="https" href="https://arblib.org/history.html#version-2-19-0">2.19.0</a>, which brings various performance improvements. 


### NumPy and SciPy

Many upgrades were enabled by dropping support for Python 3.6.  

In particular, <a class="https" href="https://numpy.org/">NumPy</a> has been upgraded to 1.20.3 in <a class="https" href="https://trac.sagemath.org/ticket/31008">#31008</a>.  Sage users benefit from many improvements made in the <a class="https" href="https://numpy.org/devdocs/release/1.20.0-notes.html">NumPy 1.20</a> series.  The minimum version of NumPy supported by the Sage library, according to `build/pkgs/numpy/install-requires.txt`, is still 1.19 (slightly ahead of the <a class="https" href="https://numpy.org/neps/nep-0029-deprecation_policy.html#drop-schedule">NEP 29 drop schedule</a>). 

<a class="https" href="https://www.scipy.org/">SciPy</a> has been upgraded to 1.6.3 in <a class="https" href="https://trac.sagemath.org/ticket/31008">#31008</a>; the minimum version supported by the Sage library, according to `build/pkgs/scipy/install-requires.txt`, is still 1.5.  The <a class="https" href="https://docs.scipy.org/doc/scipy/release.1.6.0.html">SciPy 1.6 series</a> has brought many improvements. Among the many highlights, the integration of the high-performance linear programming library <a class="https" href="https://www.maths.ed.ac.uk/hall/HiGHS/">HiGHS</a> stands out. <a class="https" href="https://trac.sagemath.org/ticket/32282">#32282</a> tracks the task of making use of it as a backend of `MixedIntegerLinearProgram` in Sage. 


### lrslib and polymake

<a class="http" href="http://cgm.cs.mcgill.ca/~avis/C/lrs.html">lrslib</a>, providing reverse search algorithms for vertex enumeration for polyhedra and equilibrium problems, has been upgraded to version 071b, which promises major speedups thanks to a new hybrid arithmetic. <a class="https" href="https://trac.sagemath.org/ticket/27745">#27745</a> 

<a class="https" href="https://polymake.org/doku.php/start">polymake</a>, a powerful system for computations with convex polyhedra, simplicial complexes, matroids, graphs, and tropical hypersurfaces, has been upgraded to version 4.4 in <a class="https" href="https://trac.sagemath.org/ticket/27745">#27745</a>. The major upgrade from version 3.4 has brought many improvements made during the polymake  <a class="https" href="https://polymake.org/doku.php/news/release_3_5">3.5</a>, <a class="https" href="https://polymake.org/doku.php/news/release_3_6">3.6</a>, <a class="https" href="https://polymake.org/doku.php/news/release_4_0">4.0</a>, <a class="https" href="https://polymake.org/doku.php/news/release_4_1">4.1</a>, <a class="https" href="https://polymake.org/doku.php/news/release_4_2">4.2</a>, <a class="https" href="https://polymake.org/doku.php/news/release_4_3">4.3</a>, and <a class="https" href="https://polymake.org/doku.php/news/release_4_4">4.4</a> development cycles. To use polymake from Sage, use `sage -i jupymake`, which activates a more robust interface; the original pexpect-based interface is now deprecated. Sage 9.4 also contains a number of interface and packaging improvements for polymake. <a class="https" href="https://trac.sagemath.org/ticket/26368">#26368</a>, <a class="https" href="https://trac.sagemath.org/ticket/31864">#31864</a>, <a class="https" href="https://trac.sagemath.org/ticket/31840">#31840</a> 


### PARI/GP and GAP

<a class="http" href="http://pari.math.u-bordeaux.fr/">PARI/GP</a>, the computer algebra system designed for fast computations in number theory, has been upgraded to 2.13.1 in <a class="https" href="https://trac.sagemath.org/ticket/30801">#30801</a>. The upgrade from version 2.11.4 has brought <a class="http" href="http://pari.math.u-bordeaux.fr/archives/pari-announce-20/msg00006.html">many improvements</a>. 

<a class="https" href="https://www.gap-system.org/">GAP</a>, the system for computational group theory and other discrete algebra, has been upgraded to 4.11.1. Although considered by upstream as a minor update from version 4.11.0, which was included in Sage 9.3, it provides <a class="https" href="https://github.com/gap-system/gap/blob/master/CHANGES.md#gap-4111-march-2021">many improvements and updates to GAP packages</a>. 


### Maxima and FriCAS

The symbolics packages <a class="https" href="https://maxima.sourceforge.io/">Maxima</a> and <a class="https" href="https://fricas.sourceforge.net/">FriCAS</a>, both running on <a class="https" href="https://gitlab.com/embeddable-common-lisp/ecl">Embeddable Common Lisp</a> (ECL), have been upgraded to 5.45.0 and 1.3.7, respectively. 

Also, if ECL 21.2.1 is provided by a system package, Sage is now able to use it instead of building its own copy. <a class="https" href="https://trac.sagemath.org/ticket/29617">#29617</a> 


### New standard packages

memory_allocator is a new standard package. See <a class="https" href="https://trac.sagemath.org/ticket/31591">#31591</a> 


### Other upgrades

* <a class="https" href="https://trac.sagemath.org/query?summary=~update&amp;milestone=sage-9.4&amp;summary=~upgrade&amp;groupdesc=1&amp;group=status&amp;max=1500&amp;col=id&amp;col=summary&amp;col=component&amp;col=time&amp;col=changetime&amp;col=author&amp;col=reviewer&amp;col=keywords&amp;order=component">Upgrade tickets, milestone 9.4</a> 
* <a class="https" href="https://repology.org/projects/?inrepo=sagemath_stable">Packages in the SageMath distribution tracked by repology.org</a> 

## For developers and packagers: Refactoring, modernization, and modularization


### Using type annotations (PEP 563) in the Sage library

Dropping support for Python 3.6 has allowed us to start using language and library features introduced in Python 3.7.  <a class="https" href="https://trac.sagemath.org/ticket/29756">Meta-ticket #29756</a> tracks such features by Python version. 

One notable new feature of Python 3.7 is type annotations for function arguments and return values. Sage 9.4 has started to make use of this feature, in the revised form that <a class="https" href="https://www.python.org/dev/peps/pep-0563">PEP 563</a> provides (`from __future__ import annotations`). A new section in the developer's manual added in <a class="https" href="https://trac.sagemath.org/ticket/32067">#32067</a> provides guidance on how to use this feature. See <a class="https" href="https://trac.sagemath.org/ticket/32058">#32058</a>, <a class="https" href="https://trac.sagemath.org/ticket/32128">#32128</a>, <a class="https" href="https://trac.sagemath.org/ticket/32164">#32164</a> for examples. 


### New location for distribution package sources: SAGE_ROOT/pkgs

The Sage source tree contains a number of source trees of Python distribution packages. In Sage 9.4, they have been moved to a new central location. <a class="https" href="https://trac.sagemath.org/ticket/31577">#31577</a> 
```txt
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
```
that is, the new directory `pkgs` is on the same level as  
```txt
SAGE_ROOT
- src
```
the unchanged monolithic sagelib source tree, which will continue to contain subdirectories 
```txt
  - bin/ 
  - doc/
  - sage/
  - sage_docbuild/      # was sage_setup/docbuild/ in Sage 9.2
  - sage_setup/ 
```
All files that contain Sage doctests (tested with `sage -t` or `make ptest`) remain in the monolithic `src/` source tree; the source trees of the distributions symlink there. 

Other modularization tickets will add 
```txt
SAGE_ROOT
- pkgs
  - sagemath-core/
  - sagemath-brial/
  - sagemath-giac/
  - sagemath-meataxe/
  - sagemath-tdlib/
```
etc.; see <a class="https" href="https://trac.sagemath.org/ticket/29705">Meta-ticket #29705</a> for more information. 


### Modern Python packaging metadata for sagemath-standard

`./bootstrap` now generates modern Python packaging metadata (`pyproject.toml` and `setup.cfg`, as well as `requirements.txt` and `Pipfile`) for our distribution package `sagemath-standard`. <a class="https" href="https://trac.sagemath.org/ticket/30913">#30913</a> 

The version information for dependencies comes from the existing files `build/pkgs/*/install-requires.txt`. 


### Using cython.parallel in sage

One can now use `cython.parallel` for parallel cython code, as demonstrated in <a class="https" href="https://trac.sagemath.org/ticket/31245">#31245</a>. 

The following cython code will work (in a source file and compiled in the shell): 


```txt
# distutils: extra_compile_args = OPENMP_CFLAGS
# distutils: extra_link_args = OPENMP_CFLAGS

from cython.parallel cimport prange, threadid

def foo():
    cdef int i, sum
    sum = 0
    for i in prange(1000, num_threads=8, schedule='dynamic', nogil=True):
        sum += threadid()
    return sum
```
`OPENMP_CFLAGS` and `OPENMP_CXXFLAGS` will be configured non-empty on many systems, if OpenMP is detected and working. If empty, the above code will still compile fine and run on only 1 thread instead. In particular one needs to use `cython.parallel` functions and not call OpenMP directly, e.g. with `omp_get_thread_num`. 


## Availability of Sage 9.4 and installation help

Sage 9.4 was released on 2021-08-22. 


### Sources

The Sage source code is available in the <a class="https" href="https://github.com/sagemath/sage/tree/9.4">sage git repository</a>, and the self-contained <a class="http" href="http://www.sagemath.org/download-source.html">source tarballs are available</a> for download.  

SageMath 9.4 supports most <a class="https" href="https://wiki.sagemath.org/ReleaseTours/sage-9.3#Availability_of_Sage_9.3_and_installation_help">platforms that were supported by Sage 9.3</a>.  Sage 9.4 now has support for building Sage from source on macOS 11 ("Big Sur") with the default compilers from Xcode; and the default compilers from homebrew. Our CI now tests also several flavors of openSUSE Linux. 

Sage 9.4 has been <a class="https" href="https://github.com/sagemath/sage/actions/runs/1155406210">tested to compile from source on a wide variety of platforms</a>, including: 

* **Linux 64-bit** (x86_64) 
      * ubuntu-{trusty⁺,xenial,bionic,focal,groovy,hirsute},  
      * debian-{jessie⁺,stretch,buster,bullseye},  
      * linuxmint-{17⁺,18,19,19.3,20.1}, 
      * fedora-{26,27,28,29,30,31,32,33,34}, 
      * centos-{7⁺,8}, 
      * gentoo, 
      * archlinux, 
      * opensuse-{15,15.3,tumbleweed}, 
      * slackware-14.2 
* **Linux 32-bit** (i386) 
      * debian-buster 
      * ubuntu-bionic 
      * centos-7⁺ 
      * manylinux-2_24 
* **macOS**  
      * macOS Catalina and older (macOS 10.x, with Xcode 11.x or Xcode 12.x) 
      * macOS Big Sur (macOS 11.x, with XCode 12.x) 
      * optionally, using Homebrew 
* **Windows** (Cygwin-64). 
(On platforms marked with ⁺, optional packages are only supported if `configure --without-system-gcc` is in use.) 

There are currently **known issues with an installation from source on conda-forge**, both on Linux and macOS. This has been addressed in the <a href="/ReleaseTours/sage-9.5">Sage 9.5</a> development series. 

**Sage 9.4 does not support building on recent Linux distributions that use glibc >= 2.34** (`fedora-35`, `ubuntu-impish` etc.) This has been addressed in the <a href="/ReleaseTours/sage-9.5">Sage 9.5</a> development series; you will need version 9.5.beta9 or later. 


### Installation FAQ

See <a class="https" href="https://github.com/sagemath/sage/blob/9.4/README.md">README.md</a> in the source distribution for installation instructions. 

See <a class="https" href="https://groups.google.com/forum/#!forum/sage-release">sage-release</a>, <a class="https" href="https://groups.google.com/forum/#!forum/sage-devel">sage-devel</a>. 


### Availability as binaries and in distributions

The easiest way to install Sage 9.4 is through a distribution that provides it, see <a class="https" href="https://repology.org/project/sagemath/versions">repology.org: sagemath</a>. 

<a class="https" href="https://github.com/3-manifolds/Sage_macOS/releases">A binary build of Sage 9.4 for macOS as a signed and notarized app is available.</a> You can choose between two options: A 800 MB disk image with the standard Sage distribution, and a 1 GB disk image that adds many optional packages. 

<a class="https" href="https://www.sagemath.org/download.html">Binaries for Linux platforms</a> are available.  

* If you get the error `/usr/bin/env: 'python': No such file or directory. Error running the script 'relocate-once.py'.`: Make sure that you have python installed in your system. On some recent Linux distributions, there is a `python3` binary but no `python` binary. In this case, edit the first line of `relocate-once.py` to change `python` to `python3`; or install a package that provides the symlink `/usr/bin/python->python3` (for Ubuntu 20.04, this is the package `python-is-python3`). 
* If Sage crashes when plotting or on other numerical operations, the binary distribution is not compatible with your CPU type. This is a known bug in the binary distribution that also affects the Sage 9.3 release; see <a class="https" href="https://trac.sagemath.org/ticket/32424">#32424</a>. Install from source instead.  
Note also that the binary packages do not support installing <a class="https" href="https://doc.sagemath.org/html/en/reference/spkg/index.html#optional-packages">optional Sage packages</a>. If you need any of these packages, install Sage from source instead, see above. 

<a class="https" href="https://doc.cocalc.com/software/updates-2021.html#sage-9-4-nasm">Sage 9.4 is available on the CoCalc.com online workspace</a>; however, the <a class="https" href="https://github.com/sagemathinc/cocalc-docker">CoCalc docker image</a> is still using Sage 9.3. 


### Alternative installation methods using pip

Since Sage 9.3, installation methods using `pip` are available.   
```txt
   $ python3 -m pip install sage_conf
```
This will download the <a class="https" href="https://pypi.org/project/sage-conf/">distribution package (sdist) sage_conf from PyPI</a>, which will build the non-Python components of the Sage distribution in a subdirectory of `$HOME/.sage`.  

After installation of `sage_conf`, a wheelhouse containing wheels of various Python packages is available; type `ls $(sage-config SAGE_SPKG_WHEELS)` to list them and `python3 -m pip install $(sage-config SAGE_SPKG_WHEELS)/*.whl` to install them.  

After this, you can install the Sage library, using any of these options: 

* using `python3 -m pip install sagemath-standard`, which downloads the <a class="https" href="https://pypi.org/project/sagemath-standard/">Sage library from PyPI</a> 
* or, after obtaining the Sage sources from git, `(make configure && cd src && python3 -m pip install -v --editable .)` 

### pip-installable subset distributions

Two new, experimental distribution packages are available on PyPI: <a class="https" href="https://trac.sagemath.org/ticket/29865">#29865</a> 

* <a class="https" href="https://pypi.org/project/sagemath-objects/">sagemath-objects</a> 
* <a class="https" href="https://pypi.org/project/sagemath-categories/">sagemath-categories</a> 

## More details

* <a class="https" href="https://www.sagemath.org/changelogs/sage-9.4.txt">Sage 9.4 changelog</a> 
* <a class="https" href="https://trac.sagemath.org/query?milestone=sage-9.4&amp;groupdesc=1&amp;group=status&amp;max=1500&amp;col=id&amp;col=summary&amp;col=author&amp;col=reviewer&amp;col=time&amp;col=changetime&amp;col=component&amp;col=keywords&amp;order=component">Trac tickets with milestone 9.4</a> 