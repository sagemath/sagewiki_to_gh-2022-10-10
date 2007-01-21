= Problem: Implementation in SAGE parallel computation of elliptic curve a_p for all p up to some bound =

In the abstract the problem of point counting modulo p, for lots of different p, is an "embarassingly parallelize -- just do each p separately.  The challenge here is *not* coming up with an algorithm, but figuring out how to implement something very efficient in SAGE that uses the PARI C library.  In other words, you should make this session below run nearly n times as fast, on a machine with n cores:
{{{
sage: E = EllipticCurve('37a')
sage: time v=E.anlist(10^6, pari_ints=True)
CPU times: user 3.05 s, sys: 0.07 s, total: 3.11 s
Wall time: 3.17
}}}

'''Challenge''': On sage.math.washington.edu, compute all $a_p$ for p < 10^6 in less than 0.5 seconds wall time.

See [:msri07/threadsafety: Thread Safety of the SAGE Libraries] for information about PARI thread safety. 
