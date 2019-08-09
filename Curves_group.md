'''#########
A cubic surface defined over a field k has exactly 27 lines over the algebraic closure of k. The goal of this code is given the defining equation of a cubic surface as input, to output equations for the 27 lines on the surface. In almost all cases, the defining field for the lines is too large to be practical to compute.
Some functions that we will use here are find_27_lines, get_polynomial_to_split, Test_Full_Galois. 
#########'''

from sage.schemes.affine.affine_rational_point import enum_affine_number_field

def find_27_lines(f, bound=1):
    ###########################################
    # Finding the 27 Lines on a cubic surface #
    ###########################################
    '''
    INPUT:
    - f -- the defining equation of a cubic surface
    - bound -- the height bound needed for the function enum_affine_number_field

    OUTPUT: 
    Equations of the 27 lines on the cubic surface

    NOTES:
    A general line in PP^3 passing through the points [a0,b0,c0,d0] and [a1,b1,c1,d1] is of the form
    [x,y,z,w] = [a0*s + a1*t, b0*s + b1*t, c0*s + c1*t, d0*s + d1*t]
    Or, written concisely as:
    [s,t]*[a0 b0 c0 d0]
          [a1 b1 c1 d1]
    If such a line lies on the cubic surface, then plugging in these coordinates for x,y,z,w yields an equation in s and t
    all of whose coefficients must be identically zero.
    The scheme defined by all of these equations will be a zero dimensional subcheme of PP^7 (8 unknowns: a0,a1, ... d0,d1).
    However, instead we can first find all the row reduced forms of the matrices above; there are 6 possible types, e.g.
    [1 0 a b]
    [0 1 c d]
    In each case, the scheme defined by the vanishing of these equations is 0 dimensional (i.e. points).
    Each K-rational point corresponds to one of the 27 lines.
    '''

    # K is the field over which the lines are defined.
    K = (get_polynomial_to_split(f)).splitting_field('alpha')

    P.<x,y,z,w> = K[]
    R.<a,b,c,d> = K[]
    S.<s,t> = R[]

    # Create a list of all possible line types.
    # These types are have a parametrization of the form [s,t]*A=[x,y,z,w] where A is an element of rref_mats_list.     
    # Store the parametrizations as tuples in line_params_list
    rref_mats_list = [Matrix(R,[[1,0,a,b],[0,1,c,d]]),Matrix(R,[[1,a,0,b],[0,0,1,c]]),Matrix(R,[[1,a,b,0],[0,0,0,1]]),Matrix(R,[[0,1,0,a],[0,0,1,b]]),Matrix(R,[[0,1,a,0],[0,0,0,1]]),Matrix(R,[[0,0,1,0],[0,0,0,1]])]
    line_params_list = [tuple(vector([s,t])*A) for A in rref_mats_list]
    # We substitute each line type [s,t]*A=[x,y,z,w] into the cubic polynomial defining the surface.
    # In order for the line to appear on the surface the polynomial that results must be identically zero.
    # Extract the coefficients in cos_list then set them all to zero by creating a scheme and compiling them in X_list.
    cos_list = [f(line).coefficients() for line in line_params_list]
    X_list = [AffineSpace(4,K, names = "a,b,c,d").subscheme(cos) for cos in cos_list]

    # Create a list of tuples that will reduce the dimension of the schemes in X_list to zero when these variables are not being used.
    my_list = [tuple([d]),(c,d),(b,c,d),(a,b,c,d)]

    #Create a list of all the points [a,b,c,d] over K
    points = []
    for X in X_list:
        if X.dimension() > 0:
            #Cuts down dimension for line types that do not use all variables
            X = AffineSpace(4,K, names = "a,b,c,d").subscheme(X_list[0].defining_polynomials()+my_list[X.dimension()-1])
        if (X.dimension())>=0:
            pts = enum_affine_number_field(X, bound=bound) #Finds all the points on these lines. Bound is 1 because higher bounds \\ are really slow.
            points += [pts]
        else:
            points += [[]]

    RR.<a,b,c,d,s,t> = PolynomialRing(K,6) 
    #takes a point (a0,b0,c0,d0) and turns it into [a0,b0,c0,d0,s,t]
    new_points = [[list(pt)+[s,t] for pt in points[i] ] for i in range(0,len(points))]
    #change the ring so that sage interprets e.g. a*s + c*t as a polynomial in RR
    new_line_params = [[RR(str(func)) for func in l] for l in line_params_list]
    lineslist = []
    #evaluate the polynomials in new_line_params at the corresponding points [a0,b0,c0,d0] in new_points 
    for i in range(0,len(new_points)):
        lineslist += [[param(pt) for  param in new_line_params[i]] for pt in new_points[i]]

    SS.<x,y,z,w,s,t> = PolynomialRing(K,6) #create a new polynomial ring
    newlines = []
    for line in lineslist:
    	#create equations of the form e.g.[x-s, y-t, z - (a0*s + c0*t), w - (b0*s + d0*t)]
        newlines += [[x-SS(str(line[0])), y-SS(str(line[1])),z- SS(str(line[2])), w- SS(str(line[3]))]]
    #turn the list of equations into ideals
    ideals = [SS.ideal(line) for line in newlines]
    #eliminate the variables s,t
    better_lines = [I.elimination_ideal([s,t]).gens() for I in ideals]
    print "The 27 lines on the surface", f, "are:"
    return better_lines

