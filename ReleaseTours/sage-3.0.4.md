

# Sage 3.0.4 Release Tour

Sage 3.0.3 was released on July 9th, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see <a class="http" href="http://sagemath.org/src/announce/sage-3.0.4.txt">sage-3.0.4.txt</a>. 


## Integer polynomials now use FLINT (Burcin Erocal, Carl Witty)

The polynomial ring ZZ['x'] is now implemented using FLINT, rather than NTL; this gives huge speedups on many operations (such as multiplication of large polynomials). (The old NTL implementation is still available with <a href="/PolynomialRing">PolynomialRing</a>(ZZ, 'x', implementation='NTL').) 


## Sage startup time improvements


## Notebook updates


## @parallel and pyprocessing
