

# Sage 2.11 Release Tour

Sage 2.11 was released on March 30, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see <a class="http" href="http://www.sagemath.org/mirror/src/announce/sage-2.11.txt">sage-2.11.txt</a>. 


## ATLAS

Michael Abshoff and Burcin Erocal upgraded ATLAS to the 3.8.1 release. In addition tuning info for 32 bit Prescott CPUs as well as  Powerbook G4s under Linux was added. 


## zn_poly

David Harvey's zn_poly library is now a standard package for Sage. zn_poly is a new C library for polynomial arithmetic in $(Z/nZ)[x]$ where $3 \le n \le ULONG\_MAX$ (i.e. any machine-word-sized modulus). The main benefit is speed. Three examples on sage.math, from my   current development code (this code is **not** yet in the spkg): 

* Multiplying length $200$ polynomials over $Z/nZ$ where n has 10 bits: 
      * NTL (zz_pX): 113 µs 
      * Magma: 44 µs 
      * **zn_poly: 13 µs** 
* Multiplying length $10^6$ polynomials over $Z/nZ$ where n has 40 bits and is odd: 
      * NTL (zz_pX): 9.1s 
      * Magma: 8.3s 
      * **zn_poly: 2.06s** 
* Reciprocal of a length $10^6$ power series over $Z/nZ$ where n has 40 bits and is odd: 
      * NTL (zz_pX): 25.4s 
      * Magma: ludicrously slow, maybe I'm doing something wrong 
      * **zn_poly: 3.62s** 
The library is used so far only to compute the zeta function for hyperelliptic curves. 


## small roots method for polynomials mod N (N composite)

Coppersmith's method for finding small roots of univariate polynomials modulo $N$ where $N$ is composite was implemented. An application of this method is to consider RSA. We are using 512-bit RSA with public exponent $e=3$ to encrypt a 56-bit DES key. Because it would be easy to attack this setting if no padding was used we pad the key $K$ with 1s to get a large number. 


```python
#!python 
sage: Nbits, Kbits = 512, 56
sage: e = 3
```
We choose two primes of size 256-bit each. 


```python
#!python 
sage: p = 2^256 + 2^8 + 2^5 + 2^3 + 1
sage: q = 2^256 + 2^8 + 2^5 + 2^3 + 2^2 + 1
sage: N = p*q
sage: ZmodN = Zmod( N )
```
We choose a random key 


```python
#!python 
sage: K = ZZ.random_element(0, 2^Kbits)
```
and pad it with $512-56=456$ $1$s 


```python
#!python 
sage: Kdigits = K.digits()
sage: M = [0]*Kbits + [1]*(Nbits-Kbits)
sage: for i in range(len(Kdigits)): M[i] = Kdigits[i]
sage: M = ZZ(M, 2)
```
Now we encrypt the resulting message: 


```python
#!python 
sage: C = ZmodN(M)^e
```
To recover $K$ we consider the following polynomial modulo $N$: 


```python
#!python 
sage: P.<x> = PolynomialRing(ZmodN)
sage: f = (2^Nbits - 2^Kbits + x)^e - C
```
and recover its small roots: 


```python
#!python 
sage: Kbar = f.small_roots()[0]
sage: K == Kbar
True
```

## Generic Multivariate Polynomial Arithmetic

Joel Mohler improved the efficiency of the generic multivariate polynomial arithmetic in Sage. Before his patch was applied: 
```python
#!python 
sage: R.<x,y,z,a,b>=ZZ[]
sage: f=prod([2*g^2-4*g+8 for g in R.gens()])
sage: %time _=f*f
CPU times: user 2.23 s, sys: 0.00 s, total: 2.23 s
Wall time: 2.24
```
and after: 


```python
#!python 
sage: R.<x,y,z,a,b>=ZZ[]
sage: f=prod([2*g^2-4*g+8 for g in R.gens()])
sage: %time _=f*f
CPU times: user 0.22 s, sys: 0.00 s, total: 0.22 s
Wall time: 0.22
```

## k-Schur Functions and Non-symmetric Macdonald Polynomials