##################################################################################
# Finds polynomial to split (the lines will be defined over its splitting field) #
##################################################################################

def get_polynomial_to_split(F):
    P = parent(F)
    x,y,z,w = P.variable_names()
    R.<a,b,c,d> = PolynomialRing(QQ, order = "lex")
    S.<s,t> = PolynomialRing(R)
    rref_mats_list = [Matrix(R,[[1,0,a,c],[0,1,b,d]]),Matrix(R,[[1,a,0,b],[0,0,1,c]]),Matrix(R,[[1,a,b,0],[0,0,0,1]]),Matrix(R,[[0,1,0,a],[0,0,1,b]]),Matrix(R,[[0,1,a,0],[0,0,0,1]]),Matrix(R,[[0,0,1,0],[0,0,0,1]])]
    big_poly = 1
    U.<T> = PolynomialRing(QQ)
    phi = R.hom([T,T,T,T],U)
    for M in rref_mats_list:
        L = lambda t: tuple(vector([1,t])*M)
        FL = lambda t: F(x=L(t)[0], y=L(t)[1], z=L(t)[2], w=L(t)[3])
        J = ideal( FL(0), FL(1), FL(2), FL(3) )
        B = J.groebner_basis()
        for elt in range(len(B)):
            h = phi(B[elt])
            if len(B[elt].variables())==1 and not h.divides(big_poly):
                big_poly *= h
    return big_poly

################################################################################
# Examples finding the 27 Lines on a cubic surface and its field of definition #
################################################################################

# This is an example showing that get_polynomial_to_split(f) works correctly.
# This example is maximal ()in the sense of Algorithm 10 described below) and
# appears on page 13 of Eisenhans--Jahnel.
P.<x,y,z,w> = PolynomialRing(QQ)
f = x^3+2*x*y^2+11*y^3+3*x*z^2+5*y^2*w+7*z*w^2
print get_polynomial_to_split(f)

# For this example, the output is:
#r=T^27 + 99/5*T^26 + 3299/25*T^25 + 36289/125*T^24 + 264/49*T^23 + 10296/245*T^22 + 7725912/60025*T^21 + 10026984/42875*T^20 + 51920262/117649*T^19 + 605313522/588245*T^18 + 4659518538/2941225*T^17 + 11953541358/2941225*T^16 + 69318152838/5764801*T^15 + 626176481634/28824005*T^14 + 156330541343898/7061881225*T^13 + 70137153565182/7061881225*T^12 + 6440174126145/13841287201*T^11 + 44233686867843/69206436005*T^10 + 33749245501389/49433168575*T^9 + 250779458513133/346032180025*T^8 + 10050474124746/13841287201*T^7 + 4683175938738/9886633715*T^6 + 990986421546/49433168575*T^5 - 6392766446550/13841287201*T^4 - 11720071818675/13841287201*T^3 - 1718943866739/1977326743*T^2 - 170175442807161/346032180025*T - 207992207875419/1730160900125


