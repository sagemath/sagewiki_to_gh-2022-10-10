

# Sage 3.3 Release Tour

Sage 3.3 was released on February 21st, 2009. For the official, comprehensive release note, see <a class="http" href="http://www.sagemath.org/mirror/src/announce/sage-3.3.txt">sage-3.3.txt</a>. There's also a <a class="http" href="http://mvngu.wordpress.com/2009/02/23/sage-33-released">beautifully formatted version</a> of this release tour. The following points are some of the foci of this release: 

* Clean up various doctest failures from 3.2.3 
* Fix some build issues from 3.2.3 on the new set of supported images 
* Merge small to medium sized patches ready to go in 
* Switch to <a class="http" href="http://www.mpir.org">MPIR</a> for multi-precision integers and rationals 
* Update the <a class="http" href="http://www.mpir.org/">gmp-mpir</a> spkg 
* Switch to <a class="http" href="http://www.flintlib.org">FLINT</a> for univariate polynomial arithmetic over `Z/nZ` 
* Upgrade <a class="http" href="http://networkx.lanl.gov">NetworkX</a> to version 0.99 upstream release 
* Upgrade <a class="http" href="http://www.ifor.math.ethz.ch/~fukuda/cdd_home/cdd.html">cddlib</a> to version 0.94f upstream release 
* Some improvements to the <a class="http" href="http://cgm.cs.mcgill.ca/~avis/C/lrs.html">lrs</a> spkg 
* <a href="/spkg/pynac">Pynac</a> interface enhancements 
* Update the <a class="http" href="http://tiswww.case.edu/php/chet/readline/rltop.html">readline</a> spkg 
* Update the <a class="http" href="http://math-atlas.sourceforge.net">ATLAS</a> spkg 
* Upgrade <a class="http" href="http://math-atlas.sourceforge.net">ATLAS</a> to version 3.8.3 upstream release 
* Update the <a class="http" href="http://www.shoup.net/ntl">NTL</a> spkg 
* Upgrade <a class="http" href="http://bitbucket.org/malb/m4ri/wiki/">M4RI</a> to version 20090105 upstream release 
* Upgrade <a class="http" href="http://www.math.union.edu/~dpvc/jsMath/">jsMath</a> to version 3.6 upstream release 
* Upgrade <a class="http" href="http://www.gap-system.org">GAP</a> to version 4.4.12 upstream release 
* Upgrade <a class="http" href="http://sage.math.washington.edu/home/wdj/guava">GUAVA</a> to version 3.9 upstream release 
* Upgrade <a class="http" href="http://jmol.sourceforge.net">Jmol</a> to version 11.6 upstream release 
* Upgrade <a class="http" href="http://matplotlib.sourceforge.net">matplotlib</a> to version 0.98.5.3-svn6910 upstream release 
* Upgrade <a class="http" href="http://www.libpng.org">libpng</a> to version 1.2.34 upstream release 
* Upgrade <a class="http" href="http://sphinx.pocoo.org">Sphinx</a> to version 0.5.1 upstream release 
* Upgrade <a class="http" href="http://www.bzip.org">bzip2</a> to version 1.0.5 upstream release 
* Upgrade <a class="http" href="http://trac.edgewall.org">trac</a> to version 0.11 upstream release 
All tickets in the 3.3 milestone can be found on the <a class="http" href="http://trac.sagemath.org/sage_trac/milestone/sage-3.3">trac server</a>. Here's a summary of features in this release, categorized under various headings. 


## Algebra

* Transitivity for permutation groups (William Stein) -- In the permutation group module `permgroup.py`, the query function `is_transitive()` returns whether or not the group is transitive on `[1..G.degree()]`. A few surrounding docstrings are fixed and doctest coverage for the module `sage.groups.perm_gps.permgroup.py` is now 100%. 
* Update the ATLAS spkg (Michael Abshoff). 
* New function `is_unit()` for symbolic ring (Florent Hivert) -- The new function `sage.calculus.calculus.SymbolicExpressionRing.is_unit()` returns whether or not an element of the symbolic ring is a unit. 

## Algebraic Geometry

* Improved precision and performance when calculating analytic rank (William Stein) -- When calculating the analytic rank of an elliptic curve, the default is to use Cremona's `gp` script, where the precision is automatically doubled until it doesn't fail. The precision is started at 16 rather than the previous default precision. The computation is now about 3 times faster usually by starting off using this smaller precision. Here's an example: ```txt
# BEFORE
sage: E = EllipticCurve('5077a')
sage: time E.analytic_rank()
CPU times: user 0.01 s, sys: 0.01 s, total: 0.02 s
Wall time: 0.21 s

# AFTER
sage: E = EllipticCurve('5077a')
sage: time E.analytic_rank()
CPU times: user 0.02 s, sys: 0.00 s, total: 0.02 s
Wall time: 0.06 s
 
