

# List of Computations where Sage is Noticeably Faster than Magma....

A binary of Sage 4.0.1-rc1 is available at /home/wbhart/sage-4.0.1.rc1/sage on eno 

A binary of Magma is available in /usr/local/magma-2.15/bin 


## Machines used

eno: (a script to stop background processes for benchmarking purposes is available at /home/wbhart/script - but please stop it when done) 


```txt
4-core: model name      : Intel(R) Core(TM)2 Quad CPU    Q6600  @ 2.40GHz
```

## Benchmarks

* Sage is faster at multiplying large numbers 


```txt
sage: a=ZZ.random_element(2^100000)
sage: b=ZZ.random_element(2^100000)
sage: time c = [a*b for i in [1..10000]]
CPU times: user 6.20 s, sys: 0.00 s, total: 6.20 s
Wall time: 6.20 s

sage: aa=magma(a)
sage: bb=magma(b)
sage: magma.eval('time z:=[%s*%s : i in [1..10000]]'%(aa.name(), bb.name()))
'Time: 11.210'
```
* Sage is faster at factoring large numbers 


```txt
sage: n=ZZ.random_element(10^29).next_prime()*ZZ.random_element(10^31).next_prime()
sage: n
16930046570310043023762335280694777006455061519242383863661
sage: time qsieve(n)
CPU times: user 0.00 s, sys: 0.00 s, total: 0.01 s
Wall time: 10.05 s
([9594859962293488319946733153, 1764491262701368590074626129037], '')

sage: n=ZZ.random_element(10^34).next_prime()*ZZ.random_element(10^36).next_prime()
sage: n
875905585594859559501188824768701936589874544145799136043283226938267
sage: time qsieve(n)
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 82.13 s

([1763643785109465131425492782015799, 496645407077197397173724652476563133],
 '')
```

```txt
> n:=16930046570310043023762335280694777006455061519242383863661;
> time Factorization(n);
[ <9594859962293488319946733153, 1>, <1764491262701368590074626129037, 1> ]
Time: 30.640

> n:=875905585594859559501188824768701936589874544145799136043283226938267;
> time Factorization(n);
[ <1763643785109465131425492782015799, 1>,
<496645407077197397173724652476563133, 1> ]
Time: 284.390
```
* Sage is faster at *proving* primality 


```txt
sage: is_prime?
<SNIP>
        Returns True if `x` is prime, and False otherwise. The
        result is proven correct - *this is NOT a pseudo-primality test!*.
<SNIP>
sage: n = ZZ.random_element(2^1000)
sage: n=next_prime(n)
sage: time is_prime(n)
CPU times: user 6.02 s, sys: 0.00 s, total: 6.02 s
Wall time: 6.02 s
True
sage: nn=magma(n)
sage: magma.eval('time IsPrime(%s)'%(nn.name()))
'true\nTime: 22.330'
```
* Sage is a tad faster at computing partitions 


```txt
sage: time z=number_of_partitions(1000000)
CPU times: user 0.05 s, sys: 0.00 s, total: 0.05 s
Wall time: 0.05 s

sage: magma.eval('time z:=NumberOfPartitions(1000000)')
'Time: 233.960'

sage: 233.96/0.05
4679.20000000000
```
* .... and Bernoulli numbers 


```txt
sage: time z=bernoulli(10000);
CPU times: user 0.04 s, sys: 0.00 s, total: 0.04 s
Wall time: 0.04 s
```

```txt
> time z:=BernoulliNumber(10000);
Time: 464.250
```

```txt
464.25/0.04 = 11606.25
```
* Computing factorials (Sage is more than twice the speed). 


```txt
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
```
* Large degree polynomial multiplication modulo n (Sage is three times as fast). 


```txt
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
sage: f = magma(ff)
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(f.name(), f.name()))
'Time: 0.530'
```
* Large degree polynomial multiplication over ZZ (Sage is five times as fast). 


