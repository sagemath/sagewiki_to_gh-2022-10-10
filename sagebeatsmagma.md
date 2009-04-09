= List of Computations where Sage is Noticeably Faster than Magma =

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
