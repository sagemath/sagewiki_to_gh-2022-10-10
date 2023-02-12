

# Linear Algebra

SAGE has extensive linear algebra capabilities. 


## Vector Spaces

The `VectorSpace` command creates a vector space class, from which one can create a subspace. Note the basis computed by Sage is ``row reduced_. 


```python
#!python numbers=none 
sage: V = VectorSpace(GF(2),8)
sage: S = V.subspace([V([1,1,0,0,0,0,0,0]),V([1,0,0,0,0,1,1,0])])
sage: S.basis()
  [
   (1, 0, 0, 0, 0, 1, 1, 0),
   (0, 1, 0, 0, 0, 1, 1, 0)
  ]
sage: S.dimension()
  2
```

## Matrix arithmetic

Computing matrix powers in Sage is illustrated by the example below. 


```python
#!python numbers=none 
sage: R = IntegerModRing(51)
sage: M = MatrixSpace(R,3,3)
sage: A = M([1,2,3, 4,5,6, 7,8,9])
sage: A^1000*A^1007
[ 3  3  3]
[18  0 33]
[33 48 12]
sage: A^2007
[ 3  3  3]
[18  0 33]
[33 48 12]
```
Matrix addition and multiplication: 


```python
#!python numbers=none 
sage: R = IntegerModRing(51)
sage: M = MatrixSpace(R,3,3)
sage: A = M([1,2,3, 4,5,6, 7,8,9])
sage: B = M([1,0,1, 0,1,0, 1,1,1])
sage: A+B

[ 2  2  4]
[ 4  6  6]
[ 8  9 10]

sage: A*B

[ 4  5  4]
[10 11 10]
[16 17 16]
sage: -7*B

[44  0 44]
[ 0 44  0]
[44 44 44]
```

## Kernels

The kernel is computed by applying the kernel method to the matrix object. The following examples illustrate the syntax. 


```python
#!python numbers=none 
sage: M = MatrixSpace(IntegerRing(),4,2)(range(8))
sage: M.kernel()
Free module of degree 4 and rank 2 over Integer Ring
Echelon basis matrix:
[ 1  0 -3  2]
[ 0  1 -2  1]
```
A kernel of dimension one over $ \mathbb{Q}$ : 


```python
#!python numbers=none 
sage: A = MatrixSpace(RationalField(),3)(range(9))
sage: A.kernel()
Vector space of degree 3 and dimension 1 over Rational Field
Basis matrix:
[ 1 -2  1]
```
A trivial kernel: 


```python
#!python numbers=none 
sage: A = MatrixSpace(RationalField(),2)([1,2,3,4])
sage: A.kernel()
Vector space of degree 2 and dimension 0 over Rational Field
Basis matrix:
[]
sage: M = MatrixSpace(RationalField(),0,2)(0)
sage: M
[]
sage: M.kernel()
Vector space of degree 0 and dimension 0 over Rational Field
Basis matrix:
[]
sage: M = MatrixSpace(RationalField(),2,0)(0)
sage: M.kernel()
Vector space of dimension 2 over Rational Field
```
Kernel of a zero matrix: 


```python
#!python numbers=none 
sage: A = MatrixSpace(RationalField(),2)(0)
sage: A.kernel()
Vector space of degree 2 and dimension 2 over Rational Field
Basis matrix:
[1 0]
[0 1]
```
Kernel of a non-square matrix: 


```python
#!python numbers=none 
sage: A = MatrixSpace(RationalField(),3,2)(range(6))
sage: A.kernel()
Vector space of degree 3 and dimension 1 over Rational Field
Basis matrix:
[ 1 -2  1]
```
The 2-dimensional kernel of a matrix over a cyclotomic field: 


```python
#!python numbers=none 
sage: K = CyclotomicField(12); a = K.gen()
sage: M = MatrixSpace(K,4,2)([1,-1, 0,-2, 0,-a^2-1, 0,a^2-1])
sage: M
[             1             -1]
[             0             -2]
[             0 -zeta12^2 - 1]
[             0  zeta12^2 - 1]
sage: M.kernel()
Vector space of degree 4 and dimension 2 over Cyclotomic Field of order 12 
 and degree 4
Basis matrix:
[               0                1                0     -2*zeta12^2]
[               0                0                1 -2*zeta12^2 + 1]
```
A nontrivial kernel over a complicated base field. 


