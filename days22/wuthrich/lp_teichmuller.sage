

# code to compute the series representation

E = EllipticCurve('11a1')

n=10; prec=10
Lserie = E.padic_lseries(5)
alp = Lserie.alpha(prec)
MSP = E.modular_symbol()
MSM = E.modular_symbol(sign=-1)

p = Lserie._p
bounds = Lserie._prec_bounds(n,prec)
padic_prec = max(bounds[1:]) + 5
res_series_prec=min(p**(n-1),prec)

K = QQ
gamma = K(1+p)
R = PowerSeriesRing(K,'T',res_series_prec)
T = R(R.gen(),res_series_prec)
L = R(0) #going to be the L-series eventually
one_plus_T_factor = R(1)
gamma_power = K(1)
teich = Lserie.teichmuller(padic_prec)
pt = 2 # the power of Teichmuller
p_power = p**(n-1)

for j in range(p_power):
   s = K(0)
   for a in range(1,p):
       b = teich[a]*gamma_power
       if pt & 2 == 0:
           s += teich[a]^pt * ( (1/alp)^n * MSP((b)/(p^n) ) -
(1/alp)^(n+1) * MSP((b)/(p^(n-1))) ) # mu(b + p^nZ_p)
       else:
           s += teich[a]^pt * ( (1/alp)^n * MSM((b)/(p^n) ) -
(1/alp)^(n+1) * MSM((b)/(p^(n-1))) )
   L += s * one_plus_T_factor
   one_plus_T_factor *= (1+T)
   gamma_power *= gamma

print 'L before p-adic approx is %s' % L

K = Qp(p,padic_prec,print_mode='series')
R = PowerSeriesRing(K,'T',res_series_prec)
Lprime = R(L,res_series_prec)
print 'Lprime is %s' % Lprime
aj = Lprime.list()
if len(aj) > 0:
      aj = [aj[0].add_bigoh(padic_prec-2)] +
[aj[j].add_bigoh(bounds[j]) for j in range(1,len(aj))]
L = R(aj,res_series_prec )
if pt & 2 == 0:
   L = L / Lserie._E.real_components()
else:
   L = L

print 'The 5-adic L-function of 11A1 twisted by the (pt)-th power of
the Teichmuller character is %s ' % L