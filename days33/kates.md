=== Project Leader ===

Kate

=== Group Members ===

Aly, Jen, Diane

=== Project Description ===

* [[attachment:KateWishList.sws]]
  * Wrap E.reduction(prime)(P) so that we can also use P.reduction(prime)
  * Implement E.reduction(p) for E defined over a p-adic fields 
  * See what exactly is going on in E.global_minimal_model(), is it returning the unique restricted model?  If so, update documentation
  * Implement Singular Weierstrass Equations and functionality similar to Elliptic Curves
     * make E.reduction(bad_prime) able to return this singular cubic object (maybe with a flag?)
     * change weierstrass model, addition of points, P.is_singular() to check if point is node/cusp, etc
  * Compute lots of examples to find guesses for bounds on "C"
  * p-adic Tate's algorithm

* Put Kate's EDS class into sage (document properly)?

== Quick Sage Example ==
def reduction(self,p):
    """
    This is going to be documentation.  
    This is a simple version of wrapping a function.  
    The next step is to make a patch with this in the correct place in the code.
    """
    P = self
    E = P.curve()
    return E.reduction(p)(P)
