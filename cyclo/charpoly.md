= Fast characteristic polynomial algorithm over cyclotomic fields =


UPDATE: A first real version of this is now done.  See the first two patches at 
    https://trac.sagemath.org/ticket/3042
The timings for this new code on sage.math are given in the table below under "Sage Multimod". 
Also a theoretical thing to do is give an a priori provable bound on the number of primes needed 
to get the charpoly via CRT.
Right now it just waits until 3 successive charpolys stabilize.
Or rather, adding in 3 primes gives the same charpoly.
That will in practice always work, but isn't proved.
And, it is probably slower than just starting with the right bound.


Craig: I thought for a minute about a bound for the size of
coefficients in the charpoly. I came up with a pretty trivial seeming
bound (what I would now call a "Hadamard-type" bound), so I looked it
up. I found this paper:

 https://arxiv.org/abs/cs/0610136

I don't know anything about the people in the world of computational
linear algebra, but this guy has written papers with Clement, and the
FFLAS website is maintained by him, so I figured it was probably the
right thing to be looking at. :) So there are two lemmas in the paper
that provide a bound for the size of the largest coefficient in the
charpoly. I implemented the first of them, and it looked pretty good.
Then I implemented the second, and it was wildly worse! It's presented
as though it's a sharpening, but I couldn't figure out how, at least
in the examples I tried out. I think they may be doing it for a
different reason, but in any event, it seemed like we were better off
with the first bound. I left the code for both in, with the second in
comments, if you want to try it out. I also put in the naive estimates
for n = 1,2,3 (the result in the paper is for n > 3): if there's
something better, let me know. Maybe we should just directly compute
the charpoly in those cases, since it's easy to write down?


Using this code with 23 replaced by 23, 67, and 199 I benchmarked both Sage and Magma
on various machines.  Here Sage is just using PARI.   For 23, Magma is 10 times faster.
For 67, Magma is 5-10 times faster.  For 199, Magma and Sage are almost the same.
So probably they are using exactly the same algorithm, but Magma is more optimized
for the small cases. 
{{{
ModularSymbols_clear_cache()
eps = DirichletGroup(23*3, CyclotomicField(11)).1^2
M = ModularSymbols(eps); M
t = M.hecke_matrix(2)
time t.charpoly()
}}}

Magma code to make the matrix and benchmark charpoly:
{{{
eps := DirichletGroup(67*3, CyclotomicField(11)).2^2;
M := ModularSymbols(eps,2,0);
t := HeckeOperator(M,2);
time f := CharacteristicPolynomial(t);
}}}


The timings themselves are as follows, all on an Opteron 1.8Ghz.

|| prime || nrows || Sage/PARI  || Magma ||  Sage Multimod ||
|| 23    || 16    || 0.47s     ||  0.03s ||  0.11s ||
|| 67    || 44    || 10.23s     ||  1.48s ||  0.11s ||
|| 199   || 132   || 531s       ||  438s  ||  5.34s ||
|| 331   || 220   || ?         ||  8611.50s   || 19.22s ||

The 331 matrix is 220x220, and our new algorithm is already ''448 times faster than Magma'' in that case.

By the way, here are similar timings for computing the square of the matrix $T_2$, i.e., for
matrix multiplication:


|| prime || Sage || PARI  || Magma ||
|| 23    ||  0.05s  || 0.01s    ||  0.01s ||
|| 67    || 0.43s   || 0.05s||  0.01s ||
|| 199   || 9.89s   || 0.64s ||  0.06s  ||

So Magma's matrix multiply is vastly superior to what is in Sage, but only because
Sage's multiply is very stupid and generic.

Regarding charpoly above, the answer isn't very big. Each coefficient looks like this
in size:
{{{
-13699065951748748504444162373*zeta_11^9 - 30666629423224882851453031398*zeta_11^8 - 
    17759717829637529333530323750*zeta_11^7 + 18956836030606298117040309088*zeta_11^6 - 
    17759717829637529333530323750*zeta_11^5 - 30666629423224882851453031398*zeta_11^4 - 
    13699065951748748504444162373*zeta_11^3 - 21360349014330060044744277916*zeta_11 - 
    21360349014330060044744277916
}}}

