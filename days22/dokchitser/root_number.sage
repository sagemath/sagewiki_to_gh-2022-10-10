def root_number(self, P=None):
    r"""
    Returns the global or local root number of this elliptic curve.

    The computations are based on:
    "Galois theory, elliptic curves, and root numbers" -- D. Rohrlich
    (P|3) "The local root number of elliptic curves with wild ramification" -- S. Kobayashi
    (P|2) "Root numbers of elliptic curves in residue characteristic 2" -- T. and V. Dokchitser

    INPUT::

         - `P` -- optional, default (None); if given, return the local
                  root number at the prime ideal `P`

    EXAMPLES::
    
        sage: K.<a>=NumberField(x^4+2)
        sage: E = EllipticCurve(K, [1, a, 0, 1+a, 0])
        sage: E.root_number()
        1
        sage: E.root_number(K.ideal(a+1))
        1
    """
    if P is None:
        # contribution from places at infinity
        s = self.base_field().signature()
        rn = (-1)^(s[0] + s[1])
        # contribution from places where E has bad reduction
        for d in self.local_data():
            rn = _root_number_local(self, d.prime()) * rn
        return rn
    else:
        return _root_number_local(self, P)


def _root_number_local(E, P):
    r"""
    Returns the local root number of this elliptic curve at `P`.

    The computation for primes not dividing 2 or 3 is based on:
    "Galois theory, elliptic curves, and root numbers" -- D. Rohrlich

    INPUT::

         - `P` -- return the local root number at the prime ideal `P`
    """
    K = E.base_field()
    d = E.local_data(P)
    if d.has_good_reduction() or d.has_nonsplit_multiplicative_reduction():
        return 1
    elif d.has_split_multiplicative_reduction():
        return -1
    else: # additive reduction
        j = E.j_invariant()
        jv = j.valuation(P) if not K is QQ else valuation(j, P.gen())
        if jv < 0:
            # potential multiplicative reduction
            if P.base_ring() is ZZ:
                return hilbert_symbol(-1, -E.c6(), P.gen())
            else:
                return generalized_hilbert_symbol(-1, -E.c6(), P)
                # return hilbert_symbol_magma(-1, -E.c6(), P)
        else:
            # potential good reduction
            p = P.gen() if K is QQ else P.smallest_integer()
            if p==2: # prime | 2
                return _root_number_local_2(E, P)
            if p==3: # prime | 3
                return _root_number_local_3(E, P)

            if K is QQ:
                f = 1
                e = 12 / gcd(12, valuation(E.discriminant(), p))
            else:
                f = P.residue_class_degree()
                e = 12 / gcd(12, E.discriminant().valuation(P))

            if f%2==0 or e==1:
                eps = 1
            elif e==2 or e==6:
                eps = legendre_symbol(-1, p)
            elif e==3:
                eps = legendre_symbol(-3, p)
            elif e==4:
                eps = legendre_symbol(-2, p)
            return eps


def _root_number_local_3(E, P):
    r"""
    Returns the local root number of this elliptic curve at `P`
    where `P` is a prime ideal dividing 3 at which this elliptic
    curve has (bad) potential good reduction.

    The computation for primes dividing 3 is based on:
    "The local root number of elliptic curves with wild ramification" -- S. Kobayashi

    INPUT::

         - `P` -- return the local root number at the prime ideal `P`
    """
    def _val(a, P):
        if P.base_ring() is ZZ:
            return valuation(a, P.gen())
        return a.valuation(P)
    def quadr_residue_symbol(a):
        return Kr(a).is_square() and 1 or -1
    def quadr_symbol(a):
        av =  _val(a, P)
        if av%2==1:
            return -1
        if P.base_ring() is ZZ:
            pi = P.gen()
        else:
            pi = P.number_field().uniformizer(P)
        b = a / pi^av
        return quadr_residue_symbol(b)
    # assume potential good reduction
    Es = E.local_data(P).minimal_model(tidy=False)
    Es = Es.short_weierstrass_model(complete_cube=False)

    disc = Es.discriminant()
    vD = _val(disc, P)
    Kr = P.residue_field()

    ks = str(Es.kodaira_symbol(P))
    if ks=='I0' or ks=='I0*':
        assert vD%2==0, "error -- valuation of discriminant should be even"
        return quadr_residue_symbol(-1)^(vD/2)
    elif ks=='III' or ks=='III*':
        return quadr_residue_symbol(-2)
    else: 
        assert ks=='II' or ks=='II*' or ks=='IV' or ks=='IV*', "error -- unexpected kodeira symbol"
        d = quadr_symbol(disc)
        c = Es.a6()
        cv = _val(c, P)
        assert cv%3!=0, "error -- 3 should not divide the valuation of the constant term anymore"
        if P.base_ring() is ZZ:
            hs = hilbert_symbol(disc, c, P.gen())
        else:
            hs = generalized_hilbert_symbol(disc, c, P)
        qr1 = quadr_residue_symbol(cv)^vD
        qr2 = quadr_residue_symbol(-1)^(vD*(vD-1)/2)
        return d*hs*qr1*qr2


