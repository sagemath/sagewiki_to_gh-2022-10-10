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

Similar timings for computing the square of the matrix $T_2$, i.e., for
matrix multiplication:


|| prime || Sage || PARI  || Magma ||
|| 23    ||  0.05s  || 0.01s    ||  0.01s ||
|| 67    || 0.43s   || 0.05s||  0.01s ||
|| 199   || 9.89s   || 0.64s ||  0.06s  ||

So Magma's matrix multiply is vastly superior to what is in Sage, but only because
Sage's multiply is very stupid and generic. 
