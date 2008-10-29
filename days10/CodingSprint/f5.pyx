"""
Faugere's F_5 algorithm

This implementation is along the lines of John Perry's pseudocode 
and Singular implementation. It was inspired by Martin Albrecht's
implementation and discussions with him and Ludovic Perret.

See http://www.math.usm.edu/perry/Research/ for details.

AUTHOR:
    -- 20081022 Simon King
EXAMPLE:
    sage: R.<x,y,z> = PolynomialRing(GF(29))
    sage: I =  R* [3*x^4*y + 18*x*y^4 + 4*x^3*y*z + 20*x*y^3*z + 3*x^2*z^3, \
                   3*x^3*y^2 + 7*x^2*y^3 + 24*y^2*z^3, 
                   12*x*y^4 + 17*x^4*z + 27*y^4*z + 11*x^3*z^2]
    sage: J = I.homogenize()

    sage: f5 = F5() # original F5
    sage: gb = f5(J)
    Generator 2/3
    1 critical pairs in degree 7
    1 critical pairs in degree 9
    1 critical pairs in degree 11
    Generator 3/3
    1 critical pairs in degree 6
    2 critical pairs in degree 7
    5 critical pairs in degree 8
    7 critical pairs in degree 9
    11 critical pairs in degree 10
    10 critical pairs in degree 11
    WARNING: top-reduction to zero
    WARNING: reduction to zero
    WARNING: reduction to zero
    3 critical pairs in degree 12
    5 critical pairs in degree 13
    2 critical pairs in degree 14
    1 critical pairs in degree 16
    Note that we encountered 3 S-polynomials reducing to zero
    sage: f5.zeroes(), len(gb)
    (3, 18)
"""

import sage
import sage.all
from sage.all import copy
import sys
from sage.structure.sequence import Sequence
from sage.rings.ideal import Ideal
#from sage.rings.polynomial.multi_polynomial_libsingular cimport MPolynomial_libsingular

class CounterClass:
    def __init__(self):
        self.Gen = 0
        self.Del = 0
    def __call__(self,i):
        if i>0:
            self.Gen += 1
        else:
            self.Del += 1
Counter = CounterClass()
CounterB = CounterClass()

def dehomogenize(I,R):
    "dehomogenize(I,R): dehomogenize an ideal I that was obtained by homogenizing an ideal of ring R"
    h = I[0].parent()('h')
    return ([R(X(h=1)) for X in I]*R).reduced_basis()

cdef class DecoratedPolynomial:
    """
    A decorated polynomial is a polynomial p in an ideal I = <f_1,...,f_m> of a polynomial
    ring R, together with a 'signature' (u,i), where u is a monomial in R and 1 <= i <= m
    is an integer. The signature has the following meaning:
    * One can express p as an ideal combination $\sum_{k=1}^i t_k\cdot f_k$, and u is the leading
      term of $t_i$ of f_1,...,f_i.
    The signature allows for avoiding some useless critical pairs in the Buchberger algorithm.
    """
    cdef int nu
    cdef object mu  # the multiplier
    cdef tuple Emu  # exponents of the multiplier
    #cdef MPolynomial_libsingular p
    cdef object p

    def __init__(self,mu, int nu,  p):
        self.mu = mu
        self.Emu = mu.degrees()
        self.nu = nu
        self.p = p
        #self.rule = -1
        #self.hist = []
    #def __init__(self,mu, int nu, object p):
    #    pass
    def sig(DecoratedPolynomial self):
        return (self.mu,self.nu)
    def poly(DecoratedPolynomial self):
        return self.p
    #def info(self):
    #    return self.hist

    def __richcmp__(DecoratedPolynomial self, DecoratedPolynomial other, op):
        # < 0, <= 1, == 2, != 3, > 4, >= 5
        # Idea for applications: When considering a pair of decorated monomials and
        # reducing them, we always reduce the "bigger" one, 
        if op == 0:
            if self.nu<other.nu:
                return True
            if (self.nu==other.nu) and (self.mu<other.mu):
                return True
            return False
        if op == 1:
            if self.nu<other.nu:
                return True
            if (self.nu==other.nu) and (self.mu<=other.mu):
                return True
            return False
        if op == 2:
            return (self.nu==other.nu) and (self.Emu==other.Emu) and (self.p==other.p)
        if op == 3:
            return not ((self.nu==other.nu) and (self.Emu==other.Emu) and (self.p==other.p))
        if op == 4:
            if self.nu>other.nu:
                return True
            if (self.nu==other.nu) and (self.mu>other.mu):
                return True
            return False
        if op == 5:
            if self.nu>other.nu:
                return True
            if (self.nu==other.nu) and (self.mu>=other.mu):
                return True
            return False


