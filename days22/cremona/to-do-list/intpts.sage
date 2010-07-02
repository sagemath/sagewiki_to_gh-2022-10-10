#        File: intpts.sage
#     Created: Thu Jul 01 04:22 PM 2010 C
# Last Change: Thu Jul 01 07:40 PM 2010
# Original Magma Code: Thotsaphon "Nook" Thongjunthug 
# Sage version: Radoslav Kirov, Jackie Anderson

from sage.misc.all import verbose

# This function should be detached and included as part of projective points over number field
def abs_log_height(X, gcd_one = True, precision = None):
    r''' Computes the height of a point in a projective space over field K.
    It assumes the coordinates have gcd equal to 1.
    If not use gcd_one flag.
    '''
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
    R = f.roots(multiplicities = False)
    m = max([CC(r).abs() for r in R])
    return 2*m

def compute_c8(L):
    # Original code transformed the lattice generators.
    # Here we assume they are of standard form.
    w1, w2 = L
    m = max(CC(w1).abs(), CC(w2).abs(), CC(w1+w2).abs())
    return m 

# There is a Sage trak ticket implementing this. In the future the library function can be used and this one removed 
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
    x = ceil(log(Q, 10)) # x = log_10(Q)
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
                verbose( "Need higher precision, recompute elliptic logarithm ...")
                # Re-compute elliptic logarithm to the right precision
                verbose( "precision in bits %i" % precbits)
                Elog = [ P.elliptic_logarithm(f, precision = precbits) for P in LGen]
                verbose( "Elliptic logarithm recomputed")
                w1, w2 = E.period_lattice(f).normalised_basis( prec = precbits)
            # Assign all non-zero entries
            for i in range(r): 
                L[i, i] = 1
                L[r, i]   = (C*Elog[i].real_part()).trunc()
                L[r+1, i] = (C*Elog[i].imag_part()).trunc()
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
        verbose( "After reduction, Q <= %f" % newQ)
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

# cyclic group iterator  
# Returns all elements of the cyclic group, remembering all intermediate steps 
# id - identity element
# gens - generators of the group
# mult - orders of the generators
# both_signs - whether to return all elements or one per each {element, inverse} pair
def cyc_iter(id, gens, mult, both_signs = False):
    if len(gens) == 0:
        yield id,[] 
    else:
        P = gens[0]
        cur = id
        if both_signs:
            ran = xrange(mult[0])
        else:
            ran = xrange(mult[0]/2 + 1)
        for k in ran: 
            for rest, coefs in cyc_iter(id, gens[1:], mult[1:], both_signs or k != 0):
                yield cur + rest, [k] + coefs
            cur += P

#generates elements of form a_1G_1 + ... + a_nG_n
#where |a_i| <= bound and the first non-zero coefficient is positive
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

def integral_points_with_Q(E, L, Q, tol = 0):
    r'''Given an elliptic curve E over a number field, its Mordell-Weil basis L, and a positive integer Q, return the sequence of all integral points modulo [-1] of the form P = q_1*L[1] + ... + q_r*L[r] + T with some torsion point T and |q_i| <= Q, followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points.
    '''
    assert tol >= 0 
    Tors = E.torsion_subgroup()
    expTors = Tors.exponent()
    OrdG = Tors.invariants() 
    Tgens = Tors.gens()
    id = E([0,1,0])
    total_gens = L + list(Tgens)
    verbose( "Generators = %s" % L)
    PtsList = []
    if tol == 0: 
        verbose( "Exact arithmetic")
        for P, Pcoeff in L_points_iter(id, L, Q):
            for T, Tcoeff in cyc_iter(id, Tgens, OrdG, both_signs = P!=id):
                R = P + T
                if R[0].is_integral() and R[1].is_integral() and R != id:
                    Rcoeff = Pcoeff + Tcoeff
                    verbose( "%s ---> %s" %(R, Rcoeff))
                    PtsList.append(R)
        verbose( "*"*45)
        return PtsList
    # Suggested by John Cremona
    # Point search. This is done via arithmetic on complex points on each
    # embedding of E. Exact arithmetic will be carried if the resulting
    # complex points are "close" to being integral, subject to some tolerance
    K = E.base_ring()
    r, s = K.signature()
    # Set tolerance - This should be larger than 10**(-current precision) to
    # avoid missing any integral points. Too large tolerance will slow the
    # computation, too small tolerance may lead to missing some integral points.
    verbose( "Tolerance = %f" % tol )
    if K == QQ:
        A = matrix([1])
    else:
        A = matrix([a.complex_embeddings() for a in K.integral_basis()])
        # Note that A is always invertible, so we can take its inverse
    B = A.inverse()
    point_dict = {}
    for emb in K.embeddings(CC):
        Ec = EllipticCurve(CC, map(emb,E.a_invariants()))
        # need to turn off checking, otherwise the program crashes
        Lc = [ Ec.point(map(emb,[P[0],P[1],P[2]]), check = False) for P in L]
        Tgensc = [ Ec.point(map(emb,[P[0],P[1],P[2]]), check = False) for P in Tgens]
        # Compute P by complex arithmetic for every embedding
        id = Ec([0,1,0]) 
        for P, Pcoeff in L_points_iter(id, Lc, Q):
            for T, Tcoeff in cyc_iter(id, Tgensc, OrdG, both_signs = P!=id):
                R = P + T
                if R == id:
                    continue
                key = tuple(Pcoeff + Tcoeff)
                if key in point_dict:
                    point_dict[key] += [R]
                else:
                    point_dict[key] = [R]
    integral_pts = []
    false = 0
    for Pcoeff in point_dict:
        # Check if the x-coordinate of P is "close to" being integral
        # If so, compute P exactly and check if it is integral skip P otherwise
        XofP = vector([Pemb[1] for Pemb in point_dict[Pcoeff]])
        # Write x(P) w.r.t. the integral basis of (K)
        # Due to the floating arithmetic, some entries in LX may have very tiny
        # imaginary part, which can be thought as zero
        LX = XofP * B
        try:
            LX = [abs( i.real_part() - i.real_part().round() ) for i in LX[0]]
        except AttributeError:
            LX = [abs(i - i.round()) for i in LX[0]]
        if len([1 for dx in LX if dx >= tol]) == 0 :
        # x-coordinate of P is not integral, skip P
            P = sum([Pcoeff[i]*Pt for i, Pt in enumerate(total_gens)])
            if P[0].is_integral() and P[1].is_integral(): 
                integral_pts.append(P)
                verbose( "%s ---> %s" %(P, Pcoeff))
            else:
                false += 1
    verbose( 'false positives %i'% false)
    return integral_pts 
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

