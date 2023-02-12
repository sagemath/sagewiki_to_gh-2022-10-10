

# Sage 4.1 Release Tour

Sage 4.1 was released on July 09, 2009. For the official, comprehensive release note, please refer to <a class="http" href="http://www.sagemath.org/src/announce/sage-4.1.txt">sage-4.1.txt</a>. A nicely formatted version of this release tour can be found <a class="http" href="http://mvngu.wordpress.com/2009/07/12/sage-4-1-released/">here</a>. The following points are some of the foci of this release: 

* Upgrade to the Python 2.6.x series 
* Support for building Singular with GCC 4.4 
* FreeBSD support for the following packages: <a href="/FreeType">FreeType</a>, gd, libgcrypt, libgpg-error, Linbox, NTL, Readline, Tachyon 
* Combinatorics: irreducible matrix representations of symmetric groups; and Yang-Baxter Graphs 
* Cryptography: Mini Advanced Encryption Standard for educational purposes 
* Graph theory: a backend for graph theory using Cython (c_graph); and improve accuracy of graph eigenvalues 
* Linear algebra: a general package for finitely generated, not-necessarily free R-modules; and multiplicative order for matrices over finite fields 
* Miscellaneous: optimized Sudoku solver; a decorator for declaring abstract methods; support Unicode in LaTeX cells (notebook); and optimized integer division 
* Number theory: improved random element generation for number field orders and ideals; support Michael Stoll's ratpoints package; and elliptic exponential 
* Numerical: computing numerical values of constants using mpmath 
* Update/upgrade 19 packages to latest upstream releases 

## Algebraic Geometry

* Construct an elliptic curve from a plane curve of genus one (Lloyd Kilford, John Cremona ) -- New function `EllipticCurve_from_plane_curve()` in the module `sage/schemes/elliptic_curves/constructor.py` to allow the construction of an elliptic curve from a smooth plane cubic with a rational point. Currently, this function uses Magma and it will not work on machines that do not have Magma installed. Assuming you have Magma installed on your computer, we can use the function `EllipticCurve_from_plane_curve()` to first check that the Fermat cubic is isomorphic to the curve with Cremona label "27a1": ```python
#!python numbers=off 
sage: x, y, z = PolynomialRing(QQ, 3, 'xyz').gens() # optional - magma  
sage: C = Curve(x^3 + y^3 + z^3) # optional - magma 
sage: P = C(1, -1, 0) # optional - magma 
sage: E = EllipticCurve_from_plane_curve(C, P) # optional - magma 
sage: E # optional - magma 
Elliptic Curve defined by y^2 + y = x^3 - 7 over Rational Field 
sage: E.label() # optional - magma 
'27a1'
 
```Here is a quartic example: ```python
#!python numbers=off 
sage: u, v, w = PolynomialRing(QQ, 3, 'uvw').gens() # optional - magma  
sage: C = Curve(u^4 + u^2*v^2 - w^4) # optional - magma 
sage: P = C(1, 0, 1) # optional - magma 
sage: E = EllipticCurve_from_plane_curve(C, P) # optional - magma 
sage: E # optional - magma 
Elliptic Curve defined by y^2  = x^3 + 4*x over Rational Field 
sage: E.label() # optional - magma 
'32a1'
 
```

## Basic Arithmetic

* Speed-up integer division (Robert Bradshaw ) -- In some cases, integer division is now up to 31% faster than previously. The following timing statistics were obtained using the machine sage.math: ```python
#!python numbers=off 
# BEFORE

sage: a = next_prime(2**31)
sage: b = Integers(a)(100)
sage: %timeit a % b;
1000000 loops, best of 3: 1.12 µs per loop
sage: %timeit 101 // int(5);
1000000 loops, best of 3: 215 ns per loop
sage: %timeit 100 // int(-3)
1000000 loops, best of 3: 214 ns per loop
sage: a = ZZ.random_element(10**50)
sage: b = ZZ.random_element(10**15)
sage: %timeit a.quo_rem(b)
1000000 loops, best of 3: 454 ns per loop


# AFTER

sage: a = next_prime(2**31)
sage: b = Integers(a)(100)
sage: %timeit a % b;
1000000 loops, best of 3: 1.02 µs per loop
sage: %timeit 101 // int(5);
1000000 loops, best of 3: 201 ns per loop
sage: %timeit 100 // int(-3)
1000000 loops, best of 3: 194 ns per loop
sage: a = ZZ.random_element(10**50)
sage: b = ZZ.random_element(10**15)
sage: %timeit a.quo_rem(b)
1000000 loops, best of 3: 313 ns per loop
 
```

## Combinatorics

