= Sage 4.0.1 Release Tour =

Sage 4.0.1 was released on FIXME. For the official, comprehensive release note, please refer to FIXME. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * 
 * 
 * 


== Algebra ==


 * Factoring rational functions (Soroosh Yazdani) -- New method {{{factor()}}} in the class {{{FractionFieldElement}}} of {{{sage/rings/fraction_field_element.pyx}}} to return the factorization of self over the base ring. Here's an example for working with this new method:
 {{{
sage: K.<x> = QQ["x"]
sage: f = (x^3 + x) / (x-3)
sage: f.factor()
(x - 3)^-1 * x * (x^2 + 1)
 }}}


 * Faster {{{basis_matrix()}}} for ambient modules (John Cremona) -- The speed-up can be up to 376x faster than previously. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: K = FreeModule(ZZ, 2000)
sage: %time I = K.basis_matrix()
CPU times: user 292.74 s, sys: 20.11 s, total: 312.85 s
Wall time: 312.90 s


# AFTER

sage: K = FreeModule(ZZ, 2000)
sage: %time I = K.basis_matrix()
CPU times: user 0.41 s, sys: 0.43 s, total: 0.84 s
Wall time: 0.83 s
 }}}


 * Optimize the construction of Lagrange interpolation polynomials (Minh Van Nguyen) -- Rewrite the method {{{lagrange_polynomial()}}} in the class {{{PolynomialRing_field}}} of {{{sage/rings/polynomial/polynomial_ring.py}}} for generating the {{{n}}}-th Lagrange interpolation polynomial. The method now provides two new options:

  * {{{algorithm}}} --- (default: {{{divided_difference}}}) If {{{algorithm="divided_difference"}}}, then use the method of divided difference. If {{{algorithm="neville"}}}, then use a variant of Neville's method to recursively generate the {{{n}}}-th Lagrange interpolation polynomial. This adaptation of Neville's method is more memory efficient than the original Neville's method, since the former doesn't generate the full Neville table resulting from Neville's recursive procedure. Instead the adaptation only keeps track of the current and previous rows of the said table.

  * {{{previous_row}}} --- (default: {{{None}}}) This is only relevant if used together with {{{algorithm="neville"}}}. Here "previous row" refers to the last row in the Neville table that was obtained from a previous computation of an {{{n}}}-th Lagrange interpolation polynomial using Neville's method. If the last row is provided, then use a memory efficient variant of Neville's method to recursively generate a better interpolation polynomial from the results of previous computation. 

 There's also the new method {{{divided_difference()}}} to compute the Newton divided-difference coefficients of the {{{n}}}-th Lagrange interpolation polynomial. The following are some timing statistics obtained using sage.math. When the results of previous computations are fed to {{{lagrange_polynomial}}} in order to produce better interpolation polynomials, we can gain an efficiency of up to 42%. 
 {{{
# BEFORE

# using the definition of Lagrange interpolation polynomial
sage: R = PolynomialRing(QQ, 'x')
sage: %timeit R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
1000 loops, best of 3: 1.71 ms per loop
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])")
625 loops, best of 3: 233 µs per loop

# without using precomputed values to generate successively better interpolation polynomials

sage: R = PolynomialRing(QQ, 'x')
sage: timeit("R.lagrange_polynomial([(0,1),(2,2)])");
625 loops, best of 3: 571 µs per loop
sage: # add two more points
sage: timeit("R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])");
125 loops, best of 3: 2.29 ms per loop
sage: 
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1)])")
625 loops, best of 3: 76.1 µs per loop
sage: # add another point
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])")
625 loops, best of 3: 229 µs per loop
sage:
sage: R = PolynomialRing(QQ, 'x')
sage: points = [(random(), random()) for i in xrange(100)]
sage: time R.lagrange_polynomial(points);
CPU times: user 1.21 s, sys: 0.00 s, total: 1.21 s
Wall time: 1.21 s
sage: # add three more points
sage: for i in xrange(3): points.append((random(), random()))
....: 
sage: time R.lagrange_polynomial(points);
CPU times: user 1.28 s, sys: 0.01 s, total: 1.29 s
Wall time: 1.29 s
sage: # add another 100 points
sage: for i in xrange(100): points.append((random(), random()))
....: 
sage: time R.lagrange_polynomial(points);
CPU times: user 5.87 s, sys: 0.02 s, total: 5.89 s
Wall time: 5.89 s


# AFTER

# using the method of divided-difference
sage: R = PolynomialRing(QQ, 'x')
sage: %timeit R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)])
1000 loops, best of 3: 827 µs per loop
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)])")
625 loops, best of 3: 111 µs per loop

# using precomputed values to generate successively better interpolation polynomials

