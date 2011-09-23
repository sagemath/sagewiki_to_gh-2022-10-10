=== Project Leader ===

Kate

=== Group Members ===

Aly, Jenn, Diane, Ekin

=== Project Description ===

Associated notebook file [[attachment:KateWishList.sws]]

Projects are listed by section below.  No one is currently working on these ones:

  * Compute lots of examples to find guesses for bounds on "C"
  * Put Kate's EDS class into sage (document properly)?

=== Restricted global_minimal_model() ===

* ticket?

=== Wrapping E.reduction(prime)(P) ===

* Ticket needs review! [[http://trac.sagemath.org/sage_trac/ticket/11822|#11822]] 

=== p-adics ===

* Implement E.reduction(p) for E defined over a p-adic fields: [[attachment:reduction of elliptic curves over padics.sws]]
  * This found a bug/needed enhancement which is now reported: [[http://trac.sagemath.org/sage_trac/ticket/11826|#11826]]

* Tate's algorithm [[attachment:Tate.sws]]

=== Singular Cubics ===

[[http://trac.sagemath.org/sage_trac/ticket/11823 | Trac ticket 11823 ]]

* Currently the patch on the trac server will allow one to define singular cubics.  

{{{
sage: E = WeierstrassCubic([0,0,0,0,0])
sage: E.is_singular()
True
}}}

* Stuff to do:

  * Work through elliptic curve documentation, test functions that should work for singular curves, and update the following lists
  * Document the WeierstrassCubic and SingularWeierstrass classes we've created
  * Do the stuff on the list below
  * make E.reduction(bad_prime) able to return this singular cubic object
  * put the checks back in for EllipticCurve and SingularWeierstrass that it is actually (or is not) singular

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

* Functions that should do something appropriate but don't (need coding):

  * j_invariant() -- should probably return +infinity?
  * change_weierstrass_model() -- the new curve needs to pass flag
  * base_extend() -- the problem may be my patch didn't work
  * change_ring() -- the problem may be my patch didn't work
  * cardinality() -- for finite fields
  * local stuff....??
  * addition of points on a curve (seems to work, but needs to avoid singular point)

* Functions that we should write (new): done - see attached worksheet.

  [[attachment:singularcurves.sws]]
  * is_singular() (done) -- this is also accessible as an internal flag:  self._is_singular 
  * P.is_singular_point() -- for a point on the curve
  * singularity_type() -- tells you if it's a node or a cusp
  * singular_point() -- returns the node or cusp