* Irreducible matrix representations of symmetric groups (Franco Saliola) -- Support for constructing irreducible representations of the symmetric group. This is based on <a class="http" href="http://www-igm.univ-mlv.fr/~al">Alain Lascoux's</a> article <a class="http" href="http://phalanstere.univ-mlv.fr/~al/ARTICLES/ProcCrac.ps.gz">Young representations of the symmetric group</a>. The following types of representations are supported: 
         * Specht representations -- The matrices have integer entries: ```python
#!python numbers=off 
sage: chi = SymmetricGroupRepresentation([3, 2]); chi
Specht representation of the symmetric group corresponding to [3, 2]
sage: chi([5, 4, 3, 2, 1])

[ 1 -1  0  1  0]
[ 0  0 -1  0  1]
[ 0  0  0 -1  1]
[ 0  1 -1 -1  1]
[ 0  1  0 -1  1]
```
         * Young's seminormal representation -- The matrices have rational entries: ```python
#!python numbers=off 
sage: snorm = SymmetricGroupRepresentation([2, 1], "seminormal"); snorm
Seminormal representation of the symmetric group corresponding to [2, 1]
sage: snorm([1, 3, 2])

[-1/2  3/2]
[ 1/2  1/2]
```
         * Young's orthogonal representation (the matrices are orthogonal) -- These matrices are defined over Sage's `Symbolic Ring`: ```python
#!python numbers=off 
sage: ortho = SymmetricGroupRepresentation([3, 2], "orthogonal"); ortho
Orthogonal representation of the symmetric group corresponding to [3, 2]
sage: ortho([1, 3, 2, 4, 5])

[          1           0           0           0           0]
[          0        -1/2 1/2*sqrt(3)           0           0]
[          0 1/2*sqrt(3)         1/2           0           0]
[          0           0           0        -1/2 1/2*sqrt(3)]
[          0           0           0 1/2*sqrt(3)         1/2]
```
You can also create the `CombinatorialClass` of all irreducible matrix representations of a given symmetric group. Then particular representations can be created by providing partitions. For example: 

         * ```python
#!python numbers=off 
sage: chi = SymmetricGroupRepresentations(5); chi
Specht representations of the symmetric group of order 5! over Integer Ring
sage: chi([5]) # the trivial representation
Specht representation of the symmetric group corresponding to [5]
sage: chi([5])([2, 1, 3, 4, 5])
[1]
sage: chi([1, 1, 1, 1, 1]) # the sign representation
Specht representation of the symmetric group corresponding to [1, 1, 1, 1, 1]
sage: chi([1, 1, 1, 1, 1])([2, 1, 3, 4, 5])
[-1]
sage: chi([3, 2])
Specht representation of the symmetric group corresponding to [3, 2]
sage: chi([3, 2])([5, 4, 3, 2, 1])

[ 1 -1  0  1  0]
[ 0  0 -1  0  1]
[ 0  0  0 -1  1]
[ 0  1 -1 -1  1]
[ 0  1  0 -1  1]
```
See the documentation of `SymmetricGroupRepresentation` and  `SymmetricGroupRepresentations` for more information and examples. 

* Yang-Baxter graphs (Franco Saliola) -- Besides being used for constructing the irreducible matrix representations of the symmetric group, Yang-Baxter graphs can also be used to construct the Cayley graph of a finite group. For example: 
         * ```python
#!python numbers=off 
sage: def left_multiplication_by(g):
....:     return lambda h : h*g
....: 
sage: G = AlternatingGroup(4)
sage: operators = [ left_multiplication_by(gen) for gen in G.gens() ]
sage: Y = YangBaxterGraph(root=G.identity(), operators=operators); Y
Yang-Baxter graph with root vertex ()
sage: Y.plot(edge_labels=False)
```
![ReleaseTours/sage-4.1/cayley-graph.png](ReleaseTours/sage-4.1/cayley-graph.png) 

* Yang-Baxter graphs can also be used to construct the permutahedron: 
         * ```python
#!python numbers=off 
sage: from sage.combinat.yang_baxter_graph import SwapIncreasingOperator
sage: operators = [SwapIncreasingOperator(i) for i in range(3)]
sage: Y = YangBaxterGraph(root=(1,2,3,4), operators=operators); Y
Yang-Baxter graph with root vertex (1, 2, 3, 4)
sage: Y.plot()
```
![ReleaseTours/sage-4.1/permutahedron.png](ReleaseTours/sage-4.1/permutahedron.png) 

* See the documentation of `YangBaxterGraph` for more information and examples. 

## Cryptography

* Mini Advanced Encryption Standard for educational purposes (Minh Van Nguyen) -- New module `sage/crypto/block_cipher/miniaes.py` to support the Mini Advanced Encryption Standard (Mini-AES) to allow students to explore the working of a block cipher. This is a simplified variant of the Advanced Encryption Standard (AES) to be used for cryptography education. Mini-AES is described in the paper: 
   * A. C.-W. Phan. Mini advanced encryption standard (mini-AES): a testbed for cryptanalysis students. Cryptologia, 26(4):283--306, 2002.  We can encrypt a plaintext using Mini-AES as follows: ```python
