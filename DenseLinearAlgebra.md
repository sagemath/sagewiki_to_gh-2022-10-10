

# The state of dense linear algebra in Sage


## Standard as of Version 5.0
 **Finite Rings** |||||
**Base Ring**   |  **Libraries**  |  **Overview**  |  **Known Limitations**  |  **Tickets** 
 $\mathbb{F}_2$  |  <a class="http" href="http://m4ri.sagemath.org">M4RI</a>  |  Sage has the fastest known implementation. Matrix-matrix multiplication is either as fast as Magma 2.17 or slightly faster. Gaussian elimination is faster than Magma 2.17.  |  Some functions might fall back to their generic implementations because M4RI either does not implement it or its implementation is not wrapped  |  
 $\mathbb{F}_{2^e}$ for $2 \leq e \leq 10$  |  <a class="http" href="http://m4ri.sagemath.org">M4RIE</a>  |  Sage has by far the fastest known implementation.  |  Many functions might fall back to their generic implementations because M4RIE either does not implement it or its implementation is not wrapped. Sage uses M4RIE's `mzed_t` but using `mzd_slice_t` would be slightly faster and save memory.  |  
 $\mathbb{Z}_p$, $2<p$ very small  |  <a class="http" href="http://www.linalg.org">LinBox</a>  |  Sage achieves decent performance, but Magma 2.17 is faster for small values. Also, (experimental) specialised implementations exist which beat both by a large margin.  |   |  
 $\mathbb{Z}_p$, $p<2^{22}$  |  <a class="http" href="http://www.linalg.org">LinBox</a>  |  Sage achieves decent performance on par with Magma 2.17. Performance differences likely come down to the BLAS used in both systems.  |  Some functions fall back to their generic implementations because <a href="/LinBox">LinBox</a> either does not implement it, or the implementation was not wrapped yet. Also, `echelonize` uses way too much memory because it copies the matrix being worked on due to a function missing in <a href="/LinBox">LinBox</a>. |  
 **Infinite Rings** |||||
 $\mathbb{Q}$  |  <a class="http" href="http://www.linalg.org">LinBox</a>, <a class="http" href="http://pari.math.u-bordeaux.fr/">Pari</a>, <a class="http" href="http://www.cs.uwaterloo.ca/~astorjoh/iml.html">IML</a>  |  Decent  |   |  
 $\mathbb{Z}$  |  <a class="http" href="http://www.linalg.org">LinBox</a>, <a class="http" href="http://pari.math.u-bordeaux.fr/">Pari</a>, <a class="http" href="http://www.cs.uwaterloo.ca/~astorjoh/iml.html">IML</a>, <a class="http" href="http://www.shoup.net/ntl/">NTL</a>, custom code  |  Decent. Fastest known Hermite Normal Form.  |   |  
 $\mathbb{R}$, $\mathbb{C}$, 53-bit  |  `SciPy`, `NumPy`, `CVXOPT`  |  Rings `RDF` and `CDF` in Sage are floating point doubles.  Performance comes from standard underlying libraries through Sage wrappers of `SciPy`/`NumPy` wrappers and interfaces. There there are no dedicated wrappers to `CVXOPT`, which sometimes offers better performance via <a class="http" href="http://www.cise.ufl.edu/research/sparse/SuiteSparse/">SuiteSparse</a>  |  Not every desirable function has been implemented, but coverage is steadily increasing.  |  
 $\mathbb{R}$, $\mathbb{C}$, arbitrary precision  |  generic  |  Rings `RealField(prec)` and `ComplexField(prec)` in Sage support arbitrary precision, but default to 53-bit when used as `RR` and `CC`.  Implementation often (always?) defaults to exact algorithms.  |  Using exact algorithms for approximate entries can provide misleading results if not interpreted properly.  |  
 $\mathbb{Q}(\zeta_n)$  |  special code  |  Optimized multi-modular algorithms for arithmetic, charpoly, echelon form over cyclotomic fields.  |   |  
 **Symbolic Rings** |||||
 $\mathbb{K}[x]$  |  generic  |   |   |  
 $\mathbb{K}[x_0,\dots,x_{n-1}]$  |  generic,<a class="http" href="http://singular.uni-kil.de">Singular</a>  |  Generic matrices with some routines (`det`, `echelon_form`) calling libSingular. Poor performance, but apparently comparable to what other systems offer.  |  This implementation is not a serious attempt to implement matrices over $\mathbb{K}[x_0,\dots,x_{n-1}]$.  |  
 Symbols  |  generic,<a class="http" href="http://maxima.sourceforge.net/">Maxima</a>  |  Generic matrices with some routines calling Maxima. Poor performance, but apparently comparable to what other systems offer.  |    |  


## Provided by Optional Packages
**Base Ring**   |  **Libraries**  |  **Overview**  |  **Known Limitations**  |  **Tickets** 
 $\mathbb{F}_{p<sup>k}$, $p</sup>k<255$  |  <a class="http" href="http://www.math.rwth-aachen.de/~MTX/">MeatAxe</a> fork  |  The fork adds Winograd-Strassen multiplication to the original `MeatAxe`. The computation of echelon forms is not asymptotically fast, but is faster than the generic implementation in Sage.  |  Patch needs review  |  <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12103">#12103</a> 


## In the Pipeline
**Base Ring**   |  **Libraries**  |  **Overview**  |  **Known Limitations**  |  **Tickets** 
 $\mathbb{F}_{p^k}$  |  Custom code  |  Matrices over extension fields are represented as tuples of matrices over the prime subfield. Then, using polynomial multiplication with matrix coefficients allows to multiply matrices. Other algorithms are implemented by reducing to matrix-matrix multiplication.  |  Only matrix-matrix multiplication is implemented so far.  |  <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12177">#12177</a> 
 $\mathbb{Z_p}$ for $p < 2^{64}$  |  <a class="http" href="http://www.flintlib.org/">FLINT 2.3</a>  |  Decent, not fully optimised.  |   |  
 $\mathbb{Z}[x]$  |  <a class="http" href="http://www.flintlib.org/">FLINT 2.3</a>  |  Decent, not fully optimised.  |   |  
 $\mathbb{Z_p}[x]$  for $p < 2^{64}$   |  <a class="http" href="http://www.flintlib.org/">FLINT 2.3</a>  |  Decent, not fully optimised.  |   |  
