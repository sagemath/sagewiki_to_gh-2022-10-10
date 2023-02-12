

# Sage 4.3.1 Release Tour

[[_TOC_]] 


## Major features

* Substantial work towards a complete SPARC Solaris 10 port. This is due to the hard work of David Kirkby. The relevant tickets include <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6595">#6595</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7067">#7067</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7138">#7138</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7162">#7162</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7387">#7387</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7505">#7505</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7781">#7781</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7815">#7815</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7817">#7817</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7849">#7849</a> 
* We're moving closer towards a FreeBSD port, thanks to the work of Peter Jeremy at ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7825">#7825</a>. 

## Algebra

* Chinese Remainder Theorem for polynomials <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7595">#7595</a> (Robert Miller) -- An implementation of the Chinese Remainder Theorem is needed for general descents on elliptic curves. Here are some examples for polynomial rings: ```txt
sage: K.<a> = NumberField(x^3 - 7)
sage: R.<y> = K[]
sage: f = y^2 + 3
sage: g = y^3 - 5
sage: CRT(1,3,f,g)
-3/26*y^4 + 5/26*y^3 + 15/26*y + 53/26
sage: CRT(1,a,f,g)
(-3/52*a + 3/52)*y^4 + (5/52*a - 5/52)*y^3 + (15/52*a - 15/52)*y + 27/52*a + 25/52
 
```This also works for any number of moduli: ```txt
sage: K.<a> = NumberField(x^3 - 7)
sage: R.<x> = K[]
sage: CRT([], [])
0
sage: CRT([a], [x])
a
sage: f = x^2 + 3
sage: g = x^3 - 5
sage: h = x^5 + x^2 - 9
sage: k = CRT([1, a, 3], [f, g, h]); k
(127/26988*a - 5807/386828)*x^9 + (45/8996*a - 33677/1160484)*x^8 + (2/173*a - 6/173)*x^7 + (133/6747*a - 5373/96707)*x^6 + (-6/2249*a + 18584/290121)*x^5 + (-277/8996*a + 38847/386828)*x^4 + (-135/4498*a + 42673/193414)*x^3 + (-1005/8996*a + 470245/1160484)*x^2 + (-1215/8996*a + 141165/386828)*x + 621/8996*a + 836445/386828
sage: k.mod(f)
1
sage: k.mod(g)
a
sage: k.mod(h)
3
 
```

## Basic arithmetic

* Implement `conjugate()` for `RealDoubleElement` <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7834">#7834</a> (Dag Sverre Seljebotn) --- New method `conjugate()` in the class `RealDoubleElement` of the module `sage/rings/real_double.pyx` for returning the complex conjugate of a real number. This is consistent with `conjugate()` methods in `ZZ` and `RR`. For example, ```txt
sage: ZZ(5).conjugate()
5
sage: RR(5).conjugate()
5.00000000000000
sage: RDF(5).conjugate()
5.0
 
```
* Improvements to complex arithmetic-geometric mean for real and complex double fields  <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7739">#7739</a> (Robert Bradshaw, John Cremona) --- Adds an `algorithm` option to the method `agm()` for complex numbers. The values of `algorithm` be can: 
   * "pari" --- Call the agm function from the Pari library. 
   * "optimal" --- Use the AGM sequence such that at each stage `(a,b)` is replaced by `(a_1,b_1) = ((a+b)/2,\pm\sqrt{ab})` where the sign is chosen so that `|a_1-b_1| \le |a_1+b_1|`, or equivalently `\Re(b_1/a_1)\ge0`. The resulting limit is maximal among all possible values. 
   * "principal" --- Use the AGM sequence such that at each stage `(a,b)` is replaced by `(a_1,b_1) = ((a+b)/2,\pm\sqrt{ab})` where the sign is chosen so that `\Re(b_1/a_1)\ge0` (the so-called principal branch of the square root). The following examples illustrate that the returned value depends on the algorithm parameter: ```txt
sage: a = CDF(-0.95, -0.65)
sage: b = CDF(0.683, 0.747)
sage: a.agm(b, algorithm="optimal")
-0.371591652352 + 0.319894660207*I
sage: a.agm(b, algorithm="principal")
0.338175462986 - 0.0135326969565*I
sage: a.agm(b, algorithm="pari")
0.080689185076 + 0.239036532686*I
 
