"""
Both of these should eventually become part of the pAdicLSeries class
(or at least the ordinary version) THey could also be defined for general
p-adic power series, but their usefulness in that setting is questionable
"""

def powerseries_newton_polygon(self):
	P = self
	p = P.base_ring().prime()
	aj = P.list()
        
	"""
	when P has coefficnets like O(p^8) the sequence of commands
	f = P.polynomial(); f.newton_polygon() does not work so I replace
	O(p^8) with zero.
	"""
	new_aj = []
        for j in range(len(aj)):
                if aj[j] == 0:
                        new_aj.append(0)
                else:
                        new_aj.append(aj[j])
	K = Qp(p)
        R.<x> = K[]
        f = R(new_aj)
        newton = f.newton_polygon()
        return newton

def powerseries_mu_lambda(self):
	"""
	takes a power series over Qp and returns its mu invariant
	the user is responsible for knowing whether they have given
	enough precision in the power series for the answer to be
	reasonable
	"""
	P = self
	newton_polygon = powerseries_newton_polygon(P)
	mu_invariant = min([x[1] for x in newton_polygon])
	lambda_invariant = min([x[0] for x in newton_polygon if x[1] == mu_invariant])
	return (mu_invariant, lambda_invariant)

def X1_optimal_curve(self):
	"""
	given an EllipticCurve, returns the curve
	which is optimal for the X_1(N) parameterization. This is
	given by the curve with the maximal area in its
	fundamental parallelogram
	"""
	E = self
	isogeny_class = E.isogeny_class()[0]
	li = [(e.period_lattice().complex_area(), e) for e in isogeny_class]
	li.sort()
	return li[len(li)-1][1]

def mu_invariant(self,p,N=None,X1_optimal=False):
	"""
	self = an elliptic curve
	p = a prime
	N = integer which gives degree to which we compute
	  the p-adic L-series of E; higher N will give more sure answers
	  large N become heavy on the processor

	Find the mu-invariant of E at p
	N tells me how long to look before I just return something
	To compute quickly, we recommend N = 3.

	Example:
	E = EllipticCurve('11a3')
	p = 5
	mu = mu_invariant(E,p,N=3)
	"""
	E = self
	correction = 0	
	#switch to the X1-optimal curve
	if X1_optimal == True:
		Enew = X1_optimal_curve(E)
		correction = Enew.isogeny_degree(E).ord(p)
		E = Enew
	if N == None:
		N = max(3, floor(5*log(10)/log(p)) - 1)
	if E.has_bad_reduction(p) or E.anlist(p)[p] % p == 0:	
		raise ValueError, '%s does not have good ordinary reduction at %s' % (E.cremona_label(), p)
	L = E.padic_lseries(p)
	P = L.series(N)
	return powerseries_mu_lambda(P)[0] + correction

def lambda_invariant(self,p,N=None,X1_optimal=False):
	"""
	self = padic L-series attached to an elliptic curve

	Find the lambda-invariant of E at p using the Newton polygon
	If you want more accurate answers, you should raise N to compute more terms
	in the E.padic_lseries(p). To compute quickly, we highly recommend
	N = 3 (but less accurately)

	Example:
        E = EllipticCurve('11a3')
        L = E.padic_lseries(5)
        lambda_inv = lambda_invariant(L,N=3)
	"""
	E = self
	#switch to the X1-optimal curve
	if X1_optimal == True:
		E = X1_optimal_curve(E)

	if N == None:
		N = max(3, floor(5*log(10)/log(p)) - 1)
	if E.has_bad_reduction(p) or E.anlist(p)[p] % p == 0:	
		raise ValueError, '%s does not have good ordinary reduction at %s' % (E.cremona_label(), p)
	L = E.padic_lseries(p)
	P = L.series(N)
	return powerseries_mu_lambda(P)
