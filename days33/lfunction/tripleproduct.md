
The <a class="http" href="http://wstein.org/home/wstein/days/33/eulerprod.py">eulerprod.py</a> file. 


```txt
#Use the following command to attach the eulerprod package (after downloading it from the link above):

attach /users/lola/desktop/eulerprod.py


#Auxiliary functions that will be called later on:

R_cdf = CDF['x']

def quad_roots(a, p):
    t = R_cdf([p, -a, 1]).roots()
    return (t[0][0], t[1][0])


def __init__(self, N, f, g, h):
    self._N = ZZ(N)
    if not (self._N.is_squarefree() and self._N > 0):
        raise ValueError, "N (=%s) must be a squarefree positive integer"%self._N
    self._newforms = (f,g,h)


#Here is where we start defining the LSeriesTripleProduct class:

class LSeriesTripleProduct(LSeriesAbstract):
    def __init__(self, N, f, g, h):
        self._N = ZZ(N)
        self._f = f
        self._g = g
        self._h = h
        self._newforms = [f, g, h]
        LSeriesAbstract.__init__(self, conductor = N**10, hodge_numbers = [-1,-1,-1,0,0,0,0,1], weight = 4, epsilon = self._compute_epsilon(), poles = [], residues = [], base_field = QQ, is_selfdual = True)
        self._gen = RDF['X'].gen()
        self._genC = CDF['X'].gen()
        self._series = RDF[['X']]
    
    def _compute_epsilon(self, p=None):
        if p is None:
            # Right below equation (1.11) in [Gross-Kudla]
            return -prod(self._compute_epsilon(p) for p in self._N.prime_divisors())
        else:
            if not ZZ(p).is_prime():
                raise ValueError, "p must be prime"
            if self._N % p != 0:
                raise ValueError, "p must divide the level"
            # Equation (1.3) in [Gross-Kudla]
            a_p, b_p, c_p = [f[p] for f in self._newforms]
            return -a_p*b_p*c_p
    
    def _cmp(self, right):
        return cmp((self._N, self._f, self._g, self._h), (right._N, right._f, right._g, right._h))
        
    def __repr__(self):
        return "L-series triple product of %s" %self._f %self._g %self._h 
    
    def _local_factor(self, P, prec):
        return charpoly(self, P)
    
    def __call__(self, s):
        return self._function(prec(s))(s)  
        
    def _charpoly_good(self, p):
        Y = self._genC 
        a = [quad_roots(f[p], p) for f in self._newforms]
        L = 1
        for n in range(8):
            d = ZZ(n).digits(2)
            d = [0]*(3-len(d)) + d
            L *= 1 - prod(a[i][d[i]] for i in range(3))*Y
        return self._gen.parent()([x.real_part() for x in L])      
     
    def _charpoly_bad(self, p):
        X = self._gen
        a_p, b_p, c_p = [f[p] for f in self._newforms]
        return (1 - a_p*b_p*c_p * X) * (1 - a_p*b_p*c_p*p*X)**2
    
    def charpoly(self, p):
        if self._N % p == 0:
            return self._charpoly_bad(p)
        else:
            return self._charpoly_good(p)

# Examples

E=EllipticCurve([0,-1,1,-10,-20])  

f = E.anlist(10**7)

L = LSeriesTripleProduct(11, f, f, f)

L.anlist(7)

L.number_of_coefficients(5)

L(RealField(5)(2)) #This command currently returns a RunTime Error ("Unable to create L-series, due to precision or other limits in PARI")
```