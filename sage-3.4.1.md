= Sage 3.4.1 Release Tour =

Sage 3.4.1 was released on April 22nd, 2009. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.1.txt|sage-3.4.1.txt]]. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * Merging improvements during the Sage Days 13 coding sprint.
 * Other bug fixes post Sage 3.4.


== Algebra ==


 * Optimized {{{is_primitive()}}} method (Ryan Hinton) -- The method {{{is_primitive()}}} in {{{sage/rings/polynomial/polynomial_element.pyx}}} is used for determining whether or not a polynomial is primitive over a finite field. Prime divisors are calculated during the test for polynomial primitivity. Where n is large, calculating those prime divisors can dominate the running time of the test. The {{{is_primitive()}}} method now has the optional argument {{{n_prime_divs}}} for providing precomputed prime divisors. This optional argument can result in a performance improvement of up to 4x. On the machine sage.math, one has the following timing statistics:
 {{{
sage: R.<x> = PolynomialRing(GF(2), 'x')
sage: nn = 128
sage: max_order = 2^nn - 1
sage: pdivs = max_order.prime_divisors()
sage: poly = R.random_element(nn)
sage: while not (poly.degree()==nn and poly.is_primitive(max_order, pdivs)):
....:     poly = R.random_element(nn)
....:     
sage: %timeit poly.is_primitive()  # without n_prime_divs optional argument
10 loops, best of 3: 285 ms per loop
sage: %timeit poly.is_primitive(max_order, pdivs)  # with n_prime_divs optional argument
10 loops, best of 3: 279 ms per loop
sage: 
sage: nn = 256
sage: max_order = 2^nn - 1
sage: pdivs = max_order.prime_divisors()
sage: poly = R.random_element(nn)
sage: while not (poly.degree()==nn and poly.is_primitive(max_order, pdivs)):
....:     poly = R.random_element(nn)
....:     
sage: %timeit poly.is_primitive()  # without n_prime_divs optional argument
10 loops, best of 3: 3.22 s per loop
sage: %timeit poly.is_primitive(max_order, pdivs)  # with n_prime_divs optional argument
10 loops, best of 3: 700 ms per loop
 }}}


 * Speed-up the method {{{order_from_multiple()}}} (John Cremona) -- For groups of prime order n, every non-identity element has order n. The previous implementation of the method {{{order_from_multiple()}}} computes g^n twice when g is not the identity and n is prime. Such double computation is now avoided. Now for each prime p dividing the given multiple of the order, we avoid the last multiplication/powering by p, hence saving some computation time whenever the p-exponent of the order is maximal. The new implementation of {{{order_from_multiple()}}} results in a performance improvement of up to 25%. Here are some timing statistics obtained using the machine sage.math:
 {{{
# BEFORE
sage: F = GF(2^1279, 'a')
sage: n = F.cardinality() - 1 # Mersenne prime
sage: order_from_multiple(F.random_element(), n, [n], operation='*') == n
True
sage: %timeit order_from_multiple(F.random_element(), n, [n], operation='*') == n
10 loops, best of 3: 63.7 ms per loop


# AFTER
sage: F = GF(2^1279, 'a')
sage: n = F.cardinality() - 1 # Mersenne prime
sage: %timeit order_from_multiple(F.random_element(), n, [n], operation='*') == n
10 loops, best of 3: 47.2 ms per loop
 }}}


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


 * Complex double fast callable interpreter (Robert Bradshaw) -- Support for complex double floating point (CDF). The new interpreter is implemented in the class {{{CDFInterpreter}}} of {{{sage/ext/gen_interpreters.py}}}.


 * Speed-up the function {{{solve_mod()}}} (Wilfried Huss) -- Performance improvement for the function {{{solve_mod()}}} is now up to 5x when solving an equation or a list of equations modulo a given integer modulus. On the machine sage.math, we have the following timing statistics:
 {{{
# BEFORE

sage: x, y = var('x,y')
sage: time solve_mod([x^2 + 2 == x, x^2 + y == y^2], 14)
CPU times: user 0.01 s, sys: 0.02 s, total: 0.03 s
Wall time: 0.18 s
[(4, 2), (4, 6), (4, 9), (4, 13)]
sage:
sage: x,y,z = var('x,y,z')
sage: time solve_mod([x^5 + y^5 == z^5], 3)
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.10 s

[(0, 0, 0),
 (0, 1, 1),
 (0, 2, 2),
 (1, 0, 1),
 (1, 1, 2),
 (1, 2, 0),
 (2, 0, 2),
 (2, 1, 0),
 (2, 2, 1)]


# AFTER

sage: x, y = var('x,y')
sage: time solve_mod([x^2 + 2 == x, x^2 + y == y^2], 14)
CPU times: user 0.03 s, sys: 0.01 s, total: 0.04 s
Wall time: 0.16 s
[(4, 2), (4, 6), (4, 9), (4, 13)
sage:
sage: x,y,z = var('x,y,z')
sage:  time solve_mod([x^5 + y^5 == z^5], 3)
CPU times: user 0.01 s, sys: 0.01 s, total: 0.02 s
Wall time: 0.02 s

[(0, 0, 0),
 (0, 1, 1),
 (0, 2, 2),
 (1, 0, 1),
 (1, 1, 2),
 (1, 2, 0),
 (2, 0, 2),
 (2, 1, 0),
 (2, 2, 1)]
 }}}


 * Optimized binomial function when an input is real or complex floating point (Dan Drake, William Stein) -- The function {{{binomial()}}} for returning the binomial coefficients is now much faster. In some cases, speed efficiency can be up to 4000x. Here are some timing statistics obtained using the machine sage.math:
 {{{
# BEFORE

sage: x, y = 1140000.78, 420000
sage: %timeit binomial(x, y)
10 loops, best of 3: 1.19 s per loop
sage: 
sage: x, y = RR(pi^5), 10
sage: %timeit binomial(x, y)
10000 loops, best of 3: 28.2 µs per loop
sage: 
sage: x, y = RR(pi^15), 500
sage: %timeit binomial(x, y)
1000 loops, best of 3: 799 µs per loop
sage:
sage: x, y = RealField(500)(1729000*sqrt(2)), 17000
sage: %timeit binomial(x, y)
10 loops, best of 3: 34.4 ms per loop


# AFTER

sage: x, y = 1140000.78, 420000
sage: %timeit binomial(x, y)
1000 loops, best of 3: 297 µs per loop
sage: 
sage: x, y = RR(pi^5), 10
sage: %timeit binomial(x, y)
10000 loops, best of 3: 189 µs per loop
sage: 
sage: x, y = RR(pi^15), 500
sage: %timeit binomial(x, y)
1000 loops, best of 3: 335 µs per loop
sage: 
sage: x, y = RealField(500)(1729000*sqrt(2)), 17000
sage: %timeit binomial(x, y)
1000 loops, best of 3: 692 µs per loop
 }}}


 * Enhanced {{{nth_root()}}} in {{{ZZ}}} and {{{QQ}}} and related utilities (John Cremona) -- Some consistency in the method {{{nth_root()}}} of {{{ZZ}}} and {{{QQ}}}. There are also some new utility methods for the rational numbers:
  1. {{{prime_to_S_part(self, S=[])}}} -- Returns {{{self}}} with all powers of all primes in S removed.
  1. {{{is_nth_power(self, int n)}}} -- Returns {{{True}}} if {{{self}}} is an n-th power; else {{{False}}}.
  1. {{{is_S_integral(self, S=[])}}} -- Determine if the rational number is S-integral.
  1. {{{is_S_unit(self, S=None)}}} -- Determine if the rational number is an S-unit.


== Build ==


== Calculus ==


 * Deprecate the calling of symbolic functions with unnamed arguments (Carl Witty, Michael Abshoff) -- Previous releases of Sage supported symbolic functions with "no arguments". This style of constructing symbolic functions is now deprecated. For example, previously Sage allowed for defining a symbolic function in the following way
 {{{
sage: x,y = var("x,y")
sage: f = x^2 + y^2  
sage: f(2,3) # bad; this is deprecated
 }}}
 But users are encouraged to explicitly declare the variables used in a symbolic function. For instance, the following is encouraged:
 {{{
sage: x,y = var("x, y")
sage: f(x, y) = x^2 + y^2  # this syntax is encouraged, or
sage: f(2,3) # since we specified the order when defining f, we know that x=2, y=3
sage: f = x^2 + y^2 # You can also do it this way
sage: f(x=2,y=3) # and then explicitly name your inputs
sage: f.subs(x=2,y=3) # or use the subs "substitute" command in a similar fashion
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


 * Fix and enhancements to permutations (Sebastien Labbe) -- This corrects the Robinson-Schensted algorithm on trivial permutations. It implements the inverse Robinson-Schensted algorithm:
 {{{
sage: Permutation((Tableau([[1,2,4],[3]]), Tableau([[1,3,4],[2]])))
[3, 1, 2, 4]
sage: Permutation(([[1,2,4],[3]], [[1,3,4],[2]]))
[3, 1, 2, 4]
 }}}
 And it works for arbitrary words (with semi-standard tableaux):
 {{{
sage: Permutation(([[1,2,2],[3]], [[1,3,4],[2]]))
[3, 1, 2, 2]
 }}}


 * First pass of cleanup of the interface of combinatorial classes (Florent Hivert) -- Before the patch, the interface of combinatorial classes had two problems:
  1. There were two redundant ways to get the number of elements {{{len(C)}}} and {{{C.count()}}}. Moreover {{{len}}} must return a plain {{{int}}} where we want an arbitrary large number and even {{{infinity}}};
  1. There were two redundant ways to get an iterator for the elements {{{C.iterator()}}} and {{{iter(C)}}} (allowing for {{{for c in C: ...}}}) via {{{C.__iter__}}}.
 
 The patch standardize those issues to:
  1. {{{C.cardinality()}}} which is more explicit and consistent with many other Sage libraries;
  1. {{{iter(C)}}} / {{{for x in C:}}} via {{{C.__iter__}}} which is clearly more Pythonic.
 
  The functions {{{iterator()}}} and {{{count()}}} are deprecated (with a warning), but will be removed in a later release. On the other hand, there was no way to keep backward compatibility for {{{len}}}. Indeed, many of function such as {{{list / filter / map}}} try silently to call {{{len}}},  which would have caused miriads of warnings to be issued in seemingly unrelated places. So it was decided to simply remove it and issue an error, suggesting to call {{{cardinality}}} instead. 


 * New class {{{IntegerListLex}}} for generating integer lists (Nicolas M. Thiery, Florent Hivert) -- The new class provides a Constant Amortized Time iterator through the combinatorial classes of integer lists. For example, we create the combinatorial class of lists of length 3 and sum 2 as follows:
 {{{
sage: C = IntegerListsLex(2, length=3); C
Integer lists of sum 2 satisfying certain constraints
sage: C.count()
6
sage: [p for p in C]
[[2, 0, 0], [1, 1, 0], [1, 0, 1], [0, 2, 0], [0, 1, 1], [0, 0, 2]]
 }}}
 Here's the list of all compositions of 4: 
 {{{
sage: list(IntegerListsLex(4, min_part = 1)) 
[[4], [3, 1], [2, 2], [2, 1, 1], [1, 3], [1, 2, 1], [1, 1, 2], [1, 1, 1, 1]]
 }}}


 * Cleanup of crystal code (Anne Schilling, Nicolas M. Thiery) -- Cartan type is now implemented as the method {{{cartan_type}}}, rather than an attribute as was previously the case.


 * Deprecate the function {{{RestrictedPartitions()}}} (Dan Drake) -- The function {{{RestrictedPartitions()}}} in {{{sage/combinat/partition.py}}} is now deprecated and will be removed in a future release. Users are advised to instead consider the function {{{Partitions()}}} with the {{{parts_in}}} keyword, which is functionally equivalent to {{{RestrictedPartitions()}}} but is more memory and time efficient. The timing improvement in {{{Partitions()}}} is up to 5x faster than {{{RestrictedPartitions()}}}. The following memory and timing statistics are produced using the machine sage.math:
 {{{
# BEFORE

sage: get_memory_usage()
721.26171875
sage: ps = RestrictedPartitions(100, ([1,6..100] + [4,9..100]))
sage: %time sum(1 for p in ps)
CPU times: user 27.26 s, sys: 1.06 s, total: 28.32 s
Wall time: 28.99 s
74040
sage: get_memory_usage()
1807.03515625

sage: get_memory_usage()
721.265625
sage: ps = RestrictedPartitions(3000, [10,50,100,500,1000])
sage: %time sum(1 for p in ps)
CPU times: user 5.60 s, sys: 0.21 s, total: 5.81 s
Wall time: 5.95 s
3506
sage: get_memory_usage()
962.54296875


# AFTER

sage: get_memory_usage()
719.3984375
sage: ps = Partitions(100, parts_in=([1,6..100] + [4,9..100]))
sage: %time sum(1 for p in ps)
CPU times: user 5.09 s, sys: 0.01 s, total: 5.10 s
Wall time: 5.10 s
74040
sage: get_memory_usage()
719.3984375

sage: get_memory_usage()
719.3984375
sage: ps = Partitions(3000, parts_in=[10,50,100,500,1000])
sage: %time sum(1 for p in ps)
CPU times: user 1.12 s, sys: 0.01 s, total: 1.13 s
Wall time: 1.13 s
3506
sage: get_memory_usage()
719.3984375
 }}}


 * Speed-up the {{{weyl_characters.py}}} module (Mike Hansen, Daniel Bump, Michael Abshoff) -- The timing efficiency is between 4x to 10x, depending on the operations involved. Here are some timing statistics produced using the machine sage.math:
 {{{
# BEFORE
sage: R = WeylCharacterRing(['B',3], prefix = "R")
sage: %time r =  R(1,1,0)
CPU times: user 0.14 s, sys: 0.00 s, total: 0.14 s
Wall time: 0.14 s
sage:
sage: R = WeylCharacterRing(['B',3], prefix = "R")
sage: %time [R(w) for w in R.lattice().fundamental_weights()]
CPU times: user 0.25 s, sys: 0.00 s, total: 0.25 s
Wall time: 0.25 s
[R(1,0,0), R(1,1,0), R(1/2,1/2,1/2)]
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: %time [A2(0,0,0)+A2(2,1,0), A2(2,1,0)+A2(0,0,0), - A2(0,0,0)+2*A2(0,0,0), 
-2*A2(0,0,0)+A2(0,0,0), -A2(2,1,0)+2*A2(2,1,0)-A2(2,1,0)]
CPU times: user 0.18 s, sys: 0.00 s, total: 0.18 s
Wall time: 0.19 s
[A2(0,0,0) + A2(2,1,0), A2(0,0,0) + A2(2,1,0), A2(0,0,0), -A2(0,0,0), 0]
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: %timeit [-x for x in [A2(0,0,0), 2*A2(0,0,0), -A2(0,0,0), -2*A2(0,0,0)]]
10 loops, best of 3: 20 ms per loop
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: chi = A2(0,0,0)+2*A2(1,0,0)+3*A2(2,0,0)
sage: mu =  3*A2(0,0,0)+2*A2(1,0,0)+A2(2,0,0)
sage: %timeit chi - mu
100 loops, best of 3: 8.16 ms per loop
sage: 
sage: A2 = WeylCharacterRing(['A',2])
sage: chi = A2(1,0,0)
sage: %time [chi^k for k in range(6)]
CPU times: user 1.05 s, sys: 0.02 s, total: 1.07 s
Wall time: 1.07 s

[A2(0,0,0),
 A2(1,0,0),
 A2(1,1,0) + A2(2,0,0),
 A2(1,1,1) + 2*A2(2,1,0) + A2(3,0,0),
 3*A2(2,1,1) + 2*A2(2,2,0) + 3*A2(3,1,0) + A2(4,0,0),
 5*A2(2,2,1) + 6*A2(3,1,1) + 5*A2(3,2,0) + 4*A2(4,1,0) + A2(5,0,0)]


# AFTER

sage: R = WeylCharacterRing(['B',3], prefix = "R")
sage: %time r =  R(1,1,0)
CPU times: user 0.03 s, sys: 0.00 s, total: 0.03 s
Wall time: 0.03 s
sage:
sage: R = WeylCharacterRing(['B',3], prefix = "R")
sage: %time [R(w) for w in R.lattice().fundamental_weights()]
CPU times: user 0.05 s, sys: 0.00 s, total: 0.05 s
Wall time: 0.05 s
[R(1,0,0), R(1,1,0), R(1/2,1/2,1/2)]
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: %time [A2(0,0,0)+A2(2,1,0), A2(2,1,0)+A2(0,0,0), - A2(0,0,0)+2*A2(0,0,0), -2*A2(0,0,0)+A2(0,0,0), -A2(2,1,0)+2*A2(2,1,0)-A2(2,1,0)]
CPU times: user 0.04 s, sys: 0.00 s, total: 0.04 s
Wall time: 0.04 s
[A2(0,0,0) + A2(2,1,0), A2(0,0,0) + A2(2,1,0), A2(0,0,0), -A2(0,0,0), 0]
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: %timeit [-x for x in [A2(0,0,0), 2*A2(0,0,0), -A2(0,0,0), -2*A2(0,0,0)]]
100 loops, best of 3: 3.33 ms per loop
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: chi = A2(0,0,0)+2*A2(1,0,0)+3*A2(2,0,0)
sage: mu =  3*A2(0,0,0)+2*A2(1,0,0)+A2(2,0,0)
sage: %timeit chi - mu
1000 loops, best of 3: 771 µs per loop
sage:
sage: A2 = WeylCharacterRing(['A',2])
sage: chi = A2(1,0,0)
sage: %time [chi^k for k in range(6)]
CPU times: user 0.20 s, sys: 0.00 s, total: 0.20 s
Wall time: 0.20 s

[A2(0,0,0),
 A2(1,0,0),
 A2(1,1,0) + A2(2,0,0),
 A2(1,1,1) + 2*A2(2,1,0) + A2(3,0,0),
 3*A2(2,1,1) + 2*A2(2,2,0) + 3*A2(3,1,0) + A2(4,0,0),
 5*A2(2,2,1) + 6*A2(3,1,1) + 5*A2(3,2,0) + 4*A2(4,1,0) + A2(5,0,0)]
 }}}


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


 * Varieties and polynomial ideals (John Perry) -- Support for polynomial ideals over finite fields of characteristics greater than what Singular supports.  Thus in case where the characteristic of the base field is too large for Singular, we use a toy implementation to compute the variety of the polynomial ideal. This implementation is contained in the new module {{{/sage/rings/polynomial/toy_variety.py}}}, which implements an educational version of the Groebner basis algorithm.


 * Extended Euclidean algorithm for polynomials over {{{GF(2)}}} (Mike Hansen) -- An {{{xgcd()}}} method for polynomials with base field being the Galois field of 2 elements.


 * New method {{{apply_morphism()}}} for ideals (Nick Alexander, John Cremona) -- The new method {{{apply_morphism()}}} in {{{sage/rings/ideal.py}}} applies a specified morphism to every element of an ideal.


== Distribution ==


== Doctest ==


 * New and improved random testing module (Carl Witty) -- The new and improved random tester can be found in {{{sage/misc/random_testing.py}}}. The random testing module is useful for Sage modules that do random testing in their doctests by constructing test cases using a random number generator. It provides a decorator to help write random testers that meet the following goals:
  1. To get the broadest possible test coverage by using different random seeds in doctests.
  1. To be able to reproduce problems when debugging.


== Documentation ==


== Geometry ==


 * Improved enumeration of vertices and 0-dimensional faces of {{{LatticePolytope}}} objects (Andrey Novoseltsev) -- There was an inconsistency between indicies of vertices, i.e. columns of the {{{.vertices()}}} matrix, and indicies of 0-dimensional faces, i.e. objects returned by {{{.faces(dim=0)}}}. For example, the 5-th 0-dimensional face could be generated by the 7-th vertex, etc. Now the i-th 0-dimensional face is generated by the i-th vertex. (The reason for the old behaviour was the output of the underlying software package PALP, now there is extra sorting.)


== Graph Theory ==


 * Improved time efficiency of {{{all_graph_colorings()}}} function (Carlo Hamalainen, Tom Boothby) -- The function {{{all_graph_colorings()}}} in {{{sage/graphs/graph_coloring.py}}} now uses the C++ dancing links implementation instead of the Cython implementation in computing graph colorings. In some cases, the speed-up can be up to 5x. Here are some timing statistics obtained using the machine sage.math. First, define a testing script called {{{color_test.sage}}} with the following content:
 {{{
from sage.graphs.graph_coloring import all_graph_colorings
set_random_seed(0)
def foo():
    G = graphs.RandomGNP(10, 0.5)
    chrom = G.chromatic_number()
    n = 0
    for C in all_graph_colorings(G, chrom):
        parts = [C[k] for k in C]
        for P in parts:
            l = len(P)
            for i in range(l):
                for j in range(i+1,l):
                    if G.has_edge(P[i],P[j]):
                        raise RuntimeError, "Coloring Failed."
        n+=1
    print "G has %s 3-colorings."%n
timeit("foo()")
 }}}
 Next, we run tests as follows:
 {{{
# BEFORE

[mvngu@sage mvngu]$ sage-3.4-sage.math-only-x86_64-Linux/sage color_test.sage 
5 loops, best of 3: 65.8 ms per loop
[mvngu@sage mvngu]$ sage-3.4-sage.math-only-x86_64-Linux/sage color_test.sage 
5 loops, best of 3: 64.4 ms per loop
[mvngu@sage mvngu]$ sage-3.4-sage.math-only-x86_64-Linux/sage color_test.sage 
5 loops, best of 3: 64.2 ms per loop


# AFTER

[mvngu@sage mvngu]$ sage-3.4.1-sage.math-only-x86_64-Linux/sage color_test.sage
5 loops, best of 3: 14.2 ms per loop
[mvngu@sage mvngu]$ sage-3.4.1-sage.math-only-x86_64-Linux/sage color_test.sage
5 loops, best of 3: 14.4 ms per loop
[mvngu@sage mvngu]$ sage-3.4.1-sage.math-only-x86_64-Linux/sage color_test.sage
5 loops, best of 3: 14.3 ms per loop
 }}}


== Graphics ==


 * Color complex plotting (Robert Bradshaw) -- New function {{{complex_plot()}}} for plotting functions of a complex variable. The function {{{complex_plot()}}} takes a complex function {{{f(z)}}} of one variable and plots output of the function over the specified {{{xrange}}} and {{{yrange}}}. The magnitude of the output is indicated by the brightness (with zero being black and infinity being white), while the argument is represented by the hue with red being positive real and increasing through orange, yellow, etc. as the argument increases. The general syntax of the function is {{{complex_plot(f, (xmin, xmax), (ymin, ymax), ...)}}}. The following code produces a plot of the [[attachment:complex square root]] function:
 {{{
sage: complex_plot(sqrt, (-5, 5), (-5, 5))
 }}}
 Here's a plot of the [[attachment:complex sine]] function:
 {{{
sage: complex_plot(sin, (-5, 5), (-5, 5))
 }}}
 Plot of a [[attachment:complex function]] with some nice zeros and a pole:
 {{{
sage: f(z) = z^5 + z - 1 + 1/z
sage: complex_plot(f, (-3, 3), (-3, 3))
 }}}
 A plot of the complex [[attachment:Riemann zeta function]]:
 {{{
sage: complex_plot(zeta, (-30,30), (-30,30))
 }}}


 * FIXME: summarize #5450


== Group Theory ==


 * Speed-up in comparing elements of a permutation group (Robert Bradshaw, Rob Beezer, John H. Palmieri) -- For elements of a permutation group, comparison between those elements is now up to 13x faster. On Mac OS X 10.4 with Intel Core 2 duo running at 2.33 GHz, one has the following improvement in timing statistics:
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


 * Optimize small permutation group elements (Robert Bradshaw) -- Avoid allocation for very small permutation group elements, otherwise there can be a significant cost of element creation. In some cases, there can be up to 17% efficiency. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: G = SymmetricGroup(3)
sage: L = [G.random_element() for _ in range(100)] * 17
sage: %timeit prod(L)
1000 loops, best of 3: 290 µs per loop
sage: 
sage: G = SymmetricGroup(10)
sage: L = [G.random_element() for _ in range(100)] * 17
sage: %timeit prod(L)
1000 loops, best of 3: 321 µs per loop


# AFTER

sage: G = SymmetricGroup(3)
sage: L = [G.random_element() for _ in range(100)] * 17
sage: %timeit prod(L)
1000 loops, best of 3: 240 µs per loop
sage: 
sage: G = SymmetricGroup(10)
sage: L = [G.random_element() for _ in range(100)] * 17
sage: %timeit prod(L)
1000 loops, best of 3: 271 µs per loop
 }}}


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


 * Optimize string representation for matrices over {{{GF(2)}}} () -- Optimize the method {{{str()}}} for returning a string representation of a matrix over the field {{{GF(2)}}}. The efficiency gain is up to 26x. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: a = random_matrix(GF(2),1000)
sage: %time b = a.str()
CPU times: user 0.25 s, sys: 0.01 s, total: 0.26 s
Wall time: 0.26 s


# AFTER
sage: a = random_matrix(GF(2),1000)
sage: %time b = a.str()
CPU times: user 0.00 s, sys: 0.01 s, total: 0.01 s
Wall time: 0.01 s
 }}}


