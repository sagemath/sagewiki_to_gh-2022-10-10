

# Coding Sprint Project: Solving Conics

* People: Marco Streng, Mak Trifkovic, Peter Bruin, John Cremona  
* This is Trac ticket 727: <a href="http://trac.sagemath.org/sage_trac/ticket/727">http://trac.sagemath.org/sage_trac/ticket/727</a> 

## Conic class currently available at the ticket

* Uses Denis Simon's pari code for solving and parametrizing conics over QQ. 
* Uses pari's rnfisnorm for finding points on conics over number fields. 
* Solves conics over finite fields and RR and CC. 
* Parametrize any conic given a rational point. 
* A hierarchy of Conic classes (modelled after the hierarchy of Elliptic curve classes and building upon the hierarchy of plane curve classes) 
* Change the constructor of Curve to return a Conic if the curve is a Conic 

## Extensions

* Hilbert symbols (for local solubility of conics): 
      * <a href="http://trac.sagemath.org/sage_trac/ticket/9334">http://trac.sagemath.org/sage_trac/ticket/9334</a> 
      * Pari has Hilbert symbols 
* Conics over polynomial rings: <a href="http://trac.sagemath.org/sage_trac/ticket/6881">http://trac.sagemath.org/sage_trac/ticket/6881</a> 
* An is_norm() function to replace the file "rnfisnorm.py" of ticket 727: <a href="http://trac.sagemath.org/sage_trac/ticket/2329">http://trac.sagemath.org/sage_trac/ticket/2329</a> 