= Sage 4.3.1 Release Tour =

== Major features ==

 * Substantial work towards a complete SPARC Solaris 10 port. This is due to the hard work of David Kirkby. The relevant tickets include [[http://trac.sagemath.org/sage_trac/ticket/6595 | #6595]], [[http://trac.sagemath.org/sage_trac/ticket/7138 | #7138]], [[http://trac.sagemath.org/sage_trac/ticket/7162 | #7162]], [[http://trac.sagemath.org/sage_trac/ticket/7505 | #7505]], [[http://trac.sagemath.org/sage_trac/ticket/7817 | #7817]].
 
 * We're moving closer towards a FreeBSD port, thanks to the work of Peter Jeremy at ticket [[http://trac.sagemath.org/sage_trac/ticket/7825 | #7825]].


== Basic arithmetics ==

 * Implement `conjugate()` for `RealDoubleElement` [[http://trac.sagemath.org/sage_trac/ticket/7834 | #7834]] (Dag Sverre Seljebotn) --- New method `conjugate()` in the class `RealDoubleElement` of the module `sage/rings/real_double.pyx` for returning the complex conjugate of a real number. This is consistent with `conjugate()` methods in `ZZ` and `RR`. For example,
 {{{
sage: ZZ(5).conjugate()
5
sage: RR(5).conjugate()
5.00000000000000
sage: RDF(5).conjugate()
5.0
 }}}


== Combinatorics ==

 * [[http://trac.sagemath.org/sage_trac/ticket/7754 | #7754]] (Nicolas M. Thiéry)


== Elliptic curves ==

 * Two-isogeny descent over `QQ` natively using ratpoints [[http://trac.sagemath.org/sage_trac/ticket/6583 | #6583]] (Robert Miller) --- New module `sage/schemes/elliptic_curves/descent_two_isogeny.pyx` for descent on elliptic curves over `QQ` with a 2-isogeny. The relevant user interface function is `two_descent_by_two_isogeny()` that takes an elliptic curve `E` with a two-isogeny `phi : E --> E'` and dual isogeny `phi'`, runs a two-isogeny descent on `E`, and returns `n1`, `n2`, `n1'` and `n2'`. Here, `n1` is the number of quartic covers found with a rational point and `n2` is the number which are ELS. Here are some examples illustrating the use of `two_descent_by_two_isogeny()`:
 {{{
sage: from sage.schemes.elliptic_curves.descent_two_isogeny import two_descent_by_two_isogeny
sage: E = EllipticCurve("14a")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
0
sage: E = EllipticCurve("65a")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
1
sage: E = EllipticCurve("1088j1")
sage: n1, n2, n1_prime, n2_prime = two_descent_by_two_isogeny(E)
sage: log(n1, 2) + log(n1_prime, 2) - 2  # the rank
2
 }}}
 You could also ask `two_descent_by_two_isogeny()` to be verbose in its computation:
 {{{
sage: E = EllipticCurve("14a")
sage: two_descent_by_two_isogeny(E, verbosity=1)
2-isogeny
Results:
2 <= #E(Q)/phi'(E'(Q)) <= 2
2 <= #E'(Q)/phi(E(Q)) <= 2
#Sel^(phi')(E'/Q) = 2
#Sel^(phi)(E/Q) = 2
1 <= #Sha(E'/Q)[phi'] <= 1
1 <= #Sha(E/Q)[phi] <= 1
1 <= #Sha(E/Q)[2], #Sha(E'/Q)[2] <= 1
0 <= rank of E(Q) = rank of E'(Q) <= 0
(2, 2, 2, 2)
 }}}


 * [[http://trac.sagemath.org/sage_trac/ticket/6887 | #6887]] (John Cremona, Jenny Cooley)


== Graph theory ==

 * [[http://trac.sagemath.org/sage_trac/ticket/1321 | #1321]] (Radoslav Kirov, Mitesh Patel)

 * [[http://trac.sagemath.org/sage_trac/ticket/7724 | #7724]] (Nathann Cohen, Yann Laigle-Chapuy)

 * [[http://trac.sagemath.org/sage_trac/ticket/7770 | #7770]] (Rob Beezer)


== Linear algebra ==

 * [[http://trac.sagemath.org/sage_trac/ticket/5174 | #5174]] (John Palmieri)

 * [[http://trac.sagemath.org/sage_trac/ticket/7728 | #7728]] (Dag Sverre Seljebotn)


== Miscellaneous ==

 * [[http://trac.sagemath.org/sage_trac/ticket/6820 | #6820]] (John Palmieri, Mitesh Patel)

 * [[http://trac.sagemath.org/sage_trac/ticket/7482 | #7482]] (William Stein)

 * [[http://trac.sagemath.org/sage_trac/ticket/7514 | #7514]] (William Stein)


== Packages ==

 * [[http://trac.sagemath.org/sage_trac/ticket/7271 | #7271]] (Martin Albrecht)

 * [[http://trac.sagemath.org/sage_trac/ticket/7388 | #7388]] (Robert Miller)
 
 * [[http://trac.sagemath.org/sage_trac/ticket/7483 | #7483]] (William Stein)

 * [[http://trac.sagemath.org/sage_trac/ticket/7692 | #7692]], [[http://trac.sagemath.org/sage_trac/ticket/7749 | #7749]] (Steven Sivek)

 * [[http://trac.sagemath.org/sage_trac/ticket/7745 | #7745]] (Karl-Dieter Crisman)

 * [[http://trac.sagemath.org/sage_trac/ticket/7825 | #7825]] (Peter Jeremy)

 * [[http://trac.sagemath.org/sage_trac/ticket/7840 | #7840]] (William Stein)
