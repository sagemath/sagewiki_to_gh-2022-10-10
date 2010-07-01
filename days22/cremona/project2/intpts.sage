def ell_height(P, precision = None):
    x = P[0]
    K = x.parent()
    return abs_log_height([x,K(1)], precision)

def abs_log_height(X, gcd_one = True, precision = None):
    r''' Computes the height of a point in a projective space over field K'''
    assert isinstance(X,list)
    K = X[0].parent()
    if precision is None:
        RR = RealField()
        CC = ComplexField()
    else:
        RR = RealField(precision)
        CC = ComplexField(precision)
    places = set([])
    if K == QQ:
        embs = K.embeddings(RR)
        Xideal = X
    else:
        embs = K.places(precision)
        # skipping zero as it currently over K breaks Sage
        Xideal = [K.ideal(x) for x in X if not x.is_zero()]
    for x in Xideal:
        places = places.union(x.denominator().prime_factors())
        if not gcd_one:
            places = places.union(x.numerator().prime_factors())
    if K == QQ:
        non_arch = sum([log(max([RR(P)**(-x.valuation(P)) for x in X])) for P in places])
    else:
        non_arch = sum([P.residue_class_degree() *
                        P.absolute_ramification_index() *
                        max([x.abs_non_arch(P, precision) for x in X]).log() for P in places])
    arch = 0
    r,s = K.signature()
    for i,f in enumerate(embs):
        if i<r:
            arch += max([f(x).abs() for x in X]).log()
        else:
            arch += max([f(x).abs()**2 for x in X]).log()
    return (arch+non_arch)/K.degree()
    
def compute_c6(E,emb):
    x = var('x')
    #f = x**3-27*emb(E.c4())*x-54*emb(E.c6())
    f = x**3-emb(E.c4()/48)*x-emb(E.c6()/864)
    #f := x^3 - (P! C4/48)*x - (P! C6/864);
    R = f.roots(multiplicities = False)
    m = max([CC(r).abs() for r in R])
    return 2*m

def compute_c8(L):
    w1, w2 = L
    m = max(CC(w1).abs(), CC(w2).abs(), CC(w1+w2).abs())
    return m 

def height_pairing_matrix(points, precision = None):
    r = len(points)
    if precision is None:
        RR = RealField()
    else:
        RR = RealField(precision)
    M = MatrixSpace(RR, r)
    mat = M()
    for j in range(r):
        mat[j,j] = points[j].height(precision = precision)
    for j in range(r):
        for k in range(j+1,r):
            mat[j,k] = ((points[j]+points[k]).height(precision=precision) - mat[j,j] - mat[k,k])/2
            mat[k,j] = mat[j,k]
    return mat

def c3(L):
    return min(map(abs,height_pairing_matrix(L).eigenvalues()))

def h_E(E):
    K = E.base_field()
    j = E.j_invariant()
    c4, c6 = E.c_invariants()
    g2, g3 = c4/12, c6/216
    return max(abs_log_height([K(1), g2, g3]), abs_log_height([K(1), j]))

def h_m(E, P, ElogEmbedP, D7):
    K = E.base_field()
    return max([P.height(), h_E(E), D7/K.degree()*abs(log(ElogEmbedP))**2])
    
def Extra_h_m(E, Periods, D7):
    D = E.base_field().degree()
    h = h_E(E)
    return map(lambda x: max([0, h, D7/D*abs(x)**2]), Periods)

def d8(E, L, Elog, Periods, D7):
    C = [exp(1) * h_E(E)]
    D = E.base_field().degree()
    for i in range(len(L)):
        C.append(h_m(E, L[i], Elog[i], D7) / D)
    C += [t / D for t in Extra_h_m(E, Periods, D7)]
    return max(C);

