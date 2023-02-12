
* _Goal_ -- Define Hensel lifting for roots and factorizations of polynomials over Henselian rings. 
* _Type_ -- basic features 
* _Priority_ -- High 
* _Difficulty_ -- Medium-Easy 
* _Prerequisites_ -- <a href="/padics/PolynomialPrecision">p-adic polynomial precision</a> 
* _Background_ --  
* _Contributors_ -- David Roe 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion

This is easy once the implementation of polynomials stabilizes... 


## Tasks

1. Write a category `HenslianRings` (or maybe `HenselianRingsWithUniformizer`) as a place to write 2-5.  Also a category for polynomials over such rings... 
1. Write a function that lifts a root of a polynomial (defined to sufficient precision) up one precision. 
1. Write a function that lifts a root of a polynomial (defined to sufficient precision) to double precision. 
1. Write a function that lifts a coprime factorization up one precision. 
1. Write a function that lifts a coprime factorization to double precision. 
1. Write functions that determine precisions of the resulting objects given the precision of the original polynomial. 
1. Write optimized versions of 2-5 for polynomials over Zp and Qp. 