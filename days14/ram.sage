# Compute the ramified primes in a quadratic number field
def RamifiedPrimes(K):
    """
    Compute the list of (finite) ramified primes of K.

    Verify that K is a quadratic field.
    Compute discriminant
    Return a list of prime factors of discriminant.
    """
    import sage.rings.number_field.number_field as NF
    if not isinstance(K,NF.NumberField_quadratic):
        return -1
    D = K.discriminant()
    FL = D.factor()
    PL = [FL[i][0] for i in xrange(len(FL))]
    return PL