== Miscellaneous ==


 * Deprecate function {{{jsmath()}}} from the command line (John H. Palmieri) -- The function {{{jsmath()}}} is now deprecated and will be removed from a future release. Users are advised to consider the function {{{html()}}} instead. For example, users should replace {{{jsmath("MATH", mode="display")}}} with {{{html("$$MATH$$")}}}, and replace {{{jsmath("MATH", mode="inline")}}} with {{{html("$MATH$")}}}.


== Modular Forms ==


 * Implement Pizer's algorithm for computing Brandt Modules and Brandt Matrices (Jon Bober, Alia Hamieh, Victoria de Quehen, William Stein, Gonzalo Tornaria) -- The new module {{{sage/modular/quatalg/brandt.py}}} implements the algorithm of Pizer for computing modular forms using quaternion algebras. See the [[http://swc-wiki.sagemath.org/2009/other/pizer|sage wiki]] for more information on this implementation and Pizer's original algorithm.


 * Multiplication for modular forms (David Loeffler) -- New method {{{__mul__}}} for {{{ModularFormElement}}} objects, which essentially allows for multiplication of modular forms. Here's an example with character:
 {{{
sage: f = ModularForms(DirichletGroup(3).0, 3).0
sage: f * f
1 + 108*q^2 + 144*q^3 + 2916*q^4 + 8640*q^5 + O(q^6)
sage: (f*f).parent()
Modular Forms space of dimension 3 for Congruence Subgroup Gamma0(3) of weight 6 over Rational Field
sage: (f*f*f).parent()
Modular Forms space of dimension 4, character [-1] and weight 9 over Rational Field
 }}}
 And here's an example without:
 {{{
sage: f = ModularForms(Gamma1(3), 5).0 
sage: f*f 
1 - 180*q^2 - 480*q^3 + 8100*q^4 + 35712*q^5 + O(q^6)
sage: (f*f).parent()
Modular Forms space of dimension 4 for Congruence Subgroup Gamma1(3) of weight 10 over Rational Field
 }}}


 * Improvements to congruence subgroups (David Loeffler, Georg S. Weber) -- The code for congruence subgroups is now split up into several files under {{{sage/modular/congroups}}}. The previous file {{{sage/modular/congroup.py}}} still exists, so pickles created with previous versions should unpickle safely under the new one. New functionality includes allowing congruence subgroups to calculate the width and regularity of their cusps, and their number of elliptic points.


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


