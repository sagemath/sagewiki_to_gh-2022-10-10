

# Sage 3.4.2 Release Tour

Sage 3.4.2 was released on May 05, 2009. For the official, comprehensive release note, please refer to <a class="http" href="http://www.sagemath.org/mirror/src//announce/sage-3.4.2.txt">sage-3.4.2.txt</a>. A nicely formatted version of this release tour can be found <a class="http" href="http://mvngu.wordpress.com/2009/05/17/sage-3-4-2-released">here</a>. The following points are some of the foci of this release: 

* Improve doctest coverage of the Sage library in anticipation of version 4.0. 
* New features for symbolic logic. 

## Algebra

* Comparison of ring coercion morphisms (Alex Ghitza) -- New comparison method `__cmp__()` for the class `RingHomomorphism_coercion` in `sage/rings/morphism.pyx`. The comparison method `__cmp__(self, other)` compares a ring coercion morphism `self` to `other`. Ring coercion morphisms never compare equal to any other data type. If `other` is a ring coercion morphism, the parents of `self` and `other` are compared. Here are some examples on comparing ring coercion morphisms: ```txt
sage: f = ZZ.hom(QQ)
sage: g = ZZ.hom(ZZ)
sage: f == g
False
sage: f > g
True
sage: f < g
False
sage: h = Zmod(6).lift()
sage: f == h
False
sage: f = ZZ.hom(QQ)
sage: g = loads(dumps(f))
sage: f == g
True
 
```
* Coercing factors into a common universe (Alex Ghitza) -- New method `base_change(self, U)` in the module `sage/structure/factorization.py` to allow the factorization `self` with its factors (including the unit part) coerced into the universe `U`. Here's an example for working with the new method `base_change()`: ```txt
sage: F = factor(2006)
sage: F.universe() 
Integer Ring
sage: P.<x> = ZZ["x"]
sage: F.base_change(P).universe() 
Univariate Polynomial Ring in x over Integer Ring
 
```

## Basic Arithmetic

* Enhancements to symbolic logic (Chris Gorecki) -- This adds a number of utilities for working with symbolic logic: 
   1. `sage/logic/booleval.py` -- For evaluating boolean formulas. 
   1. `sage/logic/boolformula.py` -- For boolean evaluation of boolean formulas. 
   1. `sage/logic/logicparser.py` -- For creating and modifying parse trees of well-formed boolean formulas. 
   1. `sage/logic/logictable.py` -- For creating and printing truth tables associated with logical statements. 
   1. `sage/logic/propcalc.py` -- For propositional calculus. Here are some examples for working with the new symbolic logic modules: ```txt
sage: import sage.logic.propcalc as propcalc
sage: f = propcalc.formula("a&((b|c)^a->c)<->b")
sage: g = propcalc.formula("boolean<->algebra")
sage: (f&~g).ifthen(f)
((a&((b|c)^a->c)<->b)&(~(boolean<->algebra)))->(a&((b|c)^a->c)<->b)
sage: f.truthtable()

a      b      c      value
False  False  False  True   
False  False  True   True   
False  True   False  False  
False  True   True   False  
True   False  False  True   
True   False  True   False  
True   True   False  True   
True   True   True   True
 
```
* New function `squarefree_divisors()` (Robert Miller) -- The new function `squarefree_divisors(x)` in the module `sage/rings/arith.py` allows for iterating over the squarefree divisors (up to units) of the element `x`. Here, we assume that `x` is an element of any ring for which the function `prime_divisors()` works.  Below are some examples for working with the new function `squarefree_divisors()`: ```txt
sage: list(squarefree_divisors(7))
[1, 7]
sage: list(squarefree_divisors(6))
[1, 2, 3, 6]
sage: list(squarefree_divisors(81))
[1, 3]
 
```

## Combinatorics

* Make `cartan_type` a method rather than an attribute (Dan Bump) -- For the module `sage/combinat/root_system/weyl_characters.py`, `cartan_type` is now a method, not an attribute. For example, one can now invoke `cartan_type` as a method like so: ```txt
sage: A2 = WeylCharacterRing("A2")
sage: A2([1,0,0]).cartan_type()
['A', 2]
 
```

## Commutative Algebra

* Improved performance in `MPolynomialRing_libsingular` (Simon King) -- This provides some optimization of the method `MPolynomialRing_libsingular.__call__()`. In some cases, the efficiency is up to 19%. The following timing statistics are obtained using the machine sage.math: ```txt
# BEFORE

sage: R = PolynomialRing(QQ,5,"x")
sage: S = PolynomialRing(QQ,6,"x")
sage: T = PolynomialRing(QQ,5,"y")
sage: U = PolynomialRing(GF(2),5,"x")
sage: p = R("x0*x1+2*x4+x3*x1^2")^4
sage: timeit("q = S(p)")
625 loops, best of 3: 321 µs per loop
sage: timeit("q = T(p)")
625 loops, best of 3: 348 µs per loop
sage: timeit("q = U(p)")
625 loops, best of 3: 435 µs per loop