```And another: ```txt
# BEFORE
sage: time elliptic_curves.rank(4)[0].analytic_rank()
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.50 s

# AFTER
sage: time elliptic_curves.rank(4)[0].analytic_rank()
CPU times: user 0.01 s, sys: 0.00 s, total: 0.01 s
Wall time: 0.33 s
 
```
* Weil pairing (David Moller Hansen, John Cremona) -- A basic framework for Weil pairing on elliptic curves using Miller's algorithm as contained in Proposition 8 of the following paper: 
         * Victor S. Miller. "The Weil pairing, and its efficient calculation". Journal of Cryptology, 17(4):235-261, 2004. 

## Basic Arithmetic

* `ivalue` field in `integer_mod.pyx` is no longer public (Craig Citro) -- The `ivalue` field for `IntegerMod_int` is no longer public. This gives about a 1.5 to 2X speed-up when multiplying `IntegerMod_ints`. Here's an example: ```txt
# BEFORE
sage: R = Integers(100) ; x = R(3) ; y = R(5)
sage: timeit('x*y')
625 loops, best of 3: 403 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 370 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 410 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 405 ns per loop

# AFTER
sage: R = Integers(100) ; x = R(3) ; y = R(5)
sage: timeit('x*y')
625 loops, best of 3: 190 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 213 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 174 ns per loop
sage: timeit('x*y')
625 loops, best of 3: 191 ns per loop
 
```
* Some fixes for `is_perfect_power()` and `bessel_J(0,0)` (Craig Citro, Robert Bradshaw, Robert L. Miller) -- A temporary work around for an upstream bug in GMP when using `is_perfect_power()`. Resolved a Pari interface bug when using `bessel_J(0,0)`. 
* Improved performance for generic polynomial rings, and for univariate polynomial arithmetic over `Z/nZ[x]` (Yann Laigle-Chapuy, Martin Albrecht, Burcin Erocal) -- Improved performance when performing modulo arithmetic between elements of a generic polynomial ring. Univariate polynomial arithmetic over `Z/nZ[x]` now has considerable speed-up at approximately 20x. ```txt
# BEFORE
sage: P.<x> = PolynomialRing(GF(7))
sage: type(x)
<type 'sage.rings.polynomial.polynomial_modn_dense_ntl.Polynomial_dense_mod_p'>
sage: f = P.random_element(100)
sage: g = P.random_element(100)
sage: %timeit f*g
1000 loops, best of 3: 445 µs per loop

# AFTER
sage: P.<x> = PolynomialRing(GF(7))
sage: type(x)
<type 'sage.rings.polynomial.polynomial_zmod_flint.Polynomial_zmod_flint'>
sage: f = P.random_element(100)
sage: g = P.random_element(100)
sage: %timeit f*g
100000 loops, best of 3: 7.92 µs per loop
 
```
* Technical preview of David Harvey's `zn_poly` library exposed to the Sage library (Martin Albrecht). ```txt
def f(p,n):
    P = PolynomialRing(GF(next_prime(p)),'x')
    f = P.random_element(n)
    g = P.random_element(n)

    t0 = cputime()
    r0 = f*g
    t0 = cputime(t0)

    t1 = cputime()
    r1 = f._mul_zn_poly(g)
    t1 = cputime(t1)

    assert(r0 == r1)

    return p,n,t0,t1

for i in range(21): 
   f(2**47,2**i)
 
```returns on sage.math ```txt
# (140737488355328, 1, 0.0, 0.0)
# (140737488355328, 2, 0.0, 0.0)
# (140737488355328, 4, 0.00099999999999766942, 0.0)
# (140737488355328, 8, 0.0, 0.0)
# (140737488355328, 16, 0.0, 0.0)
# (140737488355328, 32, 0.0059990000000027521, 0.0)
# (140737488355328, 64, 0.0, 0.0)
# (140737488355328, 128, 0.0, 0.0)
# (140737488355328, 256, 0.0, 0.0)
# (140737488355328, 512, 0.0, 0.00099999999999766942)
# (140737488355328, 1024, 0.00099999999999766942, 0.0)
# (140737488355328, 2048, 0.0020000000000024443, 0.0019989999999978636)
# (140737488355328, 4096, 0.0049989999999979773, 0.005000000000002558)
# (140737488355328, 8192, 0.010998000000000729, 0.011997999999998399)
# (140737488355328, 16384, 0.023995999999996798, 0.023997000000001378)
# (140737488355328, 32768, 0.050992000000000814, 0.052991999999996153)
# (140737488355328, 65536, 0.1149820000000048, 0.10598499999999689)
# (140737488355328, 131072, 0.29195599999999189, 0.21996599999999944)
# (140737488355328, 262144, 0.6119070000000022, 0.45393199999999467)
# (140737488355328, 524288, 1.5217689999999919, 1.0278430000000043)
# (140737488355328, 1048576, 3.1365230000000111, 2.0966819999999871)
 
