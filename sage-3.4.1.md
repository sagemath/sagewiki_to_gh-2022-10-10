= Sage 3.4.1 Release Tour =

Sage 3.4.1 was released on FIXME. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.1.txt|sage-3.4.1.txt]]. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * Merging improvements during the Sage Days 13 coding sprint.
 * Other bug fixes post Sage 3.4.


== Algebra ==


 * FIXME: summarize ticket #5535.

 * FIXME: summarize ticket #5658.


 * Speed-up in irreducibility test (Ryan Hinton) -- For polynomials over the finite field {{{GF(2)}}}, the test for irreducibility is now up to 40,000 times faster than previously. On a 64-bit Debian/squeeze machine with Core 2 Duo running at 2.33 GHz, one has the following timing improvements:
 {{{
# BEFORE
sage: P.<x> = GF(2)[]
sage: f = P.random_element(1000)
sage: %timeit f.is_irreducible()
10 loops, best of 3: 948 ms per loop
sage:
sage: f = P.random_element(10000)
sage: %time f.is_irreducible()
# gave up because it took minutes!


# AFTER
sage: P.<x> = GF(2)[]
sage: f = P.random_element(1000)
sage: %timeit f.is_irreducible()
10000 loops, best of 3: 22.7 µs per loop
sage:
sage: f = P.random_element(10000)
sage: %timeit f.is_irreducible()
1000 loops, best of 3: 394 µs per loop
sage:
sage: f = P.random_element(100000)
sage: %timeit f.is_irreducible()
100 loops, best of 3: 10.4 ms per loop
 }}}
Furthermore, on Debian 5.0 Lenny with kernel 2.6.24-1-686, an Intel(R) Celeron(R) CPU running at 2.00GHz with 1.0GB of RAM, one has the following timing statistics:
 {{{
# BEFORE
sage: P.<x> = GF(2)[]
sage: f = P.random_element(1000)
sage: %timeit f.is_irreducible()
10 loops, best of 3: 1.14 s per loop
sage: 
sage: f = P.random_element(10000)
sage: %time f.is_irreducible()
CPU times: user 4972.13 s, sys: 2.83 s, total: 4974.95 s
Wall time: 5043.02 s
False


# AFTER
sage: P.<x> = GF(2)[]
sage: f = P.random_element(1000)
sage: %timeit f.is_irreducible()
10000 loops, best of 3: 40.7 µs per loop
sage: 
sage: f = P.random_element(10000)
sage: %timeit f.is_irreducible()
1000 loops, best of 3: 930 µs per loop
sage: 
sage: 
sage: f = P.random_element(100000)
sage: %timeit f.is_irreducible()
10 loops, best of 3: 27.6 ms per loop
 }}}


== Algebraic Geometry ==


 * Refactor {{{dimension()}}} method for schemes (Alex Ghitza) -- Implement methods {{{dimension_absolute()}}} and {{{dimension_relative()}}}, where {{{dimension()}}} is an alias for {{{dimension_absolute()}}}. Here are some examples of using {{{dimension_absolute()}}} and {{{dimension()}}}:
 {{{
sage: A2Q = AffineSpace(2, QQ)
sage: A2Q.dimension_absolute()
2
sage: A2Q.dimension()
2
 }}}
 And here's an example demonstrating the use of {{{dimension_relative()}}}:
 {{{
sage: S = Spec(ZZ)
sage: S.dimension_relative()
0
 }}}


 * Plotting affine and projective curves (Alex Ghitza) -- Improving the plotting usability so it is now easier to plot affine and projective curves. For example, we can plot a [[attachment:5-nodal curve]] of degree 11:
 {{{
sage: R.<x, y> = ZZ[] 
sage: C = Curve(32*x^2 - 2097152*y^11 + 1441792*y^9 - 360448*y^7 + 39424*y^5 - 1760*y^3 + 22*y - 1) 
sage: C.plot((x, -1, 1), (y, -1, 1), plot_points=400)
 }}}
 Now we plot an [[attachment:elliptic curve]]:
 {{{
sage: E = EllipticCurve('101a') 
sage: C = Curve(E) 
sage: C.plot()
 }}}


