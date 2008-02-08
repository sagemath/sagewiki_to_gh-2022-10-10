= Fast Hermite Normal Form over ZZ =

MuPAD
{{{
>> A := linalg::randomMatrix(50,50,Dom::Integer, 10);
Warning: This matrix is too large for display. If you want to see all non-zero entries of large matrices, use doprint(..). [(Dom::Matrix(Dom::Integer))::print]

                                              Dom::Matrix(Dom::Integer)(50, 50, ["..."])
>> time(linalg::hermiteForm(A));                     

                                                                26445

}}}

== Benchmark 1: Random 200x200 single-digit matrix ==

Mathematica code:
{{{
sage: mathematica.eval('a = Table[RandomInteger[{0,9}], {i,200}, {j,200}];')

sage: mathematica.eval('Timing[HermiteDecomposition[a];]')
        {98.9791, Null}
}}}


Maple code:
{{{

> with(LinearAlgebra); n := 200: k := 9: A := RandomMatrix(n,n,generator=rand(-k..k)): time( HermiteForm(A,output=['H', 'U']) );

60.431 seconds
}}}


Sage (via PARI):
{{{
sage: a = random_matrix(ZZ,200)
sage: time v = a.echelon_form()
CPU times: user 43.72 s, sys: 0.27 s, total: 43.98 s
Wall time: 44.36
}}}

Sage (via NTL):
{{{
sage: a = random_matrix(ZZ,200, x=-9, y=9)
sage: time e = a.echelon_form(algorithm='ntl')
CPU times: user 26.11 s, sys: 0.27 s, total: 26.38 s
Wall time: 35.52
}}}


{{{
sage: a = random_matrix(ZZ,200)
sage: z = magma(a)
sage: t = magma.cputime()
sage: time w = z.HermiteForm()
CPU times: user 0.00 s, sys: 0.00 s, total: 0.00 s
Wall time: 0.82
sage: magma.cputime(t)
0.68999999999999995
}}}

== Benchmark 1: Random 200x200 matrix with 32-bit entries ==
