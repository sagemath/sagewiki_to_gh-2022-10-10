 * ''Goal'' -- Separate the precision for matrices and vectors from the approximation of their entries. 
 * ''Type'' -- precision handling, basic features
 * ''Priority'' -- High
 * ''Difficulty'' -- Hard
 * ''Prerequisites'' -- None
 * ''Background'' -- linear algebra
 * ''Contributors'' -- Xavier Caruso, David Roe
 * ''Progress'' - Xavier Caruso and David Roe have been working on precision for matrices and vectors, and improving the algorithms for computing hermite form, smith form for matrices over quasi-DVRs.
 * ''Related Tickets'' -- 

== Discussion ==

== Tasks ==

 1. Write categories `QuasiDVRs`, `MatrixAlgebrasOverQuasiDVRs`, `FreeModulesOverQuasiDVRs`.  A quasi-DVR is a local ring equipped with a prime element defining a valuation map to $\ZZ \cup \{\infty\}$ so that 0 is the only element of infinite valuation.  Artinian rings and DVRs are examples.

 1. Write `LUP_decomposition` in `MatrixAlgebrasOverQuasiDVRs.ElementMethods`.

 1. Define precision classes for vectors (e.g. flat, jagged, concave, submodule) and for matrices (e.g. flat, jagged, planar, column (submodule of codomain), row (submodule of domain))

 1. Define a vector class that separates data from precision.  The approximation could be a vector over another (finite) `QuasiDVR` or over ZZ for example.  Override vector operations to compute an approximation separately from the precision of the answer (mostly arithmetic).

 1. Define a matrix class that separates data from precision.  The appoximation could be a matrix over another (finite) `QuasiDVR` or over `ZZ` for example.  Override necessary matrix methods (quite a few).