def d9(E, L, Elog, Periods, D7):
    D = E.base_field().degree()
    C = []
    for i in range(len(L)):
        tmp = exp(1) * sqrt(D * h_m(E, L[i], Elog[i], D7) / D7)
        C.append( tmp / abs(Elog[i]))
    #Take minimum among extra_h_m
    Ehm = Extra_h_m(E, Periods, D7)
    C += [exp(1) * sqrt(D*Ehm[i]/D7) / abs(Periods[i]) for i in [0,1]]
    return min(C);

def d10(E, L, Elog, Periods, D7):
    D = E.base_field().degree()
    n = len(L)+2
    scalar = 2 * 10**(8 + 7*n) * (2/exp(1))**(2*n**2)
    scalar *= (n+1)**(4*n**2 + 10*n) * D**(2*n + 2)
    scalar *= (log(d9(E, L, Elog, Periods, D7)))**(-2*n-1)
    for i in range(len(L)):
        scalar *= h_m(E, L[i], Elog[i], D7)
    scalar *= prod(Extra_h_m(E, Periods, D7))   
    return scalar

def RHS(D, r, C9, C10, D9, D10, h, Q, expTors):
    bound = (log(log(Q*r*expTors)) + h + log(D*D9))**(r+3)
    bound *= D10*(log(Q*r*expTors) + log(D*D9))
    bound += log(C9*expTors)
    bound /= C10
    return bound

def InitialQ(D, r, Q0, C9, C10, D8, D9, D10, h, expTors):
    minQ = max(Q0, exp(D8))
    Q = minQ + 1
    x = ceil(log(10, Q)) # x = log_10(Q)
    exp_OK = 0   # the exponent that satisfies P.I.
    exp_fail = 0 # the exponent that fails P.I.
    while 10**(2*x) < RHS(D, r, C9, C10, D9, D10, h, 10**x, expTors):
        exp_OK = x # Principal Inequality satisfied
        x *= 2     # double x, and retry
    exp_fail = x # x that fails the Principal Inequality
    
    # So now x = log_10(Q) must lie between exp_OK and exp_fail
    # Refine x further using "binary search"
    while True:
        x = floor((exp_OK + exp_fail)/2)
        if 10**(2*x) >= RHS(D, r, C9, C10, D9, D10, h, 10**x, expTors): 
            exp_fail = x
        else:
            exp_OK = x
        if (exp_fail - exp_OK) <= 1:
            break
    return exp_fail # over-estimate

def Faltings_height(E):
    K = E.base_field()
    c = log(2)
    if E.b2().is_zero():
        c = 0
    h1 = abs_log_height([K(E.discriminant()), K(1)])/6
    h2 = K(E.j_invariant()).global_height_arch()/6
    h3 = K(E.b2()/12).global_height_arch()
    return n(h1 + h2/2 + h3/2 + c)

def Silverman_height_bounds(E):
    K = E.base_field()
    mu = Faltings_height(E)
    lb = -mu-2.14
    ub = abs_log_height([K(E.j_invariant()), K(1)])/12 + mu + 1.922
    return lb, ub

def ReducedQ(E, f, LGen, Elog, C9, C10, Periods, expTors, initQ):
    w1, w2 = Periods 
    r = len(LGen)
    newQ = initQ
    # Repeat LLL reduction until no further reduction is possible
    while True: 
        Q = newQ
        S = r*(Q**2)*(expTors**2)
        T = 3*r*Q*expTors/sqrt(2)
        # Create the basis matrix
        C = 1
        while True: 
            C *= Q**ceil((r+2)/2)    
            precbits = int(log(C,2)+10)
            L = copy(zero_matrix(ZZ, r+2))
            # Elliptic logarithm should have precision "suitable to" C
            # e.g. If C = 10**100, then Re(Elog[i]) should be computed
            # correctly to at least 100 decimal places
            if precbits > Elog[0].prec(): 
                print "Need higher precision, recompute elliptic logarithm ..."
                # Re-compute elliptic logarithm to the right precision
                print "precision in bits", precbits
                Elog = [ P.elliptic_logarithm(f, precision = precbits) for P in LGen]
                print "Elliptic logarithm recomputed"
            # Assign all non-zero entries
            for i in range(r): 
                L[i, i] = 1
                L[r, i]   = (C*Elog[i].real_part()).trunc()
                L[r+1, i] = (C*Elog[i].imag_part()).trunc()
            # assuming w1 is always real
            L[r , r ]   = (C*w1.real_part()).trunc()
            L[r , r+1 ] = (C*w2.real_part()).trunc()
            L[r+1, r]   = (C*w1.imag_part()).trunc()
            L[r+1, r+1] = (C*w2.imag_part()).trunc()
            # LLL reduction and constants
            L = L.transpose()
            L = L.LLL()
            b1 = L[0] # 1st row of reduced basis
            # Norm(b1) = square of Euclidean norm
            normb1 = sum([i**2 for i in b1])
            lhs = 2**(-r-1)*normb1 - S 
            if (lhs >= 0) and (sqrt(lhs) > T):
                break
        newQ = ( log(C*C9*expTors) - log(sqrt(lhs) - T) ) / C10
        newQ = floor(sqrt(newQ))
        print "After reduction, Q <=", newQ
        if ((Q - newQ) <= 1) or (newQ <= 1):
            break
    return newQ