== Basic Arithmetic ==


 * Speed-up in dividing a polynomial by an integer (Burcin Erocal) -- Dividing a polynomial by an integer is now up to 6x faster than previously. On Debian 5.0 Lenny with kernel 2.6.24-1-686, an Intel(R) Celeron(R) CPU running at 2.00GHz with 1.0GB of RAM, one has the following timing statistics:
 {{{
# BEFORE
sage: R.<x> = ZZ["x"]
sage: f = 389 * R.random_element(1000)
sage: timeit("f//389")
625 loops, best of 3: 312 µs per loop

# AFTER
sage: R.<x> = ZZ["x"]
sage: f = 389 * R.random_element(1000)
sage: timeit("f//389")
625 loops, best of 3: 48.3 µs per loop
 }}}


 * New {{{fast_float}}} supports more datatypes with improved performance (Carl Witty) -- A rewrite of {{{fast_float}}} to support multiple types. Here, we get accelerated evaluation over {{{RealField(k)}}} as well as {{{RDF}}}, real double field. As compared with the previous {{{fast_float}}}, improved performance can range from 2% faster to more than 2x as fast. An extended list of benchmark details is available at [[http://trac.sagemath.org/sage_trac/ticket/5093|ticket 5093]].


 * FIXME: summarize #5622

 * FIXME: summarize #5735

 * FIXME: summarize #5659

 * FIXME: summarize #3309

 * FIXME: summarize #5685


== Build ==


== Calculus ==


 * Deprecate the calling of symbolic functions with unnamed arguments (Carl Witty, Michael Abshoff) -- Previous releases of Sage supported symbolic functions with "no arguments". This style of constructing symbolic functions is now deprecated. For example, previously Sage allowed for defining a symbolic function in the following way
 {{{
f2 = 5 - x^2  # bad; this is deprecated
 }}}
 But users are encouraged to explicitly declare the variables used in a symolic function. For instance, the following is encouraged:
 {{{
sage: x,y = var("x, y")    # explicitly declare your variables
sage: f(x, y) = x^2 + y^2  # this syntax is encouraged
 }}}



== Coercion ==


== Combinatorics ==


 * Enhancements to the {{{Subsets}}} and {{{Subwords}}} modules (Florent Hivert) -- Numerous enhancements to the modules {{{Subsets}}} and {{{Subwords}}} include:
  1. An implementation of subsets for finite multisets, i.e. sets with repetitions.
  1. Adding the method {{{__contains__}}} for {{{Subsets}}} and {{{Subwords}}}.
 Here's an example for working with multisets:
 {{{
sage: S = Subsets([1, 2, 2], submultiset=True); S
SubMultiset of [1, 2, 2]
sage: S.list()
[[], [1], [2], [1, 2], [2, 2], [1, 2, 2]]
sage: Set([1,2]) in S  # this uses __contains__ in Subsets
True
sage: Set([]) in S
True
sage: Set([3]) in S
False
 }}}
 And here's an example of using {{{__contains__}}} with {{{Subwords}}}:
 {{{
sage: [] in Subwords([1,2,3,4,3,4,4])
True
sage: [2,3,3,4] in Subwords([1,2,3,4,3,4,4])
True
sage: [2,3,3,1] in Subwords([1,2,3,4,3,4,4])
False
 }}}


 * Fix and Enhancements to permutations (Sebastien Labbe) -- 
 Corrects the Robinson-Schensted algorithm on trivial permutations. Implements the inverse Robinson-Schensted algorithm:
 {{{
 sage: Permutation((Tableau([[1,2,4],[3]]), Tableau([[1,3,4],[2]])))
 [3, 1, 2, 4]
 sage: Permutation(([[1,2,4],[3]], [[1,3,4],[2]]))
 [3, 1, 2, 4]
 }}}
 It also works for arbitrary words (with semi-standard tableaux):
 {{{
 sage: Permutation(([[1,2,2],[3]], [[1,3,4],[2]]))
 [3, 1, 2, 2]
 }}}

 * First pass of cleanup of the interface of combinatorial classes -- Florent Hivert

 Before the patch the interface of combinatorial classes had two problems:

   - there were two redundant ways to get the number of elements {{{len(C)}}} and {{{C.count()}}}. Moreover {{{len}}} must return a plain {{{int}}} where we want arbitrary large number and even {{{infinity}}};

   - there were two redundant way to get an iterator for the elements {{{C.iterator()}}} and {{{iter(C)}}} (allowing for {{{for c in C: ...}}}) via {{{C.__iter__}}}.
 
 The patch standardize those to:

   - {{{C.cardinality()}}} which is more explicit and consistent with many other Sage libraries;

   - {{{iter(C)}}} / {{{for x in C:}}} via {{{C.__iter__}}} with is clearly more Pythonic.
 
  The functions {{{ iterator}}} and {{{count}}} are deprecated (with a warning) but still working for the moment (please fix your code). On the other hand, there was no way to keep backward compatibility for {{{len}}}. Indeed, many of function such as {{{list / filter / map}}} try silently to call {{{len}}},  which would have caused miriads of warnings to be issued in seemingly unrelated places. So it was decided to simply remove it, and issue an error, suggesting to call {{{cardinality}}} instead. 

 * FIXME: summarize #4549

 * FIXME: summarize #5729

 * FIXME: summarize #5478

 * FIXME: summarize #5721


== Commutative Algebra ==


 * New function {{{weil_restriction()}}} on multivariate ideals (Martin Albrecht) -- The new function {{{weil_restriction()}}} computes the [[http://en.wikipedia.org/wiki/Weil_restriction|Weil restriction]] of a multivariate ideal over some extension field. A Weil restriction is also known as a restriction of scalars. Here's an example on computing a Weil restriction:
 {{{
sage: k.<a> = GF(2^2) 
sage: P.<x,y> = PolynomialRing(k, 2)
sage: I = Ideal([x*y + 1, a*x + 1])
sage: I.variety() 
[{y: a, x: a + 1}] 
sage: J = I.weil_restriction() 
sage: J 
Ideal (x1*y0 + x0*y1 + x1*y1, x0*y0 + x1*y1 + 1, x0 + x1, x1 + 1) of 
Multivariate Polynomial Ring in x0, x1, y0, y1 over Finite Field of size 2
 }}}


 * FIXME: summarize #5146


 * FIXME: summarize #5353


 * FIXME: summarize #3812


== Distribution ==


== Doctest ==


 * FIXME: summarize #5318


== Documentation ==


== Geometry ==

 * Improved enumeration of vertices and 0-dimensional faces of LatticePolytope's. There was an inconsistency between indicies of vertices, i.e. columns of the .vertices() matrix, and indicies of 0-dimensional faces, i.e. objects returned by .faces(dim=0). E.g. the 5-th 0-dimensional face could be generated by the 7-th vertex etc. Now the i-th 0-dimensional face is generated by the i-th vertex. (The reason for the old behaviour was the output of the underlying software package PALP, now there is extra sorting.)

== Graph Theory ==


 * FIXME: summarize #5623


== Graphics ==


 * FIXME: summarize #5606

 * FIXME: summarize #5450


== Group Theory ==


 * Speed-up in comparing elements of a permutation group (Robert Bradshaw, John H. Palmieri, Rob Beezer) -- For elements of a permutation group, comparison between those elements is now up to 13x faster. On Mac OS X 10.4 with Intel Core 2 duo running at 2.33 GHz, one has the following improvement in timing statistics:
 {{{
# BEFORE
sage: a = SymmetricGroup(20).random_element()
sage: b = SymmetricGroup(10).random_element()
sage: timeit("a == b")
625 loops, best of 3: 3.19 µs per loop


# AFTER
sage: a = SymmetricGroup(20).random_element()
sage: b = SymmetricGroup(10).random_element()
sage: time v = [a == b for _ in xrange(2000)]
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.00 s
sage: timeit("a == b")
625 loops, best of 3: 240 ns per loop
 }}}


 * FIXME: summarize #5264


== Interfaces ==


== Linear Algebra ==


 * Deprecate the function {{{invert()}}} (John H. Palmieri) -- The function {{{invert()}}} for calculating the inverse of a dense matrix with rational entries is now deprecated. Instead, users are now advised to use the function {{{inverse()}}}. Here's an example of using the function {{{inverse()}}}:
 {{{
sage: a = matrix(QQ, 2, [1, 5, 17, 3])
sage: a.inverse()  
[-3/82  5/82] 
[17/82 -1/82] 
 }}}


 * Speed-up in calculating determinants of matrices (John H. Palmieri, William Stein) -- For matrices over {{{Z/nZ}}} with {{{n}}} composite, calculating their determinants is now up to 1500x faster. On Debian 5.0 Lenny with kernel 2.6.24-1-686, an Intel(R) Celeron(R) 2.00GHz CPU with 1.0GB of RAM, one has the following timing statistics:
 {{{
# BEFORE
sage: time random_matrix(Integers(26), 10).determinant()
CPU times: user 15.52 s, sys: 0.02 s, total: 15.54 s
Wall time: 15.54 s
13
sage: time random_matrix(Integers(256), 10).determinant()
CPU times: user 15.38 s, sys: 0.00 s, total: 15.38 s
Wall time: 15.38 s
144


# AFTER
sage: time random_matrix(Integers(26), 10).determinant()
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.01 s
23
sage: time random_matrix(Integers(256), 10).determinant()
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.00 s
 }}}


 * FIXME: summarize #5715


== Miscellaneous ==


 * FIXME: summarize #5638

 * FIXME: summarize #5386


== Modular Forms ==


 * FIXME: summarize #5520

 * FIXME: summarize #5648

 * FIXME: summarize #5180


== Notebook ==


FIXME: A number of tickets related to UTF-8 text got merged and should definitely be mentioned! #4547, #5211; #2896 and #1477 got fixed by those tickets. There's also #5564, which may not get merged for 3.4.1 but should get in soon; it pulls together a whole bunch of UTF-8 fixes and improvements.


 * FIXME: summarize #5681


== Number Theory ==


 * FIXME: summarize #5518

 * FIXME: summarize #5508

 * FIXME: summarize #793

 * FIXME: summarize #4667

 * FIXME: summarize #5159

 * FIXME: summarize #4990

 * FIXME: summarize #3081

 * FIXME: summarize #4724

 * FIXME: summarize #5673


== Numerical ==


== Packages ==


 * FIXME: summarize #4987

 * FIXME: summarize #4881

 * FIXME: summarize #4880

 * FIXME: summarize #4876

 * FIXME: summarize #5672

 * FIXME: summarize #5240

 * FIXME: summarize #5738

 * FIXME: summarize #5696

 * FIXME: summarize #4987

 * FIXME: summarize #5697

 * FIXME: summarize #5823


== Quadratic Forms ==


== Symbolics ==

 * FIXME: summarize #5737


== User Interface ==


== Website / Wiki ==
