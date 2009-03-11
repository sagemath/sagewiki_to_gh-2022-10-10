# Examine factorization of primes:
# Note that 'x' is not explicitly defined
#  (it's a symbolic variable, set by default).
f = x^2-15 
K.<a> = NumberField(f); K 
OK = K.maximal_order(); OK 
A = 5*OK; A 
FF = A.prime_factors(); FF 
P = FF[0] 
P.is_prime() 
P.ramification_index() 
P.residue_class_degree() 

# Define a function for your own use
def RamifiedPrimes(K):
    import sage.rings.number_field.number_field as NF
    if not isinstance(K,NF.NumberField_quadratic):
        return -1
    D = K.discriminant()
    FL = D.factor()
    PL = [FL[i][0] for i in xrange(len(FL))]
    return PL

# and use it.
RamifiedPrimes(K)

#if this is in a file, you can load it:
load /tmp/ram.sage
attach /tmp/ram.sage

# Define a number field with generator alpha,
#  a root of x^3-2 (shows symbolic usage)
K.<alpha> = NumberField(x^3 - 2); K
alpha^3

# You can deal with polynomials in a more "official" way (we've
#  clobberred Zx by clobbering 'x', so we have to recreate it.

Zx.<x> = PolynomialRing(ZZ)
f = x^2+2
L.<beta> = NumberField(f); L
beta^2
K.complex_embeddings()   # K is the cubic field above
L.complex_embeddings()

# Check what happened to 'x'
type(x)
reset('x')
type(x)

# Clobber 'x' and see what happens:
x = 1
E.<gamma> = NumberField(x^3-2); E
reset('x')

# Symbolic Use:
a = sqrt(2); a
K.<b> = QQ[a]; K
b
b^2
(b+1)^2
QQ[a/3 + 5]

# Be aware of notation:
QQ[b]
# vs.
QQ(b)
# What's the difference?

# Some Galois Group computations
K.<a>=NumberField(x^3-2)
G = K.galois_group(); G
G.order()

L.<b> = K.galois_closure(); L
G1 = L.galois_group()
G1.order()
G2 = Hom(L, L)
G2
G2.order()
G2.list()
phi = G2.list()[1]
phi
phi(b^2 + 2/3*b)

# Class Numbers
L.<a> = NumberField(x^2 + 23)
L.class_number()

# Orders
K.<I> = NumberField(x^2 + 1)
R = K.order(7*I); R
R.basis()
O=K.maximal_order(); O
R.index_in(O)

# Relative Extensions
K.<sqrt2> = QuadraticField(2)
R.<X> = K[]; R
L.<a> = K.extension(X^3 + sqrt2*X + 5); L
a^3
a^3 + sqrt2*a
L.galois_group()
L.absolute_degree()

### Group Theory/Gap Wrapping
PSL1 = PSL(3,4)
PSL1.order()
PSL1.is_simple()
P2 = PSL1.sylow_subgroup(2)
P2.center().order()
P7 = PSL1.sylow_subgroup(7)
# Now, Suppose we want the cosets of P2 in PSL1.
# Check with the TAB trick...

# No such luck...
# But we can wrap this in Gap clothing and work with
#  Gap directly
# We wrap up the pieces:
GPSL1 = gap(PSL1)
GP7 = gap(P7)
RC = GPSL1.RightCosets(P7)
len(RC)
C = RC[1]; C
# Note that this is *not* a python list:
C[1]
# It *is* a Gap list:
C.Elements()[2]
type(C)
