= Fast Hermite Normal Form over ZZ =


Mathematica code:
{{{
sage: mathematica.eval('a = Table[RandomInteger[{0,9}], {i,200}, {j,200}];')

sage: mathematica.eval('Timing[HermiteDecomposition[a];]')
        {98.9791, Null}
}}}


Maple code:
{{{

n := 200: k := 9: A := RandomMatrix(n,n,generator=rand(-k..k)): time( HermiteForm(A,output=['H', 'U']) );

}}}
