== Specifications for the abstract ring of multivariate polynomials, with several bases ==

Ticket [[http://sagetrac.org/sage_trac/ticket/6629|6629]]

First micro draft
{{{
== Setup the framework for MultivariatePolynomials with several bases

    Let us work over `F=\QQ(q,t)` (will be needed for Macdonald polynomials)::

        sage: F = FractionField(QQ['q,t']); (q,t) = F.gens(); F.rename('QQ(q,t)')

    We construct an (abstract) ring of multivariate polynomials over F::

        sage: P = AbstractPolynomialRing(F, 'x0,x1,x2'); P
        The abstract ring of multivariate polynomials in x0, x1, x2 over QQ(q,t)

    See
    [[http://mupad-combinat.svn.sourceforge.net/viewvc/mupad-combinat/trunk/MuPAD-Combinat/lib/EXAMPLES/MultivariatePolynomials.mu?view=markup|examples::MultivariatePolynomials]] ([[http://mupad-combinat.svn.sourceforge.net/viewvc/mupad-combinat/trunk/MuPAD-Combinat/lib/EXAMPLES/TEST/MultivariatePolynomials.tst?view=markup|Tests]]
    for a preliminary implementation in MuPAD-Combinat


    This ring has several bases, starting with the usual monomial basis::

        sage: m = P.m
        Multivariate Polynomial Ring in x0, x1, x2 over QQ(q,t)
        sage: m.basis().keys()
        Integer vectors of length 3
        sage: x0,x1,x2 = m.gens()

        sage: m.term([3,1,2]) + x2^3 + 3
        x0^3*x1*x2^2 + x2^3 + 3

        sage:: m is MultivariatePolynomialRing(F, 'x0,x1,x2')
        True

    The Schubert basis::

        sage: Y = P.schubert() #should take an optional parameter for the second alphabet
        sage: Y
        Multivariate polynomials in the Schubert basis
        sage: Y.basis().keys()
        Integer vectors of length 3
        sage: Y[1,0,0] * Y[0,1,0]
        Y[1,1,0] + Y[2,0,0]
        sage: m(Y[1,0,0])
        x0

    The 

    The SchurSchubert basis (see MuPAD)::

        sage:: P.SchurSchubert()


    This is the free module over Schur polynomials with basis Schubert
    polynomials; the later are indexed by (the code of) permutations
    of `S_n`.

        sage:: P.coeffRing()
	Symmetric polynomials in the Schur basis over QQ(q,t)

	sage:: P.basis().keys()
	Permutations of S_n ?  or Codes ?
        sage:: P.basis().cardinality()
	6


    Other bases in MuPAD-Combinat:

     * NonSymmetricHL, NonSymmetricHLdual

     * UniversalDecompositionAlgebra (free module over symmetric
       functions in the e basis, with monomial below the stair as basis

     * FreeModule over symmetric functions in the e basis over t, with
       descent monomials as basis.

    Non symmetric Macdonald polynomials (should recycle the current sage.combinat.sf.ns_macdonald)

        sage: Macdo = P.MacdonaldPolynomials(q, t)
        sage: E = Macdo.E(pi = [3,1,2]); E
        Multivariate Polynomial Ring in x0, x1, x2 over QQ(q,t), in the Macdonald E basis, with basement [3,1,2]
        sage: E[1,0,0]
        E[1,0,0]
        sage: m(E[1,0,0])
        x0
}}}

}}}
