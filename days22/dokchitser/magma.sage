def root_number_pari(E):
    if E.base_field() != QQ:
        raise NotImplementedError("only implemented ")
    return pari(E).ellrootno()

def hilbert_symbol_magma(a, b, P):
    K = P.number_field()
    f = K.polynomial()
    pr = "PQ<" + f.variable_name() + ">:=PolynomialRing(Rationals());"
    nf = "K2<" + str(K.gen()) + ">:=NumberField(" + str(f) + ");"
    pi = "P2:=ideal<MaximalOrder(K2)|" + str(list(P.gens()))[1:-1] + ">;"
    hs = "HilbertSymbol(K2!" + str(a) + ",K2!" + str(b) + ",P2)"
    # print pr + nf + pi + hs
    return Integer(magma_free(pr + nf + pi + hs))

def root_number_magma(E):
    K = E.base_field()
    f = K.polynomial()
    pr = "PQ<" + f.variable_name() + ">:=PolynomialRing(Rationals());"
    nf = "K2<" + str(K.gen()) + ">:=NumberField(" + str(f) + ");"
    ec = "E2:=EllipticCurve([K2|" + str(E.a_invariants())[1:-1] + "]);"
    rn = "RootNumber(E2)"
    # print pr + nf + ec + rn
    return Integer(magma_free(pr + nf + ec + rn))

def root_number_magma_local(E, P):
    K = E.base_field()
    f = K.polynomial()
    pr = "PQ<" + f.variable_name() + ">:=PolynomialRing(Rationals());"
    nf = "K2<" + str(K.gen()) + ">:=NumberField(" + str(f) + ");"
    ec = "E2:=EllipticCurve([K2|" + str(E.a_invariants())[1:-1] + "]);"
    pi = "P2:=ideal<MaximalOrder(K2)|" + str(list(P.gens()))[1:-1] + ">;"
    rn = "RootNumber(E2,P2)"
    # print pr + nf + ec + rn
    return Integer(magma_free(pr + nf + ec + pi + rn))