```
* Deprecate the function `sqrt_approx()` (David Roe) -- To obtain a numerical approximation of the square root of a ring element (integers, polynomials over `GF(2^x)`, rationals), users are advised to use the function `sqrt()` with a given number of bits of precision instead. 
* Use Pohlig-Hellman for generic discrete logarithm (Yann Laigle-Chapuy) -- This results in significant improvement in performance and less memory foot print. Here's an example with a smooth order: ```txt
sage: factor(5^15-1)
2^2 * 11 * 31 * 71 * 181 * 1741

# BEFORE
sage: F.<a>=GF(5^15)
sage: g=F.gen()
sage: u=g^123456789
sage: time log(u,g)
CPU times: user 271.39 s, sys: 4.72 s, total: 276.11 s
Wall time: 276.96 s
123456789
sage: get_memory_usage()
378.21875

# AFTER
sage: F.<a>=GF(5^15)
sage: g=F.gen()
sage: u=g^123456789
sage: time log(u,g)
CPU times: user 0.14 s, sys: 0.00 s, total: 0.14 s
Wall time: 0.16 s
123456789
sage: get_memory_usage()
115.8984375
 
```And here's another example with a not-so-smooth order: ```txt
sage:factor(3^13-1)
2 * 797161

# BEFORE
sage: F.<a>=GF(3**13)
sage: g=F.gen()
sage: u=g^1234567
sage: timeit('log(u,g)')
5 loops, best of 3: 1.54 s per loop
sage: get_memory_usage()
155.11328125

# AFTER
sage: F.<a>=GF(3**13)
sage: g=F.gen()
sage: u=g^1234567
sage: timeit('log(u,g)')
5 loops, best of 3: 931 ms per loop
sage: get_memory_usage()
139.4296875
 
```
* Exact division syntax in finite fields of prime order (David Roe) -- Support the division operator `//` for finite fields of prime order. 
* Consistent integer hashing (Craig Citro). 
* Unit of least precision for RR and RDF (Robert Bradshaw) -- New function `ulp()` to get the unit of least precision for a real number defined using RR or RDF. The unit of least precision for such a number is the weight of its least significant bit. Unless the number in question is exactly a power of two, it is gap between this number and the next closest distinct number that can be represented.  
* Wrap FLINT's pseudo-division algorithm for univariate polynomials over ZZ (William Stein). 

## Build

* 64-bit OSX (Michael Abshoff) -- Fixed 64-bit OSX build support for f2c, added 64-bit OSX build support for tachyon, added 64-bit OSX build support for flintqs, and added persistent Sage 64-bit building switch on OSX and Solaris. 
* Update readline spkg (Michael Abshoff) -- The updated readline spkg allows readline-5.2 to be built on the 64-bit version of OpenSUSE 11.1. 
* Update the <a class="http" href="http://www.mpir.org/">gmp-mpir</a> spkg (Michael Abshoff) -- The new spkg version 0.9 fixes various build issues on <a href="/MacIntel">MacIntel</a> architectures. <a class="http" href="http://www.mpir.org">MPIR</a> is a library supporting multiprecision integers and rationals, based on the <a class="http" href="http://gmplib.org">GMP (GNU Multi Precision)</a> project. 

## Calculus

* LaTeX output (Mike Hansen) -- Added LaTeX output for ceiling, floor, and derivative functions, and LaTeX'ing of powers of negative numbers. 
* Make `bernoulli_polynomial()` independent of Maxima (Craig Citro) -- A rewrite of `bernoulli_polynomial()` to avoid using Maxima completely in computing Bernoulli polynomials. This gives roughly a factor of 10 speed-up. 
* Support integration without explicit variable declaration (Karl-Dieter Crisman). 
* CPU time of a Maxima session (Martin Albrecht) -- The new function `cputime()` in `sage.interfaces.maxima.py` returns the amount of CPU time used by a Maxima session. 
* <a href="/spkg/pynac">Pynac</a> interface enhancements (Burcin Erocal) -- New enhancements to the Pynac interface include: 
            * Add the method `operator()` to `sage.symbolic.expression.pyx` to return the top-most operator in an expression. 
            * Allow Pynac symbolic variables as arguments to `factorial()` and `binomial()`. 
            * Iterator support to `sage.symbolic.expression.Expression`. 
            * Allow substituting more than one variable in Pynac expressions.  
            * New function `collect_common_factors()` to `sage.symbolic.expression.Expression`.  
            * LaTeX printing. 
            * Allow Pynac symbolics to be used in `CallableSymbolicExpressions`.  
* Indefinite integration for piecewise functions (Paul Butler). 
* New function `jacobian()` for computing the Jacobian matrix (Jason Grout) -- The new function is `sage.calculus.functions.jacobian()` which returns the Jacobian matrix consisting of partial derivatives in which the i,j entry of the Jacobian matrix is the partial derivative `diff(functions[i], variables[j])`. 

## Coding Theory