def _root_number_local_2(E, P):
    r"""
    Returns the local root number of this elliptic curve at `P`
    where `P` is a prime ideal dividing 2 at which this elliptic
    curve has (bad) potential good reduction.

    The computation for primes dividing 2 is based on:
    "Root numbers of elliptic curves in residue characteristic 2" -- T. and V. Dokchitser

    INPUT::

         - `P` -- return the local root number at the prime ideal `P`
    """
    K = E.base_field()

    if K is QQ:
        rn = -1
    else:
        rn = (-1)^(P.residue_class_degree() * P.ramification_index())

    t = polygen(K)
    assert E.a1() == 0
    assert E.a3() == 0
    f = t^3+E.a2()*t^2+E.a4()*t+E.a6()

    d = 1
    roots = []
    for g,_ in f.factor():
        if g.degree() == 1:
            roots += g.roots(multiplicities=False)
        if g.degree() == 2:
            d = 2
            K2.<a2> = K.extension(g)
            # roots += g.change_ring(K2).roots(multiplicities=False)
        if g.degree() == 3:
            d = 3
            K3.<a3> = K.extension(g)
            for h,_ in g.change_ring(K3).factor():
                if h.degree() == 1:
                    # roots += h.roots(multiplicities=False)
                    pass
                if h.degree() == 2:
                    d = 6
                    K6.<a6> = K3.extension(h)
                    # roots += h.change_ring(K6).roots(multiplicities=False)

    # print "d = ", d

    def _val(a, P):
        if P.base_ring() is ZZ:
            return valuation(a, P.gen())
        return a.valuation(P)

    def _change_ring(E, K, toK):
        return EllipticCurve(K, [0, toK(E.a2()), 0, toK(E.a4()), toK(E.a6())])

    def _translate_w_2_isogeny(E, r):
        E1 = E.change_weierstrass_model(1,r,0,0)
        E2 = EllipticCurve(E.base_field(), [0,-2*E1.a2(),0,E1.a2()^2-4*E1.a4(),0])
        # print E.is_isogenous(E2)
        return E2

    def _compute_H(E, P, ord2=True, ord3=False):
        # print E
        t = E.tamagawa_number(P)
        # print t
        if ord2:
            cv = valuation(t,2) + _u_of_E(E, P)
            H2 = 1 if cv%2==0 else -1
        if ord3:
            cv = valuation(t,3)
            H3 = 1 if cv%2==0 else -1
        if ord2 and ord3: return (H2, H3)
        if ord2: return H2
        return H3

    def _u_of_E(E, P):
        disc = E.discriminant()
        Emin = E.local_data(P).minimal_model(tidy=False)
        discmin = Emin.discriminant()
        assert _val(discmin, P) == E.local_data(P)._val_disc
        # print "quot = ", disc/discmin
        # return (disc/discmin).norm()^(1/12)
        # print "quot = ", (disc/discmin).valuation(P) / 12
        # print "rd = ", P.residue_class_degree()
        # if not E.base_field() is QQ:
            # print P.ramification_index()
        if E.base_field() is QQ:
            return Integer(_val(disc/discmin, P) / 12)
        else:
            # print P, disc/discmin, P.residue_class_degree()
            return Integer(P.residue_class_degree() * _val(disc/discmin, P) / 12)
            # return Integer(_val(disc/discmin, P) / 12)

    if d==1:
        # print roots
        H = _compute_H(E, P)
        E1 = _translate_w_2_isogeny(E, roots[0])
        H1 = _compute_H(E1, P)
        E2 = _translate_w_2_isogeny(E, roots[1])
        H2 = _compute_H(E2, P)
        E3 = _translate_w_2_isogeny(E, roots[2])
        H3 = _compute_H(E3, P)
        return rn * H * H1 * H2 * H3
    elif d==2:
        H = _compute_H(E, P)
        # 2-isogenous curve over base field
        # print roots[0]
        E1 = _translate_w_2_isogeny(E, roots[0]) # root[0] is the root over the base field
        # print E1
        H1 = _compute_H(E1, P)

        # a2 in K2 is root not in base field
        #TODO: over QQ not necessary
        K2b.<b2> = K2.absolute_field()
        from2, to2 = K2b.structure()
        # Unfairly picking one prime factor
        # Pfactors = K2b.ideal([ to2(pgen) for pgen in P.gens() ]).factor()
        # print Pfactors
        # P2b = K2b.ideal([ to2(pgen) for pgen in P.gens() ]).factor()[0][0]
        for P2b,_ in K2b.ideal([ to2(pgen) for pgen in P.gens() ]).factor():
            # print P2b
            E2b = _change_ring(E1, K2b, to2)
            H2 = _compute_H(E2b, P2b)
            # print "H2 = ", H2

            E2b = _change_ring(E, K2b, to2)
            E3b = _translate_w_2_isogeny(E2b, to2(a2))
            assert E3b.a6() == 0
            H3 = _compute_H(E3b, P2b)
            rn = rn * H2 * H3

        # print H, H1, H2, H3

        return rn * H * H1
    elif d==3:
        # a3 in K3
        K3b.<b3> = K3.absolute_field()
        from3, to3 = K3b.structure()
        # Unfairly picking one prime factor
        # print K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()
        for P3b,_ in K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor():
            # P3b = K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()[0][0]
            E3b = _change_ring(E, K3b, to3)
            H = _compute_H(E3b, P3b)
            # print "H = ", H
            E3bt = _translate_w_2_isogeny(E3b, to3(a3))
            H2 = _compute_H(E3bt, P3b)
            # print H, H2
            rn = rn * H * H2
        # print "H2 = ", H2
        return rn
    elif d==6:
        # a3 in K3
        K3b.<b3> = K3.absolute_field()
        from3, to3 = K3b.structure()
        # Unfairly picking one prime factor
        P3b = K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()[0][0]
        E3b = _change_ring(E, K3b, to3)
        H = _compute_H(E3b, P3b)

        E3bt = _translate_w_2_isogeny(E3b, to3(a3))
        H2 = _compute_H(E3bt, P3b)

        # a6 in K6
        K6b.<b6> = K6.absolute_field()
        from6, to6 = K6b.structure()
        # Unfairly picking one prime factor
        P6b = K6b.ideal([ to6(pgen) for pgen in P.gens() ]).factor()[0][0]
        E6b = _change_ring(E, K6b, to6)
        H3, H33 = _compute_H(E6b, P6b, ord2=True, ord3=True)

        E6bt = _translate_w_2_isogeny(E6b, to6(a3))
        H4 = _compute_H(E6bt, P6b)

        x = polygen(K)
        Kd.<d> = K.extension(x^2 - E.discriminant())
        KDb.<bd> = Kd.absolute_field()
        fromD, toD = KDb.structure()
        # Unfairly picking one prime factor
        PDb = KDb.ideal([ toD(pgen) for pgen in P.gens() ]).factor()[0][0]
        EDb = _change_ring(E, KDb, toD)
        HD = _compute_H(EDb, PDb, ord2=False, ord3=True)

        return rn * H * H2 * H3 * H33 * H4 * HD

    raise NotImplementedError("additive reduction over a prime dividing 2")


