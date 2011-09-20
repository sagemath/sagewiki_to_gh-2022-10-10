== To do list ==

* from Alice's talk:
  * Implement the algorithm (use Sage's pseudoprime function to check)
  * What other primality tests does Pari have? Wrap these.
  * Make things faster: implement as a python (maybe cython??) file
  * How does GIMPS work?
  * Ask Drew Sutherland what he's done?
  * Implement Larry Washington's formulas for dealing with elliptic curves over integral domains

* [[attachment:KateWishList.sws]]
  * Wrap E.reduction(prime)(P) so that we can also use P.reduction(prime)
  * See what exactly is going on in E.global_minimal_model(), is it returning the unique restricted model?  If so, update documentation
  * Implement Singular Weierstrass Equations and functionality similar to Elliptic Curves
     * make E.reduction(bad_prime) able to return this singular cubic object (maybe with a flag?)
     * change weierstrass model, addition of points, P.is_singular() to check if point is node/cusp, etc
  * Compute lots of examples to find guesses for bounds on "C"
  * p-adic Tate's algorithm

* Put Kate's EDS class into sage (document properly)?

* p-adics
  * [[http://trac.sagemath.org/sage_trac/ticket/7926|#7926: Bring coverage of Monsky-Washnitzer up to 50%]]
  * [[http://trac.sagemath.org/sage_trac/ticket/8241|#8241: p-adic fields should have Witt Frobenius]]
  * [[http://trac.sagemath.org/sage_trac/ticket/8685|#8685: evaluation of Monsky-Washnitzer objects (really about power series over p-adics)]]
  * [[http://trac.sagemath.org/sage_trac/ticket/9887|#9887: Slow coercion from integer ring to integer mod ring]]
  * [[http://trac.sagemath.org/sage_trac/ticket/11319|#11319: Cannot create homomorphism from prime residue field to finite field]]
  * [[http://trac.sagemath.org/sage_trac/ticket/11777|#11777: Coercion/printing problem with p-adics]]

* wrapping of gauss composition (in pari: QuadClassUnit)

* [[http://trac.sagemath.org/sage_trac/ticket/11697|#11697: Global minimal models over number fields with class number >= 1]] 
    * this is in Connell and probably wouldn't take to long to get at least a python toy version
    * Sage already has this for class number 1 fields

* [[http://trac.sagemath.org/sage_trac/query?status=needs_info&status=needs_review&status=needs_work&status=new&order=priority&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&keywords=~beginner&report=38| Open beginner tickets]]

* Reviewing number theory and elliptic curve tickets

* Kate's Group

* L-function Project
[[http://wiki.sagemath.org/days33/lfunction]]