# AFTER

sage: R = PolynomialRing(QQ,5,"x")
sage: S = PolynomialRing(QQ,6,"x")
sage: T = PolynomialRing(QQ,5,"y")
sage: U = PolynomialRing(GF(2),5,"x")
sage: p = R("x0*x1+2*x4+x3*x1^2")^4
sage: timeit("q = S(p)")
625 loops, best of 3: 316 µs per loop
sage: timeit("q = T(p)")
625 loops, best of 3: 281 µs per loop
sage: timeit("q = U(p)")
625 loops, best of 3: 392 µs per loop
 
```

## Graph Theory

* Default edge color is black (Robert Miller) -- If only one edge of a graph is colored red, for example, then the remaining edges should be colored with black by default. Here's an example: ```txt
sage: G = graphs.CompleteGraph(5)
sage: G.show(edge_colors={'red':[(0,1)]})
 
```
![ReleaseTours/sage-3.4.2/pentagon-graph.png](ReleaseTours/sage-3.4.2/pentagon-graph.png) 


## Interfaces

* Split off the <a class="http" href="http://fricas.sourceforge.net">FriCAS</a> interface from the <a class="http" href="http://www.axiom-developer.org">Axiom</a> interface (Mike Hansen, Bill Page) -- The FriCAS interface is now split off from the Axiom interface and can now be found in the module `sage/interfaces/fricas.py`. 

## Modular Forms

* Vast speedup in `P1List` construction (John Cremona) -- This provides huge improvement in the `P1List()` constructor for Manin symbols. The efficiency gain can range from 27% up to 6x. Here are some timing statistics obtained using the machine sage.math: ```txt
# BEFORE

sage: time P1List(100000)
CPU times: user 4.11 s, sys: 0.08 s, total: 4.19 s
Wall time: 4.19 s
The projective line over the integers modulo 100000
sage: time P1List(1000000)
CPU times: user 192.22 s, sys: 0.60 s, total: 192.82 s
Wall time: 192.84 s
The projective line over the integers modulo 1000000
sage: time P1List(1009*1013)
CPU times: user 31.20 s, sys: 0.05 s, total: 31.25 s
Wall time: 31.25 s
The projective line over the integers modulo 1022117
sage: time P1List(1000003)
CPU times: user 35.92 s, sys: 0.05 s, total: 35.97 s
Wall time: 35.97 s
The projective line over the integers modulo 1000003


# AFTER

sage: time P1List(100000)
CPU times: user 0.78 s, sys: 0.02 s, total: 0.80 s
Wall time: 0.80 s
The projective line over the integers modulo 100000
sage: time P1List(1000000)
CPU times: user 27.82 s, sys: 0.21 s, total: 28.03 s
Wall time: 28.02 s
The projective line over the integers modulo 1000000
sage: time P1List(1009*1013)
CPU times: user 21.59 s, sys: 0.04 s, total: 21.63 s
Wall time: 21.63 s
The projective line over the integers modulo 1022117
sage: time P1List(1000003)
CPU times: user 26.19 s, sys: 0.05 s, total: 26.24 s
Wall time: 26.24 s
The projective line over the integers modulo 1000003
 
```

## Notebook

* Downloading and uploading folders of worksheets (Robert Bradshaw) -- One can now download and upload entire folders of worksheets at once, instead of individual worksheets one at a time. This also allows for downloading only selecting worksheets in one go. 
* Reduce the number of actions that trigger taking a snapshot (William Stein, Rob Beezer) -- Snapshots now need to be explicitly requested by clicking the save button. This greatly reduces many unnecessary snapshots. 

## Number Theory

* Enhanced function `prime_pi()` for counting primes (R. Andrew Ohana) -- The improved function `prime_pi()` in `sage/functions/prime_pi.pyx` implements the prime counting function `pi(n)`. Essentially, `prime_pi(n)` counts the number of primes less than or equal to `n`. Here are some examples: ```txt
sage: prime_pi(10)
4
sage: prime_pi(100)
25
sage: prime_pi(-10)
0
sage: prime_pi(-0.5)
0
sage: prime_pi(10^10)
455052511
 
```
* Action of the Galois group on cusps (William Stein) -- New method `galois_action()` in `sage/modular/cusps.py` for computing action of the Galois group on cusps for congruence subgroups. The relevant algorithm here is taken from section 1.3 of the following text: 
   * S. Glenn. Arithmetic on Modular Curves. Progress in Mathematics, volume 20, Birkhauser, 1982. 
Here are some examples for working with `galois_action()`: 
```txt
sage: Cusp(1/10).galois_action(3, 50)
1/170
sage: Cusp(oo).galois_action(3, 50)
Infinity
sage: Cusp(0).galois_action(3, 50)
0
 
