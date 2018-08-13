r"""
This module provides a simple function to convert flipper
number field elements into Sage number field elements.

EXAMPLES::

    sage: import flipper
    sage: import flipper_nf_conversion

    sage: S = flipper.load('S_2_1')
    sage: h = S.mapping_class('acBD')
    sage: F = h.flat_structure()
    sage: x = F.edge_vectors.values()[0].x
    sage: flipper_nf_conversion.flipper_nf_element_to_sage(x)
    2*a^3 - 14*a^2 + 26*a - 14
"""

from sage.rings.all import ZZ, QQ, AA, RIF, NumberField

def flipper_nf_to_sage(K, name='a'):
    r"""
    Convert a flipper number field to Sage.

    .. NOTE::

        Currently, the code is not careful at all with root isolation.
    """
    r = K.lmbda.interval_approximation()
    l = r.lower * ZZ(10)**(-r.precision)
    u = r.upper * ZZ(10)**(-r.precision)

    p = QQ['x'](K.polynomial.coefficients)
    s = AA.polynomial_root(p, RIF(l,u))
    return NumberField(p, name, embedding=s)

def flipper_nf_element_to_sage(x):
    r"""
    Convert a flipper nf element to Sage.
    """
    return flipper_nf_to_sage(x.number_field)(x.linear_combination)