$k$-Schur functions $s_\lambda^{(k)}$ are a relatively new family of symmetric functions which play a role in $\mathbb{Z}[h_1, \ldots, h_k]$ as the Schur functions $s_\lambda$ do in $\Lambda$.  The $k$-Schur functions, amongst other things, provide a natural basis for the quantum cohomology of the Grassmannian.  The $k$-Schur functions can be used like any other symmetric functions and are created with kSchurFunctions. 
```python
#!python 
sage: ks3 = kSchurFunctions(QQ,3); ks3
k-Schur Functions at level 3 over Univariate Polynomial Ring in t over Rational Field
sage: s(ks3([3,2,1]))
s[3, 2, 1] + t*s[4, 1, 1] + t*s[4, 2] + t^2*s[5, 1]
```
Non-symmetric Macdonald polynomials in type A can now be accessed in Sage.  The polynomials are computed from the main theorem in "A Combinatorial Formula for the Non-symmetric Macdonald Polynomials" by Haglund, Haiman, and Loehr. ( <a href="http://arxiv.org/abs/math.CO/0601693">http://arxiv.org/abs/math.CO/0601693</a> ) 
```python
#!python 
sage: from sage.combinat.sf.ns_macdonald import E
sage: E([0,1,0])
((-t + 1)/(-q*t^2 + 1))*x0 + x1
sage: E([1,1,0])
x0*x1
```

## Improved capabilities for solving matrix equations

William Stein implemented code so that one can now solve matrix equations $AX = B$ and $XA=B$ whenever a solution exists.  In particular, solving linear equations now works even if $A$ is singular or nonsquare.  
```txt
sage: A = matrix(QQ,2,3, [1,2,3,2,4,6]); v = vector([-1/2,-1])
sage: x = A \ v; x
(-1/2, 0, 0)
sage: A*x == v
True
```

## Generators for congruence subgroups

Robert Miller implemented an algorithm for very quickly  computing generators for congruence subgroups $\Gamma_0(N)$, $\Gamma_1(N)$, and $\Gamma_H(N)$.  
```txt
sage: Gamma0(11).generators()
[[1 1]
[0 1],
 [-1  0]
[ 0 -1],
...
 [10 -1]
[11 -1],
 [-10   1]
[-11   1]]
sage: time G = Gamma0(389).generators()
CPU times: user 0.03 s, sys: 0.01 s, total: 0.04 s
Wall time: 0.04
sage: time G = Gamma0(997).generators()
CPU times: user 0.14 s, sys: 0.00 s, total: 0.14 s
Wall time: 0.14
sage: time G = Gamma0(2008).generators()
CPU times: user 0.82 s, sys: 0.00 s, total: 0.82 s
Wall time: 0.82
sage: len(G)
3051  
```

## gfan-0.3 upgrade, improved interface


```txt
@interact
def gfan_browse(p1 = input_box('x^3+y^2',type = str, label='polynomial 1: '), p2 = input_box('y^3+z^2',type = str, label='polynomial 2: '), p3 = input_box('z^3+x^2',type = str, label='polynomial 3: ')):
    R.<x,y,z> = PolynomialRing(QQ,3)
    i1 = ideal(R(p1),R(p2),R(p3))
    gf1 = i1.groebner_fan()
    testr = gf1.render()
    html('Groebner fan of the ideal generated by: ' + str(p1) + ', ' + str(p2) + ', ' + str(p3))
    show(testr, axes = False, figsize=[8,8*(3^(.5))/2])
```
![ReleaseTours/sage-2.11/gfan_1b.png](ReleaseTours/sage-2.11/gfan_1b.png) 


## Bugfixes/Upgrades (incomplete)

* misc: 
      * #2148  <a href="/PolyBoRi">PolyBoRi</a> monomial orders are wrong 
      * #2437  Update eclib.spkg to eclib-20080304 
      * #2468  inverting a non-invertible matrix over RDF returns weird results 
      * #2517  ignore bad values in plot 
      * #2545  <a href="/FractionFieldElement">FractionFieldElement</a> lacks derivative method 
      * #2566  fix all known bugs in graph_isom and binary_code 
      * #2571  problem with copy() on sage.rings.integer_mod.<a href="/IntegerMod">IntegerMod</a>_gmp 
      * #2574  problem with Abelian groups and trivial elements 
      * #2576  preserve docstrings of decorated methods in multi_polynomial_ideal.py 
      * #2579  Inconsistency in integer quotient 
      * #2581  extend solve_right to all cases; implement solve_left 
      * #2582  fix bug in <a href="/PermutationGroupElement">PermutationGroupElement</a> 
      * #2585  padic bugfix - check=False in constructor 
      * #2587  subgroup of a permutation group is so slow it's silly 
      * #2588  documentation and tests for sage.schemes.hyperelliptic_curves.jacobian_morphism 
      * #2593  Sage chokes on utf-8 in .sage files 
      * #2594  MPolynomial_polydict <ins>floordiv</ins> wrong arithmetic fixed 
      * #2602  plot_vector_field docs are unnecessarily complicated (and use the slow lambda functions!) 
      * #2584  printing bug with list_function() 