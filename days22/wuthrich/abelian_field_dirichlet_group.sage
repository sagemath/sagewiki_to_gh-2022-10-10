def conductor(self):
	R = self.maximal_order()
	m = 1
	for p in R.discriminant().prime_factors():
		m*=p^(R.fractional_ideal(p).prime_factors()[0].ramification_index().valuation(p)+1)
	return m


def conductorf(self):
	m = 1
	dsc = self.polynomial().discriminant()
	A = dsc.numerator().prime_factors()+dsc.denominator().prime_factors()
	for p in A:
		R = self.maximal_order(p)
		e = R.fractional_ideal(p).prime_factors()[0].ramification_index()
		if e!=1:
			m*=p^(e.valuation(p)+1)
	return m


def dirichlet_group(self):
	m = conductor(self)
	d = self.degree()
	G = IntegerModRing(m)
	R = self.ring_of_integers()
	A = [G.0]
	j = 2*G.0
	while (len(A)==euler_phi(m)/d)==False:
		if (j in A)==False and gcd(j,m)==1:
			b = j.lift()
		while b.is_prime()==False:
			b = b+m
		c = j^(R.ideal(b).prime_factors()[0].residue_class_degree())
		k = c
		B = A
		if (k in A)==False:
			while (k==1)==False:
				for x in A:
					if (k*x in B)==False:
						B.append(k*x)
				k = k*c
		for y in B:
			if (y in A)==False:
				A.append(y)
		j = j + G.0
	n = len(A)
	G = DirichletGroup(m)
	H = []
	i = 0
	while (len(H)==d)==False:
		t = 0
		q = 1
		while t < n and q==1:
			q = G[i](A[t])
			t = t+1
		if t == n:
			H.append(G[i])
		i = i+1
	return H