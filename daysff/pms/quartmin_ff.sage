
r"""
reduction of quartics over rational function fields 
used for descent

"""

def quartic_level(A,P,debug = True):
    r"""
    calculates the I and J invariant and its valuation at P

    INPUT:

    -``A`` -- the coefficients (integral) of the quartic 
    -``P`` -- a prime polynomial
    
    EXAMPLES::

	sage: K.<T> = FunctionField(GF(5))
	sage: A = [T,1,T**2,T+1,1]
	sage: R = K._ring
	sage: P = R(T.element())
	sage: quartic_level(A,P)
	(T**4 + 4*T + 2, 3*T**6 + 4*T**3 + 3*T + 3, 0)

    """

    a,b,c,d,e = A
    K = A[0].parent()
    R = K._ring
    a = R(K(a).element())
    b = R(K(b).element())
    c = R(K(c).element())
    d = R(K(d).element())
    e = R(K(e).element())
    if debug:
       print a
       print b
       print c
       print d
       print e
    I = R(12*a*e-3*b*d+c**2)
    J = R(72*a*c*e+9*b*c*d-27*a*d**2-27*b**2*e-2*c**3)
    if debug:
       print I
       print J
    assert (I != 0 or J != 0)
    if (I == 0):
       return I,J,(J.valuation(P)/6).floor()
    if (J == 0):
       return I,J,(I.valuation(P)/4).floor()
    return I,J,min((I.valuation(P)/4).floor() , (J.valuation(P)/6).floor() )



def quartic_coefficients(f):
    r"""
    returns the coefficients of f where y^2 = f is the defining polynomial of a quartic

    INPUT:
    -``f`` -- homogeneous polynomial of degree 4 in 2 variables

    EXAMPLES::

	sage: K.<T> = FunctionField(GF(5))
	sage: KUV.<U,V> = K[]
	sage: f = U**4 + T*U**3*V + T**2*U**2*V**2 + T**3*U*V**3 + T**4*V**4
	sage: quartic_coefficients(f)
	[1, T, T**2, T**3, T**4]


    """
    K = f.parent()
    A  = [ [4-x,x] for x in range(5) ]
    out = [f.monomial_coefficient(K.gens()[0]**a[0]*K.gens()[1]**a[1])  for a in A]
    return out

def root(f):
    r"""
   
   INPUT:
    -``f`` -- homogeneous polynomial of degree 4 in 2 variables

    EXAMPLES::

	sage: K.<T> = FunctionField(GF(5))
	sage: KUV.<U,V> = K[]
	sage: f = U**4 + T*U**3*V + T**2*U**2*V**2 + T**3*U*V**3 + T**4*V**4 
 


    """
    g = f[0]
    a = g.MonomialCoefficient({g.parent().gens()[0]:1,g.parent().gens()[1]:0})
    b = g.MonomialCoefficient({g.parent().gens()[0]:0,g.parent().gens()[1]:0})
    return (-b/a)



