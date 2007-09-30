= Elliptic Curve =

== Get doctest coverage up to 100% ==

== Period Lattice ==
  * Make it so precision can be specified (in bits)
  * Make an abstract "period lattice" class

== Implement Tate's algorithm over number fields ==
  * This means porting Cremona's code.  David Roe started on this.
  * This will give computation of conductors over number fields.  

== Compute the Neron-Tate canonical height of points on elliptic curves over number fields == 

== Reorganize and refactor the ell_rational_field file ==
  1. separate out all the L-series commands into an L-series class, e.g., like padic_lseries right now. 

== Compute E(F_q) and/or #E(F_q) ==
  * Implement smart baby step-giant step (Albrecht, Sutherland)

== Compute with L-series of elliptic curves over number fields ==
  * Use Dokchitser to compute L-function
