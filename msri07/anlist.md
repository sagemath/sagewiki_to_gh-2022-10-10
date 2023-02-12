

# Problem: Implementation in SAGE parallel computation of elliptic curve a_p for all p up to some bound

In the abstract the problem of point counting modulo p, for lots of different p, is an "embarassingly parallelize -- just do each p separately.  The challenge here is *not* coming up with an algorithm, but figuring out how to implement something very efficient in SAGE that uses the PARI C library.  In other words, you should make this session below run nearly n times as fast, on a machine with n cores: 
```txt
sage: E = EllipticCurve('37a')
sage: time v=E.anlist(10^6, pari_ints=True)
CPU times: user 7.24 s, sys: 0.06 s, total: 7.30 s
Wall time: 12.16
```
**Challenge**: On sage.math.washington.edu, make a list of all $a_n$ for $n < 10^6$ in less than 1 second wall time. 

See [:msri07/threadsafety: Thread Safety of the SAGE Libraries] for information about PARI thread safety.  

MAGMA times, by the way: 
```txt
sage: magma.version()

sage: F = magma(E)
sage: t = magma.cputime()
sage: time v=F.TracesOfFrobenius(10^6)
sage: magma.cputime(t)
6.5
```