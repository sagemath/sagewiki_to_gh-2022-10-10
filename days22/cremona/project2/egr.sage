load '/home/jim/Desktop/intpts.sage' #Please insert the appropriate directory

def ideal_sqrt(u,S = []):
    u_fact = u.prime_to_S_part(S).factor()
    if all([r[1]%2 == 0 for r in u_fact]):
        u_sqrt = [r[0]^(r[1]/2) for r in u_fact]
        return prod(u_sqrt)
    raise ValueError, str(u)+" is not an S-square"

def K2_4(self):
   result = dict()
   for u in self.selmer_group([],2):
       C = self.class_group()
       C4 = [g for g in C if g.order() == 4]+[C(1)]
       for g in C4:
           if (not C(ideal_sqrt(self.ideal(u))) in result.keys()) and C(ideal_sqrt(self.ideal(u))) == g^2:
               result[u] = (C(ideal_sqrt(self.ideal(u)))/g^2).ideal().gen(0)
   return result

def full_square_dict(D):
    Dnew = dict(D)
    result = dict()
    for k in Dnew.keys():
        result[k] = Dnew[k]
        del Dnew[k]
        for l in Dnew.keys():
            result[k*l] = result[k]*Dnew[l]
    return result

def whole_group(gens, exponents):
   g = gens[0]; gens = gens[1:]
   e = exponents[0]; exponents = exponents[1:]
   res = g
   for k in range(e):
       if gens:
           for gg in whole_group(gens, exponents):
               yield res * gg
       else:
           yield res
       res *= g

def egr(self):
    r"""
    Returns the Elliptic curves with j not equal to 0 or 1728 over self with everywhere good reduction, assuming Denis Simon's program simon_two_descent() returns a complete set of generators. The algorithm is one designed in Cremona and Lingham's paper 'Finding all elliptic curves with good reduction outside a given set of primes.'
    """
    sel24 = full_square_dict(K2_4(self))
    sel3 = whole_group(self.selmer_group(tuple([]),3),[3 for r in self.selmer_group(tuple([]),3)])
    sel2 = whole_group(self.selmer_group(tuple([]),2),[2 for r in self.selmer_group(tuple([]),2)])
    sel6_12 = {}
    primesabove = K.primes_above(6)
    ellist = []
    for a in sel24.keys():
        for b in sel3:
            sel6_12[(a^3)*(b^(-2))] = [sel24[a],b]
    for w in sel6_12.keys():
        Ew = EllipticCurve([0,1728*w])
        plist , clist = IntegralPointsMain(Ew,Ew.simon_two_descent()[2])
        for R in plist:
            j = R[0]^3/w
            if j != 0 and j != 1728 and j.is_integral():
                E = EllipticCurve([-(R[0]/3)*sel6_12[w][0]^2 , (-2/27)*R[1]*sel6_12[w][0]^3])
                for u in sel2:
                    if all([E.quadratic_twist(u).has_good_reduction(p) for p in primesabove]):
                        ellist += [E.quadratic_twist(u)]
    return ellist
