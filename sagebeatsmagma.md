= List of Computations where Sage is Noticeably Faster than Magma.... =

== Machines used ==

eno: (a binary of Sage 4.0.1-rc1 is available at /home/wbhart/sage-4.0.1.rc1/sage on eno)
(a script to stop background processes for benchmarking purposes is available at /home/wbhart/script - but please stop it when done)

{{{
4-core: model name	: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz
}}}

== Benchmarks ==

* Large degree polynomial multiplication modulo n (sage is twice as fast):
{{{
[wstein@eno]$ ~/eno/build/sage-3.4.alpha0/sage
----------------------------------------------------------------------
| Sage Version 3.4.alpha0, Release Date: 2009-02-24                  |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 5), 'V2.15-5')
sage: sage: R.<t> = Zmod(next_prime(8000^3))[]
sage: sage: ff = R.random_element(degree=3200)
sage: sage: time v = [ff*ff for i in [1..100]]
CPU times: user 0.26 s, sys: 0.00 s, total: 0.26 s
Wall time: 0.27 s
sage: 
sage: sage: S = magma(R)
sage: sage: f = magma('%s![Random(0,10000000) : i in [1..3200]]'%S.name())
sage: sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
'Time: 0.560'
}}}

* Computing factorials (Magma takes 50% longer).
{{{
[wstein@eno]$ ~/eno/build/sage-3.4.alpha0/sage
----------------------------------------------------------------------
| Sage Version 3.4.alpha0, Release Date: 2009-02-24                  |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 5), 'V2.15-5')
sage: time n = factorial(10^6)
CPU times: user 0.94 s, sys: 0.02 s, total: 0.96 s
Wall time: 0.98 s
sage: time magma.eval('time n := Factorial(10^6);')
CPU times: user 0.00 s, sys: 0.02 s, total: 0.02 s
Wall time: 2.95 s
'Time: 1.440'
sage: time magma.eval('time n := Factorial(10^7);')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 27.88 s
'Time: 27.340'
sage: time n = factorial(10^7)
CPU times: user 18.60 s, sys: 0.17 s, total: 18.76 s
Wall time: 19.11 s
sage: 27.34/18.76
1.45735607675906
}}}

* Rank of random dense matrices over GF(2)

{{{
----------------------------------------------------------------------
| Sage Version 4.0.alpha0, Release Date: 2009-05-15                  |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: A = random_matrix(GF(2),10^4,10^4)
sage: %time A.rank()
CPU times: user 1.23 s, sys: 0.01 s, total: 1.23 s
Wall time: 1.25 s
9998

sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.rank()
CPU times: user 9.65 s, sys: 0.02 s, total: 9.67 s
Wall time: 9.85 s
19937
sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.echelonize(algorithm='pluq')
CPU times: user 7.26 s, sys: 0.02 s, total: 7.27 s
Wall time: 7.40 s

sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: %time A.rank()
CPU times: user 34.60 s, sys: 0.05 s, total: 34.65 s
Wall time: 35.21 s
19937
sage: %time A.echelonize(algorithm='pluq')
CPU times: user 28.35 s, sys: 0.04 s, total: 28.39 s
Wall time: 28.86 s
}}}

{{{
Magma V2.15-8     Sun May 17 2009 13:16:26 on eno      [Seed = 595144467]
Type ? for help.  Type <Ctrl>-D to quit.
> A:=RandomMatrix(GF(2),10^4,10^4);
> time Rank(A);
10000
Time: 2.790

> A:=RandomMatrix(GF(2),2*10^4,2*10^4);
> time Rank(A);
20000
Time: 19.500

> A:=RandomMatrix(GF(2),32*10^3,32*10^3);
> time Rank(A);
31999
Time: 63.480
}}}


= ....But Magma has the following features which Sage doesn't have (yet) =

* fast and correct multivariate polynomial factorisation algorithm
* fast Gröbner basis computations mod p (p > 2, p prime) and QQ
* fast GCD of multivariate polynomials
