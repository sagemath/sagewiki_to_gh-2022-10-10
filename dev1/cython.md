

# Dev Days 1: Cython

   * Robert Bradshaw: Pex integration, generators, closures, everything else 
   * Josh Kantor: Pex 
   * Dan Gindikin: Pex 
   * Dag Sverre Seljebotn: numpy, Pex 
   * Carl Witty: Cython 
   * Gary Furnish: fast memory management 
   * Craig Citro: ? 
Numpy Static Syntax Options:  


```txt
 cdef ndarray[float, 2] arr = x
 cdef ndarray<float, 2> arr = x
```
or some other syntax? (Consensus is that none of these are ideal.) 