cdef class F5:
    cdef dict Rules       # rewriting rules (indexed by leading monomial, yielding a monomial ideal)
    cdef object Rgb       # reduced GB of the first few input generators
    cdef object RgbMon    # their leading ideal
    cdef list Inputgen    # the ideal generators we got, interreduced and increasingly sorted
    cdef list Basis       # list of decorated polynomials that yields self.Rgb
    cdef object Ring      # the polynomial ring we started with
    cdef object HRing     # homogenized ring
    cdef object One       # "One" in the ring we work with (may be homogenisation of self.Ring
    cdef int nvars        # number of variables of HRing
    cdef int homog        # 1, if the input was homogeneous; 0 otherwise (then we homogenize/dehomogenize)
    cdef int Zeroes       # Number of S-polynomials reducing to zero, to test the efficiency of 
                          # our implementation of the F5 criterion.
                          # We are not keeping track of the corresponding critical pairs.
    def __init__(F5 self):
        "F = F5() set up the machinery to compute Groebner bases with the F5 algorithm"
        self.Rules={}
        self.Rgb = None
        self.RgbMon = None
        self.Inputgen = []
        self.Basis = []
        self.Ring = None
        self.HRing = None
        self.One = None
        self.nvars = 0
        self.homog = 0
        self.Zeroes = 0

    #def __init__(self):
    #    pass

    #def __dealloc__(self):
    #    self.Rules={}
    #    self.Rgb = None
    #    self.RgbMon = None
    #    self.Inputgen = []
    #    self.Basis = []
    #    self.Ring = None
    #    self.HRing = None
    #    self.One = None
    #    self.nvars = 0
    #    self.homog = 0
    #    self.Zeroes = 0
    #    print "Deleted"

    def __call__(F5 self, I):
        """
        F(I): Apply the F5 algorithm to an ideal I and return its reduced Groebner basis
        """
        if not isinstance(I, sage.rings.polynomial.multi_polynomial_ideal.MPolynomialIdeal):
            I = Ideal(I)
        self.Ring = I.ring()
        self.Zeroes = 0 # S-polynomials reducing to zero.
                         # We do not keep track of the corresponding critical pair.
        self.Rgb            = Sequence([I.ring()(0)],I.ring()) # (reduced) GB of the first few input generators
        self.RgbMon = self.Rgb
        # TODO: is homogenization really needed?
        # Certainly it is needed in the F5 matrix version. But here??
        if not I.is_homogeneous():
            print "homogenizing the input"
            J = I.homogenize()
            self.homog = 0
        else:
            J = I
            self.homog = 1
        if J.gens()==(0,):
            self.Inputgen = [J.ring()(0)]     # reduced_basis would yield a segfault
        else:
            self.Inputgen       = list(J.reduced_basis())   # the ideal generators we got, sorted increasingly
        self.HRing = J.ring()
        self.Inputgen.sort()
        self.Rules          = {} # rewriting rules
        self.Basis          = [] # List of decorated polynomials that will eventually form a
                                 # a Groebner basis of J
        self.One            = J.ring()(1) # self.One.parent() =self.HRing != self.Ring, if there was a homogenisation
        self.nvars          = len(J.ring().gens())
        return self.basis()

    ## Some methods that reveal the C-attributes of self.
    def rules(self):
        return self.Rules
    def zeroes(self):
        return self.Zeroes

    #############
    ## Main procedure
    ## Return the previously computed basis, or do the computation when first called
    def basis(slf, maxgen=None):
        """
        F.basis(): Compute a reduced Groebner basis using the F5 algorithm.
        """
        cdef F5 self = slf
        if self.Basis:
            if self.homog:
                return self.Rgb # or [X.poly for X in self.Basis]*self.HRing, currently without reduction
            else:
                return dehomogenize(self.Rgb,self.Ring)
        if not self.homog:
            h = self.HRing('h')
        if self.Inputgen[0] == 0:
            return Sequence([self.HRing(0)], self.HRing)
        cdef DecoratedPolynomial newDP = DecoratedPolynomial(self.One,0,self.Inputgen[0]/self.Inputgen[0].lc())
        
        self.Rules[0]=[]
        self.Basis.append(newDP)
        cdef int i
        cdef int UpTo
        if maxgen is None:
            UpTo = len(self.Inputgen)
        else:
            UpTo = maxgen
        cdef int laststop = 0
        cdef DecoratedPolynomial X,Y
        for i in range(1,UpTo):
            print "Generator %d/%d"%(i+1,UpTo)
            # by induction, we have a reduced GB for the generators 1,...,i-1.
            self.Rgb = ([Y.p for Y in self.Basis]*self.HRing).reduced_basis()
            self.RgbMon = ([Y.p.lm() for Y in self.Basis]*self.HRing).reduced_basis()
            self.insert(i)
            for X in self.Basis[laststop:]:
                # it it contains a constant polynomial, the ideal is trivial
                if self.homog:
                    if X.p.degree()==0:
                        self.Rgb = Sequence([self.One], self.HRing)
                        return Sequence([self.Ring(1)], self.Ring)
                else:
                    if X.p(h=1).degree()==0:
                        self.Rgb = Sequence([self.One], self.HRing)
                        return Sequence([self.Ring(1)], self.Ring)
            laststop = len(self.Basis)
        # Now, there only remains to toss out the reduced GB
        if self.Zeroes:
            print "Note that we encountered %d S-polynomials reducing to zero"%(self.Zeroes)
        self.Rgb = ([Y.p for Y in self.Basis]*self.HRing).reduced_basis()
        if self.homog:
            return self.Rgb
        else:
            return dehomogenize(self.Rgb,self.Ring)

    cdef insert(F5 self,int i):
        """F.insert(i): Compute a Groebner basis for the ideal spanned by generators #0,...,i,
           when a Groebner basis for generators #0,...,i-1 is already known.
        """
        # We may reduce the i-th generator f_i by everything that is in the "old" ideal (f_0,...,f_{i-1})
        f = self.Inputgen[i].reduce(self.Rgb)
        self.Rules[i]=[]
        if f.lc()==0:
            return
        cdef DecoratedPolynomial newDP = DecoratedPolynomial(self.One, i, f/f.lc())

        cdef int newindices = len(self.Basis)  # self.Basis[:newindices] was our starting point
        self.Basis.append(newDP)
        cdef int j,d
        cdef list P
        cdef list Pd,tmpL,X
        cdef DecoratedPolynomial Y,Z
        # generate new S-polynomials
        # The argument i is used for the F5 criterion (it appears in the signature of 
        # polynomials we want to reduce with)
        P=self.crit_pairs(newDP,newindices,i,newindices)  # only crit pairs involving newDP and old GB elements
        if not self.homog:
            h = self.HRing('h')
        while P:
            #print i
            #print "len P =",len(P)
            d = min([X[0].degree() for X in P])
            tmpL,Pd = [],[]
            for X in P:
                if X[0].degree() == d:
                    Pd.append(X)
                else:
                    tmpL.append(X)
            print "%d critical pairs in degree %d"%(len(Pd),d)
            P = tmpL
            S = self.SPolys(Pd)
            R = self.reduction(S, i, newindices)
            for Y in R:
                self.Basis.append(Y)
                if self.homog:
                    if Y.p.degree()==0:
                        return
                else:
                    if Y.p(h=1).degree()==0:
                        return
                P.extend(self.crit_pairs(Y,len(self.Basis),i,newindices))   # crit pairs for all of self.Basis (including the new ones)


    cdef list crit_pair(self, DecoratedPolynomial X, DecoratedPolynomial Y, int i, int newindices):
        """
        F.crit_pair(X,Y,i,newindices) returns (t,u_X,X,u_Y,Y) corresponding to a critical pair
            X,Y when necessary for the computation of a Groebner basis of (f_1,...,f_i). Here,
            the F5 criterion for label i is used. By switching X and Y, if necessary, we will
            have X<Y in the output. 
            Assumption: F.Basis[:newindices] (a private attribute) corresponds to a GB of 
                        (f_1,...,f_{i-1}).
        """
        R = self.HRing
        t_X = X.p.lm()
        t_Y = Y.p.lm()
        t = t_X.lcm(t_Y)
        u_X = R.monomial_quotient(t,t_X)
        u_Y = R.monomial_quotient(t,t_Y)
        umuX = X.mu*u_X
        if X.nu==i and self.topreducible(umuX):
            #X.hist.append(('topred',umuX,i))
            return [] # since the row with signature (umuX,nu) is kicked out by F5, we don't need the S-poly
        umuY = Y.mu*u_Y
        if (X.nu==Y.nu) and (umuX==umuY):  # found in Perry's f5_library.lib
            # I guess this is part of "rewrite criterion".
            # But I confess I don't understand why this is correct
            return []
        if Y.nu==i and self.topreducible(umuY):
            #Y.hist.append(('topred',umuY,i))
            return []
        # adopt minor optimization (check is_rewritable)
        if self.is_rewritable(u_X,X) or self.is_rewritable(u_Y,Y):
            return []
        # Eventually we try to reduce from "top" to "bottom".
        # We return the pair X,Y, if u_X*X is on top of u_Y*Y.
        # Hence, later we will replace u_Y*Y by the S-poly of X and Y
        if (X.nu>Y.nu) or ((X.nu==Y.nu) and (umuX>umuY)): 
            return [[t,Y,u_Y,X,u_X]]
        return [[t,X,u_X,Y,u_Y]]

    cdef list crit_pairs(self, DecoratedPolynomial X, int ub, int i, int newindices):
        "compare with crit_pair, but here Y runs on self.Basis[:ub]"
        cdef list CP = []
        cdef DecoratedPolynomial Y
        for Y in self.Basis[:ub]:
            CP.extend(self.crit_pair(X,Y,i,newindices))
        return CP

    cdef list SPolys(self,list P):
        """
        F.SPolys(P), P a list of critical pairs, given by a 5-tuple of 
          1) a monomial t (the least common multiple of the leading monomials of X.poly() and Y.poly()), 
          2) the cofactor u_X = t/lm(X.poly()) for X, 
          3) a decorated polynomial X,
          4) the cofactor u_Y = t/lm(X.poly()) for Y,
          5) a decorated polynomial Y.
        Moreover, (u_X*X)<(u_Y*Y).
        The S-polynomials are computed and tested for rewritability. The non-rewritable S-polynomials
        are added to the rewrite rules and are returned in a list.
        """
        # P is a list of tuples (lcm, u_X,X, u_Y,Y), with u_X*lm(X) = u_Y*lm(Y) = lcm
        P.sort() # which means increasing by lcm
        cdef list S = []
        cdef DecoratedPolynomial X,Y,Z
        for (t,X,u_X,Y,u_Y) in P:
            if (not self.is_rewritable(u_X,X)) and (not self.is_rewritable(u_Y,Y)):
                s = (u_X*X.p*Y.p.lc() - u_Y*Y.p*X.p.lc()) # it will be reduced soon, in a different method...
                if s!=0:
                    # We know that u_X*X is on top of u_Y*Y.
                    # Hence, thinking abouz the F5 matrix version, we would 
                    # create rows labeled (X.mu*u_X,X.nu) and (Y.mu*u_Y,Y.nu),
                    # and a reduction from top to bottom would yield
                    # the S-polynomial at (Y.mu*u_Y,Y.nu). 
                    # TODO: Is this thinking correct?
                    Z = DecoratedPolynomial(Y.mu*u_Y,Y.nu, s/s.lc())
                    #Z.hist.append(('S-poly',X,X.sig(),Y,Y.sig()))
                    self.add_rule(Z)
                    S.append(Z)
        S.sort() # by increasing signature, hence, from top to bottom in the F5 matrix version
        return S

    cdef list reduction(self,list S, int i, int newindices):
        """
        F.reduction(S,i,newindices): S a list of decorated polynomials, and F.Basis[:newindices] (a private
        attribute) provides a Groebner basis for the ideal generatd by the generators #0,...,i-1. 
        It is assumed that the list is sorted by increasing signature. 
        We will reduce each element of S by the GB and the elements of S of lower signature.
        Returns the list of completely reduced decorated polynomials.
        """
        cdef DecoratedPolynomial X,Y
        cdef list truncGB = list(self.Rgb)
        # We use self.Rgb, since it is a reduced GB for the ideal of the first i-1 indices.
        # Later on, we add to it new reduced S-polynomials.
        cdef list completed  = []
        cdef list newly_completed = []
        cdef list redo = []
        #sys.stdout.write('r')
        #sys.stdout.flush()
        while S:
            #sys.stdout.write('.')
            #sys.stdout.flush()
            X = S.pop(0) # this is the one with the smallest signature
            # By construction, the signature of all our input polynomials has index i:
            #sys.stdout.write('r')
            #sys.stdout.flush()
            X.p = X.p.reduce(truncGB)
            #sys.stdout.write('.')
            #sys.stdout.flush()
            #X.hist.append('reduction')
            if X.p.lc()!=0:
                X.p = X.p/X.p.lc()
            newly_completed, redo = self.top_reduction(X,newindices,completed)
            completed.extend(newly_completed)
            truncGB.extend([Y.p for Y in newly_completed]) # hence basis is "old basis" plus "completed"
            S.extend(redo)
            S.sort() # by increasing signature, since reductions must be done from top to bottom.
            #print "S",len(S)
            #print "rule",len(self.Rules[i])
            #print "Basis", len(self.Basis)
        #sys.stdout.write('\n')
        #sys.stdout.flush()
        return completed

    cdef tuple top_reduction(self, DecoratedPolynomial X, int newindices,list completed):
        if X.p.lc()==0:
            print "WARNING: reduction to zero"
            self.Zeroes = self.Zeroes+1
            return ([],[])
        #X.hist.append(('test',X.p))
        #sys.stdout.write('t')
        #sys.stdout.flush()
        J = self.find_reductor(X,newindices,completed)
        #sys.stdout.write('.')
        #sys.stdout.flush()
        if not J:
            return ([X],[])
        cdef DecoratedPolynomial Y = J[1]
        
        u = J[0]
        p = X.p-u*Y.p
        #sys.stdout.write('\n')
        #sys.stdout.flush()
        if p.lc()!=0:
            p = p/p.lc()
        else:
            print "WARNING: top-reduction to zero"
            self.Zeroes = self.Zeroes+1 
            return ([],[])
        newmono = Y.mu*u
        # TODO: is it newmono<X.mu or newmono<=X.mu?
        # At least it seems there is an infinite loop if it is "<" only
        if (Y.nu<X.nu) or (Y.nu==X.nu and newmono<=X.mu):
            # i.e., (signature of Y)*u is not bigger, hence, it is on top of sig(X)
            # hence, X ought to be replaced
            X.p = p
            #X.hist.append(('top-red by',Y,'with',u,X.p.lm(),Y.p.lm(),X.p.lm()))
            #X.hist.append('redo1')
            return ([],[X])
        # Otherwise, (signature of Y)*u is below sig(X). Hence, 
        # the corresponding row (that is now being created) must be reduced
        # (which is done right on the spot).
        cdef DecoratedPolynomial Z = DecoratedPolynomial(newmono,Y.nu,p)
        
        #Z.hist.append(('top-red obtained from',X,Y))
        #X.hist.append(('top-red 2',Y,Z))
        self.add_rule(Z)
        return ([],[X,Z])

    cdef list find_reductor(self, DecoratedPolynomial X, int newindices, list completed):
        """
        F.find_reductor(X,i,C): returns [], or [[u,Y]] if there is a decorated polynomial Y 
        in self.Basis+C (private attribute) and X is *safely* top-reducible by Y with multiplier u. 
        That's to say, u*Y has the same leading monomial as X, Y is neither detected by the F5 
        criterion nor the rewritten criterion, and u*Y has smaller signature than X.
        """
        cdef DecoratedPolynomial Y
        t = X.p.lm()
        R = self.HRing
        for Y in self.Basis:
            if Y<X:
                tt = Y.p.lm()
                if R.monomial_divides(tt,t):
                    u = R.monomial_quotient(t,tt)
                    umu = Y.mu*u
                    # Y is a reductor of X if u*Y has different signature from X,
                    # (u,Y) is not rewritable, and umu is not topreducible.
                    if ((Y.nu!=X.nu) or (umu!=X.mu)) and (not self.topreducible(umu)) and (not self.is_rewritable(u,Y)):
                        return [u,Y]
        for Y in completed: 
            if Y<X:
                tt = Y.p.lm()
                if R.monomial_divides(tt,t):
                    u = R.monomial_quotient(t,tt)
                    umu = Y.mu*u
                    if ((Y.nu!=X.nu) or (umu!=X.mu)) and (not self.topreducible(umu)) and (not self.is_rewritable(u,Y)):
                        return [u,Y]
        return []

    def topreducible(self, u):
        """
        F.topreducible(u): Tests whether the F5 criterion would apply to decorated polynomials 
        with signature (u,i), where u is a monomial and self.Rgb (private attribute) provides
        a Groebner basis for the ideal spanned by the generators #0,...,i-1.
        """
        return u.reduce(self.RgbMon)==0

    cdef add_rule(self, DecoratedPolynomial X):
        "F.add_rule(X) adds the rewriting rule corresponding to the decorated polynomial X"
        #print "Add", X.nu, X.mu
        self.Rules[X.nu].append(X)

    def is_rewritable(self, u, DecoratedPolynomial X):
        """
        F.is_rewritable(u,X) tests if the is a rewriting (corresponding to Gaussian 
        elimination "from top") for u*X, where u is a monomial and X a decorated polynomial.
        """
        cdef DecoratedPolynomial Y
        cdef list R = self.Rules[X.nu]
        cdef int l = len(R)
        HR = self.HRing
        umu = X.mu*u
        while (1):
            l-=1
            if l<0:
                return False
            Y = R[l]
            if Y is X:
                return False
            if HR.monomial_divides(Y.mu,umu):
                return True
        #return (X.mu*u).reduce([Y.mu for Y in self.Rules[X.nu][X.rule+1:]])==0

