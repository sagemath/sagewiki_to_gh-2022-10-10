=== Project Leader ===

Kate

=== Group Members ===

Aly, Jenn, Diane, Ekin

=== Project Description ===

* [[attachment:KateWishList.sws]]
  * Wrap E.reduction(prime)(P) so that we can also use P.reduction(prime) [[http://trac.sagemath.org/sage_trac/ticket/11822|#11822]]
  * Implement E.reduction(p) for E defined over a p-adic fields 
    * This found a bug: [[http://trac.sagemath.org/sage_trac/ticket/11826|#11826]]
  * See what exactly is going on in E.global_minimal_model(), is it returning the unique restricted model?  If so, update documentation
  * Implement Singular Weierstrass Equations and functionality similar to Elliptic Curves 
     * make E.reduction(bad_prime) able to return this singular cubic object [[http://trac.sagemath.org/sage_trac/ticket/11823|#11823]]
     * change weierstrass model, addition of points, P.is_singular() to check if point is node/cusp, etc
  * Compute lots of examples to find guesses for bounds on "C"
  * p-adic Tate's algorithm

* Put Kate's EDS class into sage (document properly)?

=== Singular Cubics ===

[[http://trac.sagemath.org/sage_trac/ticket/11823 | Trac ticket 11823 ]]

* Functions that seem ok out of the box (so need only documentation adjustment/testing):

  * a_invariants() etc. (b, c also)
  * discriminant()
  * base_ring()
  * base_field()
  * is_on_curve()
  * coordinate_ring()
  * division_polynomial()
  * formal_group()
  * multiplication_by_m()?
  * addition of points on a curve

* Functions that should do something appropriate but don't (need coding):

  * j_invariant() -- should probably return +infinity?
  * change_weierstrass_model() -- the problem may be my patch didn't work
  * base_extend() -- the problem may be my patch didn't work
  * change_ring() -- the problem may be my patch didn't work
  * cardinality() -- for finite fields
  * local stuff....??

* Functions that we should write (new):

  * is_singular() (done)
  * P.is_singular_point() -- for a point on the curve
  * singularity_type() -- tells you if it's a node or a cusp
  * singular_point() -- returns the node or cusp
