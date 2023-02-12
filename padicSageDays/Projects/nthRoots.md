

## People

Reinier Broker, Stefan Erickson, Diane Quan, Colin Weir 


## Description

Given an element in a finite extension of Qp and a positive integer n, return the nth root of the element.  

See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12567">#12567</a>. 


## Progress

Implemented square roots and nth roots for elements in Qp. Only returns nth root of an element in Qp if the nth root lies in Qp. 


## Work

Still needs to be editted for syntax conventions, error messages, examples, and documentation.  Also requires optimization and improved code.  

Code should eventually be replaced by superior FLINT code by Sebastian Pancratz; requires FLINT 2 to be incorporated into Sage. See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12173">#12173</a>. 
