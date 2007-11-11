= Sage Days 6 Coding Sprints =

List any and all project ideas here.  Use the format
 * (name) Project idea.  If the idea is more than one line, make a [:/example: link like this (note the leading slash) to more info].

== Here they are ==

(If this list gets much longer -- which it will - we might want to have subheadings, e.g. number fields, linear algebra, elliptic curves... -- john.cremona)

 * (wstein and ondrej certik) [:/debian: determine exactly which sage packages are in debian]

 * (wstein) upgrade the freetype package in sage.

 * (wstein) upgrade the cvxopt package to 0.9

 * (wstein) Number fields -- Reduction modulo a prime ideal, or any ideal.

 * (wstein) Number fields -- optimize K([1,2,3,4,5]), etc., for K number field or order.

 * (wstein) Timing of doctests (partially done)

 * (wstein) Double question mark for spyx files doesn't work.; docstrings work.

 * (wstein) Markup Cython code based on what C code it generates.

 * (wstein) R Python expect interface

 * (wstein) Redo all the "edwards coord" proofs in Sage instead of Magma.  See email to sagedays6, along with http://hyperelliptic.org/EFD/edwards.html

 * (wstein) ATLAS into Sage on Linux.

 * (wstein) Linbox -- get rid of all the crappy hacks for minpoly/charpoly use in Sage.

 * (wstein) Linbox -- fix wrapping of smith_form problems in Sage.

 * (wstein) Create pickle database

 * (wstein) Document number fields.

 * (wstein) Compute kernels of matrices over $\mathbf{Z}/p^n\mathbf{Z}$.

 * (Ondrej Certik) simplify/improve calculus in SAGE [:/calculus: see this link for more info]

 * (mabshoff) fix BlasMatrix::Hom leak in LinBox

 * (mabshoff) start of 2.8.13 release cycle

 * (david harvey) try to improve cache efficiency of NTL's FFT routine

 *(Bill Allombert) improve PARI ECM implementation

 * (john.cremona) adapt interface to new Simon gp scripts

 * (john.cremona) elliptic curve isomorphisms, urst transforms of curves and points

 * (john.cremona) improved $\#E(F_q^d)$ for elliptic curves defined over $F_q$

 * (malb) speed up $GF(p^n)$ for $p \neq 2$ and $p^n \geq 2^{16}$ (using NTL::ZZ_pE and NTL::zz_pE)

 * (malb) implement quotient rings over multivariate polynomial rings over finite fields using libSINGULAR

 * (malb) implement multivariate polynomial rings over number fields using libSINGULAR

 * --((malb) implement sparse matrices over $GF(p^n)$ (using Givaro) modelled after sparse matrices modint.)--

 * (weinmann) related to malb's point directly above: merge smatlib code into SAGE.

 * (weinmann) extend MPolynomialSystemGenerator such that equation systems for (stream and block) ciphers can be generated in a generic way.