* Weight distribution for binary codes (Robert L. Miller) -- A weight distribution algorithm for binary codes using Robert Bradshaw's bitsets. This implementation in <a class="http" href="http://www.cython.org">Cython</a> gives a 19 to 20 times performance speed-up over the previous GAP/Guava implementation. Here's an example: ```txt
# BEFORE
sage: time C.spectrum()
CPU times: user 0.03 s, sys: 0.02 s, total: 0.05 s
Wall time: 3.36 s
[1, 0, 0, 7, 7, 0, 0, 1]
sage: time C.spectrum()
CPU times: user 0.02 s, sys: 0.01 s, total: 0.03 s
Wall time: 2.20 s
[1, 0, 0, 7, 7, 0, 0, 1]
sage: time C.spectrum()
CPU times: user 0.02 s, sys: 0.01 s, total: 0.03 s
Wall time: 3.26 s
[1, 0, 0, 7, 7, 0, 0, 1]
sage: time C.spectrum()
CPU times: user 0.02 s, sys: 0.01 s, total: 0.03 s
Wall time: 2.74 s
[1, 0, 0, 7, 7, 0, 0, 1]

# AFTER
sage: timeit('C.spectrum()')
625 loops, best of 3: 1.86 ms per loop
 
```
* Linear codes decoding algorithms (David Joyner, Robert L. Miller) -- A number of algorithms in the GAP package Guava are moved to Sage. Two decoding methods are implemented, in particular, the methods nearest neighbor and syndrome.  

## Coercion

* Ring coercion for polynomials over finite fields (William Stein). 
* Move univariate polynomial rings to new coercion model (Robert Bradshaw). 

## Combinatorics

* Bell polynomials (Blair Sutton) -- New function `bell_polynomial()` in `sage.combinat.combinat.py` returns the Bell polynomial. 
* Covering design (Daniel Gordon) -- New module `sage.combinat.designs.covering_design.py` adds basic support for covering design. The function `best_known_covering_design_www()` is an interface to the online database of best known covering design at the <a class="http" href="http://www.ccrwest.org">La Jolla Covering Repository</a>. 

## Commutative Algebra

* Multivariate polynomials over residue fields of number fields (Nick Alexander) -- Fixed an infinite loop bug when working with multivariate polynomials over residue fields of number fields. Previously in hashing "large" characteristic residue fields, the hash method would try to hash an ideal of the residue field itself, which in turn would try to hash its parent, and so on ad infinitum. At no point has a residue field with cardinality a very large prime been created in Sage. 
* GCD of polynomials over finite fields (Martin Albrecht) -- Previously when using libsingular to compute the GCD of two (multivariate) polynomials over finite fields, Sage would segfault whenever the base rings are not identical. 
* Deprecate `Ideal.reduced_basis()` (John Perry) -- The previous name `Ideal.reduced_basis()` is misleading as it suggests that it can be used for computing the reduced Groebner basis, when in fact it returns the interreduced basis. Thus `Ideal.reduced_basis()` is now deprecated and users are encouraged to use `Ideal.interreduced_basis()` instead. 
* Factoring multivariate polynomials over non-prime finite fields (William Stein) -- The factoring algorithm works as follow. If `f` is a polynomial over a non-prime finite field, factoring `f` is reduced to factoring over a prime field and using GCD over the non-prime field. 
* Multivariate ideal dimensions over any field (John Perry) -- Support for computing the dimension of fields of large prime characteristics via the method `dimension()` in the module `sage.rings.polynomial.multi_polynomial_ideal.py`. The default is to use the functionalities of Singular to do so. However, if the characteristic of the field is larger than what Singular can handle, the method falls back on a toy implementation of Buchberger to compute the Groebner basis, and finally using the algorithm described in Chapter 9, Section 1 of the following text: 
         * David A. Cox, John B. Little & Donal O'Shea. "Ideals, Varieties, and Algorithms: An Introduction to Computational Algebraic Geometry and Commutative Algebra" 3rd edition. Springer, 2007. 
* Improve `mq.SR` usability and performance (Martin Albrecht) -- Here are some improvements for `mq.SR`: 
            * faster `polynomial_system` generation by pre-computing S-Box polynomials 
            * support for finite extension field elements in `mq.SBox` (needed by `mq.SR`) 
            * more module level documentation for `mq.sr` 
            * new `sbox()` function which returns AES (or SR) SBox object 
            * `AllowZeroInversionsContext()` to handle table creation and such 
            * more user friendly encryption, i.e. accept more inputs and make sense of them 
            * `varstr()` function to return a specific string rather than a list of strings using `varstrs()` 
            * `variable_dict()` function which gives fast access to string -> variable mappings 
            * ring constructor now accepts optional `reverse_variables` parameter 
            * `SR_gf2_2` class as an example on how to customize things 
            * added `constant_coefficient()` function to `BooleanPolynomials` (needed by `sbox()`) 

