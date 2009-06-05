= Sage 4.0.1 Release Tour =

Sage 4.0.1 was released on FIXME. For the official, comprehensive release note, please refer to FIXME. A nicely formatted version of this release tour can be found at FIXME. The following points are some of the foci of this release:

 * 
 * 
 * 


== Algebra ==


 * Factoring rational functions (Soroosh Yazdani) -- New method {{{factor()}}} in the class {{{FractionFieldElement}}} of {{{sage/rings/fraction_field_element.pyx}}} to return the factorization of self over the base ring. Here's an example for working with this new method:
 {{{
sage: K.<x> = QQ["x"]
sage: f = (x^3 + x) / (x-3)
sage: f.factor()
(x - 3)^-1 * x * (x^2 + 1)
 }}}


 * Faster {{{basis_matrix()}}} for ambient modules (John Cremona) -- The speed-up can be up to 376x faster than previously. The following timing statistics were obtained using the machine sage.math:
 {{{
# BEFORE

sage: K = FreeModule(ZZ, 2000)
sage: %time I = K.basis_matrix()
CPU times: user 292.74 s, sys: 20.11 s, total: 312.85 s
Wall time: 312.90 s


# AFTER

sage: K = FreeModule(ZZ, 2000)
sage: %time I = K.basis_matrix()
CPU times: user 0.41 s, sys: 0.43 s, total: 0.84 s
Wall time: 0.83 s
 }}}


 * FIXME: summarize #6081

 * FIXME: summarize #6043


== Algebraic Geometry ==


 * FIXME: summarize #5948


== Basic Arithmetic ==


 * FIXME: summarize #5732


== Calculus ==


 * FIXME: summarize #5404


== Combinatorics ==


 * FIXME: summarize #6000

 * FIXME: summarize #6167

 * FIXME: summarize #6093

 * FIXME: summarize #6050

 * FIXME: summarize #5931

 * FIXME: summarize #5925


== Commutative Algebra ==


 * FIXME: summarize #6120


== Geometry ==


== Graph Theory ==


== Graphics ==


 * FIXME: summarize #6184

 * FIXME: summarize #5599


== Group Theory ==


== Interfaces ==


 * FIXME: summarize #6208


== Linear Algebra ==


== Miscellaneous ==


 * FIXME: summarize #5967

 * FIXME: summarize #5483

 * FIXME: summarize #6139


== Modular Forms ==


 * FIXME: summarize #5995


== Notebook ==


 * FIXME: summarize #4575

 * FIXME: summarize #5895


== Number Theory ==


 * FIXME: summarize #133

 * FIXME: summarize #6021

 * FIXME: summarize #6206


== Numerical ==


 * FIXME: summarize #5827


== Packages ==


 * FIXME: summarize #5840

 * FIXME: summarize #6173

 * FIXME: summarize #5817

 * FIXME: summarize #6156

 * FIXME: summarize #6169

 * FIXME: summarize #6209

 * FIXME: summarize #6219


== P-adics ==


== Quadratic Forms ==


== Symbolics ==


 * FIXME: summarize #6144

 * FIXME: summarize #6194


== Topology ==


 * FIXME: summarize #6141
