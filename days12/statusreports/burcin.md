

## Burcin's status report for SD 12


### pynac

* print higher degree terms first 
* added: 
   * support for symbolic binomial and factorial 
   * `.latex()` method 
   * `.collect_common_factors()` 
   * iterators and `__getitem__` 
   * `.function()` method to allow creating `CallableSymbolicExpressions` with pynac expressions 
Changes above will be in the pynac-0.1.2 release, which should be released with Sage 3.3. 

I have patches that 

* add constants for `Infinity` and `UnsignedInfinity` (to pynac) 
* implement arithmetic with infinity 
* make 1/gamma(-1) = 0  
* fix series expansion of 1/(1/sqrt(x) + 1/x) 
which need to be cleaned up and tested more. They should be available for testing before I get home (next Tuesday). 


## bugs fixed

* #4981 clean up polynomial_ring.py 
* #4840 FLINT: call the stack cleanup function at exit 
* #3298 Cython warnings for `PolyBoRi` 

## reviews

* #4850 bug in power_mod 
* #5027 comparing complex i raises error 
* #2957 Singular multivariate polynomials are buggy on exponent overflow) 