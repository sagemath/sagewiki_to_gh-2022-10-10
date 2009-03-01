\\partial_dual	for an integral lattice L, given by the Gram matrix gr,
\\		and a divisor p of the exponent of L#/L (level of L), 
\\		this function determines a Gram matrix   
\\		for the partial dual D_p(L),
\\		which is defined as L# \cap (1/p)L, rescaled by p.
\\		Rudolf Scharlau, 2009-02-28
\\		Example: the well-known Gram matrix fpr the root lattice
\\		A3 is e.g. [2,1,1;1,2,1;1,1,2]; use p=1,2,4.
{partial_dual(gr,p)=
grinv=gr^-1;
level=denominator(matdet(grinv));
new=concat((level/p)*grinv,gr^0);
bas=new*qflll(p*new,1);
grnew=p*bas~*gr*bas;
tt=qflllgram(grnew,1);
grnewred=tt~*grnew*tt;
grnewred;
}