#!python numbers=off 
sage: from sage.crypto.block_cipher.miniaes import MiniAES
sage: maes = MiniAES()
sage: K = FiniteField(16, "x")
sage: MS = MatrixSpace(K, 2, 2)
sage: P = MS([K("x^3 + x"), K("x^2 + 1"), K("x^2 + x"), K("x^3 + x^2")]); P

[  x^3 + x   x^2 + 1]
[  x^2 + x x^3 + x^2]
sage: key = MS([K("x^3 + x^2"), K("x^3 + x"), K("x^3 + x^2 + x"), K("x^2 + x + 1")]); key

[    x^3 + x^2       x^3 + x]
[x^3 + x^2 + x   x^2 + x + 1]
sage: C = maes.encrypt(P, key); C

[            x       x^2 + x]
[x^3 + x^2 + x       x^3 + x]
 
```Here is the decryption process: ```python
#!python numbers=off 
sage: plaintxt = maes.decrypt(C, key)
sage: plaintxt == P
True
 
```We can also work directly with binary strings: ```python
#!python numbers=off 
sage: from sage.crypto.block_cipher.miniaes import MiniAES
sage: maes = MiniAES()
sage: bin = BinaryStrings()
sage: key = bin.encoding("KE"); key
0100101101000101
sage: P = bin.encoding("Encrypt this secret message!")
sage: C = maes(P, key, algorithm="encrypt")
sage: plaintxt = maes(C, key, algorithm="decrypt")
sage: plaintxt == P
True
 
```
Or work with integers `n` such that `0 <= n <= 15`: 
```python
#!python numbers=off 
sage: from sage.crypto.block_cipher.miniaes import MiniAES
sage: maes = MiniAES()
sage: P = [n for n in xrange(16)]; P
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
sage: key = [2, 3, 11, 0]; key
[2, 3, 11, 0]
sage: P = maes.integer_to_binary(P)
sage: key = maes.integer_to_binary(key)
sage: C = maes(P, key, algorithm="encrypt")
sage: plaintxt = maes(C, key, algorithm="decrypt")
sage: plaintxt == P
True
 
```

## Graph Theory

* Fast compiled graphs `c_graph` (Robert Miller) -- The Python package <a class="http" href="http://networkx.lanl.gov">NetworkX</a> version 0.36 is currently the default graph implementation in Sage. The goal of fast compiled graphs, or `c_graph`, is to be the default implementation of graph theory in Sage. The c_graph implementation is developed using Cython, which allows graph theoretic computations to run at the speed of C. The `c_graph` backend is implemented in the module `sage/graphs/base/c_graph.pyx`. This module is called by higher-level frontends in `sage/graphs/`. Where support is provided for using `c_graph`, graph theoretic computations is usually more efficient than using NetworkX. For example, the following timing statistics were obtained using the machine sage.math: ```python
#!python numbers=off 
# NetworkX 0.36

sage: time G = Graph(1000000, implementation="networkx")
CPU times: user 8.74 s, sys: 0.27 s, total: 9.01 s
Wall time: 9.08 s


# c_graph

sage: time G = Graph(1000000, implementation="c_graph")
CPU times: user 0.01 s, sys: 0.14 s, total: 0.15 s
Wall time: 0.19 s
 
```Here, we see an efficiency gain of up to 47x using `c_graph`. 
* Improve accuracy of graph eigenvalues (Rob Beezer) -- New routines to compute eigenvalues and eigenvectors of integer matrices more precisely than before. Rather than converting adjacency matrices of graphs to computations over the real or complex fields, adjacency matrices are retained as matrices over the integers, yielding more accurate and informative results for eigenvalues, eigenvectors, and eigenspaces. Here is a comparison involving the computation of graph spectrum: ```python
#!python numbers=off 
# BEFORE

sage: g = graphs.CycleGraph(8); g
Cycle graph: Graph on 8 vertices
sage: g.spectrum()

[-2.0,
 -1.41421356237,
 -1.41421356237,
 4.02475820828e-18,
 6.70487495185e-17,
 1.41421356237,
 1.41421356237,
 2.0]


# AFTER

sage: g = graphs.CycleGraph(8); g
Cycle graph: Graph on 8 vertices
sage: g.spectrum()
[2, 1.414213562373095?, 1.414213562373095?, 0, 0, -1.414213562373095?, -1.414213562373095?, -2]
 
```Integer eigenvalues are now exact, irrational eigenvalues are more precise than previously, making multiplicities easier to determine. Similar comments apply to eigenvectors: ```python
#!python numbers=off 
sage: g.eigenvectors()

[(2, [
(1, 1, 1, 1, 1, 1, 1, 1)
], 1),
 (-2, [
(1, -1, 1, -1, 1, -1, 1, -1)
], 1),
 (0, [
(1, 0, -1, 0, 1, 0, -1, 0),
(0, 1, 0, -1, 0, 1, 0, -1)
], 2),
 (-1.414213562373095?,
  [(1, 0, -1, 1.414213562373095?, -1, 0, 1, -1.414213562373095?),
   (0, 1, -1.414213562373095?, 1, 0, -1, 1.414213562373095?, -1)],
  2),
 (1.414213562373095?,
  [(1, 0, -1, -1.414213562373095?, -1, 0, 1, 1.414213562373095?),
   (0, 1, 1.414213562373095?, 1, 0, -1, -1.414213562373095?, -1)],
  2)]
 