```txt
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
sage: magma.eval('time z:=[%s*%s^i : i in [1..40]]'%(f.name(), g.name()))
'Time: 112.820'
```
* Application of polynomial multiplication to modular forms -- Computing the q-expansion of the Delta function (sage is over 5 times faster than Magma): 
```txt
[wstein@eno sage-4.0.1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1, Release Date: 2009-06-06                       |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: time d = delta_qexp(2*10^6)
CPU times: user 17.20 s, sys: 0.73 s, total: 17.93 s
Wall time: 17.94 s
sage: magma.eval('R<q> := PowerSeriesRing(IntegerRing());')
''
sage: magma.eval('time d := Delta(q + O(q^(2*10^6)));')
'Time: 94.920'
sage: 94.920/17.94
5.29096989966555
```
* Division of a polynomial by an integer is faster in Sage 


```txt
sage: R=ZZ['x']
sage: f = 3876877658987687 * R.random_element(10000)
sage: timeit("f//3876877658987687")
625 loops, best of 3: 294 Âµs per loop
sage: ff = magma(f)
sage: magma.eval('time z:=[%s div 3876877658987687 : i in [1..1000]]'%(ff.name()))
'Time: 1.010'
sage: 0.00101/0.000294
3.43537414965986
```
* Sage is asymptotically faster for Quotrem over ZZ (used in computation of Sturm sequences) 


```txt
sage: R.<x>=ZZ['x']
sage: ff = R.random_element(degree=10000)
sage: gg = R.random_element(degree=5000)
sage: time v=ff.quo_rem(gg)
CPU times: user 0.17 s, sys: 0.02 s, total: 0.18 s
Wall time: 0.18 s

sage: f=magma(ff)
sage: g=magma(gg)
sage: magma.eval('time z:=Quotrem(%s,%s)'%(f.name(), g.name()))
'Time: 1.970'
```
* Polynomial GCD over ZZ is faster in Sage 
```txt
sage: R=ZZ['x']
sage: f=R.random_element(100)
sage: g=R.random_element(100)
sage: h=R.random_element(100)
sage: s=f*g
sage: t=f*h
sage: time v = [s.gcd(t) for i in [1..1000]]
CPU times: user 0.15 s, sys: 0.00 s, total: 0.16 s
Wall time: 0.16 s

sage: ss=magma(s)
sage: tt=magma(t)
sage: magma.eval('time u:=[Gcd(%s,%s) : i in [1..1000]]'%(ss.name(), tt.name()))
'Time: 1.230'
```
* Exact logarithm of integers is faster in Sage. 


```txt
sage: def zlog(m, n, k):
....:         for i in range(0, m/1000):
....:             a = ZZ.random_element(n)+2
....:             b = ZZ.random_element(k)
....:             c = a^b
....:             for j in range (0, 1000):
....:                 c.exact_log(a)
....:
sage: time zlog(1000000, 100, 100)
CPU times: user 0.62 s, sys: 0.23 s, total: 0.85 s
Wall time: 0.85 s
sage: time zlog(1000000, 2^50, 100)
CPU times: user 2.10 s, sys: 0.27 s, total: 2.36 s
Wall time: 2.36 s
sage: time zlog(1000000, 100, 2^10)
CPU times: user 1.75 s, sys: 0.26 s, total: 2.01 s
Wall time: 2.01 s
```

```txt
> procedure z_log(m, n, k)
procedure> for i := 0 to (m div 1000) do
procedure|for> a := Random(n) + 2;
procedure|for> b := Random(k);
procedure|for> c := a^b;
procedure|for> for j := 1 to 1000 do
procedure|for|for> d := Ilog(a, c);
procedure|for|for> end for;
procedure|for> end for;
procedure> end procedure;
> time z_log(1000000, 100, 100);
Time: 1.180
> time z_log(1000000, 2^50, 100);
Time: 5.830
> time z_log(1000000, 100, 2^10);
Time: 6.450
```
* Univariate polynomial multiplication over a finite field 


