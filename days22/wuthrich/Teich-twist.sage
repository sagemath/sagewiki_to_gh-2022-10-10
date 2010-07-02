def Teich_twist(E = EllipticCurve('11a1'),p=5,pt=2,n=5,prec=5):
    Lserie = E.padic_lseries(p)
    alp = Lserie.alpha(prec)
    MSP = E.modular_symbol()
    MSM = E.modular_symbol(sign=-1)

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
    p_power = p**(n-1)

    for j in range(p_power):
        s = K(0)
        for a in range(1,p):
            b = teich[a]*gamma_power
            if pt & 2 == 0:
                s += teich[a]^pt * ( (1/alp)^n * MSP((b)/(p^n) ) - (1/alp)^(n+1) * MSP((b)/(p^(n-1))) )
            else:
                s += teich[a]^pt * ( (1/alp)^n * MSM((b)/(p^n) ) - (1/alp)^(n+1) * MSM((b)/(p^(n-1))) )
        L += s * one_plus_T_factor
        one_plus_T_factor *= (1+T)
        gamma_power *= gamma
    print 'Ellptic Curve : %s' % E.cremona_label()
    print 'prime : %s ' % p
    print 'the power of Teichmuller : %s ' % pt
    print 'n : %s' % n
    print 'precision : %s' % prec

    Kp = Qp(p,padic_prec,print_mode='series')
    Rp = PowerSeriesRing(Kp,'T',res_series_prec)
    Lprime = Rp(L,res_series_prec)
    aj = Lprime.list()
    if len(aj) > 0:
           aj = [aj[0].add_bigoh(padic_prec-2)] + [aj[j].add_bigoh(bounds[j]) for j in range(1,len(aj))]
    L = Rp(aj,res_series_prec ) 
    if pt & 2 == 0:
        L = L / Lserie._E.real_components()
    else:
        L = L

    print 'The p-adic L-function of a given elliptic curve twisted by the given power of the Teichmuller character is'
    print L