```Eigenspaces are exact, in that they can be expressed as vector spaces over number fields.  When the defining polynomial has several roots, the eigenspaces are not repeated. Previously, eigenspaces were "fractured" owing to slight computational differences in identical eigenvalues. In concert with `eigenvectors()`, this command illuminates the structure of a graph's eigenspaces more than purely numerical results. ```python
#!python numbers=off 
sage: g.eigenspaces()

[
(2, Vector space of degree 8 and dimension 1 over Rational Field
User basis matrix:
[1 1 1 1 1 1 1 1]),
(-2, Vector space of degree 8 and dimension 1 over Rational Field
User basis matrix:
[ 1 -1  1 -1  1 -1  1 -1]),
(0, Vector space of degree 8 and dimension 2 over Rational Field
User basis matrix:
[ 1  0 -1  0  1  0 -1  0]
[ 0  1  0 -1  0  1  0 -1]),
(a3, Vector space of degree 8 and dimension 2 over Number Field in a3 with defining polynomial x^2 - 2
User basis matrix:
[  1   0  -1 -a3  -1   0   1  a3]
[  0   1  a3   1   0  -1 -a3  -1])
]
 
```Complex eigenvalues (of digraphs) previously were missing their imaginary parts. This issue has been fixed as part of the improvement in calculating graph eigenvalues. 

## Graphics

* Plot histogram improvement (David Joyner) -- Some improvements to the `plot_histogram()` function of the class `IndexedSequence` in `sage/gsl/dft.py`. The default colour of the histogram is blue: ```python
#!python numbers=off 
sage: J = range(3)
sage: A = [ZZ(i^2)+1 for i in J]
sage: s = IndexedSequence(A, J)
sage: s.plot_histogram()
 
```
![ReleaseTours/sage-4.1/histogram-blue.png](ReleaseTours/sage-4.1/histogram-blue.png) 

* You can now change the colour of the histogram with the argument `clr`: ```python
#!python numbers=off 
sage: s.plot_histogram(clr=(1,0,0))
 
```
![ReleaseTours/sage-4.1/histogram-red.png](ReleaseTours/sage-4.1/histogram-red.png) 

* and even use the argument `eps` to change the width of the spacing between the bars: ```python
#!python numbers=off 
sage: s.plot_histogram(clr=(1,0,1), eps=0.3)
 
```
![ReleaseTours/sage-4.1/histogram-pink.png](ReleaseTours/sage-4.1/histogram-pink.png) 


## Linear Algebra

* Multiplicative order for matrices over finite fields (Yann Laigle-Chapuy) -- New method `multiplicative_order()` in the class `Matrix` of `sage/matrix/matrix0.pyx` for computing the multiplicative order of a matrix. Here are some examples on using the new method `multiplicative_order()`: ```python
#!python numbers=off 
sage: A = matrix(GF(59), 3, [10,56,39,53,56,33,58,24,55])
sage: A.multiplicative_order()
580
sage: (A^580).is_one()
True
sage: B = matrix(GF(10007^3, 'b'), 0)
sage: B.multiplicative_order()
1
sage: E = MatrixSpace(GF(11^2, 'e'), 5).random_element()
sage: (E^E.multiplicative_order()).is_one()
True
 
```
* A general package for finitely generated not-necessarily free R-modules (William Stein, David Loeffler ) -- This consists of the following new Sage modules: 
   * `sage/modules/fg_pid/fgp_element.py` -- Elements of finitely generated modules over a principal ideal domain. Here are some examples: ```python
#!python numbers=off 
sage: V = span([[1/2,1,1], [3/2,2,1], [0,0,1]], ZZ)
sage: W = V.span([2*V.0+4*V.1, 9*V.0+12*V.1, 4*V.2])
sage: Q = V/W
sage: x = Q(V.0-V.1); x
(0, 3)
sage: type(x)
<class 'sage.modules.fg_pid.fgp_element.FGP_Element'>
sage: x is Q(x)
True
sage: x.parent() is Q
True
sage: Q
Finitely generated module V/W over Integer Ring with invariants (4, 12)
sage: Q.0.additive_order()
4
sage: Q.1.additive_order()
12
sage: (Q.0+Q.1).additive_order()
12
 
```
   * `sage/modules/fg_pid/fgp_module.py` -- Finitely generated modules over a principal ideal domain. Currently, only the principal ideal domain `ZZ` of integers is supported. Here are some examples: ```python