## Distribution

* GAP configuration file (Matthias Meulien) -- A user's local GAP configuration file is usually named `$HOME/.gaprc`. When such a file already exists and Sage is compiled from source, using the Sage interface to GAP, e.g. `gap._eval_line('1+3;')`, can result in gibberish. This is now fixed so that the GAP interface would output a comprehensible message/answer as a result of some GAP calculation. 
* An OSX Sage launcher (Ivan Andrus, Karl-Dieter Crisman) -- Support for building a clickable Sage launcher on Mac OSX. With the source distribution of Sage 3.3, creating a clickable Mac OSX app is as easy as 1-2-3: 
   1. Download and extract <a class="http" href="http://www.sagemath.org/download.html">sage-3.3.tar</a> to a directory that you have write access: ```txt
tar -xvf sage-3.3.tar -C /path/to/preferred/dir
  
```
   1. Nagivate to the top level directory of the uncompressed source distribution, and compile Sage 3.3 from there: ```txt
cd SAGE_ROOT/
make  # be patient here. Go get a drink or something.
make test  # this is optional. Be very patient here, if you do this.
  
```
   1. Now create a binary OSX clickable app: ```txt
./sage -bdist 3.3  # this can take a while
  
```After the system has completed building the binary version, you can find the binaries in `SAGE_ROOT/dist`. A screenshot of a Sage Mac OSX clickable app in action can be found in <a href="ReleaseTours/sage-3.3/sage-osx-app.png">sage-osx-app.png</a>. 
* Port to 64-bit OSX 10.5 (Michael Abshoff). 

## Geometry

* Polyhedral improvements (Marshall Hampton) -- Added more built-in Archimedean solids and some new methods such as the Gale transform, bipyramid construction, edge truncation, and perspective projection with (optionally) hidden faces invisible. The Schlegel projection code has also been refactored to make it more general in the future. 

## Graph Theory

* Equality testing in graphs (Robert L. Miller) -- The "weighted" property or edge label is taken into account when testing for equality in graphs. 
* Update <a class="http" href="http://networkx.lanl.gov">NetworkX</a> to version 0.99 upstream release (Robert L. Miller, Michael Abshoff) -- NetworkX is a Python package for studying the structure and dynamics of complex networks. It can be used to analyze large networks including social, biological and technological networks. 
* Improve timings for `adjacency_matrix`, `weighted_adjacency_matrix`, and `kirchoff_matrix` (Mike Hansen). ```txt
# BEFORE
sage: %time m = graphs.GridGraph([50,50]).laplacian_matrix()
CPU times: user 38.42 s, sys: 0.24 s, total: 38.66 s
Wall time: 39.02 s

# AFTER
sage: %time m = graphs.GridGraph([50,50]).laplacian_matrix()
CPU times: user 0.63 s, sys: 0.06 s, total: 0.69 s
Wall time: 0.89 s
 
```
* Pretty plot of graphs with multiedges (Emily Kirkman) -- A plot of a multiedge graph can be found in <a href="ReleaseTours/sage-3.3/multiedge-graph.png">multiedge-graph.png</a>. The plot is produced using the following code from the docstring of `sage.graphs.graph.GenericGraph.plot()`: ```txt
sage: g = Graph({}, loops=True, multiedges=True)
sage: g.add_edges([(0,0,'a'), (0,0,'b'), (0,1,'c'),(0,1,'d'), 
...     (0,1,'e'), (0,1,'f'), (0,1,'f'), (2,1,'g'),(2,2,'h')]) 
sage: g.plot(edge_labels=True, color_by_label=True, edge_style='dashed')
 
```
* Improvements to the `Graph(...)` constructor for input matrices Robert L. Miller) --  This is an overhaul of the `Graph` and `DiGraph` initialization functions. Among other things, one can now naturally convert between `Graph` and `DiGraph`. 

## Graphics

* Plotting a region (Arnaud Bergeron) -- New function `region_plot()` for plotting a region where a system of equations/inequalities holds true. Here's a region plot,  <a href="ReleaseTours/sage-3.3/concentric-ellipses.png">concentric-ellipses.png</a>, produced using the following code from the docstring of `sage.plot.contour_plot.region_plot()`: ```txt
sage: x, y = var('x, y') 
sage: region_plot(cos(x^2 + y^2) < 0, (-3, 3), (-3, 3))
 
```Here is a more sophisticated plot, <a href="ReleaseTours/sage-3.3/yellow-dots.png">yellow-dots.png</a>, produced using the following code from the doctring of `sage.plot.contour_plot.region_plot()`: ```txt
sage: x, y = var('x, y')
sage: region_plot(sin(x) * sin(y) >= 1/4, (-10,10), (-10,10), incol='yellow', bordercol='black', plot_points=100).show(aspect_ratio=1)
 
