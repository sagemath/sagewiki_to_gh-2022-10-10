=== People interested ===

Xavier Caruso, Jérémy Le Borgne

=== Description ===

If $k$ is a field and $\sigma$ a ring endomorphism of $k$, the ring of skew polynomials $k[X,\sigma]$ is the usual vector space of polynomials over $k$ equipped with the multiplication deduced from the rule $a X = \sigma(a) X$ ($a \in K$)

This ring is closely related to $\sigma$-modules over $k$ (which arises in $p$-adic Hodge theory).

The aim of the project is to implement basic arithmetic on $k[X,\sigma]$ when $k$ is a finite field

=== Progress ===

A class has been written (for now, in python). It supports the following functions:
 - basic arithmeric (addition, multiplication, euclidean division, gcd)
 - computation of the center $Z(k[X,\sigma])$ -- need to add a coercion map
 - computation of the so-called map $\Psi : k[X,\sigma] \to Z(k[X,\sigma])$
 - computation of the associated Galois representation (via the corresponding $\sigma$-module)
 - factorization -- in progress

=== Bugs ===

Do not derive from PolynomialRing_general since this class assumes that the variable commutes with the constant