#!python numbers=off 
sage: V = span([[1/2,1,1], [3/2,2,1], [0,0,1]], ZZ)
sage: W = V.span([2*V.0+4*V.1, 9*V.0+12*V.1, 4*V.2])
sage: import sage.modules.fg_pid.fgp_module
sage: Q = sage.modules.fg_pid.fgp_module.FGP_Module(V, W)
sage: type(Q)
<class 'sage.modules.fg_pid.fgp_module.FGP_Module_class'>
sage: Q is sage.modules.fg_pid.fgp_module.FGP_Module(V, W, check=False)
True
sage: X = ZZ**2 / span([[3,0],[0,2]], ZZ)
sage: X.linear_combination_of_smith_form_gens([1])
(1)
sage: Q
Finitely generated module V/W over Integer Ring with invariants (4, 12)
sage: Q.gens()
((1, 0), (0, 1))
sage: Q.coordinate_vector(-Q.0)
(-1, 0)
sage: Q.coordinate_vector(-Q.0, reduce=True)
(3, 0)
sage: Q.cardinality()
48
 
```
   * `sage/modules/fg_pid/fgp_morphism.py` -- Morphisms between finitely generated modules over a principal ideal domain. Here are some examples: ```python
#!python numbers=off 
sage: V = span([[1/2,1,1],[3/2,2,1],[0,0,1]],ZZ)
sage: W = V.span([2*V.0+4*V.1, 9*V.0+12*V.1, 4*V.2])
sage: Q = V/W; Q
Finitely generated module V/W over Integer Ring with invariants (4, 12)
sage: phi = Q.hom([Q.0+3*Q.1, -Q.1]); phi
Morphism from module over Integer Ring with invariants (4, 12) to module with invariants (4, 12) that sends the generators to [(1, 3), (0, 11)]
sage: phi(Q.0) == Q.0 + 3*Q.1
True
sage: phi(Q.1) == -Q.1
True
sage: Q.hom([0, Q.1]).kernel()
Finitely generated module V/W over Integer Ring with invariants (4)
sage: A = Q.hom([Q.0, 0]).kernel(); A
Finitely generated module V/W over Integer Ring with invariants (12)
sage: Q.1 in A
True
sage: phi = Q.hom([Q.0-3*Q.1, Q.0+Q.1])
sage: A = phi.kernel(); A
Finitely generated module V/W over Integer Ring with invariants (4)
sage: phi(A)
Finitely generated module V/W over Integer Ring with invariants ()
 
```

## Miscellaneous

* An optimized Sudoku solver (Rob Beezer, Tom Boothby) -- Support two algorithms for efficiently solving a Sudoku puzzle: a backtrack algorithm and the DLX algorithm. Generally, the DLX algorithm is very fast and very consistent. The backtrack algorithm is very variable in its performance, on some occasions markedly faster than DLX but usually slower by a similar factor, with the potential to be orders of magnitude slower. The following code compares the performance between the Sudoku solver in Sage 4.0.2 and that in this release. We also compare the performance between the backtrack algorithm and the DLX algorithm. All timing statistics were obtained using the machine sage.math: ```python
#!python numbers=off 
# BEFORE

sage: A = matrix(ZZ,9,[5,0,0, 0,8,0, 0,4,9, 0,0,0, 5,0,0, 0,3,0, 0,6,7, \
....: 3,0,0, 0,0,1,  1,5,0, 0,0,0, 0,0,0,  0,0,0, 2,0,8, 0,0,0, \
....: 0,0,0, 0,0,0, 0,1,8, \
....: 7,0,0, 0,0,4, 1,5,0, 0,3,0, 0,0,2, 0,0,0,  4,9,0, 0,5,0, 0,0,3])
sage: %timeit sudoku(A);
10 loops, best of 3: 43.5 ms per loop
sage: from sage.games.sudoku import solve_recursive
sage: B = matrix(ZZ, 9, 9, [ [0,0,0,0,1,0,9,0,0], [8,0,0,4,0,0,0,0,0], \
....: [2,0,0,0,0,0,0,0,0], [0,7,0,0,3,0,0,0,0], [0,0,0,0,0,0,2,0,4], \
....: [0,0,0,0,0,0,0,5,8], [0,6,0,0,0,0,1,3,0], [7,0,0,2,0,0,0,0,0], \
....: [0,0,0,8,0,0,0,0,0] ])
sage: %timeit solve_recursive(B, 8, 5);
1000 loops, best of 3: 325 µs per loop


# AFTER