```
* Consistency in variable range (Mike Hansen, Jason Grout) -- The variable range of `parametric_plot()` is now consistent with that of `plot()`, namely `(var, min, max)`. 
* Polar plot syntax (Jason Grout) -- Polar plot now accepts the syntax `(t, 0, 2*pi)` for the interval. 
* New function `density_plot()` and improved colour map handling (Arnaud Bergeron) -- The new function `density_plot()` takes a function of two variables and plots contour lines of the function over two specified ranges. Also, some improvements on how color map is handled. Here's a density plot in grayscale, <a href="ReleaseTours/sage-3.3/density-plot-bw.png">density-plot-bw.png</a>, produced using the following code: ```txt
sage: x,y = var('x, y')
sage: density_plot(sin(x) * sin(y), (-2, 2), (-2, 2))
 
```A sample plot in colour, <a href="ReleaseTours/sage-3.3/density-plot-colour.png">density-plot-colour.png</a>, is produced using the following code: ```txt
sage: density_plot(sin(x^2 + y^2) * cos(x) * sin(y), (-4, 4), (-4, 4), cmap='jet', plot_points=100)
 
```
* 3-D polygon (Arnaud Bergeron) -- The new function `polygon3d()` allows for plotting of 3-D polygons. 
* Fill option for `plot()`, `polar_plot()` and `parametric_plot()` (Wilfried Huss, Karl-Dieter Crisman, Michael Abshoff) -- Added new options "fill", "fillcolor", and "fillalpha" to the plot family of functions. These new fill options allow users to fill the area between two functions in a plot, or to fill the area between the function and the x-axis. The syntax for the new fill option is similar to what Mathematica uses. Here's a fill plot, <a href="ReleaseTours/sage-3.3/fill-plot.png">fill-plot.png</a>, produced using the following code: ```txt
maxima.load('interpol')

def f(x):
    return RDF(1 / (1 + 25 * x^2))

def runge():
    g = plot(f, -1, 1, rgbcolor='red', thickness=1)
    polynom = []
    for i, n in enumerate([6, 8, 10, 12]):
        data = [(x, f(x)) for x in xsrange(-1, 1, 2 / (n - 1), include_endpoint=True)]
        polynom.append(maxima.lagrange(data).sage())
        g += list_plot(data, rgbcolor='black', pointsize=5)
    g += plot(polynom, -1, 1, fill=f, fillalpha=0.2, thickness=0)
    return g

runge().show(ymin=0, ymax=1)
 
```

## Group Theory

* New method `is_cyclic()` (David Joyner) -- The new method `is_cyclic()` for (finite) groups is currently not as optimized as it should be. Given a finite abelian group, one can test to see whether or not it is cyclic, a test that depends on calculating the elementary divisors of the group. As correctness is the main concern in the current implementation of `elementary_divisors()`, performance is not taken into account. However, the docstring for `elementary_divisors()` describes an algorithm communicated by Robert L. Miller for speeding up this method. 

## Interfaces

* Magma interface (William Stein) -- Fixed a problem in Sage's interface to Magma so that now the Magma `.sig` files in `extcode` are no longer written there by Magma itself. The current behaviour is that the first (and only first) time a Magma interface is started in a given session, files in `data/extcode/magma` are copied to a temporary directory. 
* GAP interface (Mike Hansen) -- Ensured that the GAP interface handles keyboard interrupt gracefully, that GAP output would be printed, and that multi-line input and comments are handled as expected. 
* Sage preparser (Robert Bradshaw) -- Some simplification of the Sage preparser, together with improved handling of literal numbers. 

## Linear Algebra

* Multiplication of sparse matrices over finite fields (William Stein, Craig Citro) -- Significant performance improvement when multiplying two sparse matrices over the same finite field. In some cases, performance is about 37 times faster than previously. ```txt
# BEFORE
sage: m = random_matrix(GF(10007), 100, 100, sparse=True)
sage: %time m*m
CPU times: user 3.36 s, sys: 0.03 s, total: 3.39 s
Wall time: 3.42 s
100 x 100 sparse matrix over Finite Field of size 10007

# AFTER
sage: m = random_matrix(GF(10007), 100, 100, sparse=True)
sage: %time m*m
CPU times: user 0.09 s, sys: 0.00 s, total: 0.09 s
Wall time: 0.09 s
100 x 100 sparse matrix over Finite Field of size 10007
 
