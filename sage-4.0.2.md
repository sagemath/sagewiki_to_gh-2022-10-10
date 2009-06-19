= Sage 4.0.2 Release Tour =

Sage 4.0.2 was released on FIXME. For the official, comprehensive release note, please refer to FIXME. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * 


== Algebra ==


 * Correct precision bound in {{{hilbert_class_polynomial()}}} and miscellaneous new functions (John Cremona) -- The two new functions are {{{elliptic_j()}}} in {{{sage/functions/special.py}}}, and {{{is_primitive()}}} in the class {{{BinaryQF}}} of {{{sage/quadratic_forms/binary_qf.py}}}. The function {{{elliptic_j(z)}}} returns the elliptic modular {{{j}}}-function evaluated at {{{z}}}. The function {{{is_primitive()}}} determines whether the binary quadratic form {{{ax^2 + bxy + cy^2}}} satisfies {{{gcd(a,b,c) = 1}}}, i.e. that it is primitive. Here are some examples on using these new functions:
 {{{
sage: elliptic_j(CC(i))
1728.00000000000
sage: elliptic_j(sqrt(-2.0))
8000.00000000000
sage: Q = BinaryQF([6,3,9])
sage: Q.is_primitive()
False
sage: Q = BinaryQF([1,1,1])
sage: Q.is_primitive()
True
 }}}


 * Efficient Lagrange interpolation polynomial (Yann Laigle-Chapuy) -- Calculating the Lagrange interpolation polynomial of a set of points is now up to 48% faster than previously. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: R = PolynomialRing(QQ, 'x')
sage: %timeit R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
1000 loops, best of 3: 824 µs per loop
sage: R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
-23/84*x^3 - 11/84*x^2 + 13/7*x + 1
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])")
625 loops, best of 3: 111 µs per loop
sage: R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])
a^2*x^2 + a^2*x + a^2


# AFTER

sage: R = PolynomialRing(QQ, 'x')
sage: %timeit R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
1000 loops, best of 3: 425 µs per loop
sage: R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
-23/84*x^3 - 11/84*x^2 + 13/7*x + 1
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])")
625 loops, best of 3: 86.4 µs per loop
sage: R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])
a^2*x^2 + a^2*x + a^2
 }}}


 * Deprecate the method {{{__len__()}}} for a matrix group (Nicolas Thiery) -- The method {{{__len__()}}} of the class {{{MatrixGroup_gap}}} in {{{sage/groups/matrix_gps/matrix_group.py}}} is now deprecated and will be removed in a future release. To get the number of elements in a matrix group, users are advised to use the method {{{cardinality()}}} instead. The method {{{order()}}} is essentially the same as {{{cardinality()}}}, so {{{order()}}} will be deprecated in a future release.


== Algebraic Geometry ==


 * FIXME: summarize #6218


== Basic Arithmetic ==


== Build ==


 * FIXME: summarize #6234

 * FIXME: summarize #6170


== Calculus ==


== Coding Theory ==


 * FIXME: summarize #6014


== Combinatorics ==


== Commutative Algebra ==


 * FIXME: summarize #6051


== Cryptography ==


 * FIXME: summarize #6185


== Graph Theory ==


 * FIXME: summarize #5975


== Graphics ==


== Group Theory ==


 * FIXME: summarize #6263

 * FIXME: summarize #6123


== Interfaces ==


== Linear Algebra ==


 * FIXME: summarize #6178

 * FIXME: summarize #5510

 * FIXME: summarize #2256


== Miscellaneous ==


 * FIXME: summarize #6089

 * FIXME: summarize #6110


== Modular Forms ==


== Notebook ==


 * FIXME: summarize #6259

 * FIXME: summarize #6225

 * FIXME: summarize #5371


== Number Theory ==


 * FIXME: summarize #5976

 * FIXME: summarize #5842

 * FIXME: summarize #6205

 * FIXME: summarize #6193

 * FIXME: summarize #6044

 * FIXME: summarize #6046


== Numerical ==


== Packages ==


 * Upgrade [[http://numpy.scipy.org|NumPy]] to version 1.3.0 latest upstream release (Jason Grout).


 * Upgrade [[http://www.scipy.org|SciPy]] to version 0.7 latest upstream release (Jason Grout).


 * Upgrade [[http://www.singular.uni-kl.de|Singular]] to version 3-1-0 latest upstream release (Martin Albrecht).


 * Upgrade [[http://www.flintlib.org|FLINT]] to version 1.3.0 latest upstream release (Nick Alexander).


 * Update the [[http://www.mpir.org|MPIR]] spkg to version {{{mpir-1.2.p3.spkg}}} (Nick Alexander).


 * Remove [[http://sage.math.washington.edu/home/wdj/guava|Guava]] as a standard Sage package (David Joyner).


 * FIXME: summarize #6298


== Symbolics ==


== Topology ==