sage: h = Sudoku('8..6..9.5.............2.31...7318.6.24.....73...........279.1..5...8..36..3......')
sage: %timeit h.solve(algorithm='backtrack').next();
1000 loops, best of 3: 1.12 ms per loop
sage: %timeit h.solve(algorithm='dlx').next();
1000 loops, best of 3: 1.58 ms per loop
sage: # These are the first 10 puzzles in a list of "Top 95" puzzles.
sage: top =['4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......',\
....: '52...6.........7.13...........4..8..6......5...........418.........3..2...87.....',\
....: '6.....8.3.4.7.................5.4.7.3..2.....1.6.......2.....5.....8.6......1....',\
....: '48.3............71.2.......7.5....6....2..8.............1.76...3.....4......5....',\
....: '....14....3....2...7..........9...3.6.1.............8.2.....1.4....5.6.....7.8...',\
....: '......52..8.4......3...9...5.1...6..2..7........3.....6...1..........7.4.......3.',\
....: '6.2.5.........3.4..........43...8....1....2........7..5..27...........81...6.....',\
....: '.524.........7.1..............8.2...3.....6...9.5.....1.6.3...........897........',\
....: '6.2.5.........4.3..........43...8....1....2........7..5..27...........81...6.....',\
....: '.923.........8.1...........1.7.4...........658.........6.5.2...4.....7.....9.....']
sage: p = [Sudoku(top[i]) for i in xrange(10)]
sage: for i in xrange(10):
....:     %timeit p[i].solve(algorithm='dlx').next();
....:     %timeit p[i].solve(algorithm='backtrack').next();
....:     
100 loops, best of 3: 2.26 ms per loop
10 loops, best of 3: 223 ms per loop
100 loops, best of 3: 2.6 ms per loop
10 loops, best of 3: 21.3 ms per loop
100 loops, best of 3: 2.38 ms per loop
10 loops, best of 3: 83.5 ms per loop
1000 loops, best of 3: 1.76 ms per loop
10 loops, best of 3: 43.5 ms per loop
1000 loops, best of 3: 1.86 ms per loop
10 loops, best of 3: 316 ms per loop
1000 loops, best of 3: 1.65 ms per loop
10 loops, best of 3: 145 ms per loop
100 loops, best of 3: 1.84 ms per loop
10 loops, best of 3: 547 ms per loop
1000 loops, best of 3: 1.77 ms per loop
10 loops, best of 3: 255 ms per loop
100 loops, best of 3: 2.08 ms per loop
10 loops, best of 3: 445 ms per loop
1000 loops, best of 3: 1.67 ms per loop
10 loops, best of 3: 266 ms per loop
 
```
* A decorator for declaring abstract methods (Nicolas Thiéry) -- Support a decorator that can be used to declare a method that should be implemented by derived classes. This declaration should typically include documentation for the specification for this method. The purpose of the decorator is to enforce a consistent and visual syntax for such declarations. The decorator is also used by the Sage categories framework for automated tests. As an example, here we create a class with an abstract method: ```python
#!python numbers=off 
sage: class A(object):
....:     @abstract_method
....:     def my_method(self):
....:         """
....:         The method :meth:`my_method` computes my_method
....:         """
....:         pass
....:     
sage: A.my_method
<abstract method my_method at 0x7f53414a7410>
 
```The current policy is that a `NotImplementedError` is raised  when accessing the method through an instance, even before the method is called: ```python
#!python numbers=off 
sage: x = A()
sage: x.my_method
Traceback (most recent call last):
...
NotImplementedError: <abstract method my_method at 0x7f53414a7410>
 
```It is also possible to mark abstract methods as optional: ```python
#!python numbers=off 
sage: class A(object):
....:     @abstract_method(optional=True)
....:     def my_method(self):
....:         """
....:         The method :meth:`my_method` computes my_method
....:         """
....:         pass
....:     
sage: A.my_method
<optional abstract method my_method at 0x3b551b8>
sage: x = A()
sage: x.my_method
NotImplemented
 
```

## Notebook

* Unicode in `%latex` cells (Peter Mora) -- One can now enter Unicode characters directly in Notebook cells. Here is a screenshot illustrating this: 
![ReleaseTours/sage-4.1/unicode-latex.png](ReleaseTours/sage-4.1/unicode-latex.png) 

* Allow `\[` and `\]` to delimit math in `%html` blocks (John Palmieri) -- One can now enter ```python
#!python numbers=off 
%html
test
\[ x^2 \]
 
```and the expression `x^2` is typeset in math mode. 

## Number Theory

* Improved `random_element()` method for number field orders and ideals (John Cremona) -- The new method `random_element()` of the class `NumberFieldIdeal` in `sage/rings/number_field/number_field_ideal.py` returns a random element of a fractional ideal, computed as a random `ZZ`-linear combination of the basis. A similar method has also been implemented for the class `Order` in `sage/rings/number_field/order.py`}. Here are some examples on using this new method: ```python
#!python numbers=off 
sage: K.<a> = NumberField(x^3 + 2)
sage: I = K.ideal(1 - a)
sage: I.random_element()
2*a^2 + a + 3
sage: I.random_element(distribution="uniform")
-a^2 + 2*a + 2
sage: I.random_element(-30, 30)
-30*a^2 + 17*a - 11
sage: I.random_element(-30,30).parent() is K
True
sage: K.<a> = NumberField(x^3 + 2)
sage: OK = K.ring_of_integers()
sage: OK.random_element()
2*a^2 + 7*a + 2
sage: OK.random_element(distribution="uniform")
-2*a^2 + a - 1
sage: K.order(a).random_element()
-2*a^2 - a - 5
 
