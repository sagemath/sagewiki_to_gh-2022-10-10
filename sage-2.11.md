= Sage 2.11 Release Tour =
Sage 2.10.1 was released on XXX 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see [http://sagemath.org/announce/sage-2.11.txt sage-2.11.txt].

'''This is Work-in-Progress! Hence the links on this page won't work and information will be added as we got along!'''

== Bugfixes/Upgrades ==
 * ATLAS:
   * #2260  Upgraded to 3.8.1
   * #2108  ATLAS tuning info for Intel Prescott CPUs
   * #2368  ATLAS tuning info for Powerbook G4

 * misc:
   * #2148  PolyBoRi monomial orders are wrong
   * #2437  Update eclib.spkg to eclib-20080304
   * #2468  inverting a non-invertible matrix over RDF returns weird results
   * #2517  ignore bad values in plot
   * #2545  FractionFieldElement lacks derivative method
   * #2566  fix all known bugs in graph_isom and binary_code
   * #2571  problem with copy() on sage.rings.integer_mod.IntegerMod_gmp
   * #2574  problem with Abelian groups and trivial elements
   * #2576  preserve docstrings of decorated methods in multi_polynomial_ideal.py
   * #2579  Inconsistency in integer quotient
   * #2581  extend solve_right to all cases; implement solve_left
   * #2582  fix bug in PermutationGroupElement
   * #2585  padic bugfix - check=False in constructor
   * #2587  subgroup of a permutation group is so slow it's silly
   * #2588  documentation and tests for sage.schemes.hyperelliptic_curves.jacobian_morphism
   * #2593  Sage chokes on utf-8 in .sage files
   * #2594  MPolynomial_polydict __floordiv__ wrong arithmetic fixed
   * #2602  plot_vector_field docs are unnecessarily complicated (and use the slow lambda functions!)
   * #2584  printing bug with list_function()

== zn_poly ==
David Harvey's zn_poly library is now a standard package for Sage. zn_poly is a new C library for polynomial arithmetic in $(Z/nZ)[x]$ where $3 \le n \le ULONG\_MAX$ (i.e. any machine-word-sized modulus). The main benefit is speed. Three examples on sage.math, from my   current development code (this code is '''not''' yet in the spkg):
 * Multiplying length $200$ polynomials over $Z/nZ$ where n has 10 bits:
   * NTL (zz_pX): 113 µs
   * Magma: 44 µs
   * '''zn_poly: 13 µs'''

 * Multiplying length $10^6$ polynomials over $Z/nZ$ where n has 40 bits and is odd:
   * NTL (zz_pX): 9.1s
   * Magma: 8.3s
   * '''zn_poly: 2.06s'''

 * Reciprocal of a length $10^6$ power series over $Z/nZ$ where n has 40 bits and is odd:
   * NTL (zz_pX): 25.4s
   * Magma: ludicrously slow, maybe I'm doing something wrong
   * '''zn_poly: 3.62s'''

The library is used so far only to compute the zeta function for hyperelliptic curves.

== small roots method for polynomials mod N (N composite) ==

Coppersmith's method for finding small roots of univariate polynomials modulo $N$ where $N$ is composite was implemented. An application of this method is to consider RSA. We are using 512-bit RSA with public exponent $e=3$ to encrypt a 56-bit DES
key. Because it would be easy to attack this setting if no padding was used we pad the key $K$ with 1s to get a large number.

{{{#!python
sage: Nbits, Kbits = 512, 56
sage: e = 3
}}}

We choose two primes of size 256-bit each.

{{{#!python
sage: p = 2^256 + 2^8 + 2^5 + 2^3 + 1
sage: q = 2^256 + 2^8 + 2^5 + 2^3 + 2^2 + 1
sage: N = p*q
sage: ZmodN = Zmod( N )
}}}

We choose a random key

{{{#!python
sage: K = ZZ.random_element(0, 2^Kbits)
}}}

and pad it with $512-56=456$ $1$s

{{{#!python
sage: Kdigits = K.digits()
sage: M = [0]*Kbits + [1]*(Nbits-Kbits)
sage: for i in range(len(Kdigits)): M[i] = Kdigits[i]
sage: M = ZZ(M, 2)
}}}

Now we encrypt the resulting message:

{{{#!python
sage: C = ZmodN(M)^e
}}}

To recover $K$ we consider the following polynomial modulo $N$:

{{{#!python
sage: P.<x> = PolynomialRing(ZmodN)
sage: f = (2^Nbits - 2^Kbits + x)^e - C
}}}

and recover its small roots:

{{{#!python
sage: Kbar = f.small_roots()[0]
sage: K == Kbar
True
}}}

== Generic Multivariate Polynomial Arithmetic ==
Joel Mohler improved the efficiency of the generic multivariate polynomial arithmetic in Sage. Before his patch was applied:
{{{#!python
sage: R.<x,y,z,a,b>=ZZ[]
sage: f=prod([2*g^2-4*g+8 for g in R.gens()])
sage: %time _=f*f
CPU times: user 2.23 s, sys: 0.00 s, total: 2.23 s
Wall time: 2.24
}}}

and after:

{{{#!python
sage: R.<x,y,z,a,b>=ZZ[]
sage: f=prod([2*g^2-4*g+8 for g in R.gens()])
sage: %time _=f*f
CPU times: user 0.22 s, sys: 0.00 s, total: 0.22 s
Wall time: 0.22
}}}
