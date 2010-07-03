def problems(E):
    for d in E.local_data():
        problems_local(E, d.prime())

def problems_local(E, P):
    print "at", P, "we feel",
    K = E.base_field()
    d = E.local_data(P)
    if d.has_good_reduction():
        print "good :)"
    elif d.has_nonsplit_multiplicative_reduction():
        print "nonsplit multiplicative :)"
    elif d.has_split_multiplicative_reduction():
        print "split multiplicative :)"
    else: # additive reduction
        j = E.j_invariant()
        jv = j.valuation(P) if not K is QQ else valuation(j, P.gen())
        if jv < 0:
            print "bad but potential multiplicative"
            # potential multiplicative reduction
            return
        else:
            # potential good reduction
            p = P if K is QQ else P.smallest_integer()
            if p==2: # prime | 2
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
                print "bad and potential good -- at 2, d=", d, " :("
                return
            if p==3: # prime | 3
                print "bad and potential good -- at 3 :("
                return

            print "bad and potential good"


# def _root_number_local_3(E, P):
#     def _val(a, P):
#         if P.base_ring() is ZZ:
#             return valuation(a, P.gen())
#         return a.valuation(P)
#     def quadr_residue_symbol(a):
#         return Kr(a).is_square() and 1 or -1
#     def quadr_symbol(a):
#         av =  _val(a, P)
#         if av%2==1:
#             return -1
#         if P.base_ring() is ZZ:
#             pi = P.gen()
#         else:
#             pi = P.number_field().uniformizer(P)
#         # print "piv = ", pi.valuation(P)
#         b = a / pi^av
#         return quadr_residue_symbol(b)
#     # assume potential good reduction
#     Es = E.local_data(P).minimal_model(tidy=False)
#     Es = Es.short_weierstrass_model(complete_cube=False)

#     disc = Es.discriminant()
#     vD = _val(disc, P)
#     Kr = P.residue_field()

#     ks = str(Es.kodaira_symbol(P))
#     if ks=='I0' or ks=='I0*':
#         assert vD%2==0, "error -- valuation of discriminant should be even"
#         return quadr_residue_symbol(-1)^(vD/2)
#     elif ks=='III' or ks=='III*':
#         return quadr_residue_symbol(-2)
#     else: 
#         assert ks=='II' or ks=='II*' or ks=='IV' or ks=='IV*', "error -- unexpected kodeira symbol"
#         # print "vD = ", vD, disc
#         d = quadr_symbol(disc)
#         c = Es.a6()
#         cv = _val(c, P)
#         assert cv%3!=0, "error -- 3 should not divide the valuation of the constant term anymore"
#         # print disc, c, P
#         hs = generalized_hilbert_symbol(disc, c, P)
#         # hs = hilbert_symbol_magma(disc, c, P)
#         qr1 = quadr_residue_symbol(cv)^vD
#         qr2 = quadr_residue_symbol(-1)^(vD*(vD-1)/2)
#         # print d, hs, qr1, qr2
#         return d*hs*qr1*qr2


# def transl_ell_curve_w_2_isog(E, rt):
#     Echange = E.change_weierstrass_model(1,rt,0,0)
#     E2 = EllipticCurve(E.base_field(), [0,-2*Echange.a2(),0,Echange.a2()^2-4*Echange.a4(),0])
#     # print E.is_isogenous(E2)
#     return E2

# def _root_number_local_2(E, P):
#     K = E.base_field()

#     if K is QQ:
#         rn = -1
#     else:
#         rn = (-1)^(P.residue_class_degree() * P.ramification_index())

#     t = polygen(K)
#     assert E.a1() == 0
#     assert E.a3() == 0
#     f = t^3+E.a2()*t^2+E.a4()*t+E.a6()

#     d = 1
#     roots = []
#     for g,_ in f.factor():
#         if g.degree() == 1:
#             roots += g.roots(multiplicities=False)
#         if g.degree() == 2:
#             d = 2
#             K2.<a2> = K.extension(g)
#             # roots += g.change_ring(K2).roots(multiplicities=False)
#         if g.degree() == 3:
#             d = 3
#             K3.<a3> = K.extension(g)
#             for h,_ in g.change_ring(K3).factor():
#                 if h.degree() == 1:
#                     # roots += h.roots(multiplicities=False)
#                     pass
#                 if h.degree() == 2:
#                     d = 6
#                     K6.<a6> = K3.extension(h)
#                     # roots += h.change_ring(K6).roots(multiplicities=False)

#     print "d = ", d

#     def _compute_H(E, P, ord2=True, ord3=False):
#         t = E.tamagawa_number(P)
#         if ord2:
#             cv = valuation(t,2) + _u_of_E(E, P)
#             H2 = 1 if cv%2==0 else -1
#         if ord3:
#             cv = valuation(t,3)
#             H3 = 1 if cv%2==0 else -1
#         if ord2 and ord3: return (H2, H3)
#         if ord2: return H2
#         return H3