```
The same thing for multiprecision real and complex numbers has also been implemented <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7719">#7719</a> and will be in the next release. 

* New decorator `coerce_binop` <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/383">#383</a> (Robert Bradshaw) --- The new decroator `coerce_binop`  can be applied to methods to ensure the arguments have the same parent. For example ```txt
@coerce_binop
def quo_rem(self, other):
    ...
 
```will guarantee that `self` and `other` have the same parent before this method is called. 

## Combinatorics

* Weyl group optimizations <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7754">#7754</a> (Nicolas M. Thiéry) --- Three major improvements that indirectly also improve efficiency of most Weyl group routines: 
   * Faster hash method calling the hash of the underlying matrix (which is set as immutable for that purpose). 
   * New `__eq__()` method. 
   * Action on the weight lattice realization: optimization of the matrix multiplication. Some operations are now up to 34% faster than previously: ```txt
BEFORE

sage: W = WeylGroup(["F", 4])
sage: W.cardinality()
1152
sage: %time list(W);
CPU times: user 10.51 s, sys: 0.05 s, total: 10.56 s
Wall time: 10.56 s
sage: W = WeylGroup(["E", 8])
sage: %time W.long_element();
CPU times: user 1.47 s, sys: 0.00 s, total: 1.47 s
Wall time: 1.47 s


AFTER

sage: W = WeylGroup(["F", 4])
sage: W.cardinality()
1152
sage: %time list(W);
CPU times: user 6.89 s, sys: 0.04 s, total: 6.93 s
Wall time: 6.93 s
sage: W = WeylGroup(["E", 8])
sage: %time W.long_element();
CPU times: user 1.21 s, sys: 0.00 s, total: 1.21 s
Wall time: 1.21 s
 
```
* Implement the Gale Ryser theorem <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7301">#7301</a> (Nathann Cohen, David Joyner) --- The Gale Ryser theorem asserts that if `p_1, p_2` are two partitions of `n` of respective lengths `k_1, k_2`, then there is a binary `k_1 \times k_2` matrix `M` such that `p_1` is the vector of row sums and `p_2` is the vector of column sums of `M`, if and only if `p_2` dominates `p_1`. T.S. Michael helped a great deal with the refereeing process. Here are some examples: ```txt
sage: from sage.combinat.integer_vector import gale_ryser_theorem
sage: p1 = [4, 2, 2]
sage: p2 = [3, 3, 1, 1]
sage: gale_ryser_theorem(p1, p2)
[1 1 1 1]
[1 1 0 0]
[1 1 0 0]
sage: p1 = [4, 2, 2, 0]
sage: p2 = [3, 3, 1, 1, 0, 0]
sage: gale_ryser_theorem(p1, p2)
[1 1 1 1 0 0]
[1 1 0 0 0 0]
[1 1 0 0 0 0]
[0 0 0 0 0 0]
 
```
* Iwahori Hecke algebras on the T basis <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7729">#7729</a> (Daniel Bump, Nicolas M. Thiéry) --- Iwahori <a class="http" href="http://wiki.sagemath.org/HeckeAlgebras">Hecke algebras</a> are deformations of the group algebras of Coxeter groups, such as Weyl groups (finite or affine). Here are some examples: ```txt
sage: R.<q> = PolynomialRing(QQ)
sage: H = IwahoriHeckeAlgebra("A3", q)
sage: [T1, T2, T3] = H.algebra_generators()
sage: T1 * (T2 + T3) * T1
T1*T2*T1 + (q-1)*T3*T1 + q*T3
 
```
* Coxeter groups: more Bruhat and weak order features <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7753">#7753</a> (Nicolas M. Thiéry, Daniel Bump) --- Four new methods implementing the Bruhat order for Coxeter groups. The method `bruhat_le()` for Bruhat comparison: ```txt
sage: W = WeylGroup(["A", 3])
sage: u = W.from_reduced_word([1, 2, 1])
sage: v = W.from_reduced_word([1, 2, 3, 2, 1])
sage: u.bruhat_le(u)
True
sage: u.bruhat_le(v)
True
sage: v.bruhat_le(u)
False
sage: v.bruhat_le(v)
True
sage: s = W.simple_reflections()
sage: s[1].bruhat_le(W.one())
False
 
```The method `weak_le()` for comparison in weak order: ```txt
sage: W = WeylGroup(["A", 3])
sage: u = W.from_reduced_word([1, 2])
sage: v = W.from_reduced_word([1, 2, 3, 2])
sage: u.weak_le(u)
True
sage: u.weak_le(v)
True
sage: v.weak_le(u)
False
sage: v.weak_le(v)
True
 