== Topology ==

 * Implemented simplicial complexes and their homology (John Palmieri):
 {{{
sage: circle = SimplicialComplex(2, [[0,1], [1,2], [2,0]])
sage: circle.homology(0)  # 'homology' means reduced homology
0
sage: circle.homology(1, base_ring=QQ)  # homology with coefficients
Vector space of dimension 1 over Rational Field
 }}}
 A number of simplicial complexes are already defined: type {{{simplicial_complexes.}}} and hit the TAB key to get a list.
 {{{
sage: K = simplicial_complexes.KleinBottle()
sage: K.cohomology()  # without an argument, get all homology groups as a dictionary
{0: 0, 1: Z, 2: C2}
sage: S = simplicial_complexes.NotIConnectedGraphs(6,2)  # an example from graph theory
sage: S.f_vector()
[1, 15, 105, 455, 1365, 3003, 4945, 5715, 3990, 1470, 306, 30]
sage: sum(S.f_vector())  # total number of simplices
21400
sage: time S.homology()  # on a 2.4 GHz iMac
Wall time: 20.31 s
{0: 0, 1: 0, 2: 0, 3: 0, 4: 0, 5: 0, 6: 0, 7: Z^24, 8: 0, 9: 0, 10: 0}
 }}}

 Each simplicial complex has an associated chain complex, and chain complexes can also be defined on their own:
 {{{
sage: S = simplicial_complexes.NotIConnectedGraphs(6,2)
sage: C = S.chain_complex()
sage: C.differential()
{0: [],
 1: 15 x 105 sparse matrix over Integer Ring,
 2: 105 x 455 sparse matrix over Integer Ring,
 3: 455 x 1365 sparse matrix over Integer Ring,
 4: 1365 x 3003 sparse matrix over Integer Ring,
 5: 3003 x 4945 sparse matrix over Integer Ring,
 6: 4945 x 5715 sparse matrix over Integer Ring,
 7: 5715 x 3990 sparse matrix over Integer Ring,
 8: 3990 x 1470 sparse matrix over Integer Ring,
 9: 1470 x 306 sparse matrix over Integer Ring,
 10: 306 x 30 sparse matrix over Integer Ring}
sage: D = ChainComplex([identity_matrix(2), matrix(3,2), identity_matrix(3)])
sage: D
Chain complex with at most 4 nonzero terms over Integer Ring.
sage: D.differential(0)
[1 0]
[0 1]
sage: D.differential(1)
[0 0]
[0 0]
[0 0]
sage: D.differential(2)
[1 0 0]
[0 1 0]
[0 0 1]
sage: D.differential(3)
[]
 }}}

== User Interface ==


== Website / Wiki ==