```txt
sage: p=ZZ.random_element(2^25).next_prime()
sage: p
26540959
sage: f=R.random_element(4000)
sage: g=R.random_element(4000)
sage: time z = [f*g for i in [1..100]]
CPU times: user 0.39 s, sys: 0.00 s, total: 0.39 s
Wall time: 0.39 s

sage: ff=magma(f)
sage: gg=magma(g)
sage: magma.eval('time z:=[%s*%s : i in [1..100]]'%(ff.name(), gg.name()))
'Time: 1.040'
```
* Multivariate polynomial multiplication over a finite field (Sage is more than twice as fast at this "Fateman benchmark"): 


```txt
sage: R.<x,y,z> = GF(389)[]
sage: f = (x+y+z+1)^20
sage: time g = f*(f+1)
CPU times: user 0.12 s, sys: 0.00 s, total: 0.12 s
Wall time: 0.12 s
sage: ff = magma(f)
sage: time magma.eval('time g := %s*(%s+1);'%(ff.name(),ff.name()))
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.27 s
'Time: 0.250'
```
* Multiplication of random dense matrices over GF(2)  


```txt
sage: A = random_matrix(GF(2),10^4,10^4)
sage: B = random_matrix(GF(2),10^4,10^4)
sage: time C = A*B
CPU times: user 1.41 s, sys: 0.00 s, total: 1.41 s
Wall time: 1.43 s
```

```txt
> A:=RandomMatrix(GF(2),10^4,10^4);
> B:=RandomMatrix(GF(2),10^4,10^4);
> time C := A*B;
Time: 3.720
```
* Rank of random dense matrices over GF(2) (Sage is more than twice the speed). 


```txt
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
```

```txt
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

```
* Fast HNF and determinant for integer matrices, especially as the entries get large. 
```txt
[wstein@eno sage-4.0.1]$ ./sage
----------------------------------------------------------------------
| Sage Version 4.0.1, Release Date: 2009-06-06                       |
| Type notebook() for the GUI, and license() for information.        |
----------------------------------------------------------------------
sage: a = random_matrix(ZZ,300,x=-2^128,y=2^128)
sage: time d = a.det()
CPU times: user 5.97 s, sys: 0.02 s, total: 5.98 s
Wall time: 5.99 s
sage: b = magma(a)
sage: time magma.eval('time d := Determinant(%s);'%b.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 35.59 s
'Time: 35.500'
sage: time h = a.hermite_form()
CPU times: user 23.99 s, sys: 0.10 s, total: 24.09 s
Wall time: 24.17 s
sage: time magma.eval('time h := HermiteForm(%s);'%b.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 90.31 s
'Time: 90.200'
```
A bigger det where Sage is *ten* times faster: 
```txt
sage: a = random_matrix(ZZ,1000,x=-2^128,y=2^128)
sage: time d = a.det()
CPU times: user 122.57 s, sys: 0.25 s, total: 122.82 s
Wall time: 122.90 s
sage: b = magma(a)
sage: time magma.eval('time d := Determinant(%s);'%b.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 1262.36 s
'Time: 1261.980'
```
* Characteristic polynomials of integer matrices with _large entries_ (here Sage is over 4 times faster): 
```txt
sage: a = random_matrix(ZZ,100,x=-2^512,y=2^512)
sage: time f = a.charpoly()
CPU times: user 16.76 s, sys: 0.00 s, total: 16.76 s
Wall time: 16.76 s
sage: b = magma(a)
sage: time magma.eval('time f := CharacteristicPolynomial(%s)'%b.name())
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 71.27 s
'Time: 71.120'
sage: 71.120/16.76
4.24343675417661
```
* Modular composition over GF(2) 


```txt
sage: P.<x> = GF(2)[]  
sage: d = 5*10^4; f,g,h = P.random_element(d),P.random_element(d),P.random_element(d)
sage: %time r = f.modular_composition(g,h)                                           
CPU times: user 2.69 s, sys: 0.01 s, total: 2.69 s                                   
Wall time: 2.70 s  
```

```txt
sage: fM,gM,hM = magma(f),magma(g),magma(h)
sage: t = magma.cputime(); rM = fM.ModularComposition(gM,hM); magma.cputime(t)
13.44
sage: rM == magma(r)
True
```