```python
#!python numbers=none 
sage: K = FractionField(MPolynomialRing(RationalField(),2,'x'))
sage: M = MatrixSpace(K, 2)([[K.gen(1),K.gen(0)], [K.gen(1), K.gen(0)]])
sage: M
[x1 x0]
[x1 x0]
sage: M.kernel()
Vector space of degree 2 and dimension 1 over Fraction Field of Multivariate Polynomial Ring in x0, x1 over Rational Field
Basis matrix:
 [ 1 -1]
```
Other methods for integer matrices include: `elementary_divisors`, `smith_form` (for the Smith normal form), `echelon` (a method for integer matrices) for the Hermite normal form, `frobenius` for the Frobenius normal form (rational canonical form). 

There a many methods for matrices over a field such as $ \mathbb{Q}$ or a finite field: `row_span`, `nullity`, `transpose`, `swap_rows`, `matrix_from_columns`, `matrix_from_rows`, among many others.  


## Eigenvectors and eigenvalues

How do you compute eigenvalues and eigenvectors using Sage? 

Sage included both in the eigenspaces command, the output of which has several components, corresponding to the different eigenvalues. 


```python
#!python numbers=none 
sage: MS = MatrixSpace(QQ, 3, 3)
sage: A = MS([[1,1,0],[0,2,0],[0,0, 3]])
sage: A
[1 1 0]
[0 2 0]
[0 0 3]
sage: A.eigenspaces()
[
(3, [
(0, 0, 1)
]),
(2, [
(0, 1, 0)
]),
(1, [
(1, -1, 0)
])
]
sage: v1*A == r1*v1
True
sage: v2*A == r2*v2
True
sage: v3*A == r3*v3
True
```
Note that these are ``left`` eigenspaces. To get the right eigenspaces, first take the transpose: 


```python
#!python numbers=none 
sage: At = A.transpose()
sage: v1 = At.eigenspaces()[0][1][0]
sage: v2 = At.eigenspaces()[1][1][0]
sage: v3 = At.eigenspaces()[2][1][0]
sage: A*v1 == r1*v1
True
sage: A*v2 == r2*v2
True
sage: A*v3 == r3*v3
True
```

## Row reduction

The row reduced echelon form of a matrix is computed as in the following example. 


```txt
sage: M = MatrixSpace(RationalField(),2,3)
sage: A = M([1,2,3, 4,5,6])
sage: A
[1 2 3]
[4 5 6]
sage: A.parent()
Full MatrixSpace of 2 by 3 dense matrices over Rational Field
sage: A[0,2] = 389
sage: A
[  1   2 389]
[  4   5   6]
sage: A.echelon_form()
[      1       0 -1933/3]
[      0       1  1550/3]
```

## Characteristic polynomial

The characteristic polynomial is a Sage method for square matrices. 

First a matrix over $ \mathbb{Z}$ : 


```python
#!python numbers=none 
sage: A = MatrixSpace(IntegerRing(),2)( [[1,2], [3,4]] )
sage: f = A.charpoly()
sage: f
x^2 - 5*x - 2
sage: f.parent()
Univariate Polynomial Ring in x over Integer Ring
```
We compute the characteristic polynomial of a matrix over the polynomial ring $ \mathbb{Z}[a]$ : 


```python
#!python numbers=none 
sage: R = PolynomialRing(IntegerRing(),'a'); a = R.gen()
sage: M = MatrixSpace(R,2)([[a,1], [a,a+1]])
sage: M
[    a     1]
[    a a + 1]
sage: f = M.charpoly()
sage: f
x^2 + (-2*a - 1)*x + a^2
sage: f.parent()
Univariate Polynomial Ring in x over Univariate Polynomial Ring in a over Integer Ring

sage: M.trace()
2*a + 1
sage: M.determinant()
a^2
```
We compute the characteristic polynomial of a matrix over the multi-variate polynomial ring $ \mathbb{Z}[u,v]$ : 


```python
#!python numbers=none 
sage: R.<u,v> = PolynomialRing(ZZ,2)
sage: A = MatrixSpace(R,2)([u,v,u^2,v^2])
sage: f = A.charpoly(); f
x^2 + (-1*v^2 - u)*x - u^2*v + u*v^2
```
It's a little difficult to distinguish the variables. To fix this, we might want to rename the indeterminate "Z". However, as of Sage 1.5, we can no longer reassign the name of a determinate in an instantiated polynomial ring. However, we can locally change the name in a `with` block: 


```python
#!python numbers=none 
sage: with localvars(f.parent(), 'Z'): 
....:     print(f)
Z^2 + (-1*v^2 - u)*Z - u^2*v + u*v^2
```