#// Search for all integral points on elliptic curves over number fields
#// within a given bound
#// Input:    E = elliptic curve over a number field K
#//           L = a sequence of points in the Mordell-Weil basis for E(K)
#//           Q = a maximum for the absolute bound on all coefficients
#//               in the linear combination of points in L
#// Output:  S1 = sequence of all integral points on E(K) modulo [-1]
#//          S2 = sequence of tuples representing the points as a
#//               linear combination of points in L
#// Option: tol = tolerance used for checking integrality of points.
#//               (Default = 0 - only exact arithmetic will be performed)

#abelian group iterator 
def ab_iter(id, gens, mult):
    if len(gens) == 0:
        yield id,[] 
    else:
        P = gens[0]
        cur = id
        for k in xrange(mult[0]):
            for rest, coefs in ab_iter(id, gens[1:], mult[1:]):
                yield cur + rest, [k] + coefs
            cur += P

#generates elements of form a_1G_1 + ... + a_nG_n
#where |a_i| <= bound and the first non-zero one is positive
def L_points_iter(id, gens, bound, all_zero = True):
    if len(gens) == 0:
        yield id, []
    else:
        P = gens[0]
        cur = id
        for k in xrange(bound+1):
            for rest, coefs in L_points_iter(id, gens[1:], bound, all_zero = (all_zero and k == 0)):
                yield cur + rest, [k] + coefs  
                if k!=0 and not all_zero:
                   yield -cur + rest, [-k] + coefs 
            cur += P

def IntegralPoints(E, L, Q, tol = 0):
    r'''Given an elliptic curve E over a number field, its Mordell-Weil basis L, and a positive integer Q, return the sequence of all integral points modulo [-1] of the form P = q_1*L[1] + ... + q_r*L[r] + T with some torsion point T and |q_i| <= Q, followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points.
    '''
    assert tol >= 0 
    # Find the generators of the torsion subgroup of E(K)
    Tors = E.torsion_subgroup()
    expTors = Tors.exponent()
    OrdG = Tors.invariants() 
    Tgens = Tors.gens()
    if len(L) == 0 and len(Tgens) == 0:
        return [], []
    id = E([0,1,0])
    L += Tgens
    print "Generators = ", L
    PtsList = []
    CoeffList = []
    # Skip the complex arithmetic and only perform exact arithmetic if tol = 0
    if tol == 0: 
        print "Exact arithmetic"
        for P, Pcoeff in L_points_iter(id, L, Q):
            for T, Tcoeff in ab_iter(id, Tgens, OrdG):
                R = P + T
                if R[0].is_integral() and R[1].is_integral() and R != id:
                    Rcoeff = Pcoeff + Tcoeff
                    #print "%f ---> %f\n"% R, Rcoeff
                    PtsList.append(R)
                    CoeffList.append([ (L[i], c) for i,c in enumerate(Rcoeff) if c != 0 ])
        print "*"*45
        return PtsList, CoeffList
