"""
Faugere's F5

These implementations are heavily inspired by John Perry's pseudocode
and Singular implementation of these algorithms.

See http://www.math.usm.edu/perry/Research/ for details.

This implementation runs faster than the Singular script
implementation but uses much more RAM for some reason.

AUTHOR:
    -- 20081013 Martin Albrecht (initial version based on John Perry's pseudocode)
    -- 20081013 John Perry (loop from 0 to m-1 instead of m-1 to 0)

EXAMPLE:
    sage: R.<x,y,z> = PolynomialRing(GF(29))
    sage: I =  R* [3*x^4*y + 18*x*y^4 + 4*x^3*y*z + 20*x*y^3*z + 3*x^2*z^3, \
                   3*x^3*y^2 + 7*x^2*y^3 + 24*y^2*z^3, 
                   12*x*y^4 + 17*x^4*z + 27*y^4*z + 11*x^3*z^2]
    sage: J = I.homogenize()

    sage: f5 = F5() # original F5
    sage: gb = f5(J)
    sage: f5.zero_reductions, len(gb)
    d 7
    d 9
    d 11
    d 6
    d 7
    d 8
    d 9
    d 10
    d 11
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    d 12
    d 13
    d 14
    d 16
    (3, 27)

    sage: f5 = F5R() # F5 with interreduced B
    sage: gb = f5(J)
    sage: f5.zero_reductions, len(gb)
    d 7
    d 9
    d 11
    d 6
    d 7
    d 8
    d 9
    d 10
    d 11
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    d 12
    d 13
    d 14
    d 16
    (3, 18)

    sage: f5 = F5C() # F5 with interreduced B and Gprev
    sage: gb = f5(J)
    sage: f5.zero_reductions, len(gb)
    d 7
    d 9
    d 11
    d 6
    d 7
    d 8
    d 9
    d 10
    d 11
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    verbose 0 (179: 283.py, top_reduction) reduction to zero.
    d 12
    d 13
    d 14
    d 16
    (3, 18)
"""

divides = lambda x,y: x.parent().monomial_divides(x,y)
LCM = lambda f,g: f.parent().monomial_lcm(f,g)
LM = lambda f: f.lm()
LT = lambda f: f.lt()

def compare_by_degree(f,g):
    if f.total_degree() > g.total_degree():
        return 1
    elif f.total_degree() < g.total_degree():
        return -1
    else:
        return cmp(f.lm(),g.lm())

