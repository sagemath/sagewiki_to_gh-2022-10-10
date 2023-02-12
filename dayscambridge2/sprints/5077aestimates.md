

## Discussion of verifying kolyvagin for rank 3 curve 5077a


```txt
We have
\begin{verbatim}
sage: E = EllipticCurve('5077a')
sage: for p in prime_range(30):
...       print p, gcd(E.ap(p),p+1)
2 1
3 1
5 2
7 4
11 6
13 2
17 2
19 1
23 6
29 6
sage: E.heegner_discriminants_list(10)
[-7, -19, -40, -47, -55, -59, -71, -79, -84, -88]
sage: for D in E.heegner_discriminants_list(20):
...       K.<a> = QuadraticField(D)
...       if D%11 and len(K.factor(11)) == 1 and len(K.factor(23)) == 1:
...           print D, K.class_number()
-47 5
-59 3
-71 7
-104 6
-115 2
sage: K.<a> = QuadraticField(-115)
sage: p = 3; c = 11*23
sage: c
253
sage: 12*24*3
864
sage: for p in prime_range(50):
...       if len(K.factor(p)) == 1:
...          print p, gcd(E.ap(p),p+1)
2 1
3 1
5 2
11 6
13 2
19 1
23 6
47 3
\end{verbatim}

Thus if we take $D=-115$, $c=23 \cdot 47$, and $\ell=11$.  Then my
purported maybe algorithm would compute:

$$P_c\pmod{\ell} \in E(\mathbf{F}_{\ell^2})[3].$$

With luck, this will just happen to turn out to be nonzero hence
verify Kolyvagin's conjecture provably.  If it isn't we can try
$\ell=23$ or $\ell=47$ with $c'=11\cdot 23\cdot 47/ \ell$.

We would have to do computations in 
$$
  \Div(X_0(5077)_{\F_{11}}^{\ss})
$$
We have
\begin{verbatim}
sage: dimension_new_cusp_forms(5077*11,2,11)
4233
\end{verbatim}
Doing linear algebra on that space over $\F_3$ is completely
reasonable.  But computing the Kolyvagin point directly over a number
field of degree 2162 would be impossibly hard, since the height would
be crazy ginormous.    Maybe one could get the field down to
degree $2\cdot 11\cdot 23 = 506$, but even then the height is likely
to make this just impossible. 

With my new algorithm idea, though, I think it this computation is
possible.  In fact, maybe it will just be as hard as computing
a 1-dimensional eigenspace in characteristic $3$ of a sparse
matrix of size $4233$, which is computationally... possible.
```
This seems very feasible, but requires working with class number > 1, which in theory should be fine.  

Here is some more than Jen and I did tonight: 
```txt
sage: K.<a> = QuadraticField(-7)
sage: E = EllipticCurve('5077a')
sage: for p in prime_range(400):
...       if len(K.factor(p))==1:
...          print p, factor(gcd(E.ap(p),p+1))
3 1
5 2
7 2^2
13 2
17 2
19 1
31 2
41 2 * 3 * 7
47 3
59 1
61 2
73 2
83 2
89 1
97 2
101 2
103 2^3 * 13
131 1
139 2^2
157 2
167 2^3
173 3
181 1
199 1
223 7
227 2
229 2 * 5
241 1
251 2^2
257 2 * 3
269 2
271 2
283 2^2
293 3
307 1
311 2^3
313 2
349 5 * 7
353 2
367 2^4
383 3
397 2
sage: dimension_new_cusp_forms(5077*41,2,41)
16927
sage: dimension_new_cusp_forms(5077*229,2,229)
96481
sage: for D in E.heegner_discriminants_list(20):
...         K.<a> = QuadraticField(D)
...         if D%11 and len(K.factor(23)) == 1:
...              print D, K.class_number()
-47 5
-59 3
-71 7
-104 6
-115 2
-127 5
-131 5
-151 7
sage: for D in E.heegner_discriminants_list(20):
...         K.<a> = QuadraticField(D)
...         if D%11 and len(K.factor(29)) == 1:
...              print D, K.class_number()
-19 1
-40 2
-47 5
-79 5
-84 4
-104 6
-127 5
-131 5
sage: dimension_new_cusp_forms(5077*29,2,29)
11849
sage: E = EllipticCurve('5077a')
sage: for p in prime_range(50):
...       print p, gcd(E.ap(p),p+1)
2 1
3 1
5 2
7 4
11 6
13 2
17 2
19 1
23 6
29 6
31 2
37 38
41 42
43 4
47 3
```