```
* Finding elliptic curves with prescribed reduction over `QQ` (John Cremona) -- New function `EllipticCurves_with_good_reduction_outside_S()` for constructing elliptic curves with good reduction outside a finite set of primes. This essentially implements the algorithm presented in the paper, but currently only over `QQ`: 
   * J. Cremona and M. Lingham. Finding all elliptic curves with good reduction outside a given set of primes. Experimental Mathematics, 16(3):303--312, 2007. Here are some examples for working with this new function: ```txt
sage: EllipticCurves_with_good_reduction_outside_S([])
[]
sage: elist = EllipticCurves_with_good_reduction_outside_S([2])
sage: elist

[Elliptic Curve defined by y^2 = x^3 + 4*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 11*x - 14 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 11*x + 14 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 4*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 44*x - 112 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 44*x + 112 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 + x + 1 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 - 9*x + 7 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 + 3*x - 5 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 - 2*x - 2 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 + x - 1 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 - 9*x - 7 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 + 3*x + 5 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 - 2*x + 2 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 - 3*x + 1 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + x^2 - 13*x - 21 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 2*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + 8*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 + 2*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - 8*x over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 - 3*x - 1 over Rational Field,
 Elliptic Curve defined by y^2 = x^3 - x^2 - 13*x + 21 over Rational Field]
sage: len(elist)
24
sage: ', '.join([e.label() for e in elist])
'32a1, 32a2, 32a3, 32a4, 64a1, 64a2, 64a3, 64a4, 128a1, 128a2, 128b1, 128b2, 128c1, 128c2, 128d1, 128d2, 256a1, 256a2, 256b1, 256b2, 256c1, 256c2, 256d1, 256d2'
 
```
* Make elliptic curves over the mod rings `Z/pZ` behave like elliptic curves over the finite fields `GF(p)` (Alex Ghitza) -- Elliptic curves over `Z/NZ` for prime `N` are now treated as being over a finite field. For example, ```txt
sage: F = Zmod(101)
sage: EllipticCurve(F, [2, 3])
Elliptic Curve defined by y^2 = x^3 + 2*x + 3 over Ring of integers modulo 101
sage: E = EllipticCurve([F(2), F(3)])
sage: type(E)
<class 'sage.schemes.elliptic_curves.ell_finite_field.EllipticCurve_finite_field'>
 
```However, if `N` is composite, then elliptic curves over `Z/NZ` are treated as being of the type "generic elliptic curve". For example, ```txt
sage: F = Zmod(95)
sage: EllipticCurve(F, [2, 3])
Elliptic Curve defined by y^2 = x^3 + 2*x + 3 over Ring of integers modulo 95
sage: E = EllipticCurve([F(2), F(3)])
sage: type(E)
<class 'sage.schemes.elliptic_curves.ell_generic.EllipticCurve_generic'>
 
```
* Clean up `sage/schemes/elliptic_curves/ell_generic.py` (Alex Ghitza) -- A lot of code in the module `sage/schemes/elliptic_curves/ell_generic.py` has been moved around and cleaned up. In particular, all methods relating to twists from `ell_generic.py` have been moved to `sage/schemes/elliptic_curves/ell_field.py`, including the alias `base_field = base_ring`. We now have `change_ring` being an alias for `base_extend`, since the two have the exact same functionality and equivalent code. And the standalone function `Hasse_bounds` has been moved from `ell_generic.py` to `sage/schemes/plane_curves/projective_curve.py`. 

## Packages

* Upgrade <a class="http" href="http://www.cython.org">Cython</a> to version 0.11.1 latest upstream release (Robert Bradshaw) -- Based on Pyrex, Cython is a language that closely resembles Python and developed for writing C extensions for Python. For critical functionalities and performance, Sage uses Cython to generate very efficient C code from Cython code, for wrapping external C libraries, and for fast C modules that speed up the execution of Python code. 
* Upgrade <a class="http" href="http://www.mpir.org">MPIR</a> to version 1.1.1 latest upstream release (Michael Abshoff) -- MPIR is a library for multiprecision integers and rationals based on the <a class="http" href="http://www.gmplib.org">GMP project</a>. Among other things, MPIR aims to provide native build capability under Windows. 
* Move DSage to its own spkg (William Stein) -- The Distributed Sage framework (DSage) contained in `sage/dsage` is now packaged as a self-contained spkg. DSage allows for distributed computing from within Sage. 
* Update the <a class="http" href="http://www.flintlib.org">FLINT</a> spkg (Michael Abshoff) -- The new FLINT spkg is `flint-1.2.4.p2.spkg` and fixes spkg-check on OS X 64-bit. 
* Update the <a class="http" href="http://maxima.sourceforge.net">Maxima</a> spkg (Michael Abshoff) -- The Lisp implementation <a class="http" href="http://clisp.cons.org">Clisp</a> needs a stack size larger than many systems provide, i.e. 8KB. When Clisp is used as the Lisp implementation for Maxima, then Maxima can randomly fail to build if the stack size is not raised. The updated Maxima spkg `maxima-5.16.3.p2.spkg` sets the stack size to 32KB for Clisp. 