'''
    # Suggested by John Cremona
    # Point search. This is done via arithmetic on complex points on each
    # embedding of E. Exact arithmetic will be carried if the resulting
    # complex points are "close" to being integral, subject to some tolerance
    
    # Embed each generator of the torsion subgroup
    X = [Conjugates(P[1]) for P in (L + Tors)]
    Y = [Conjugates(P[2]) for P in (L + Tors)]
    # Create all embeddings of E
    K = BaseRing(E)
    s1, s2 = Signature(K)
    a1, a2, a3, a4, a6 = Explode(aInvariants(E))
    a1 = Conjugates(a1)
    a2 = Conjugates(a2)
    a3 = Conjugates(a3)
    a4 = Conjugates(a4)
    a6 = Conjugates(a6)
    EmbedEList = [EllipticCurve([a1[j], a2[j], a3[j], a4[j], a6[j]]) j in 
        [1..(s1+2*s2)]]

    # Set tolerance - This should be larger than 10**(-current precision) to
    # avoid missing any integral points. Too large tolerance will slow the
    # computation, too small tolerance may lead to missing some integral points.
    print "Tolerance =", tol 
    
    # Create the matrix containing all embeddings of the integral basis of K
    # as its columns
    IntBasis = IntegralBasis(K) 
    B = Matrix([Conjugates(a)    a in IntBasis])
    # Note that B is always invertible, so we can take its inverse
    B = B**(-1)
    
    # Embeddings of each point in L
    # Format [[P1 ... P1], [P2 ... P2], ...]
    EmbedLList = []
    for i = 1 to (r+#Tors) do
        EmbedLi = []
        for j = 1 to (s1+2*s2) do
            P_i = Points(EmbedEList[j], X[i][j])[1]
            # Choose the right sign for the y-coordinate
            if (Y[i][j] ne 0) and (Re(P_i[2]/Y[i][j]) lt 0) then
                P_i = -P_i
            end if
            Append(~EmbedLi, P_i)
        end for
        Append(~EmbedLList, EmbedLi)
    end for

    # Point search
    for l in ListC do
        # Compute P by complex arithmetic for every embedding
        EmbedPList = [E![0,1,0]    E in EmbedEList]
        for j = 1 to (s1+2*s2) do
            EmbedPList[j] = &+[l[i]*EmbedLList[i][j]    i in [1..(r + #Tors)]]
        end for

        # Check if the x-coordinate of P is "close to" being integral
        # If so, compute P exactly and check if it is integral skip P otherwise
        XofP = Matrix([[P[1]    P in EmbedPList]])
        # Write x(P) w.r.t. the integral basis of (K)
        # Due to the floating arithmetic, some entries in LX may have very tiny
        # imaginary part, which can be thought as zero
        LX = XofP * B
        LX = [Abs( Re(LX[1,i]) - Round(Re(LX[1,i])) ) i in [1..#IntBasis]]
        LX = &and[dx lt tol    dx in LX]
        if not LX then
            # x-coordinate of P is not integral, skip P
            continue
        end if

        # Now check P by exact arithmetic
        # Add P and the list of tuples representing P into the list
        # if P is integral
        P = &+[l[i]*L[i]    i in [1..#L]]
        if IsIntegral(P[1]) and IsIntegral(P[2]) then
            print "%f ---> %f\n"% l, P
            Append(~PtsList, P)
            TupList = [ <L[i], l[i]>    i in [1..#L] | l[i] ne 0 ]
            Append(~CoeffList, TupList)
        end if
    end for
    vprint Detail "*"**45
    return PtsList, CoeffList
end intrinsic
'''
# Compute all integral points on elliptic curve over a number field
# This function simply computes a suitable bound Q, and return
# IntegralPoints(E, L, Q    tol = ...). 
# Input        E = elliptic curve over a number field K
#                     L = a sequence of points in the Mordell-Weil basis for E(K)
# Output    S1 = sequence of all integral points on E(K) modulo [-1]
#                    S2 = sequence of tuples representing the points as a
#                             linear combination of points in L
# Option tol = tolerance used for checking integrality of points.
#                             (Default = 0 - only exact arithmetic will be performed) 
def IntegralPointsMain(E, L, tol = 0): 
    r'''Given an elliptic curve over a number field and its Mordell-Weil basis, return the sequence of all integral points modulo [-1], followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points. (This function simply computes a suitable Q and call
IntegralPoints(E, L, Q tol = ...)
'''
    assert tol >= 0
    if len(L) == 0: 
        return IntegralPoints(E, [], 0, tol = tol)
    # Embed E into various (real/complex) embeddings
    K = E.base_ring()
    expTors = E.torsion_subgroup().exponent()
    r, s = K.signature()
    pi = RR(math.pi) 
    b2 = E.b_invariants()[0] 
    # Global constants (independent to the embedding of E)
    C2 = - Silverman_height_bounds(E)[0] 
    C3 = c3(L)
    h = h_E(E)
    print "Global constants"
    print "c2 = %.4f\n"% C2
    print "c3 = %.4f\n"% C3
    print "h_E = %.4f\n"% h
    print "-"*45
    Q = []
    # Find the most reduced bound on each embedding of E
    for i,f in enumerate(K.places()):
        if i < r: 
            nv = 1
            print "Real embedding #%i\n" % i 
        else:
            nv = 2
            print "Complex embedding #%i\n" % (i-r)
        if K == QQ:
            emb = None
        else:
            emb = f
        # Create complex embedding of E
        # Embedding of all points in Mordell-Weil basis
        # Find complex elliptic logarithm of each embedded point
        # EmbedL = [map(f,P) for P in L]
        Elog = [P.elliptic_logarithm(emb, precision = floor(100*log(10,2))) for P in L]
        Periods = E.period_lattice(emb).gens();
        # Local constants (depending on embedding)
        # C9, C10 are used for the upper bound on the linear form in logarithm
        C4 = C3 * K.degree() / (nv*(r+s))
        print "c4 = %.4f\n"% C4
        C5 = C2 * K.degree() / (nv*(r+s))
        print "c5 = %.4f\n"% C5
        C6 = compute_c6(E,f)
        print "c6 = %.4f\n"% C6
        delta = 1 + (nv-1)*pi
        C8 = compute_c8(Periods)
        print "c8 = %.4f\n"% C8
        C7 = 8*(delta**2) + (C8**2)*abs(f(b2))/12
        print "c7 = %.4f\n"% C7
        C9 = C7*exp(C5/2)
        print "c9 = %.4f\n"% C9
        C10 = C4/2
        print "c10 = %.4f\n"% C10
        Q0 = sqrt( ( log(C6+abs(f(b2))/12) + C5) / C4 )
        print "Q0 = %.4f\n"% Q0

        # Constants for David's lower bound on the linear form in logarithm
        w2, w1 = Periods # N.B. periods are already in "standard" form
        D7 = 3*pi / ((abs(w2)**2) * (w2/w1).imag_part())
        D8 = d8(E, L, Elog, Periods, D7)
        D9 = d9(E, L, Elog, Periods, D7)
        D10 = d10(E, L, Elog, Periods, D7)
        print "d7  =",  D7
        print "d8  =",  D8
        print "d9  =",  D9
        print "d10 =", D10
        # Find the reduced bound for the coefficients in the linear
        # logarithmic form
        loginitQ = InitialQ(K.degree(), len(L), Q0, C9, C10, D8, D9, D10, h, expTors)
        print "Initial Q <= 10^%f\n"% loginitQ
        initQ = 10**loginitQ
        Q.append(ReducedQ(E, emb, L, Elog, C9, C10, Periods, expTors, initQ))
        print "-"*45
    Q = max(Q)
    print "Maximum absolute bound on coefficients = %i\n"% Q    
    return IntegralPoints(E, L, Q, tol = tol)

