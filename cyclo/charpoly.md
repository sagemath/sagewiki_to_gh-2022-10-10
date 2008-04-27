= Fast characteristic polynomial algorithm over cyclotomic fields =

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
}}}


The timings themselves are as follows, all on an Opteron 1.8Ghz.

|| prime || Sage/PARI  || Magma ||
|| 23    ||  0.47s     ||  0.03s ||
|| 67    || 10.23s     ||  1.48s ||
|| 199   || 531s       ||  438s  ||

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
 