```
* Minimum polynomials for `GF(p)` (Alex Ghitza). 
* Matrix exponential for general matrices (Jason Grout) -- Added a generic matrix exponential that depends on Maxima's matrix exponentiation function. If the matrix has floating point numbers, these will be rounded automatically to rational numbers during the computation. For numerical approximations to the exponential, one can first convert the matrix to RDF or CDF. 
* 100% doctest coverage for the modules `sage.matrix.constructor.py`, `sage.matrix.misc.pyx`, `sage.matrix.matrix_generic_dense.pyx` (William Stein) -- Apart from the full doctest coverage, calculating the lift of a matrix is now 20 times faster than previously. 
* Improved performance for method `density()` in `sage.matrix.matrix_modn_sparse.pyx` (Craig Citro). 
* Added a kernel method for sparse integer matrices (John H. Palmieri). 
* Speed up `right_nullity()` for matrices (John H. Palmieri). 
* Considerable (optional) speed-up for row echelon forms of dense matrices over GF(2) due to new M4RI library (Martin Albrecht). ```txt
# BEFORE
sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.echelon_form(algorithm='m4ri')
CPU times: user 15.49 s, sys: 0.05 s, total: 15.54 s
Wall time: 15.72 s
20000 x 20000 dense matrix over Finite Field of size 2

# AFTER
sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.echelon_form(algorithm='pluq')
CPU times: user 9.86 s, sys: 0.04 s, total: 9.91 s
Wall time: 9.97 s
20000 x 20000 dense matrix over Finite Field of size 2
 
```

## Miscellaneous

* Rewrite of the function `__getitem__` (Jason Grout, Craig Citro) -- A rewrite of the function `__getitem__` in `sage.matrix.matrix0.pyx` to better support slices and negative indices. 
* Function `get_memory_usage()` now returns a float on all platforms (William Stein). 
* The function `CremonaDatabase().number_of_curves()` now works even when the optional Cremona database isn't installed (Alex Ghitza). 
* Set iteration for finite sets (Robert L. Miller) -- Set iteration is now implemented for finite sets. 

## Notebook

* Interact cells in the notebook are not automatically evaluated (Mike Hansen). 
* Clear browser cache when restarting the worksheet (Mike Hansen). 
* Update jsMath to version 3.6 upstream release (Jason Grout) -- jsMath is a package for including professional quality mathematics typesetting a la LaTeX/TeX in HTML pages. It works across multiple popular browsers and is platform independent. 
* In-line WYSIWYG editor for text cells using <a class="http" href="http://tinymce.moxiecode.com">TinyMCE</a> (Jason Grout) -- TinyMCE is a Javascript library that implements a WYSIWYG editor within a browser. 
* Automatic indentation (Alexander Hupfer, Tom Boothby) -- Automatic indentation for Python code after colons and same level identation. Currently, up to four levels of indentation are supported. 

## Number Theory

* Number field ideal utilities (John Cremona, Maite Aranes) -- New function `invertible_residues()` for iterating through only the invertible residues modulo an integral ideal. New function `element_1_mod()` such that `A.element_1_mod(B)` returns some `a` in `A` such that `1 - a` is in `B`. 
* New function `random_element()` for returning a random element of a number field (Alex Ghitza). 
* Elliptic curve function `integral_points()` misses some points (John Cremona) -- Francois Glineur reported that for the elliptic curve `20160bg2`, the output of `integral_points()` misses the points `x = 168` and `x = 381`. This problem has been narrowed down to the function `point_preprocessing()`, and the bug is now fixed. 
* Elliptic curve (Robert Bradshaw) -- Support for the construction of an elliptic curve via a Weierstrass equation. The Weierstrass equation can be passed as an argument to `EllipticCurve()`. For example, to construct the elliptic curve `y^2 = x^3 - x`, one can now do the following: ```txt
sage: x, y = var("x, y")
sage: ellW = EllipticCurve(y^2 == x^3 - x)
sage: ellW.plot()
 
```to get the plot in <a href="ReleaseTours/sage-3.3/elliptic-curve.png">elliptic-curve.png</a>. Previously, if one is not familiar with the Cremona database, the above elliptic curve would very likely be constructed by passing in its a-invariants as follows: ```txt
sage: ellA = EllipticCurve([0, 0, 0, -1, 0])
sage: ellA == ellW
True
 
