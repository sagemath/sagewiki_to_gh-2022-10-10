Describe msri07/anlist here.

= Problem: Implementation in SAGE parallel computation of elliptic curve a_p for all p up to some bound =

In the abstract the problem of point counting modulo p, for lots of different p, is an "embarassingly parallelize -- just do each p separately.  The challenge here is *not* coming up with an algorithm, but figuring out how to implement something very efficient in SAGE that uses the PARI C library.

See [:msri07/threadsafety: Thread Safety of the SAGE Libraries] for information about PARI thread safety. 