def calculate_Q(E,L):
    if len(L) == 0:
        return 0
    K = E.base_ring()
    expTors = E.torsion_subgroup().exponent()
    r, s = K.signature()
    pi = RR(math.pi) 
    b2 = E.b_invariants()[0] 
    # Global constants (independent to the embedding of E)
    gl_con = {}
    gl_con['c2'] = C2 = - Silverman_height_bounds(E)[0] 
    gl_con['c3'] = C3 = c3(L)
    gl_con['h_E'] = h = h_E(E)
    verbose( "Global constants")
    for name, val in gl_con.iteritems():
        verbose( '%s = %s'%(name, val))
    verbose( "-"*45)
    Q = []
    # Find the most reduced bound on each embedding of E
    # Sage bug, QQ.places() is not implemented
    # and K.embeddings gives each complex places twice
    if K is QQ:
        infplaces = K.embeddings(CC)  
    else:
        infplaces = K.places()
    for i, f in enumerate(infplaces):
        # Bug in P.complex_logarithm(QQ.embeddings(CC)[0]) 
        if K is QQ:
            emb = None
        else:
            emb = f
        if i < r: 
            nv = 1
            verbose( "Real embedding #%i" % i )
        else:
            nv = 2
            verbose( "Complex embedding #%i" % (i-r))
        # Create complex embedding of E
        # Embedding of all points in Mordell-Weil basis
        # Find complex elliptic logarithm of each embedded point
        precbits = floor(100*log(10,2)) 
        Elog = [P.elliptic_logarithm(emb, precision = precbits) for P in L]
        Periods = E.period_lattice(emb).normalised_basis();
        # Local constants (depending on embedding)
        # C9, C10 are used for the upper bound on the linear form in logarithm
        loc_con = {}
        loc_con['c4'] = C4 = C3 * K.degree() / (nv*(r+s))
        loc_con['c5'] = C5 = C2 * K.degree() / (nv*(r+s))
        loc_con['c6'] = C6 = compute_c6(E,f)
        loc_con['delta'] = delta = 1 + (nv-1)*pi
        loc_con['c8'] = C8 = compute_c8(Periods)
        loc_con['c7'] = C7 = 8*(delta**2) + (C8**2)*abs(f(b2))/12
        loc_con['c9'] = C9 = C7*exp(C5/2)
        loc_con['c10'] = C10 = C4/2
        loc_con['Q0'] = Q0 = sqrt( ( log(C6+abs(f(b2))/12) + C5) / C4 )

        # Constants for David's lower bound on the linear form in logarithm
        # Magma and Sage output periods in different order, need to swap w1 and w2
        w2, w1 = Periods # N.B. periods are already in "standard" form
        loc_con['d7'] = D7 = 3*pi / ((abs(w2)**2) * (w2/w1).imag_part())
        loc_con['d8'] = D8 = d8(E, L, Elog, Periods, D7)
        loc_con['d9'] = D9 = d9(E, L, Elog, Periods, D7)
        loc_con['d10'] = D10 = d10(E, L, Elog, Periods, D7)
        for name, val in loc_con.iteritems():
            verbose( "{0} = {1}".format(name, val))
        # Find the reduced bound for the coefficients in the linear logarithmic form
        loginitQ = InitialQ(K.degree(), len(L), Q0, C9, C10, D8, D9, D10, h, expTors)
        verbose( "Initial Q <= 10^%f" % loginitQ)
        initQ = 10**loginitQ
        Q.append(ReducedQ(E, emb, L, Elog, C9, C10, Periods, expTors, initQ))
        verbose( "-"*45)
    Q = max(Q)
    verbose( "Maximum absolute bound on coefficients = %i"% Q)
    return Q

def integral_points(E, L, tol = 0, both_signs = False): 
    r'''Given an elliptic curve over a number field and its Mordell-Weil basis, return the sequence of all integral points modulo [-1], followed by a sequence of tuple sequences representing the points as a linear combination of points. An optional tolerance may be given to speed up the computation when checking integrality of points. (This function simply computes a suitable Q and call
IntegralPoints(E, L, Q tol = ...)
'''
    assert tol >= 0
    id = E([0,1,0]) 
    Q = calculate_Q(E,L)
    int_points = integral_points_with_Q(E, L, Q, tol = tol)
    if both_signs:
        int_points += [-P for P in int_points]
    int_points.sort()
    return int_points 
