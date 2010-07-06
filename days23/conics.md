= Coding Sprint Project: Solving Conics =

* People: Marco Streng, Mak Trifkovic, Peter Bruin, John Cremona 

* This is Trac ticket 727: http://trac.sagemath.org/sage_trac/ticket/727

== Conic class currently available at the ticket ==

* Uses Denis Simon's pari code for solving and parametrizing conics over QQ

* Uses pari's rnfisnorm for finding points on conics over number fields

* Solves conics over finite fields and RR and CC.

== To do ==

* I forgot to include "sage/schemes/plane_conics/__init__.py" (which is empty), so the patch actually doesn't work

* Use a good Hilbert symbol, such as the one of Trac ticket 9334 or the one of Pari. http://trac.sagemath.org/sage_trac/ticket/9334

* Make a hierarchy of Conic classes (modelled after the hierarchy of Elliptic curve classes?), each with special functionality

* Fix broken doctests:

        sage -t  "sage/schemes/plane_conics/conic_solve.py"

        sage -t  "sage/schemes/plane_conics/hilbert.py"

        sage -t  "sage/schemes/plane_conics/projective_conic.py

* Add missing doctests (e.g. pickling)

* Change the constructor of Curve to return a Conic if the curve is a Conic
