

# Sage 3.1.2 Release Tour

Sage 3.1.2 was released on September 19th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see sage-3.1.2.txt.  


## Doctest Coverage Hits 60%

* Mike Hansen wrote doctests for almost all pexpect interfaces, which will ensure greater stability across the board. 

## Hidden Markov Models

* William Stein wrote Cython bindings for the GHMM C library for computing with Hidden Markov Models, which are a statistical tool that is important in machine learning, natural language processing, bioinformatics, and other areas.  GHMM is also now included standard in Sage. 

## Notebook Bugs

* Many bugs introduced in 3.1.1 were fixed by Mike Hansen and Timothy Clemans.  
* A new testing procedure was implemented, hopefully preventing regressions like in 3.1.1 in the future. 

## New Structures for Partition Refinement

Robert Miller 

* Hypergraphs (i.e. incidence structures) -- this includes simplicial complexes and block designs 
* Matrices -- the automorphism group of a matrix is the set of column permutations which leave the (unordered) set of rows unchanged 

## Major polytope improvements

Arnaud Bergeron and Marshall Hampton 

* Triangulation code was improved (could still be better) 
* Built-in polytope class was added with many standard regular polytopes and families (e.g. hypersimplices) 
* New polytope methods such as polars, graphs, and Schlegel projections were added. 
* Support for scalar multiplication and translation by vectors. 
* Here is a demo of just some of the new functionality: <a href="ReleaseTours/sage-3.1.2/polydemo.mov">Polytope demo</a> (need to download this to view properly, the wiki doesn't seem to show it) 

## Improved Dense Linear Algebra over GF(2)

* M4RI (<a href="http://m4ri.sagemath.org">http://m4ri.sagemath.org</a>) was updated to the newest upstream release which 
   * provides much improved performance for multiplication (see <a class="http" href="http://m4ri.sagemath.org/performance.html">M4RI's "performance" page</a>), 
   * provides improved performance for elimination, 
   * contains several build and bugfixes. 
* hashs and matrix pickling was much improved (Martin Albrecht) 
**Before** 
```txt
sage: A = random_matrix(GF(2),10000,10000)
sage: A.set_immutable()
sage: %time _ = hash(A)
CPU times: user 3.96 s, sys: 0.62 s, total: 4.58 s
sage: A = random_matrix(GF(2),2000,2000)
sage: %time _ = loads(dumps(A))
CPU times: user 4.00 s, sys: 0.07 s, total: 4.07 s
```
**After** 
```txt
sage: A = random_matrix(GF(2),10000,10000)
sage: A.set_immutable()
sage: %time _ = hash(A)
CPU times: user 0.02 s, sys: 0.00 s, total: 0.02 s
sage: A = random_matrix(GF(2),2000,2000)
sage: %time _ = loads(dumps(A))
CPU times: user 1.35 s, sys: 0.01 s, total: 1.37 s
```
* dense matrices over $\mathbb{F}_2$ can now be written to/read from 1-bit PNG images (Martin Albrecht) 

## New PolyBoRi Version (0.5) and Improved Interface

* <a href="/PolyBoRi">PolyBoRi</a> was upgraded from 0.3 to 0.5rc (Tim Abbott, Michael Abshoff, Martin Albrecht) 
* `mq.SR` now returns <a href="/PolyBoRi">PolyBoRi</a> equation systems if asked to 
* support for boolean polynomial interpolation was added 
**Example** 

First we create a random-ish boolean polynomial. 


```txt
sage: B.<a,b,c,d,e,f> = BooleanPolynomialRing(6)
sage: f = a*b*c*e + a*d*e + a*f + b + c + e + f + 1
```
            Now we find interpolation points mapping to zero and to one. 


```txt
sage: zeros = set([(1, 0, 1, 0, 0, 0), (1, 0, 0, 0, 1, 0), \
                   (0, 0, 1, 1, 1, 1), (1, 0, 1, 1, 1, 1), \
                   (0, 0, 0, 0, 1, 0), (0, 1, 1, 1, 1, 0), \
                   (1, 1, 0, 0, 0, 1), (1, 1, 0, 1, 0, 1)])
sage: ones = set([(0, 0, 0, 0, 0, 0), (1, 0, 1, 0, 1, 0), \
                  (0, 0, 0, 1, 1, 1), (1, 0, 0, 1, 0, 1), \
                  (0, 0, 0, 0, 1, 1), (0, 1, 1, 0, 1, 1), \
                  (0, 1, 1, 1, 1, 1), (1, 1, 1, 0, 1, 0)])
sage: [f(*p) for p in zeros]
[0, 0, 0, 0, 0, 0, 0, 0]
sage: [f(*p) for p in ones]
[1, 1, 1, 1, 1, 1, 1, 1]
```
Finally, we find the lexicographically smallest interpolation polynomial using <a href="/PolyBoRi">PolyBoRi</a> . 


```txt
sage: g = B.interpolation_polynomial(zeros, ones); g
b*f + c + d*f + d + e*f + e + 1
```

```txt
sage: [g(*p) for p in zeros]
[0, 0, 0, 0, 0, 0, 0, 0]
sage: [g(*p) for p in ones]
[1, 1, 1, 1, 1, 1, 1, 1]
```

## QEPCAD Interface


## Developer's Handbook

* John H Palmieri rewrote/rearranged large parts of the 'Programming Guide' (now 'Developer's Guide') which should make getting started easier for new developers. 

## Improved 64-bit OSX Support


## Fast Numerical Integration


## GAP Meataxe Interface

* In the `module matrix_group`, the method `module_composition_factors` interfaces with GAP's <a class="http" href="http://www.gap-system.org/Manuals/doc/htm/ref/CHAP067.htm">Meataxe</a> implementation. This will return decomposition information for a G-module, for any matrix group G over a finite field (David Joyner and Simon King). 

## Better SymPy Integration

* Ondrej Cetrik implemented more conversions from Sage native types to <a href="/SymPy">SymPy</a> native types. 

## Faster Determinants of Dense Matrices over Multivariate Polynomial Rings

* Martin Albrecht modified Sage to use Singular  
**Before** 
```txt
sage: P.<x,y> = QQ[]
sage: C = random_matrix(P,8,8)
sage: %time d = C.det()
CPU times: user 2.78 s, sys: 0.02 s, total: 2.80 s
```
**After** 
```txt
sage: P.<x,y> = QQ[]
sage: C = random_matrix(P,8,8)
sage: %time d = C.det()
CPU times: user 0.09 s, sys: 0.00 s, total: 0.09 s
```
* a discussion about this issue can be found on <a class="http" href="http://groups.google.com/group/sage-devel/browse_thread/thread/7aa1bd1e945ff372/">sage-devel</a> 

## Real Number Inputs Improved

* Robert Bradshaw improved real number input so that the precision is preserved better: 
**Before** 


```txt
sage: RealField(256)(1.2)
1.199999999999999955591079014993738383054733276367187500000000000000000000000
```
**After** 
```txt
sage: RealField(256)(1.2)
1.200000000000000000000000000000000000000000000000000000000000000000000000000
```

## Arrow drawing improved

* Jason Grout redid the arrows to look nicer and behave better with graphs: 

```txt
sage: g = DiGraph({0:[1,2,3],1:[0,3,4], 3:[4,6]})
sage: show(g)
```

## Eigen functions for matrices

* Jason Grout added a few standard functions to compute eigenvalues and left and right eigenvectors, returning exact results in QQbar. 

```txt
sage: a = matrix(QQ, 4, range(16)); a
[ 0  1  2  3]
[ 4  5  6  7]
[ 8  9 10 11]
[12 13 14 15]
sage: a.eigenvalues()
[0, 0, -2.464249196572981?, 32.46424919657298?]
sage: a.eigenvectors_right()
[(0, [
(1, 0, -3, 2),
(0, 1, -2, 1)
], 2),
 (-2.464249196572981?,
  [(1, 0.3954107716733585?, -0.2091784566532830?, -0.8137676849799244?)],
  1),
 (32.46424919657298?,
  [(1, 2.890303514040928?, 4.780607028081855?, 6.670910542122782?)],
  1)]
sage: D,P=a.eigenmatrix_right()
sage: P
[                   1                    0                    1                    1]
[                   0                    1  0.3954107716733585?   2.890303514040928?]
[                  -3                   -2 -0.2091784566532830?   4.780607028081855?]
[                   2                    1 -0.8137676849799244?   6.670910542122782?]
sage: D

[                  0                   0                   0                   0]
[                  0                   0                   0                   0]
[                  0                   0 -2.464249196572981?                   0]
[                  0                   0                   0  32.46424919657298?]
sage: a*P==P*D
True
```
The question marks at the end of the numbers in the previous example mean that Sage is printing out an approximation of an exact value that it uses.  In particular, the question mark means that the last digit can vary by plus or minus 1.  In other words, 32.46424919657298? means that the exact number is really between 32.46424919657297 and 32.46424919657299.  Sage knows what the exact number is and uses the exact number in calculations. 
