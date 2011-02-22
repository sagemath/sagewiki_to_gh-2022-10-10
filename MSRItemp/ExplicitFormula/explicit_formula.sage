import sys
import mpmath

psi = mpmath.digamma
delta = log(2)/(2*pi)

def von_mangoldt(n, R = RR):
    '''
    return Lambda(n), evaluated in the ring R
    '''
    if n == 1:
        return R(0)
    if not is_prime_power(n):
        return R(0)
    factors = factor(n)
    return R(factors[0][0]).log()

def beurling_function(terms = 10, precision = 0):
    z = SR.var('z')
    B = 1 + 2 * (sin(pi * z)/pi)^2 * (1/z - sum( 1/(z+n)^2 for n in [1 .. terms] ) )
    return B
    
def selberg_minus_function(terms = 10, precision = 0, delta = 1, alpha = -1, beta = 1):
    z = SR.var('z')
    B = beurling_function(terms = terms, precision = precision)
    if precision == 0:
        precision = 53
    Sminus = -(1/2)*B.subs(z = delta*(alpha - z)) - (1/2)*B.subs(z = delta*(z - beta))
    if precision == 53:
        return fast_callable(Sminus, domain=float, vars='z')
    else:
        return fast_callable(Sminus, domain=RealField(precision), vars='z')


def selberg_plus_function(terms = 10, precision = 0, delta = 1, alpha = -1, beta = 1):
    z = SR.var('z')
    B = beurling_function(terms = terms, precision = precision)
    if precision == 0:
        precision = 53
    Sminus = (1/2)*(B.subs(z = delta*(z - alpha)) + B.subs(z = delta*(beta - z)))
    if precision == 53:
        return fast_callable(Sminus, domain=float, vars='z')
    else:
        return fast_callable(Sminus, domain=RealField(precision), vars='z')
        
def selberg_minus_function_integer_width(delta = 1, alpha = -1, beta = 1, domain = float, symbolic = False):
    z = SR.var('z')
    terms = RDF(delta*(beta - alpha)).round() - 1
    Sminus = (sin(pi*delta * (alpha - z)))^2/pi^2 * (sum ( [1/(delta*(alpha - z) + n)^2 for n in srange(1, terms + 1)]) - 1/(delta*(z - beta)) - 1/(delta*(alpha - z)))
    if symbolic:
        return Sminus
    else:
        return fast_callable(Sminus, domain=domain, vars='z')

def sinc_squared(delta = 1):
    def f(x):
        if x == 0:
            return RR(1)
        else:
            return (RR(delta * pi * x).sin()/RR(delta * pi * x))^2
    return f

def sinc(delta = 1):
    def f(x):
        if x == 0:
            return RR(1)
        else:
            return (RR(delta * pi * x).sin()/RR(delta * pi * x))
    return f


def tri(delta = 1):
    def f(x):
        return max( RR(1 - abs(x/delta)), RR(0))/RR(delta)
    return f

def elliptic_curve_rank_bound(delta):
    """compute a function that will give an upper bound for the analytic rank of an elliptic curve of conductor N, assuming GRH.
    Uses the explicit formula with the test function sinc(delta x)."""

    f = sinc_squared(delta)
    f_hat = tri(delta)

    gamma_term1, error1 = mpmath.quad(lambda t : psi(1/4 + t * i/2).real * f(t), [-oo, oo], error = true)
    gamma_term1 = RR(gamma_term1.real)
    error1 = RR(error1)

    print error1

    if error1 > .1:
        print "warning: error in computing the first numerical intergral was probably too large."


    gamma_term2, error2 = mpmath.quad(lambda t : psi(1/4 + t * i/2 + 1/2) * f(t), [-oo, oo], error = true)
    gamma_term2 = RR(gamma_term2.real)
    error2 = RR(error2)

    print error2

    if error2 > .1:
        print "warning: error in computing the second numerical intergral was probably too large."

    N = SR.var('N')

    # the prime sum...
    # f_hat has support in -delta, delta, so our sum will be over the prime powers
    # p^alpha such that log(p^alpha)/2pi < delta, i.e. p < exp(2 pi delta)

    S = RR(0)

    print ceil(exp(2 * pi * delta))
    sys.stdout.flush()

    for n in sxrange(ceil(exp(2 * pi * delta))):
        x = von_mangoldt(n) * 2

        if x != 0:
            S = S + x/RR(n).sqrt() * f_hat(RR(n).log()/RR(2 * pi)) 

    S = S / RR(pi)

    bound = (gamma_term1/RR(2 * pi) + gamma_term2/RR(2 * pi) - f_hat(0) * RR(pi).log()/RR(pi) + f_hat(0)/RR(2 * pi) * log(N))/f(0) + S
    return N, bound

def gamma_integrand_1(delta):
    f = sinc_squared(delta)
    return lambda t : psi(1/4 + t * i/2).real * f(t)