```The method `bruhat_poset()` returns the Bruhat poset of a Weyl group: ```txt
sage: W = WeylGroup(["A", 3])
sage: P = W.bruhat_poset()
sage: u = W.from_reduced_word([3, 1])
sage: v = W.from_reduced_word([3, 2, 1, 2, 3])
sage: P(u) <= P(v)
True
sage: len(P.interval(P(u), P(v)))
10
sage: P.is_join_semilattice()
False
 
```The method `weak_poset()` returns the left (resp. right) poset for weak order: ```txt
sage: W = WeylGroup(["A", 2])
sage: P = W.weak_poset(); P
Finite poset containing 6 elements
sage: W = WeylGroup(["B", 3])
sage: P = W.weak_poset(side="left")
sage: P.is_join_semilattice(), P.is_meet_semilattice()
(True, True)
 
```
* Interval exchange transformations <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7145">#7145</a> (Vincent Delecroix) --- New module for manipulating interval exchange transformations and linear involutions. Here, we create an interval exchange transformation: ```txt
sage: T = iet.IntervalExchangeTransformation(('a b','b a'),(sqrt(2),1))
sage: print T
Interval exchange transformation of [0, sqrt(2) + 1[ with permutation
a b
b a
 
```It can also be initialized using permutation (group theoretic ones): ```txt
sage: p = Permutation([3,2,1])
sage: T = iet.IntervalExchangeTransformation(p, [1/3,2/3,1])
sage: print T
Interval exchange transformation of [0, 2[ with permutation
1 2 3
3 2 1
 
```For the manipulation of permutations of IET, there are special types provided by this module. All of them can be constructed using the constructor `iet.Permutation`. For the creation of labelled permutations of interval exchange +transformation: ```txt
sage: p1 =  iet.Permutation('a b c', 'c b a')
sage: print p1
a b c
c b a
 
```
* Add S-adic to the word generator <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7543">#7543</a> (Sebastien Labbe) --- New method `s_adic()` returns the s-adic infinite word obtained from a sequence of morphisms applied on a letter. Here we define three morphisms and compute the first nested succesive prefixes of the s-adic word: ```txt
sage: m1 = WordMorphism('e->gh,f->hg')
sage: m2 = WordMorphism('c->ef,d->e')
sage: m3 = WordMorphism('a->cd,b->dc')
sage: words.s_adic([m1],'e')
word: gh
sage: words.s_adic([m1,m2],'ec')
word: ghhg
sage: words.s_adic([m1,m2,m3],'eca')
word: ghhggh
 
```When the given sequence of morphism is finite, one may simply give the last letter, i.e. "a", instead of giving all of them, i.e. "eca": ```txt
sage: words.s_adic([m1,m2,m3],'a')
word: ghhggh
sage: words.s_adic([m1,m2,m3],'b')
word: ghghhg
 
```

## Elliptic curves

* Two-isogeny descent over `QQ` natively using ratpoints <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6583">#6583</a> (Robert Miller) --- New module `sage/schemes/elliptic_curves/descent_two_isogeny.pyx` for descent on elliptic curves over `QQ` with a 2-isogeny. The relevant user interface function is `two_descent_by_two_isogeny()` that takes an elliptic curve `E` with a two-isogeny `phi : E --> E'` and dual isogeny `phi'`, runs a two-isogeny descent on `E`, and returns `n1`, `n2`, `n1'` and `n2'`. Here, `n1` is the number of quartic covers found with a rational point and `n2` is the number which are ELS. Here are some examples illustrating the use of `two_descent_by_two_isogeny()`: ```txt
sage: from sage.schemes.elliptic_curves.descent_two_isogeny import two_descent_by_two_isogeny
sage: E = EllipticCurve("14a")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
0
sage: E = EllipticCurve("65a")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
1
sage: E = EllipticCurve("1088j1")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
2
 
```You could also ask `two_descent_by_two_isogeny()` to be verbose in its computation: ```txt
sage: E = EllipticCurve("14a")
sage: two_descent_by_two_isogeny(E, verbosity=1)
2-isogeny
Results:
2 <= #E(Q)/phi'(E'(Q)) <= 2
2 <= #E'(Q)/phi(E(Q)) <= 2
#Sel^(phi')(E'/Q) = 2
#Sel^(phi)(E/Q) = 2
1 <= #Sha(E'/Q)[phi'] <= 1
1 <= #Sha(E/Q)[phi] <= 1
1 <= #Sha(E/Q)[2], #Sha(E'/Q)[2] <= 1
0 <= rank of E(Q) = rank of E'(Q) <= 0
(2, 2, 2, 2)
 
```
* More functions for elliptic curve isogenies <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6887">#6887</a> (John Cremona, Jenny Cooley) --- Code for constructing elliptic curve isogenies already existed in Sage 4.1.1. The enhancements here include: 
   * For `l=2,3,5,7,13` over any field, find all `l`-isogenies of a given elliptic curve. (These are the `l` for which `X_0(l)` has genus 0). 
   * Similarly for the remaining `l` for which `l`-isogenies exist over `QQ`. 
   * Given an elliptic curve over `QQ`, find the whole isogeny class in a robust manner. 
   * Testing if two curves are isogenous at least over `QQ`. 
The relevant use interface method is `isogenies_prime_degree()` in the class `EllipticCurve_field` of the module `sage/schemes/elliptic_curves/ell_field.py`.  Here are some examples showing `isogenies_prime_degree()` in action. Examples over finite fields: 
```txt
sage: E = EllipticCurve(GF(next_prime(1000000)), [7,8])
sage: E.isogenies_prime_degree()
[Isogeny of degree 2 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 970389*x + 794257 over Finite Field of size 1000003, Isogeny of degree 2 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 29783*x + 206196 over Finite Field of size 1000003, Isogeny of degree 2 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 999960*x + 78 over Finite Field of size 1000003, Isogeny of degree 13 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 878063*x + 845666 over Finite Field of size 1000003, Isogeny of degree 13 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 375648*x + 342776 over Finite Field of size 1000003]
sage: E.isogenies_prime_degree(13)
[Isogeny of degree 13 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 878063*x + 845666 over Finite Field of size 1000003, Isogeny of degree 13 from Elliptic Curve defined by y^2 = x^3 + 7*x + 8 over Finite Field of size 1000003 to Elliptic Curve defined by y^2 = x^3 + 375648*x + 342776 over Finite Field of size 1000003]
 
```
Examples over number fields (other than `QQ`): 
```txt
sage: QQroot2.<e> = NumberField(x^2 - 2)
sage: E = EllipticCurve(QQroot2, [1,0,1,4,-6])
sage: E.isogenies_prime_degree(2)
[Isogeny of degree 2 from Elliptic Curve defined by y^2 + x*y + y = x^3 + 4*x + (-6) over Number Field in e with defining polynomial x^2 - 2 to Elliptic Curve defined by y^2 + x*y + y = x^3 + (-36)*x + (-70) over Number Field in e with defining polynomial x^2 - 2]
sage: E.isogenies_prime_degree(3)
[Isogeny of degree 3 from Elliptic Curve defined by y^2 + x*y + y = x^3 + 4*x + (-6) over Number Field in e with defining polynomial x^2 - 2 to Elliptic Curve defined by y^2 + x*y + y = x^3 + (-171)*x + (-874) over Number Field in e with defining polynomial x^2 - 2, Isogeny of degree 3 from Elliptic Curve defined by y^2 + x*y + y = x^3 + 4*x + (-6) over Number Field in e with defining polynomial x^2 - 2 to Elliptic Curve defined by y^2 + x*y + y = x^3 + (-128/3)*x + 5662/27 over Number Field in e with defining polynomial x^2 - 2]
 
```
For elliptic curves over `QQ` we can find the complete isogeny class (previously this functionality was provided by the eclib library, but now it is native in Sage, which avoids the precision problems of the library version).  The list of isogenous curves is returned, as well as a matrix of the degrees of the isogenies between them: 
```txt
sage: EllipticCurve('14a1').isogeny_class()
([Elliptic Curve defined by y^2 + x*y + y = x^3 + 4*x - 6 over Rational Field, Elliptic Curve defined by y^2 + x*y + y = x^3 - 36*x - 70 over Rational Field, Elliptic Curve defined by y^2 + x*y + y = x^3 - x over Rational Field, Elliptic Curve defined by y^2 + x*y + y = x^3 - 171*x - 874 over Rational Field, Elliptic Curve defined by y^2 + x*y + y = x^3 - 11*x + 12 over Rational Field, Elliptic Curve defined by y^2 + x*y + y = x^3 - 2731*x - 55146 over Rational Field], [ 1  2  3  3  6  6]
[ 2  1  6  6  3  3]
[ 3  6  1  9  2 18]
[ 3  6  9  1 18  2]
[ 6  3  2 18  1  9]
[ 6  3 18  2  9  1])
```

```txt
sage: EllipticCurve(j=-640320^3).isogeny_class()
([Elliptic Curve defined by y^2 + y = x^3 - 2174420*x + 1234136692 over Rational Field, Elliptic Curve defined by y^2 + y = x^3 - 57772164980*x - 5344733777551611 over Rational Field], [  1 163]
[163   1])
```

## Graph theory

* An interactive graph editor <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1321">#1321</a> (Radoslav Kirov, Mitesh Patel) --- Embed an interactive graph editor into the notebook. The following screenshot shows a graph editor for playing around with the complete graph on 5 vertices: ![ReleaseTours/sage-4.3.1/graph-editor.png](ReleaseTours/sage-4.3.1/graph-editor.png) 
* Breadth/depth first searches and basic connectivity for c_graphs <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7724">#7724</a> (Nathann Cohen, Yann Laigle-Chapuy) --- Implementation of the following methods for the class `CGraphBackend` in the module `sage/graphs/base/c_graph.pyx`: 
   * `depth_first_search()` 
   * `breadth_first_search()` 
   * `is_connected()` 
   * `is_strongly_connected()` In some cases, the c_graphs implementation of these methods provides a 2x speed improvement: ```txt
sage: g = graphs.RandomGNP(1000, 0.01)
sage: h = g.copy(implementation="c_graph")
sage: %timeit list(g.depth_first_search(0));
100 loops, best of 3: 8.17 ms per loop
sage: %timeit list(h.depth_first_search(0));
100 loops, best of 3: 3.29 ms per loop
sage:
sage: %timeit list(g.breadth_first_search(0));
100 loops, best of 3: 6.48 ms per loop
sage: %timeit list(h.breadth_first_search(0));
10 loops, best of 3: 34 ms per loop
sage:
sage: %timeit g.is_connected();
100 loops, best of 3: 8.47 ms per loop
sage: %timeit h.is_connected();
100 loops, best of 3: 3.41 ms per loop
sage:
sage: g = g.to_directed()
sage: h = g.copy(implementation="c_graph")
sage: %timeit g.is_strongly_connected();
10 loops, best of 3: 23.5 ms per loop
sage: %timeit h.is_strongly_connected();
10 loops, best of 3: 25 ms per loop
 
```
* Tower of Hanoi graph <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7770">#7770</a> (Rob Beezer) --- The Tower of Hanoi puzzle can be described by a graph whose vertices are possible states of the disks on the pegs, with edges representing legitimate moves of a single disk. The new method `HanoiTowerGraph()` of the class `GraphGenerators` in the module `sage/graphs/graph_generators.py` returns the graph whose vertices are the states of the Tower of Hanoi puzzle, with edges representing legal moves between states. See the documentation of this method for details on interpreting the the possible states of this puzzle. The following screenshot shows all the possible states of an instance of the puzzle with 3 pegs and 3 disks, produced using the following code: ```txt
H = graphs.HanoiTowerGraph(3, 3, positions=False)
show(H, figsize=[8,8])
 
```![ReleaseTours/sage-4.3.1/tower-hanoi-graph.png](ReleaseTours/sage-4.3.1/tower-hanoi-graph.png) 
* Max Vertex/Edge disjoint st-paths <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7292">#7292</a> (Nathann Cohen) --- Given a graph and two vertices `u` and `v`, the maximum flow between `u` and `v` is equal to the maximum number of edge-disjoint paths between the two vertices (there is also an equivalent vertex version of this result). This patch adds functions ``Graph.edge_disjoint_paths`` and ``Graph.vertex_disjoint_paths`` that returns paths, which appear wuite often in graph algorithms. 
* Create Bipartite Graph according to 2 degree sequences <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7590">#7590</a> (Nathann Cohen) --- Thanks to the new implementation of the Gale Ryser theorem <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7301">#7301</a>, Sage can now create, given 2 degree sequences, a bipartite graph such that the degree sequences of the two sets are the ones given in argument, or answer that there exists no such graph. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7634">#7634</a> 

## Linear algebra

* Viewing entries of large matrices <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5174">#5174</a> (John Palmieri) --- For a small matrix such as `2 x 2`, the default is to print the entries of the matrix. This default behaviour is unsuitable for large matrices such as `100 x 100`. The string representation of such large matrices now indicate how to view all their entries. Here are some examples illustrating the new way to view the string representation of matrices. If the matrix is too big, all the elements are not displayed by default: ```txt
sage: A = random_matrix(ZZ, 5)
sage: A
[ 1 -4 -4  1 -1]
[-1  1 13 -1 -1]
[-1  0  0 -1 -1]
[-8  1 -1  1 -4]
[ 1 -5 -1  1  2]
sage: A = random_matrix(ZZ, 100)
sage: A
100 x 100 dense matrix over Integer Ring (type 'print A.str()' to see all of the entries)
 
```If a matrix has several names, refer to the matrix as "obj": ```txt
sage: A = random_matrix(ZZ, 200)
sage: B = A
sage: B
200 x 200 dense matrix over Integer Ring (type 'print obj.str()' to see all of the entries)
 
```If a matrix doesn't have a name, don't print any name referring to the matrix in its string representation: ```txt
sage: A = random_matrix(ZZ, 150)
sage: A.transpose()
150 x 150 dense matrix over Integer Ring
sage: T = A.transpose(); T
150 x 150 dense matrix over Integer Ring (type 'print T.str()' to see all of the entries)
 
```
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7728">#7728</a> (Dag Sverre Seljebotn) 

## Miscellaneous

* Command line access to HTML documentation and docstrings <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6820">#6820</a> (John Palmieri, Mitesh Patel) --- Browse the Sage standard documentation from the command line or within the notebook interface. Use the following commands to browse documents in the standard documentation: 
   * `browse_sage_doc.tutorial()` or its alias `tutorial()` 
   * `browse_sage_doc.reference()`, or its aliases `reference()` and `manual()` 
   * `browse_sage_doc.developer()` or its alias `developer()` 
   * `browse_sage_doc.constructions()` or its alias `constructions()` The following screenshot illustrates viewing the Sage tutorial from the command line interface, activated using the command: ```txt
sage: tutorial()
 
```This command invoked a terminal-based web browser such as Links to view the tutorial. 
![ReleaseTours/sage-4.3.1/browse-doc-cmd.png](ReleaseTours/sage-4.3.1/browse-doc-cmd.png) 

* A mode for automatic names <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7482">#7482</a> (William Stein) --- Provide a mode so that undeclared variables magically spring into existence and object oriented notation is not necessary. The target audience is people wanting to simplify use of Sage for calculus for undergraduate students. This new mode currently only works within the notebook. The following screenshot illustates how to use the mode for automatic names. ![ReleaseTours/sage-4.3.1/automatic-names.png](ReleaseTours/sage-4.3.1/automatic-names.png) 
* Complete rewrite of the load and attach commands: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7514">#7514</a> (William Stein) --- Now the code is uniform between the command line and notebook.  It is also much more flexible and sensible.  E.g., you can use load and attach as normal functions now, e.g. load('filename.sage'), attach('filename.sage').  Type `load?` and `attach?` for more help. 
* Rewrite the @parallel decorate to be vastly more robust, flexible, and usable. <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6967">#6967</a>  (William Stein) --- Now @parallel uses the exact state of the running Sage session, which allows you to do much more robust parallel computations on a multiprocessor computers.  In particular, this works: 

```txt
# File p.sage
def h(s):
    sleep(1)
    return s*s

def f(n1, n2, cores=24):
    @parallel(cores)
    def g(n):
        return h(n)*h(n)
    return [a for _, a in g([n1..n2])]

#------

sage: load p.sage
sage: time f(1,24)
CPU times: user 0.03 s, sys: 0.22 s, total: 0.25 s
Wall time: 2.28 s
[1, 16, 81, 256, 625, 1296, 2401, 4096, 6561, 10000, 14641, 28561, 20736,
 38416, 50625, 65536, 83521, 104976, 130321, 160000, 194481, 234256, 279841, 331776]
```
This rewrite involves replacing the old implementation, which used multiprocessing (or Dsage), by a new one which uses the fork system call (it's about 2 pages of code written using only basic Python). 

* Speed up <a href="/MixedIntegerLinearProgram">MixedIntegerLinearProgram</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7740">#7740</a> (Nathann Cohen) --- this patch replaces the use of ``<a href="/InfinitePolynomialRing">InfinitePolynomialRing</a>`` and ``var`` in ``<a href="/MixedIntegerLinearProgram">MixedIntegerLinearProgram</a>`` by a new symbolic class dedicated to linear functions. This only takes several lines of code and greatly improves the speed. To this is added a new way to define linear constraints using comparators : ``<, <=, ==, >=, >``. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7776">#7776</a> 
* Update the pre-requisites check script to version 0.6 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7781">#7781</a> (David Kirkby). 
* Complete the port to Mac OS X 10.6 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7095">#7095</a> (Craig Citro, John Palmieri, Francis Clarke, William Stein) --- This ticket finishes off the job of porting Sage to Mac OS X 10.6. Previous versions of Sage also built on this platform, but had numerous doctest failures. At least on the machine `bsd.math`, which runs Mac OS X 10.6.2, all doctests pass. 

## Number theory

* S-units, S-class groups, and selmer groups of etale algebras (and number fields) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7703">#7703</a> (Robert Miller) 

## Packages

* Upgrade <a class="http" href="http://polybori.sourceforge.net">PolyBoRi</a> to latest upstream release version 0.6.3.r1647-20091028<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7271">#7271</a> (Martin Albrecht). 
* Upgrade <a class="http" href="http://www.mathe2.uni-bayreuth.de/stoll/programs">ratpoints</a> to latest upstream release version 2.1.3 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7388">#7388</a> (Robert Miller). 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7692">#7692</a>, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7749">#7749</a> (Steven Sivek) 
* Upgrade <a class="http" href="http://maxima.sourceforge.net">Maxima</a> to latest upstream release version 5.20.1 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7745">#7745</a> (Karl-Dieter Crisman). 
* Upgrade <a class="http" href="http://www.valgrind.org">Valgrind</a> to upstream release 3.5.0 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7440">#7440</a> (Tim Dumol). 
* Upgrade <a class="http" href="http://nb.sagemath.org">Sage Notebook</a> to latest upstream release version 0.6 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7785">#7785</a> (Tim Dumol and William Stein). 
* Update <a class="http" href="http://pari.math.u-bordeaux.fr">Pari/GP</a> to version 2.3.3.p6 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7825">#7825</a> (Peter Jeremy). 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7856">#7856</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7067">#7067</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7239">#7239</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7387">#7387</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7761">#7761</a> 
* Small change to eclib build script (eclib ignores SAGE64 if OS is not Darwin) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7814">#7814</a> 
* Update <a class="http" href="http://www.algorithm.uni-bayreuth.de/en/research/SYMMETRICA">Symmetrica</a> to version 2.0.p5 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7032">#7032</a> (David Kirkby). 
* Update <a class="http" href="http://www.flintlib.org">Flint</a> to version 1.5.0.p3 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7815">#7815</a> (David Kirkby). 
* Update <a class="http" href="http://math-atlas.sourceforge.net">ATLAS</a> to version 3.8.3.p10 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7838">#7838</a> (David Kirkby). 
* Update <a class="http" href="http://www.mpir.org">MPIR</a> to version 1.2.2.p0 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7849">#7849</a> (Bill Hart, David Kirkby). 
* Update <a class="http" href="http://www.gap-system.org">GAP</a> to version 4.4.10.p13 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7873">#7873</a> (David Kirkby). 
* Update <a class="http" href="http://www.singular.uni-kl.de">Singular</a> to version 3-1-0-4-20090818.p3 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7898">#7898</a> (David Kirkby). 
* Update <a class="http" href="http://www.shoup.net/ntl">NTL</a> to version 5.4.2.p10 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7899">#7899</a> (David Kirkby). 
* Update <a class="http" href="http://mercurial.selenic.com">Mercurial</a> to version 1.3.1.p1 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7900">#7900</a> (David Kirkby). 
* Update <a class="http" href="http://pari.math.u-bordeaux.fr">Pari/GP</a> to version 2.3.3.p7 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7901">#7901</a> (David Kirkby). 
* Update Fortran spkg to version 20100118 <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7485">#7485</a> (William Stein) --- With this update, Fortran is now a pre-requisite for building Sage on any platform, except for Mac OS X. This spkg update still ships Fortran binaries for Mac OS X. 
* Remove dsage from the standard packages repository <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7975">#7975</a> (William Stein). 