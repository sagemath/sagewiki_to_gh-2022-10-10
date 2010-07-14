= Some relative number fields arithmetic benchmarks =

These examples have the patch from [[http://trac.sagemath.org/sage_trac/ticket/9500|trac 9500]] applied.

{{{
sage: R.<x> = QQ[]
sage: K.<a,b> = NumberField([x^19 + 17*x^3 + 2*x - 3, x^3 + 2*x - 17])
sage: R.<a0,b0> = QQ[]
sage: S.<aa,bb> = R.quotient([a0^5 + 17*a0^3 + 2*a0 - 3, b0^3 + 2*b0 - 17])
sage: timeit('a*b')
125 loops, best of 3: 3.79 ms per loop
sage: timeit('aa * bb')
625 loops, best of 3: 45.2 µs per loop
sage: 3.79 / 0.0452
83.8495575221239
sage: time c = a/b
Time: CPU 29.65 s, Wall: 30.35 s
sage: time cc = aa / bb
Time: CPU 0.00 s, Wall: 0.00 s
sage: timeit('aa/bb')
625 loops, best of 3: 262 µs per loop
sage: 29.65/0.000262
113167.938931298
sage: time z = [aa/bb for i in [1..1000]]
Time: CPU 0.27 s, Wall: 0.28 s
sage: time z = [aa*bb for i in [1..1000]]
Time: CPU 0.05 s, Wall: 0.05 s
sage: gb = S.defining_ideal().groebner_basis()
sage: time z = [(a0*b0).reduce(gb) for i in [1..100000]]
Time: CPU 0.89 s, Wall: 1.19 s
}}}

Scary -- so quotient polynomial rings give a speedup by a factor of over 100000 (!) for division in this example. This is worth doing. 



Compare to Magma:
{{{
R<x> := PolynomialRing(RationalField());
K<a,b>:= NumberField([x^19 + 17*x^3 + 2*x - 3, x^3 + 2*x - 17]);
time z := [a*b : i in [1..100000]];
Time: 0.750
time z := [a/b : i in [1..1000]];
Time: 0.140
}}}

In this example, Sage is a little slower, but not by much. 
