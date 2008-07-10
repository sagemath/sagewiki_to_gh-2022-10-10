= Sage 3.0.4 Release Tour =

== Integer polynomials now use FLINT (Burcin Erocal, Carl Witty) ==

The polynomial ring ZZ['x'] is now implemented using FLINT, rather than NTL; this gives huge speedups on many operations (such as multiplication of large polynomials).
(The old NTL implementation is still available with PolynomialRing(ZZ, 'x', implementation='NTL').)