class F5:
    def __init__(self, F=None):
        if F is not None:
            self.Rules = [[] for _ in range(len(F))]
            self.L = [0]
            self.zero_reductions = 0

    def poly(self, i):
        return self.L[i][1]

    def sig(self, i):
        return self.L[i][0]

    def __call__(self, F):
        if isinstance(F, sage.rings.polynomial.multi_polynomial_ideal.MPolynomialIdeal):
            F = F.reduced_basis()
        else:
            F = Ideal(list(F)).reduced_basis()
        if not all(f.is_homogeneous() for f in F):
            F = Ideal(F).homogenize()
            F = F.gens()
        return self.basis(F)

    def basis(self, F):
        poly = self.poly
        incremental_basis = self.incremental_basis

        self.__init__(F)

        Rules = self.Rules
        L = self.L

        m = len(F)
        F = sorted(F, cmp=compare_by_degree)
        
        f0 = F[0]
        L[0] = (Signature(1, 0), f0*f0.lc()**(-1))
        Rules[0] = list()

        Gprev = set([0])
        B = [f0]

        for i in xrange(1,m):
            Gcurr = incremental_basis(F[i], i, B, Gprev)
            if any(poly(lambd) == 1 for lambd in Gcurr):
                return set(1)
            Gprev = Gcurr
            B = [poly(l) for l in Gprev]
        return B

    def incremental_basis(self, f, i, B, Gprev):
        L = self.L
        critical_pair = self.critical_pair
        compute_spols = self.compute_spols
        reduction = self.reduction
        Rules = self.Rules

        L.append( (Signature(1,i), f*f.lc()**(-1)) )
        curr_idx = len(L) - 1
        Gcurr = Gprev.union([curr_idx])
        Rules[i] = list()

        P = reduce(lambda x,y: x.union(y), [critical_pair(curr_idx, j, i, Gprev) for j in Gprev], set())
        while len(P) != 0:
            d = min(t.degree() for (t,k,u,l,v) in P)
            print "d", d
            Pd = [(t,k,u,l,v) for (t,k,u,l,v) in P if t.degree() == d]
            P = P.difference(Pd)
            S = compute_spols(Pd)
            R = reduction(S, B, Gprev, Gcurr)
            for k in R:
                P = reduce(lambda x,y: x.union(y), [critical_pair(j, k, i, Gprev) for j in Gcurr], P)
                Gcurr.add(k)
        return Gcurr

    def critical_pair(self, k, l, i, Gprev):
        poly = self.poly
        sig = self.sig
        is_top_reducible = self.is_top_reducible
        is_rewritable = self.is_rewritable

        #print "crit_pair(%s,%s,%s,%s)"%(k, l, i, Gprev)
        #print self.L
        tk = poly(k).lt()
        tl = poly(l).lt()
        t = LCM(tk, tl)
        u0 = t//tk
        u1 = t//tl
        m0, e0 = sig(k)
        m1, e1 = sig(l)
        if e0 == e1 and u0*m0 == u1*m1:
            return set()
        #print "test1", e0, i, u0, m0
        #print "test2", e1, i, u1, m1
        if e0 == i and is_top_reducible(u0*m0, Gprev):
            #print "test1 done"
            return set()
        if e1 == i and is_top_reducible(u1*m1, Gprev):
            #print "test2 done"
            return set()
        if is_rewritable(u0, k) or is_rewritable(u1, l):
            #print "test3", is_rewritable(u0, k), is_rewritable(u1, l)
            return set()
        if u0 * sig(k) < u1 * sig(l):
            u0, u1 = u1, u0
            k, l = l, k
        return set([(t,k,u0,l,u1)])
        
    def compute_spols(self, P):
        poly = self.poly
        sig = self.sig
        spol = self.spol
        is_rewritable = self.is_rewritable
        add_rule = self.add_rule

        L = self.L

        S = list()
        P = sorted(P, key=lambda x: x[0])
        for (t,k,u,l,v) in P:
            if not is_rewritable(u,k) and not is_rewritable(v,l):
                s = spol(poly(k), poly(l))
                if s != 0:
                    L.append( (u * sig(k), s) )
                    add_rule(u * sig(k), len(L)-1)
                    S.append(len(L)-1)
        S = sorted(S, key=lambda x: sig(x))
        return S

    def spol(self, f, g):
        return LCM(LM(f),LM(g)) // LT(f) * f - LCM(LM(f),LM(g)) // LT(g) * g

    def reduction(self, S, B, Gprev, Gcurr):
        L = self.L
        sig = self.sig
        poly = self.poly
        top_reduction = self.top_reduction

        to_do = S
        completed = set()
        while len(to_do):
            k, to_do = to_do[0], to_do[1:]
            h = poly(k).reduce(B)
            L[k] = (sig(k), h)
            newly_completed, redo = top_reduction(k, Gprev, Gcurr.union(completed))
            completed = completed.union( newly_completed )
            for j in redo:
                # insert j in to_do, sorted by increasing signature
                to_do.append(j)
                to_do.sort(key=lambda x: sig(x))
        return completed

    def top_reduction(self, k, Gprev, Gcurr):
        find_reductor = self.find_reductor
        add_rule = self.add_rule
        poly = self.poly
        sig = self.sig
        L = self.L

        if poly(k) == 0:
            verbose("reduction to zero.",level=0)
            self.zero_reductions += 1
            return set(),set()
        p = poly(k)
        J = find_reductor(k, Gprev, Gcurr)
        if J == set():
            L[k] = ( sig(k), p * p.lc()**(-1) )
            return set([k]),set()
        j = J.pop()
        q = poly(j)
        u = p.lt()//q.lt()
        p = p - u*q
        if p != 0:
            p = p * p.lc()**(-1)
        if u * sig(j) < sig(k):
            L[k] = (sig(k), p)
            return set(), set([k])
        else:
            L.append((u * sig(j), p))
            add_rule(u * sig(j), len(L)-1)
            return set(), set([k, len(L)-1])

    def find_reductor(self, k, Gprev, Gcurr):
        is_rewritable = self.is_rewritable
        is_top_reducible = self.is_top_reducible
        
        poly = self.poly
        sig = self.sig
        t = poly(k).lt()
        for j in Gcurr:
            tprime = poly(j).lt()
            if divides(tprime,t):
                u = t // tprime
                mj, ej = sig(j)
                if u * sig(j) != sig(k) and not is_rewritable(u, j) \
                        and not is_top_reducible(u*mj, Gprev):
                    return set([j])
        return set()
                
    def add_rule(self, s, k):
        self.Rules[s[1]].append( (s[0],k) )

    def is_rewritable(self, u, k):
        j = self.find_rewriting(u, k)
        return j != k

    def find_rewriting(self, u, k):
        Rules = self.Rules
        mk, v = self.sig(k)
        for ctr in reversed(xrange(len(Rules[v]))):
            mj, j = Rules[v][ctr]
            if divides(mj, u * mk):
                return j
        return k

    def is_top_reducible(self, t, l):
        poly = self.poly
        for g in l:
            if divides(poly(g).lt(), t):
                return True
        return False