Probably that should take at most 350/5 = 70 primes to get using a multimodular algorithm.
In magma, charpoly of a random 132x132 matrix over GF(10007) done 70 times takes 0.63 seconds.
The same in Sage takes 2.46 seconds.  This time plus the overhead of CRT should be about
the time it takes to do the charpoly.  (On OS X Sage takes 1.07 seconds and Magma 0.43 seconds.) 
So I don't see why Sage shouldn't be able to do this charpoly in about 10 seconds. 

Here is a little demo proof-of-concept illustrating computing the 67 charpoly more quickly
by doing it over ZZ and using p-adic reconstruction.   I do ''not'' think this is the way 
to go -- I think straight multimodular is -- but this already illustrates that both PARI and
Magma are pretty stupid right now.

{{{
def padic_cyclotomic_reconstruction(K, w, p, prec, phi):
    n = K.degree()
    zeta = K.gen()
    X = [zeta^i for i in range(n)] + [w]
    A = matrix(ZZ, n + 2, n + 2)
    for i in range(len(X)):
         A[i,i] = 1
         A[i,n+1] = Mod(phi(X[i]), p^prec).lift()
    A[n+1, n+1] = p^(prec-1)
    L = A.LLL()
    #print L
    rr = L[1].copy()
    rr[0] -= rr[-1] 
    alpha = -1/rr[-2]
    lin_comb = rr[:-2]*alpha
    return K(lin_comb.list())


def charpoly_cyclo(A, prec=20, pstart=389):
    # Compute charpoly of A using p-adic cyclotomic algorithm.
    K = A.base_ring()
    n = K.number_of_roots_of_unity()
    p = pstart
    while p % n != 1:
        p = next_prime(p)
    print "p = ", p
    f = K.defining_polynomial()
    C = pAdicField(p, prec)
    R = f.roots(C)
    phi = K.hom(QQ(R[0][0].lift()), check=False)
    pp = p^prec
    B = matrix(QQ, A.nrows(), A.ncols(), [phi(w)%pp for w in A.list()])
    time f = B.charpoly()
    return [padic_cyclotomic_reconstruction(K, w, p, prec, phi) 
               for w in f.list()]
///
}}}

{{{
ModularSymbols_clear_cache()
eps = DirichletGroup(67*3, CyclotomicField(11)).1^2
M = ModularSymbols(eps); M
t = M.hecke_matrix(2)
time f = t.charpoly()
///

Time: CPU 8.30 s, Wall: 8.78 s
}}}

{{{
time B = charpoly_cyclo(t, 30, next_prime(10000))
///

p =  10099
Time: CPU 2.26 s, Wall: 2.64 s
CPU time: 3.56 s,  Wall time: 4.14 s
}}}

{{{
B[0]
///

13383*zeta11^9 + 2223*zeta11^8 + 12771*zeta11^7 + 783*zeta11^6 + 783*zeta11^5 + 12771*zeta11^4 + 2223*zeta11^3 + 13383*zeta11^2 + 24129
}}}

{{{
f[0]
///

13383*zeta11^9 + 2223*zeta11^8 + 12771*zeta11^7 + 783*zeta11^6 + 783*zeta11^5 + 12771*zeta11^4 + 2223*zeta11^3 + 13383*zeta11^2 + 24129
}}}

{{{
B[10]
///

-588700556*zeta11^9 - 965692897*zeta11^8 + 754459476*zeta11^7 + 1319584698*zeta11^6 + 754459476*zeta11^5 - 965692897*zeta11^4 - 588700556*zeta11^3 - 2199625369*zeta11 - 2199625369
}}}

{{{
f[10]
///

-588700556*zeta11^9 - 965692897*zeta11^8 + 754459476*zeta11^7 + 1319584698*zeta11^6 + 754459476*zeta11^5 - 965692897*zeta11^4 - 588700556*zeta11^3 - 2199625369*zeta11 - 2199625369
}}}