```
* Support for Michael Stoll's ratpoints package (Robert Miller, Michael Stoll) -- Stoll's ratpoints package is a program for finding points of bounded height on curves of the form `y^2 = a_n x^n + ... + a_1 x + a_0`. The library code is contained in the Cython module `sage/libs/ratpoints.pyx`. Here are some examples for working with ratpoints: ```python
#!python numbers=off 
sage: from sage.libs.ratpoints import ratpoints
sage: for x,y,z in ratpoints([1..6], 200):
....:     print -1*y^2 + 1*z^6 + 2*x*z^5 + 3*x^2*z^4 + 4*x^3*z^3 + 5*x^4*z^2 + 6*x^5*z
....:     
0
0
0
0
0
0
0
sage: for x,y,z in ratpoints([1..5], 200):
....:     print -1*y^2 + 1*z^4 + 2*x*z^3 + 3*x^2*z^2 + 4*x^3*z + 5*x^4
....:     
0
0
0
0
0
0
0
0
 
```
* Elliptic exponential (John Cremona) -- New method `elliptic_exponential()` in the class `EllipticCurve_rational_field` of `sage/schemes/elliptic_curves/ell_rational_field.py` for computing the elliptic exponential of a complex number with respect to an elliptic curve. A similar method is also defined for the class `PeriodLattice_ell` in `sage/schemes/elliptic_curves/period_lattice.py`. Here are some examples: ```python
#!python numbers=off 
sage: E = EllipticCurve([1,1,1,-8,6])
sage: P = E([0,2])
sage: z = P.elliptic_logarithm()
sage: E.elliptic_exponential(z)
(-1.6171648557030742010940435588e-29 : 2.0000000000000000000000000000 : 1.0000000000000000000000000000)
sage: z = E([0,2]).elliptic_logarithm(precision=200)
sage: E.elliptic_exponential(z)
(-1.6490990486332025523931769742517329237564168247111092902718e-59 : 2.0000000000000000000000000000000000000000000000000000000000 : 1.0000000000000000000000000000000000000000000000000000000000)
 
```And here are some torsion examples: ```python
#!python numbers=off 
sage: E = EllipticCurve('389a')
sage: w1,w2 = E.period_lattice().basis()
sage: E.two_division_polynomial().roots(CC,multiplicities=False)
[-2.04030220028546, 0.135409240221753, 0.904892960063711]
sage: [E.elliptic_exponential((a*w1+b*w2)/2)[0] for a,b in [(0,1),(1,1),(1,0)]]
[-2.04030220028546, 0.135409240221753, 0.904892960063711]
sage: E.division_polynomial(3).roots(CC,multiplicities=False)

[-2.88288879135334,
 1.39292799513138,
 0.0783137314443164 - 0.492840991709879*I,
 0.0783137314443164 + 0.492840991709879*I]
sage: [E.elliptic_exponential((a*w1+b*w2)/3)[0] for a,b in [(0,1),(1,0),(1,1),(2,1)]]

[-2.88288879135335,
 1.39292799513138,
 0.0783137314443165 - 0.492840991709879*I,
 0.0783137314443168 + 0.492840991709879*I]
 
