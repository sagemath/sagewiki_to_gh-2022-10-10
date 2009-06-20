= Sage Days 16 Project Idea Page =

  
== Create a Cython class for points on elliptic curves and optimize basic arithmetic ==

  Right now basic arithmetic on elliptic curves is way too slow.  It could be sped up by moving the point class to Cython, and possibly by using better formulas for arithmetic, e.g., using projective coordinates. 

== Rewrite abelian groups ==

  It would be possible to use [[http://trac.sagemath.org/sage_trac/ticket/5882|trac 5882]] to rewrite abelian groups natively in Sage (not using GAP), in a way that is much more flexible than the current implementation.  This could be useful for many number theory applications.
