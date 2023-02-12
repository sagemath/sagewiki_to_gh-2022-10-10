
* _Goal_ -- Implement specialized algorithms to work with matrices, vectors and modules over quotients of discrete valuation rings.  
* _Type_ -- basic features, speed improvements 
* _Priority_ -- High 
* _Difficulty_ -- Medium-Hard 
* _Prerequisites_ -- None 
* _Background_ -- linear algebra 
* _Contributors_ -- Xavier Caruso, David Roe 
* _Progress_ - Xavier Caruso and David Roe have been working on precision for matrices and vectors, and improving the algorithms for computing hermite form, smith form for matrices over quotients of discrete valuation rings. 
* _Related Tickets_ --  

## Discussion

By a `QuoDVR` we mean a quotient of a discrete valuation ring.  We have two easy examples for QuoDVRs: `Z/p^nZ` and `k[x]/x^n`.  In addition we have `OK/pi^n OK` where `pi` is a prime ideal in the ring of integers `OK` of a number field.  We'll start by implementing the first two rings.  These will be subclass of `IntegerMod_int`, `IntegerMod_int64` and `IntegerMod_gmp` on the one hand, and of `sage.rings.polynomial.polynomial_quotient_ring_element.PolynomialQuotientRingElement` on the other.  We intend to implement/optimize the following functions: 


```python
#!python 
cdef long maxordp = (1L << (sizeof(long) * 8 - 2)) - 1
# 1073741823 or 4611686018427387903 on 32/64 bit.

def valuation(self)
cdef _valuation_c(self)
def __lshift__(self, n)
def __rshift__(self, n)
cdef _pshift(self, Py_ssize_t n)
cpdef Py_ssize_t valuation_between(self, Py_ssize_t a=0, Py_ssize_t b=maxordp) # actually uses the precision of the parent rather than 
   """
   Assumes that the valuation of this element is at least a;
   If the valuation is at least b, returns b.  Otherwise, returns the valuation.
   """
def __floordiv__(self, right) # consistent with p-adics
```
The `IntegerMod` classes will use a subclass of `sage.rings.padics.pow_computer.PowComputer` to store powers of p. 

Note that for `Z/p^nZ`, this class is VERY similar to `sage.rings.padics.padic_fixed_modulus_element.pAdicFixedModulusElement`.  The main difference is a conceptual one: these elements live in a finite ring, and thus the behavior of operations such as matrix kernels will be different.  The only practical difference I can think of will be for printing. 

The benefit is that we'll use the category framework to write code in common for such rings, matrices over these rings, free modules, etc. 


## Tasks

1. Write a category for `QuoDVR`. 
1. Write linkage files for `Z/p^nZ` and `k[x]/x^n` for different `k`. 
1. Write parent classes and element template classes for `Z/p^nZ` and `k[x]/x^n` considered as `QuoDVRs` (inheriting from appropriate rings and elements). 
1. Make `sage.categories.matrix_algebras.MatrixAlgebras` into a Cython file and move some code from `sage.matrix.matrix2` to `sage.categories.matrix_algebras.MatrixAlgebras`. 
1. Write categories `MatrixAlgebrasOverQuoDVRs`, `FreeModulesOverQuoDVRs`.  Implement Hermite form, Smith form and LUP decomposition in `MatrixAlgebrasOverQuasiDVRs.ElementMethods` using specialized algorithms.  See <a href="/Wikipedia">http://en.wikipedia.org/wiki/LU_decomposition</a> 
1. Write an "exact matrix template" (ie no precision) class into which we can plug the linkage files for `Z/p^nZ` and `k[x]/x^n`. 
1. Write matrix classes over `Z/p^nZ` and `k[x]/x^n` using the exact template.  Change `sage.matrix.matrix_space.MatrixSpace._get_matrix_class` to take advantage of these classes. 
1. Write a class for submodules over QuoDVRs.  The point is that we have algorithms for sum and intersection of these submodules, based on algorithms for matrices. 
1. Write an "exact vector template" (ie no precision) class into which we can plug the linkage files for `Z/p^nZ` and `k[x]/x^n`. 
1. Write vector classes over `Z/p^nZ` and `k[x]/x^n` using the exact template.  Modify `sage.modules.free_module.element_class` to put them into effect. 