```where the a-invariants of a general elliptic curve are specified in `y^2 + a_1 xy + a_3 y = x^3 + a_2 x^2 + a_4 x + a_6`. 
* Separating relative number fields from generic/absolute number fields (Nick Alexander) -- Functionalities in the module `sage.rings.number_field.number_field.py` that deal with relative number fields are now wrapped inside the new module `sage.rings.number_field.number_field_rel.py`. 
* Cremona's database of elliptic curves (William Stein) -- Improved handling of the case `990h`. 
* Manin constant (William Stein) -- New function `manin_constant()` to compute the Manin constant of an elliptic curve. This function only works if the curve is in the installed Cremona database. By default Sage includes a small database, whereas the full database must be installed as an optional package. WARNING: The result is _not_ provably correct in the sense that when the numbers are huge, isogenies could be missed due to precision issues.  The newly implemented function can be found in the module `sage.schemes.elliptic_curves.ell_rational_field.py`. 
* Bach bound (William Stein) -- New function `bach_bound()` to compute the Bach bound associated to a number field. Assuming the General Riemann Hypothesis, the Bach bound is a bound B such that every integral ideal is equivalent modulo principal fractional ideals to an integral ideal of norm at most B. The newly implemented function can be found in the module `sage.rings.number_field.number_field_base.pyx`. 
* Make relative number fields lazy (Nick Alexander) -- Relative number fields are now truly lazy, meaning that they no longer require PARI's nf or bnf structures for the base field nor PARI's rnf structures for the extension. Arithmetic can now be done in huge extensions, those for which there is no hope of finding units, class groups, etc. 

## Optional Packages

* Modular polynomials database (Alex Ghitza) -- Removed the use of `polydict` in the module `sage.databases.db_modular_polynomials.py`.  
* `lrs.spkg` improvements (Marshall Hampton) -- Further tests added to the `makefile` of the package <a class="http" href="http://cgm.cs.mcgill.ca/~avis/C/lrs.html">lrs</a>. This optional package implements the reverse search algorithm for vertex enumeration and convex hull problems. 

## Packages

* Switch from GMP to <a class="http" href="http://www.mpir.org">MPIR</a> and upgrade to version 0.9.rc3 upstream release  (Michael Abshoff) -- MPIR, otherwise known as eMPIRe, is a library for multiprecision integers and rationals based on the <a class="http" href="http://www.gmplib.org">GMP</a> project. Among other things, MPIR aims to provide native build capability under Windows. 
* Upgrade <a class="http" href="http://www.mpfr.org">MPFR</a> to version 2.4.0 upstream release (Michael Abshoff) -- MPFR is a C library for multiprecision floating-point computations that is based on the GMP project. 
* Upgrade <a class="http" href="http://ecm.gforge.inria.fr">GMP-ECM</a> to version 6.2.1 upstream release (Michael Abshoff). 
* Move <a class="http" href="http://jquery.com">jquery</a> into its own spkg (Jason Grout). 
* Upgrade <a class="http" href="http://www.selenic.com/mercurial/wiki">Mercurial</a> to version 1.1.2 upstream release (Mike Hansen). 
* OS X 64-bit (Michael Abshoff) -- Added 64-bit build support for Pynac, <a class="http" href="http://www.r-project.org">R</a>, <a class="http" href="http://ghmm.sourceforge.net">GHMM</a>, and <a class="http" href="http://bdwgc.sourceforge.net">Boehm GC</a>. Also added `fortran-OSX64-20090120.spkg` to the experimental spkg repository. 
* Upgrade <a class="http" href="http://ipython.scipy.org/moin">IPython</a> to version 0.9.1 upstream release (Mike Hansen). 
* Upgrade <a class="http" href="http://www.ifor.math.ethz.ch/~fukuda/cdd_home/cdd.html">cddlib</a> to version 0.94f upstream release (Sebastien Barthelemy). 
* Upgrade <a class="http" href="http://bitbucket.org/malb/m4ri/wiki/">M4RI</a> to version 20090105 upstream release (Martin Albrecht). 
* Upgrade GAP/GUAVA to versions 4.4.12/3.9 upstream releases (David Joyner). 
* Upgrade <a class="http" href="http://jmol.sourceforge.net">Jmol</a> to version 11.6 upstream release (Michael Abshoff). 
* Upgrade <a class="http" href="http://matplotlib.sourceforge.net">matplotlib</a> to version 0.98.5.3-svn6910 upstream release (Jason Grout, Michael Abshoff). 
* Upgrade <a class="http" href="http://www.libpng.org">libpng</a> to version 1.2.34 upstream release (Michael Abshoff). 
* Upgrade <a class="http" href="http://sphinx.pocoo.org">Sphinx</a> to version 0.5.1 upstream release (Mike Hansen). 
* Upgrade <a class="http" href="http://www.bzip.org">bzip2</a> to version 1.0.5 upstream release (Michael Abshoff). 
* Upgrade <a class="http" href="http://math-atlas.sourceforge.net">ATLAS</a> to version 3.8.3 upstream release (Michael Abshoff). 

## Porting

* OSX 64-bit (Michael Abshoff) -- Added proper `libcsage` build support, and <a class="http" href="http://www.singular.uni-kl.de">Singular</a> is now built using the flag `--with-malloc=system`. 
* Upgrade <a class="http" href="http://directory.fsf.org/project/libgcrypt">libgcrypt</a> to version 1.4.3 upstream release and force the function `get_memory_usage()` to fall back to using `top` when not on Linux (Michael Abshoff) -- This is part of the Solaris port. 

## Website/Wiki

* The trac server now displays the comments of a Mercurial diff (Robert Bradshaw) -- Here's a screenshot, <a href="ReleaseTours/sage-3.3/trac-better-diff.png">trac-better-diff.png</a>, showing Mercurial diff comments when viewing patches on the trac server. 
* Added a `hg_examples` Mercurial wrapper for the examples repository (Mike Hansen). 
* Upgrade <a class="http" href="http://trac.edgewall.org">trac</a> to version 0.11 upstream release (William Stein). 