# Find the 27 lines on the diagonal cubic surface x^3 + y^3 + z^3 + w^3
P.<x,y,z,w> = PolynomialRing(QQ)
f = x^3 + y^3 + z^3 + w^3
find_27_lines(f)
# Output
'''
The 27 lines on the surface x^3 + y^3 + z^3 + w^3 are:
[[y + w, x + z],
 [y + (-alpha)*w, x + z],
 [y + (alpha - 1)*w, x + z],
 [y + z, x + w],
 [y + (-alpha)*z, x + w],
 [y + (alpha - 1)*z, x + w],
 [y + z, x + (-alpha)*w],
 [y + (-alpha)*z, x + (-alpha)*w],
 [y + (alpha - 1)*z, x + (-alpha)*w],
 [y + z, x + (alpha - 1)*w],
 [y + (-alpha)*z, x + (alpha - 1)*w],
 [y + (alpha - 1)*z, x + (alpha - 1)*w],
 [y + w, x + (-alpha)*z],
 [y + (-alpha)*w, x + (-alpha)*z],
 [y + (alpha - 1)*w, x + (-alpha)*z],
 [y + w, x + (alpha - 1)*z],
 [y + (-alpha)*w, x + (alpha - 1)*z],
 [y + (alpha - 1)*w, x + (alpha - 1)*z],
 [y, x + z + w],
 [y, x + (alpha - 1)*z + w],
 [y, x + (-alpha)*z + w],
 [y, x + (-alpha)*z + (-alpha)*w],
 [y, x + z + (-alpha)*w],
 [y, x + (alpha - 1)*z + (-alpha)*w],
 [y, x + (alpha - 1)*z + (alpha - 1)*w],
 [y, x + (-alpha)*z + (alpha - 1)*w],
 [y, x + z + (alpha - 1)*w]]
 '''

#########
#Algorithm 10 of Elsenhans--Jahnel
#########


def Test_Full_Galois(f,bound = 200):
    r"""
    Given a degree 27 polynomial, determine whether the Algorithm 10 of Experiments with general cubic surfaces by Elsenhans and Jahnel is satisfied.
    If it is, we will print the first prime at which each type of form appears.

    INPUT:

    - f -- a cubic homogeneous polynomial in four variables that defines a non-singular cubic surface
    - bound -- a bound of the number of primes to look at for step 3 of algorithm 10 (default: 500)

    OUTPUT:

    Returns `True` if the algorithm succeeds and it is determined that the cubic surface has full Galois gorup.  Otherwise it returns `False`.

    EXAMPLES::

        sage: R.<x,y,z,w> = QQ[]
        sage: f = x^3+2*x*y^2+11*y^3+3*x*z^2+5*y^2*w+7*z*w^2
        sage: Test_Full_Galois(f) 
        Unable to determine if there is the full Galois group given the current prime bound
        False

    You may have to increase the prime bound in order to verify we have the full Galois group::

        sage: R.<x,y,z,w> = QQ[]
        sage: f = x^3+2*x*y^2+11*y^3+3*x*z^2+5*y^2*w+7*z*w^2
        sage: Test_Full_Galois(f, bound = 500)
        We have the full Galois group
        Type A appeared at 373
        Type B appeared at 19
        Type C appeared at 19
        True



    If the statement is not true no matter the bound it will not be clear::

        sage: R.<x,y,z,w> = QQ[]
        sage: Test_Full_Galois(x^3+y^3+z^3+w^3)
        Unable to determine if there is the full Galois group given the current prime bound
        False

    """
    K = f.base_ring()
    R.<a,b,c,d> = PolynomialRing(K,4,order='lex')
    ell = lambda s,t: [s,t,a*s+b*t,c*s+d*t]
    J = R.ideal(f(ell(0,1)),f(ell(1,0)),f(ell(1,1)),f(ell(-1,1)))
    B = J.groebner_basis()
    r = B[len(B)-1]
    if r.degree() != 27:
        print "Error, unable to determine if full Galois group"
        return False
    boolA = False
    boolB = False
    boolC = False
    for p in primes(1,bound):
        try:
            rp=r.change_ring(GF(p))
            if not rp.is_squarefree() or rp.degree()<27:
                continue
            degree_list = [f[0].degree() for f in rp.factor()]
            degree_list.sort()
            if degree_list in [[9,9,9]] and not boolA:
                boolA = True
                pA = p
            if degree_list in [[1,1,5,5,5,5,5],[2,5,5,5,10]] and not boolB:
                boolB = True
                pB = p
            if degree_list in [[1,4,4,6,12],[2,5,5,5,10],[1,2,8,8,8]] and not boolC:
                boolC = True
                pC = p
            if boolA and boolB and boolC:
                print "We have the full Galois group"
                print "Type A appeared at", pA
                print "Type B appeared at", pB
                print "Type C appeared at", pC
                break
        except: continue
    if not (boolA and boolB and boolC):
        print "Unable to determine if there is the full Galois group given the current prime bound"
        return False
    else: return True