```

## Numerical

* Use mpmath to compute constants (Fredrik Johannson, Mike Hansen) -- Previously the functions `khinchin()`, `mertens()` and `twinprime()` in `sage/symbolic/constants.py` were `LimitedPrecisionConstant`. Using mpmath, these functions now support arbitrary precision for the corresponding constants. There is now also support for the Glaisher-Kinkelin constant `A = \exp(\frac{1}{12}-\zeta'(-1))` using mpmath. Here are some examples on using these functions with the mpmath backend. The Khinchin constant: ```python
#!python numbers=off 
sage: float(khinchin)
2.6854520010653062
sage: khinchin.n(digits=60)
2.68545200106530644530971483548179569382038229399446295305115
sage: khinchin._mpfr_(RealField(100))
2.6854520010653064453097148355
sage: RealField(100)(khinchin)
2.6854520010653064453097148355
 
```The Twin Primes constant: ```python
#!python numbers=off 
sage: float(twinprime)
0.66016181584686962
sage: twinprime.n(digits=60)
0.660161815846869573927812110014555778432623360284733413319448
sage: twinprime._mpfr_(RealField(100))
0.66016181584686957392781211001
sage: RealField(100)(twinprime)
0.66016181584686957392781211001
 
```The Mertens constant: ```python
#!python numbers=off 
sage: float(mertens)
0.26149721284764277
sage: mertens.n(digits=60)
0.261497212847642783755426838608695859051566648261199206192064
sage: mertens._mpfr_(RealField(100))
0.26149721284764278375542683861
sage: RealField(100)(mertens)
0.26149721284764278375542683861
 
```The Glaisher-Kinkelin constant: ```python
#!python numbers=off 
sage: float(glaisher)
1.2824271291006226
sage: glaisher.n(digits=60)
1.28242712910062263687534256886979172776768892732500119206374
sage: a = glaisher + 2
sage: parent(a)
Symbolic Ring
sage: glaisher._mpfr_(RealField(100))
1.2824271291006226368753425689
sage: RealField(100)(glaisher)
1.2824271291006226368753425689
 
```

## Packages

* New package <a class="http" href="http://code.google.com/p/mpmath/">mpmath</a> version 0.12 for multiprecision floating-point arithmetic (Fredrik Johannson, Mike Hansen) -- The Python package mpmath is now a standard package of Sage. Functions in mpmath can be called from Sage using the library under `sage/libs/mpmath`, with automatic data conversion between Sage and mpmath. 
* New package <a class="http" href="http://www.mathe2.uni-bayreuth.de/stoll/programs/">Ratpoints</a> version 2.1.2 for computing rational points on hyperelliptic curves (Robert Miller, Michael Stoll) -- The C package Ratpoints is now a standard spkg. The corresponding library file is `sage/libs/ratpoints.pyx`. 
* Upgrade <a class="http" href="http://www.singular.uni-kl.de">Singular</a> to version singular-3-1-0-2-20090620 with support for compiling with GCC 4.4 (Andrzej Giniewicz, Martin Albrecht, Craig Citro). 
* Upgrade Sage's <a class="http" href="http://www.python.org">Python</a> spkg to the 2.6.x series (Mike Hansen). 
* Upgrade <a class="http" href="http://twistedmatrix.com">Twisted</a> to version 8.2.0 latest upstream release (Mike Hansen). 
* Upgrade <a class="http" href="http://www.scons.org">SCons</a> to version 1.2.0 latest upstream release (Mike Hansen). 
* Update the <a class="http" href="http://pynac.sagemath.org">Pynac</a> spkg to version pynac-0.1.8.p1.spkg (Mike Hansen). 
* Update the <a class="http" href="http://ipython.scipy.org">IPython</a> spkg to version ipython-0.9.1.p0.spkg (Mike Hansen). 
* Update the <a class="http" href="http://math-atlas.sourceforge.net/">ATLAS</a> spkg to version atlas-3.8.3.p5.spkg (David Kirkby). 
* Update the <a class="http" href="http://abel.ee.ucla.edu/cvxopt/">CVXOPT</a> spkg to version cvxopt-0.9.p8.spkg (Gonzalo Tornaria). 
* Update the <a class="http" href="http://www.freetype.org">FreeType</a> spkg to version freetype-2.3.5.p1.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://www.libgd.org">GD</a> spkg to version gd-2.0.35.p2.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://www.gnupg.org">libgcrypt</a> spkg to version libgcrypt-1.4.3.p1.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://www.gnupg.org">libgpg_error</a> spkg to version libgpg_error-1.6.p1.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://www.linbox.org">linbox</a> spkg to version linbox-1.1.6.p0.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://www.shoup.net/ntl/">NTL</a> spkg to version ntl-5.4.2.p8.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://tiswww.case.edu/php/chet/readline/rltop.html">Readline</a> spkg to version readline-5.2.p7.spkg (Peter Jeremy). 
* Update the <a class="http" href="http://jedi.ks.uiuc.edu/~johns/raytracer/">Tachyon</a> spkg to version tachyon-0.98beta (Peter Jeremy). 
* Update the <a class="http" href="http://www.math.ucf.edu/~reid/Rubik/optimal_solver.html">Rubik</a> spkg to version rubiks-20070912.p9.spkg (William Stein) -- This adds support for compiling Rubiks in parallel. 
* Update the <a class="http" href="http://pypi.python.org/pypi/python-gnutls">python-gnutls</a> spkg to version python_gnutls-1.1.4.p5.spkg (William Stein). 
* Update the <a class="http" href="http://math-atlas.sourceforge.net">ATLAS</a> spkg to version atlas-3.8.3.p5.spkg (David Kirkby). 

## Symbolics

* Symbolic `arctan2` function (Karl-Dieter Crisman) -- New symbolic trigonometric function `arctan2` in `sage/functions/trig.py`. This symbolic function returns the arctangent (measured in radians) of `y/x`. Unlike `arctan(y/x)`, the signs of both `x` and `y` are considered. For example, note the difference between `arctan2()` and `arctan()`: ```python
#!python numbers=off 
sage: arctan2(1,-1)
3/4*pi
sage: arctan(1/-1)
-1/4*pi
 
```The new symbolic function `arctan2()` is also consistent with the implementations in Python and Maxima: ```python
#!python numbers=off 
sage: arctan2(1,-1)  # the symbolic arctan2
3/4*pi
sage: maxima.atan2(1,-1)  # Maxima implementation
3*%pi/4
sage: math.atan2(1,-1)  # Python implementation
2.3561944901923448
 
```We can also compute an approximation: ```python
#!python numbers=off 
sage: arctan2(-.5,1).n(100)
-0.46364760900080611621425623146
 
```