sage: R = PolynomialRing(QQ, 'x')
sage: timeit("R.lagrange_polynomial([(0,1),(2,2)], neville=True)");
625 loops, best of 3: 332 µs per loop
sage: p = R.lagrange_polynomial([(0,1),(2,2)], neville=True);
sage: # add two more points
sage: timeit("R.lagrange_polynomial([(0,1),(2,2),(3,-2),(-4,9)], neville=True, previous_row=p)");
625 loops, best of 3: 1.41 ms per loop
sage:
sage: R = PolynomialRing(GF(2**3,'a'), 'x')
sage: a = R.base_ring().gen()
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1)], neville=True)");
625 loops, best of 3: 36.4 µs per loop
sage: p = R.lagrange_polynomial([(a^2+a,a),(a,1)], neville=True);
sage: # add another point
sage: timeit("R.lagrange_polynomial([(a^2+a,a),(a,1),(a^2,a^2+a+1)], neville=True, previous_row=p)");
625 loops, best of 3: 131 µs per loop
sage:
sage: R = PolynomialRing(QQ, 'x')
sage: points = [(random(), random()) for i in xrange(100)]
sage: time R.lagrange_polynomial(points, neville=True);
CPU times: user 1.26 s, sys: 0.00 s, total: 1.26 s
Wall time: 1.26 s
sage: p = R.lagrange_polynomial(points, neville=True);
sage: # add three more points
sage: for i in xrange(3): points.append((random(), random()))
....: 
sage: time R.lagrange_polynomial(points, neville=True, previous_row=p);
CPU times: user 0.09 s, sys: 0.00 s, total: 0.09 s
Wall time: 0.08 s
sage: p = R.lagrange_polynomial(points, neville=True, previous_row=p)
sage: # add another 100 points
sage: for i in xrange(100): points.append((random(), random()))
....: 
sage: time R.lagrange_polynomial(points, neville=True, previous_row=p);
CPU times: user 4.62 s, sys: 0.00 s, total: 4.62 s
Wall time: 4.62 s
 }}}


== Algebraic Geometry ==


 * FIXME: summarize #5948


== Basic Arithmetic ==


 * Speed overhaul for {{{digits}}}, {{{exact_log}}} and {{{ndigits}}} (Joel B. Mohler) -- Speed-up for the cases where the method {{{exact_log}}} can conveniently be computed by log 2 estimation. In some cases, time efficiency can be up to 927x faster than previously. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: n = 5^1000
sage: m = 2975982357823879528793587928793592
sage: %timeit n.exact_log(m)
1000 loops, best of 3: 205 µs per loop
sage: n = 5^50
sage: m = 33
sage: %timeit n.exact_log(m)
10000 loops, best of 3: 29.6 µs per loop
sage: def zlog(m, n, k):
....:     for i in xrange(0, m/1000):
....:         a = ZZ.random_element(n) + 2
....:         b = ZZ.random_element(k)
....:         c = a^b
....:         for i in xrange (0, 1000):
....:             c.exact_log(a)
....:             
sage: time zlog(100000, 2^100, 100)
CPU times: user 22.59 s, sys: 0.12 s, total: 22.71 s
Wall time: 22.70 s
sage: time zlog(100000, 100, 100)
CPU times: user 3.45 s, sys: 0.02 s, total: 3.47 s
Wall time: 3.47 s


# AFTER

sage: n = 5^1000
sage: m = 2975982357823879528793587928793592
sage: %timeit n.exact_log(m)
1000000 loops, best of 3: 221 ns per loop
sage: n = 5^50
sage: m = 33
sage: %timeit n.exact_log(m)
1000000 loops, best of 3: 526 ns per loop
sage: def zlog(m, n, k):
....:     for i in xrange(0, m/1000):
....:         a = ZZ.random_element(n) + 2
....:         b = ZZ.random_element(k)
....:         c = a^b
....:         for i in xrange (0, 1000):
....:             c.exact_log(a)
....:             
sage: time zlog(100000, 2^100, 100)
CPU times: user 1.96 s, sys: 0.02 s, total: 1.98 s
Wall time: 1.99 s
sage: time zlog(100000, 100, 100)
CPU times: user 0.05 s, sys: 0.01 s, total: 0.06 s
Wall time: 0.05 s
 }}}


== Calculus ==


 * FIXME: summarize #5404


== Combinatorics ==


 * FIXME: summarize #6000

 * FIXME: summarize #6167

 * FIXME: summarize #6093

 * FIXME: summarize #6050

 * FIXME: summarize #5931

 * FIXME: summarize #5925


== Commutative Algebra ==


 * FIXME: summarize #6120


== Geometry ==


== Graph Theory ==


== Graphics ==


 * FIXME: summarize #6184

 * FIXME: summarize #5599


== Group Theory ==


== Interfaces ==


 * FIXME: summarize #6208


== Linear Algebra ==


== Miscellaneous ==


 * FIXME: summarize #5967

 * FIXME: summarize #5483

 * FIXME: summarize #6139


== Modular Forms ==


 * FIXME: summarize #5995


== Notebook ==


 * FIXME: summarize #4575

 * FIXME: summarize #5895


== Number Theory ==


 * FIXME: summarize #133

 * FIXME: summarize #6021

 * FIXME: summarize #6206


== Numerical ==


 * FIXME: summarize #5827


== Packages ==


 * FIXME: summarize #5840

 * FIXME: summarize #6173

 * FIXME: summarize #5817

 * FIXME: summarize #6156

 * FIXME: summarize #6169

 * FIXME: summarize #6209

 * FIXME: summarize #6219


== P-adics ==


== Quadratic Forms ==


== Symbolics ==


 * FIXME: summarize #6144

 * FIXME: summarize #6194


== Topology ==


 * FIXME: summarize #6141
