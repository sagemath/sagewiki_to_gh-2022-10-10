= List of Computations where Sage is Noticeably Faster than Magma.... =

== Machines used ==

eno: (a binary of Sage 4.0.1-rc1 is available at /home/wbhart/sage-4.0.1.rc1/sage on eno)
(a script to stop background processes for benchmarking purposes is available at /home/wbhart/script - but please stop it when done)

{{{
4-core: model name	: Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz
}}}

== Benchmarks ==

* Large degree polynomial multiplication modulo n (Sage is three times as fast).

{{{
[wbhart@eno sage-4.0.1.rc1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 8), 'V2.15-8')
sage: R.<t> = Zmod(next_prime(8000^3))[]
sage: ff = R.random_element(degree=3200)
sage: time v = [ff*ff for i in [1..100]]
CPU times: user 0.18 s, sys: 0.00 s, total: 0.18 s
Wall time: 0.18 s
sage: S = magma(R)
sage: f = magma('%s![Random(0,10000000) : i in [1..3200]]'%S.name())
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
'Time: 0.540'
}}}

* Large degree polynomial multiplication over ZZ (Sage is 4.5 times as fast).

{{{
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: R.<x>=ZZ['x']
sage: ff = R.random_element(degree=3200)
sage: gg = R.random_element(degree=3200)
sage: time v = [ff*gg^i for i in [1..40]]
CPU times: user 22.29 s, sys: 0.22 s, total: 22.50 s
Wall time: 22.51 s
sage: S = magma(R)
sage: f = magma(ff)
sage: g = magma(gg)
sage: time v = [f*g^i for i in [1..40]]
CPU times: user 0.05 s, sys: 0.01 s, total: 0.06 s
Wall time: 99.62 s
}}}

* Computing factorials (Sage is more than twice the speed).

{{{
[wbhart@eno sage-4.0.1.rc1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: magma.version()
((2, 15, 8), 'V2.15-8')
sage: time n = factorial(10^6)
CPU times: user 0.57 s, sys: 0.01 s, total: 0.58 s
Wall time: 0.59 s
sage: time magma.eval('time n := Factorial(10^6);')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 1.45 s
'Time: 1.440'
sage: time magma.eval('time n := Factorial(10^7);')
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 27.33 s
'Time: 27.300'
sage: time n = factorial(10^7)
CPU times: user 11.50 s, sys: 0.25 s, total: 11.75 s
Wall time: 11.75 s
sage: 27.30/11.75
2.32340425531915
}}}

* Rank of random dense matrices over GF(2) (Sage is more than twice the speed).

{{{
----------------------------------------------------------------------
| Sage Version 4.0.1.rc1, Release Date: 2009-06-04                   |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: A = random_matrix(GF(2),10^4,10^4)
sage: %time A.rank()
CPU times: user 1.20 s, sys: 0.01 s, total: 1.20 s
Wall time: 1.20 s
9999

sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.rank()
CPU times: user 9.34 s, sys: 0.02 s, total: 9.36 s
Wall time: 9.36 s
19937

sage: A = random_matrix(GF(2),2*10^4,2*10^4)
sage: %time A.echelonize(algorithm='pluq')
CPU times: user 6.79 s, sys: 0.01 s, total: 6.80 s
Wall time: 6.80 s

sage: A = random_matrix(GF(2),3.2*10^4,3.2*10^4)
sage: %time A.rank()
CPU times: user 31.57 s, sys: 0.05 s, total: 31.62 s
Wall time: 31.63 s
19937

sage: %time A.echelonize(algorithm='pluq')
CPU times: user 27.10 s, sys: 0.04 s, total: 27.14 s
Wall time: 27.15 s
}}}

{{{
Magma V2.15-8     Thu Jun  4 2009 21:58:05 on eno      [Seed = 3168701748]
Type ? for help.  Type <Ctrl>-D to quit.
> A:=RandomMatrix(GF(2),10^4,10^4);
> time Rank(A);
9999
Time: 3.040

> A:=RandomMatrix(GF(2),2*10^4,2*10^4);
> time Rank(A);
19999
Time: 17.750

> A:=RandomMatrix(GF(2),32*10^3,32*10^3);
> time Rank(A);
31999
Time: 62.980

}}}


= ....But Magma has the following features which Sage doesn't have (yet) =

* fast and correct multivariate polynomial factorisation algorithm

* fast Gröbner basis computations mod p (p > 2, p prime) and QQ

* fast GCD of multivariate polynomials
