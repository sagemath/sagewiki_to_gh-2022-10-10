= Sage Days 16 Project Idea Page =

  
== Create a Cython class for points on elliptic curves and optimize basic arithmetic ==

PEOPLE: William Stein

  Right now basic arithmetic on elliptic curves is way too slow.  It could be sped up by moving the point class to Cython, and possibly by using better formulas for arithmetic, e.g., using projective coordinates. 

== Create elliptic curve classes for elliptic curve models in the Explicit-Formulas Database ==

PEOPLE: David Kohel

  In order to optimize and compare arithmetic, we should first implement alternative models and verify relative performance.  The isomorphisms between different models should also be implemented, and classes for isogenies of these models developed, making use first of the new isogenies code, and eventually putting in place special optimized code for specific models.

See the EFD: http://www.hyperelliptic.org/EFD/

== Rewrite abelian groups ==

PEOPLE: William Stein

  It would be possible to use [[http://trac.sagemath.org/sage_trac/ticket/5882|trac 5882]] to rewrite abelian groups natively in Sage (not using GAP), in a way that is much more flexible than the current implementation.  This could be useful for many number theory applications.   

  [[/abgrp|More Details]]

== Optimize/better document/generally improve graph theory library in Sage ==

PEOPLE: Robert Miller

  Ticket [[http://trac.sagemath.org/sage_trac/ticket/6085|#6085]] contains a lot of work so that a graph created by Graph(implementation='c_graph') is just as functional as a Sage graph. I will be sporadically working on improving documentation and optimizing graphs all week, and anyone interested is welcome to join.
