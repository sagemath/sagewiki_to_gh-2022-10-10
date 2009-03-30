= Sage 3.4.1 Release Tour =

Sage 3.4.1 was released on FIXME. For the official, comprehensive release note, please refer to [[http://www.sagemath.org/src/announce/sage-3.4.1.txt|sage-3.4.1.txt]]. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * Merging improvements during the Sage Days 13 coding sprint.
 * Other bug fixes post Sage 3.4.


== Algebra ==


 * FIXME: summarize ticket #5535.


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


 * FIXME: summarize #5200


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


== Distribution ==


== Doctest ==


== Documentation ==


== Geometry ==


== Graph Theory ==


== Graphics ==


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


== Miscellaneous ==


== Modular Forms ==


== Notebook ==

A number of tickets related to UTF-8 text got merged and should definitely be mentioned! #4547, #5211; #2896 and #1477 got fixed by those tickets. There's also #5564, which may not get merged for 3.4.1 but should get in soon; it pulls together a whole bunch of UTF-8 fixes and improvements.

== Number Theory ==


 * FIXME: summarize #5518

 * FIXME: summarize #5508


== Numerical ==


== Optional Packages ==


== Packages ==


 * FIXME: summarize #4987


== Quadratic Forms ==


== Symbolics ==


== User Interface ==


== Website / Wiki ==