def QMOP(f,P,debug = True):

    r"""
    reduces the quartic y^2 = f with respect to one prime polynomial
    this function needs reside fields.otherwise it wont work.
    the seccond example for example wont work until it is changed

    INPUT:
    -``f`` -- homogeneous polynomial of degree 4 in 2 variables with integral coefficients over a rational function field
    -``P`` -- a polynom in the ring of integers of the coefficients of f
  
    OUTPUT:
    - a minimal quartic equivalent to f
    - the transformation matrix

    EXAMPLES::

	sage: K.<T> = FunctionField(GF(5))
	sage: KUV.<U,V> = K[]
	sage: f = T*U**4 + T*U**3*V + T**2*U**2*V**2 + T**3*U*V**3 + T**4*V**4 
 	sage: P = R(T.element())
	sage: QMOP(f,P)
	(False, [T 0]
	[0 1], T**5*U**4 + T**4*U**3*V + T**4*U**2*V**2 + T**4*U*V**3 + T**4*V**4)

	sage: K.<T> = FunctionField(GF(5))
	sage: KUV.<U,V> = K[]
	sage: f = (T**11 + T + 1)*U**4 + T*U**3*V + T**2*U**2*V**2 + T**3*U*V**3 + T**4*V**4 
 	sage: P = R(T.element())
	sage: QMOP(f,P)
	


    """
    KUV = f.parent()
    U,V = KUV.gens()
    K = KUV.base_ring()
    R = K._ring
    M = diagonal_matrix(R,[1,1])
    cf = quartic_coefficients(f)
    cff = [R(aa.element()) for aa in cf] ##coerce to polynomial ring
    	  		       	     	 ##because valuation wants
					 ##polynomials
    vals = [c.valuation(P) for c in cff]
    if debug:
       print "valuations: ",vals
    minval = min(vals)
    I,J,lev = quartic_level(cf,P)
    if debug:
       print "I: ",I
       print "J: ",J
       print "level ",lev
    if lev == 0:
       return True,diagonal_matrix(R,[1,1]),f
    
    if minval >= 2:
       if debug:
       	  print "case 1: nothing to do.."
       return False,diagonal_matrix(R,[1,1]),f

    if not False in [vals[i] >= i for i in range(1,5)]:
       if debug:
       	  print "case 2: reducing..."
       return False, diagonal_matrix(R,[P,1]),f([P*U,V])

    if not False in [vals[i] >= (4-i) for i in range(0,4) ]:
       if debug:
       	  print "case 3: reducing..."
       return False, matrix(R,2,2,[0,1,P,0]),f(V,P*U)

    if not False in [vals[i] >= (2*i - 2) for i in range(2,5) ]:
       if debug:
       	  print "case 4: reducing"
       return False,diagonal_matrix(R,[P^2,1]),f(P^2*U,V)

    if not False in [vals[i] >= (6 - 2*i) for i in range(0,3) ]:
       if debug:
       	  print "case 5: reducing.."
       return False,matrix(R,2,2,[0,1,P^2,0]),f(V,P^2*U)
    if debug:
       print "case 6: reducing.."
    ##KP has to be the residue field, so as soon as there is a way of
    ##constructing residue fields - change it!!!
    ##because later a multivariate polynomial over this ring 
    ##has to be factored
    KP = R.quotient_by_principal_ideal(P)
    mapKP = KP.coerce_map_from(R)
    KPuv.<u,v> = KP[]
    cfP = [mapKP(R(c.element())) for c in cf]
    if debug:
       print "reduced coefficients: ",cfP
       print "KUV",KUV
       print "KPuv",KPuv
    RXY.<X,Y> = R[]
    print RXY
    red = RXY.hom([u,v])
    coefs = [a.quo_rem(P^minval)[0] for a in f.coefficients()]
    if debug:
       print "new coefficients: ",coefs
       print "coefs[0].parent ->",coefs[0].parent()
    mons = f.monomials()
    mons2 = []
    for mo in mons:
    	modegs = mo.degrees()
	mons2 = mons2 + [X**modegs[0]*Y**modegs[1]]
    ###f1 = sum([coefs[i]*mons[i] for i in range(len(mons))])
    ###dont think that i ll need f1
    f2 = sum([coefs[i].numerator()*mons2[i] for i in range(len(mons2))])
    if debug:
       #print "f1: ",f1
       #print red
       print "f2: ",f2
       print f2.parent() 
    pf = red(f2)
    QUAD = True
    cfP = [mapKP(c) for c in quartic_coefficients(f2)]
    if debug:
       print "cfP: ",cfP
    ###this does not work. need to go for residue fields
    fac = factor(pf)
    if debug:
       print fac
    if (v,4) in fac:
       f = f(V,U)    
       M = matrix(R,2,2,[0,1,1,0])

    if (v,3) in fac:
       g = [x for x in fac if x[1] == 1 ]
       assert len(g) == 1
       assert g[0][0].total_degree() == 1
       s = root(g[0])
       QUAD = False
       f = f(U + s*V,V)
       M = matrix(R,2,2,[1,s,0,1])

    if cfP[0] != 0:
       if len(fac) == 1:
       	  assert fac[0][1] == 4
	  s = root(fac[0])
	  f = f(U + s*V,V)
	  M = matrix(R,2,2,[1,s,0,1])
       rts = [x for x in fac if x[0].total_degree() == 1 ]
       if len(rts) == 2:
       	  r1 = rts[0]
	  r2 = rts[1]
	  QUAD = False
	  if r2[1] == 3:
	     s1 = root(r2)
	     s2 = root(r1)	
	  else:
	     s1 = root(r1)
	     s2 = root(r2)
	  s1 = 1/(s1 - s2)
	  f = f(U + s2*V,V)
	  f = f(V,U + s1*V)
	  M = matrix(R,2,2,[s2,s1*s2 + 1,1,s1])
    if QUAD:
       return False,M*matrix(R,2,2,[P,0,0,1]),f(P*U,V)
    assert not QUAD
    KP2 = R.quotient_by_principal_ideal(P^2)
    s = KP2.coerce(-cf[2]/(3*cf[1])).lift()
    f = f(U + s*V,V)
    M = M*matrix(R,2,2,[1,s,0,1])
    if minval == 0:
       return False,M*matrix(R,2,2,[P,0,0,1]),f(P*U,V)
    else:
	return False,M*matrix(R,2,2,[P^2,0,0,1]),f(P^2*U,V)

 
def my_quartic_minimize(f,debug=True):

    r"""
    reduces the quartic y^2 = f with respect to all prime polynomials

    INPUT:
    -``f`` -- homogeneous polynomial of degree 4 in 2 variables with integral coefficients over a rational function field
    EXAMPLES::

	sage: K.<T> = FunctionField(GF(5))
	sage: KUV.<U,V> = K[]
	sage: f = (T**11 + T + 1)*U**4 + T*U**3*V + T**2*U**2*V**2 + T**3*U*V**3 + T**4*V**4 
 	sage: P = R(T.element())
	sage: my_quartic_minimize(f)
    """
    K = f.parent().base_ring()
    R = K._ring
    sl2 = diagonal_matrix(R,[1,1])
    cf = quartic_coefficients(f)
    I,J,_ = QuarticLevel(cf,R.gens()[0])
    df = 4*I^3 - J^2
    if df.is_zero():
       return f,sl2
    fac = factor(df)
    if debug:
       print "fac: ",fac
    bp = [x[0] for x in fac]
    bp = [(p,df.valuation(p)) for p in bp ]
    bp = [x for x in bp if x[1] >= 12 ]

    for p in bp:
    	if debug:
	   print "reducing ",p
    	flag = False
	while not flag:
	      flag,mat,f = QMOP(f,p[0])
	      print f
	      e = (min([x.valuation(p[0]) for x in QuarticCoefficients(f)])/2).floor()
	      coefs = [a.quo_rem(p[0]^(2*e))[0] for a in f.coefficients()]
    	      mons = f.monomials()
    	      f = sum([coefs[i]*mons[i] for i in range(len(mons))])
	      sl2 = sl2*mat
	if debug:
	   print "finished reduction for ",p
    return f,sl2