class F5R(F5):
    def basis(self, F):
        poly = self.poly
        incremental_basis = self.incremental_basis

        self.__init__(F)

        Rules = self.Rules
        L = self.L

        m = len(F)
        F = sorted(F, cmp=compare_by_degree)
        
        f0 = F[0]
        L[0] = (Signature(1, 0), f0*f0.lc()**(-1))
        Rules[0] = list()

        Gprev = set([0])
        B = [f0]

        for i in xrange(1,m):
            Gcurr = incremental_basis(F[i], i, B, Gprev)
            if any(poly(lambd) == 1 for lambd in Gcurr):
                return set(1)
            Gprev = Gcurr
            B = Ideal([poly(l) for l in Gprev]).reduced_basis()
            
        return B

class F5C(F5):
    def basis(self, F):
        poly = self.poly

        self.__init__(F)

        Rules = self.Rules
        L = self.L

        m = len(F)
        F = sorted(F, cmp=compare_by_degree)
        
        f0 = F[0]
        L[0] = (Signature(1, 0), f0*f0.lc()**(-1))
        Rules[0] = list()

        Gprev = set([0])
        B = set([f0])

        for i in xrange(1,m):
            Gcurr = self.incremental_basis(F[i], B, Gprev)
            if any(poly(lambd) == 1 for lambd in Gcurr):
                return set(1)
            B = Ideal([poly(l) for l in Gcurr]).reduced_basis()
            if i != m-1:
                Gprev = self.setup_reduced_basis(B)
        return B

    def incremental_basis(self, f, B, Gprev):
        L = self.L
        critical_pair = self.critical_pair
        compute_spols = self.compute_spols
        reduction = self.reduction
        Rules = self.Rules

        i = len(L)
        L.append( (Signature(1,i), f*f.lc()**(-1)) )
        Rules.append( list() )
        Gcurr = Gprev.union([i])
        P = reduce(lambda x,y: x.union(y), [critical_pair(i, j, i, Gprev) for j in Gprev], set())
        while len(P) != 0:
            d = min(t.degree() for (t,k,u,l,v) in P)
            print "d", d
            Pd = [(t,k,u,l,v) for (t,k,u,l,v) in P if t.degree() == d]
            P = P.difference(Pd)
            S = compute_spols(Pd)
            R = reduction(S, B, Gprev, Gcurr)
            for k in R:
                P = reduce(lambda x,y: x.union(y), [critical_pair(j, k, i, Gprev) for j in Gcurr], P)
                Gcurr.add(k)
        return Gcurr

    def setup_reduced_basis(self, B):
        add_rule = self.add_rule
        self.L = range(len(B))
        self.Rules = [[] for _ in range(len(B))]

        L = self.L
        Rules = self.Rules
        Gcurr = set()

        for i in range(len(B)):
            L[i] = (Signature(1,i), B[i])
            Gcurr.add( i )
            Rules[i] = []
            t = B[i].lt()
            for j in range(i+1, len(B)):
                u = LCM(t, B[j].lt())//B[j].lt()
                add_rule( Signature(u, j), -1 )
        return Gcurr

from UserList import UserList

class Signature(UserList):
     def __init__(self, monomial, index):
         UserList.__init__(self,[monomial, index])
         
     def __lt__(self, other):
         if self[1] < other[1]:
             return True
         elif self[1] > other[1]:
             return False
         else:
             return (self[0] < other[0])

     def __eq__(self, other):
         return self[0] == other[0] and self[1] == other[1]
   
     def __neq__(self, other):
         return self[0] != other[0] or self[1] != other[1]
   
     def __rmul__(self, other):
         if isinstance(self, Signature):
             return Signature(other * self[0], self[1])
         else:
             raise TypeError

f5 = F5C()