#     def _val(a, P):
#         if P.base_ring() is ZZ:
#             return valuation(a, P.gen())
#         return a.valuation(P)

#     def _u_of_E(E, P):
#         disc = E.discriminant()
#         Emin = E.local_data(P).minimal_model(tidy=False)
#         discmin = Emin.discriminant()
#         assert _val(discmin, P) == E.local_data(P)._val_disc
#         # print "quot = ", disc/discmin
#         # return (disc/discmin).norm()^(1/12)
#         # print "quot = ", (disc/discmin).valuation(P) / 12
#         # print "rd = ", P.residue_class_degree()
#         # if not E.base_field() is QQ:
#             # print P.ramification_index()
#         if E.base_field() is QQ:
#             return Integer(_val(disc/discmin, P) / 12)
#         else:
#             return Integer(P.residue_class_degree() * _val(disc/discmin, P) / 12)

#     if d==1:
#         # print roots
#         H = _compute_H(E, P)
#         E1 = transl_ell_curve_w_2_isog(E, roots[0])
#         H1 = _compute_H(E1, P)
#         E2 = transl_ell_curve_w_2_isog(E, roots[1])
#         H2 = _compute_H(E2, P)
#         E3 = transl_ell_curve_w_2_isog(E, roots[2])
#         H3 = _compute_H(E3, P)
#         return rn * H * H1 * H2 * H3
#     elif d==2:
#         H = _compute_H(E, P)
#         # 2-isogenous curve over base field
#         # print roots[0]
#         E1 = transl_ell_curve_w_2_isog(E, roots[0]) # root[0] is the root over the base field
#         # print E1
#         H1 = _compute_H(E1, P)

#         # a2 in K2 is root not in base field
#         K2b.<b2> = K2.absolute_field()
#         from2, to2 = K2b.structure()
#         # Unfairly picking one prime factor
#         Pfactors = K2b.ideal([ to2(pgen) for pgen in P.gens() ]).factor()
#         print Pfactors
#         P2b = K2b.ideal([ to2(pgen) for pgen in P.gens() ]).factor()[0][0]
#         E2b = E.change_ring(K2b)
#         # print E2b
#         H2 = _compute_H(E2b, P2b)
#         # print "H2 = ", H2

#         E3b = transl_ell_curve_w_2_isog(E2b, to2(a2))
#         assert E3b.a6() == 0
#         H3 = _compute_H(E3b, P2b)

#         return rn * H * H1 * H2 * H3
#     elif d==3:
#         # a3 in K3
#         K3b.<b3> = K3.absolute_field()
#         from3, to3 = K3b.structure()
#         # Unfairly picking one prime factor
#         # print K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()
#         P3b = K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()[0][0]
#         E3b = E.change_ring(K3b)
#         H = _compute_H(E3b, P3b)
#         # print "H = ", H
#         E3bt = transl_ell_curve_w_2_isog(E3b, to3(a3))
#         H2 = _compute_H(E3bt, P3b)
#         # print "H2 = ", H2
#         return rn * H * H2
#     elif d==6:
#         # a3 in K3
#         K3b.<b3> = K3.absolute_field()
#         from3, to3 = K3b.structure()
#         # Unfairly picking one prime factor
#         P3b = K3b.ideal([ to3(pgen) for pgen in P.gens() ]).factor()[0][0]
#         E3b = E.change_ring(K3b)
#         H = _compute_H(E3b, P3b)

#         E3bt = transl_ell_curve_w_2_isog(E3b, to3(a3))
#         H2 = _compute_H(E3bt, P3b)

#         # a6 in K6
#         K6b.<b6> = K6.absolute_field()
#         from6, to6 = K6b.structure()
#         # Unfairly picking one prime factor
#         P6b = K6b.ideal([ to6(pgen) for pgen in P.gens() ]).factor()[0][0]
#         E6b = E.change_ring(K6b)
#         H3, H33 = _compute_H(E6b, P6b, ord2=True, ord3=True)

#         E6bt = transl_ell_curve_w_2_isog(E6b, to6(a6))
#         H4 = _compute_H(E6bt, P6b)

#         x = polygen(K)
#         Kd.<d> = K.extension(x^2 - E.discriminant())
#         KDb.<bd> = Kd.absolute_field()
#         fromD, toD = KDb.structure()
#         # Unfairly picking one prime factor
#         PDb = KDb.ideal([ toD(pgen) for pgen in P.gens() ]).factor()[0][0]
#         EDb = E.change_ring(KDb)
#         HD = _compute_H(EDb, PDb, ord2=False, ord3=True)

#         return rn * H * H2 * H3 * H33 * H4 * HD

#     raise NotImplementedError("additive reduction over a prime dividing 2")