```txt
sage: d = 5*10^5; f,g,h = P.random_element(d),P.random_element(d),P.random_element(d)
sage: %time r = f.modular_composition(g,h)
^ACPU times: user 288.13 s, sys: 0.14 s, total: 288.26 s
Wall time: 288.34 s

sage: %time r = f.modular_composition(g,h,algorithm='ntl')
CPU times: user 303.45 s, sys: 0.04 s, total: 303.49 s
Wall time: 303.60 s

sage: fM,gM,hM = magma(f),magma(g),magma(h)
sage: t = magma.cputime(); rM = fM.ModularComposition(gM,hM); magma.cputime(t)
832.03999999999996
```
* Sage computes ranks of elliptic curves and generators, fast... and correctly (see Rogers, N.F., Rank Computations for the congruent number elliptic curves, Experimental Mathematics, 9 (2000), 591-594.) 


```txt
sage: D=6611719866
sage: E=EllipticCurve([0,0,0,-D^2,0])
sage:  time E.rank()
CPU times: user 0.01 s, sys: 0.01 s, total: 0.02 s
Wall time: 3.20 s
6
sage:  time E.gens()
CPU times: user 0.07 s, sys: 0.06 s, total: 0.13 s
Wall time: 5.89 s

[(247424194842066/37249 : 373863724821481185720/7189057 : 1),
 (165541824817/16 : 51806810701954601/64 : 1),
 (15062000442 : 1660900534642656 : 1),
 (548503784857/36 : -365985935192610019/216 : 1),
 (11638545941238203281/246490000 : 39314069377271931544287972679/3869893000000 : 1),
 (514136077885092448181278/169697035249 : -368651568597676351513664298941602072/69905505791578807 : 1)]
```

```txt
> D:=6611719866;
> E:=EllipticCurve([0,0,0,-D^2,0]);
> time Rank(E);
Warning: rank computed (2) is only a lower bound
(It may still be correct, though)
2
Time: 9.640
> time Generators(E);
Height bound (50.6331) on point search is too large -- reducing to 15.0000
This means that the computed group may only generate a group of finite
index in the actual group.
[ (-6611719866 : 0 : 1), (0 : 0 : 1), (-156630507 : -82723846945707 : 1),
(213545146551959209/902500 : -98642697824946986013197323/857375000 : 1) ]
Time: 57.970
```
* Computation with Brandt modules, i.e., using quaternion algebras to compute Hecke module isomorphic to free abelian group on enhanced supersingular elliptic curves in characteristic p  (in the example below, Sage is over 4 times faster): 


```txt
sage: time B = BrandtModule(59,15)
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.00 s
sage: time B.hecke_matrix(2)
CPU times: user 9.29 s, sys: 0.27 s, total: 9.56 s
Wall time: 9.57 s
116 x 116 dense matrix over Rational Field
sage: time B.hecke_matrix(3)
CPU times: user 0.03 s, sys: 0.00 s, total: 0.03 s
Wall time: 0.03 s
116 x 116 dense matrix over Rational Field
sage: time B.hecke_matrix(5)
CPU times: user 0.02 s, sys: 0.00 s, total: 0.02 s
Wall time: 0.02 s
116 x 116 dense matrix over Rational Field
sage: time B.hecke_matrix(7)
CPU times: user 0.02 s, sys: 0.00 s, total: 0.03 s
Wall time: 0.03 s
116 x 116 dense matrix over Rational Field


sage: magma.eval('time B := BrandtModule(59,15);')
'Time: 40.820'
sage: magma.eval('time T2 := HeckeOperator(B,2);')
'Time: 0.330'
sage: magma.eval('time T3 := HeckeOperator(B,3);')
'Time: 0.360'
sage: magma.eval('time T5 := HeckeOperator(B,5);')
'Time: 0.390'
sage: magma.eval('time T7 := HeckeOperator(B,7);')
'Time: 0.400'
```