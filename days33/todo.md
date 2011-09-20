== To do list ==

* from Alice's talk:
  * Implement the algorithm (use Sage's pseudoprime function to check)
  * What other primality tests does Pari have? Wrap these.
  * Make things faster: implement as a python (maybe cython??) file
  * How does GIMPS work?
  * Ask Drew Sutherland what he's done?
  * Implement Larry Washington's formulas for dealing with elliptic curves over integral domains

* [[attachment:KateWishList.sws]]

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

* From William: For L-series lovers:  Getting the doctest coverage to 100% on this
might be a good project:

  http://code.google.com/p/purplesage/source/browse/psage/lseries/eulerprod.py

That may discover "issues" (bugs), which I would likely have to fix,
but would also be fun because one gets to come up with lots of
creative examples of L-series all over the place.   Also, the top of
that file has a todo list for new features to implement -- most would
be bad projects, but one which would be good would be to make it so
the Lseries object can use Lcalc (Rubinstein's program) to compute
L-series instead of Dokchitser.  This would be a good project, because
it would mainly involve thinking about the annoying mathematics
involved in going between normalizing L-series with the center of the
critical strip at 1/2 versus not doing that.  Also, it is all pure
Python, so easier to get going.

Anyway, I'd say 1 could be a good project for people who know the
basics of L-series, but want to get a much more concrete feel for
them.  In fact, instead of just trying to get coverage to 100%,
writing a *tutorial* for computing with L-series using that package
would be really nice.   E.g., one could walk through how to find
missing information, create new L-series classes, etc.
