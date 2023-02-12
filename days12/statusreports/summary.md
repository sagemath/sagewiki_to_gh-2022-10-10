

```txt
\hd{Overall}%

Overall XXX bugs were fixed and closed making the release 3.3 a candidate for being the biggest release ever.

\hd{Math}%
Stein fixed bugs in Sage's use of mwrank, factorization of multivariate polynomials over finite fields, the elliptic curve
database, multivariate polynomial arithmetic, ring changes and hashing over Givaro finite fields, kernels of integer matrices and getting help on primes.

King improved the documentation of the kernel command.

Alexander fixed a bug in the creation of fractional ideals in relative number field which in turn caused quite a few other bugs in that area.

Albrecht, Boothby, Perry, King and Alexander fixed several bugs in univariate and multivariate polynomials which could lead to segmentation faults and wrong results in computations. Perry improved the support for multivariate polynomial rings over finite fields with large prime characteristic.

Boothby improved basic arithmetic in Steenrod algebras.

Citro and Ghitza fixed  bugs for modular symbols and free modules. Ghitza made sure that the generator returned for prime order finite fields is a valid multiplicative generator and fixed the interface to Cremona's database.

Albrecht and Perry worked on an F4-style F5 algorithm and finished a toy implementation of it.

\hd{Graphics}%
Stein fixed bugs in parametric and list 3d plotting.

Albrecht fixed bugs in the visualization of the structure of matrices.

Shumow fixed a bug in the 3d plotting of points.

\hd{System}%
Stein fixed PATH issues, doctesting of spyx and sage files, the -notebook option, getting memory
usage, cached gap workspaces, loading of magma/sage interface files, and make check.

Shumow, Stein and Abshoff discussed the future process of Sage's Windows port.

King fixed a bug which would prevent the clearance of the tmp directory, improved the timeit command, 

Miller fixed several memory leaks in sparse linear algebra and fixed many bugs across the library.

\hd{Testing}%
Stein removed some long doctests that left cruft around.

\hd{Notebook and Interfaces}%

Hansen fixed 12 bugs in the Sage notebook including problems with the LaTeX and HTML cells in the notebooks. As part of these fixes, he simplified a significant portion of the notebook code.

Boothby implemented auto indentation in the notebook.

Hansen worked on improving the robustness and functionality of the GAP and Mathematica interfaces.

```