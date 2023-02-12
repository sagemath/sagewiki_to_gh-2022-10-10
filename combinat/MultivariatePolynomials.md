

## Specifications for the abstract ring of multivariate polynomials, with several bases

Ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6629">6629</a> 

First micro draft 
```txt
Setup the framework for MultivariatePolynomials with several bases:

    Let us work over `F=\QQ(q,t)` (will be needed for Macdonald polynomials)::

        sage: F = FractionField(QQ['q,t']); (q,t) = F.gens(); F.rename('QQ(q,t)')

    We construct an (abstract) ring of multivariate polynomials over F::

        sage: P = AbstractPolynomialRing(F, 'x0,x1,x2'); P
        The abstract ring of multivariate polynomials in x0, x1, x2 over QQ(q,t)

    See
    [[http://mupad-combinat.svn.sourceforge.net/viewvc/mupad-combinat/trunk/MuPAD-Combinat/lib/EXAMPLES/MultivariatePolynomials.mu?view=markup|examples::MultivariatePolynomials]] ([[http://mupad-combinat.svn.sourceforge.net/viewvc/mupad-combinat/trunk/MuPAD-Combinat/lib/EXAMPLES/TEST/MultivariatePolynomials.tst?view=markup|Tests]]
    for a preliminary implementation in MuPAD-Combinat


    This ring has several bases, starting with the usual monomial basis::

        sage: x = P.monomial_basis()
        Multivariate Polynomial Ring in x0, x1, x2 over QQ(q,t)
        sage: x.basis().keys()
        Integer vectors of length 3
        sage: x0,x1,x2 = x.gens()

        sage: x.term([3,1,2]) + x2^3 + 3
        x0^3*x1*x2^2 + x2^3 + 3

        sage:: x is MultivariatePolynomialRing(F, 'x0,x1,x2')
        True

        sage: x.print_style(style = "vectors")
        sage: x.term([3,1,2]) + x2^3 + 3
        x[3,1,2] + x[0,0,3] + 3*x[0,0,0]

    The Schubert basis::

        sage: Y = P.schubert()
        sage: Y
        Multivariate polynomials in the Schubert basis
        sage: Y.basis().keys()
        Integer vectors of length 3
        sage: Y[1,0,0] * Y[0,1,0]   # ToY(Y[1,0,0] * Y[0,1,0])
        Y[1,1,0] + Y[2,0,0]
        sage: m(Y[1,0,0])             #  Tox(Y[1,0,0])
        x0
       # TODO: add larger examples!

# Design to be discussed in the long run
#     One can optionaly specify an alphabet, whose elements should leave in the ground ring::
#      sage: Y = P.schubert([x2,x1,x0])
#    If the ground ring allows for it, the default alphabet should be [y0,y1,y2]

    The key polynomials (Demazure characters)::

        sage: K = P.key_polynomials(type = "A")
        sage: K
        Multivariate polynomials in the key polynomial basis
        sage: K.basis().keys()
        Integer vectors of length 3
        sage: K(x0 * (x0+x1))              # x2K(x0 * (x0+x1))   En type B (not yet implemented):  x2KB(x0 * (x0+x1))
        K[0,2,0] - K[2,0,0]
        sage: K[1,0,0] * K[0,1,0]           # x2K(K2x(K[1,0,0] * K[0,1,0]))
        K[1,1,0] + K[2,0,0]
        sage: m(K[0,2,0] - K[2,0,0])      # K2x(K[0,2,0] - K[2,0,0])
        x0^2 + x0*x1
        # TODO: add larger examples computed with ACE!

    The Demazure atoms: / dual of key polynomials:

        sage: hK = P.key_polynomials_dual(type = "A")     # tool(`Key7.mpl`)
        sage: hK
        Multivariate polynomials in the dual basis of  key polynomials
        sage: hK.dual()
        Multivariate polynomials in the key polynomials basis
        sage: scalar(hK[5,2,4], K[4,2,5])  # Watch for the reversal of the vector (weight)
        1
        sage: hK.basis().keys()
        Integer vectors of length 3
        sage: hK[2,4,1] * hK[2,1,3]          # x2hK(expand(K2x(hK[0,2,1]) * K2x(hK[1,0,1]))))
        hK[1,2,2] + hK[2,1,2]
        sage: x(hK[4,0,3])                       # K2x(hK[4,0,3])
        x[4,2,1] + x[4,1,2] + x[4,0,3]

    Grothendieck polynomials::

        sage: G = P.grothendieck_polynomials(type = "A")
        sage: G
        Multivariate polynomials in the key polynomial basis
        sage: G.basis().keys()
        Integer vectors of length 3
        sage: hK[2,4,1] * hK[2,1,3]          # x2hK(expand(K2x(hK[0,2,1]) * K2x(hK[1,0,1]))))
        hK[1,2,2] + hK[2,1,2]
        sage: x(hK[4,0,3])                       # K2x(hK[4,0,3])
        x[4,2,1] + x[4,1,2] + x[4,0,3]

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

```