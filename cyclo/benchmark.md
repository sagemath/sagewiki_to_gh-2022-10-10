

# Benchmarking Cyclotomic Linear Algebra

Systems: 

      * Magma-2.14 and Magma-2.13 
      * PARI-2.3.3 
      * Sage-3.0 
Operating Systems / Hardware: 

      * 32-bit OS X intel 2.6Ghz core 2 duo natively 
      * 64-bit Linux running on 1.8Ghz Opteron natively 
      * 32-bit Linux running on 2.6Ghz core 2 duo (under vmware) 
      * 64-bit Linux running on 2.6Ghz core 2 duo (under vmware) 
Benchmarks: 

1. Matrix addition 
1. Matrix vector product 
1. Matrix multiplication 
1. Determinant 
1. Rank 
1. Characteristic Polynomial <a href="/cyclo/charpoly">some benchmarks here</a> 
1. Reduced row echelon form 
1. Sparse reduced row echelon form 
1. Solving A*x = b and A*X = B 
1. Kernel 
1. Rational decomposition 
A good source of matrices that we care about: 

Below, replace 23 by any of 23, 67, 89, 199, and p=2 in the last line below by any positive integer: 
```txt
ModularSymbols_clear_cache()
eps = DirichletGroup(23*3, CyclotomicField(11)).1^2
M = ModularSymbols(eps); M
t = M.hecke_matrix(2)
```