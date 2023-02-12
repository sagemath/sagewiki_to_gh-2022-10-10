
* _Goal_ -- the ability to create arbitrary absolute extensions of Qp and Zp, given a monic unramified polynomial f over Zp and an Eisenstein polynomial with coefficients in the extension of Zp defined by f. 
* _Type_ -- basic features, speed improvements 
* _Priority_ -- High 
* _Difficulty_ -- Hard 
* _Prerequisites_ -- None 
* _Background_ -- Mathematical familiarity with extensions of Zp and Qp, `sage.rings.polynomial.polynomial_template`, `sage.libs.flint.zmod_poly_linkage`, `sage.rings.polynomial.polynomial_zmod_flint` 
* _Contributors_ -- David Roe 
* _Progress_ - some progress on templates for finite rings using `zmod_poly_t` 
* _Related Tickets_ --  

## Discussion

See also <a href="/padics/QuoDVRs">quotients of discrete valuation rings</a>. 


### Templates

Currently, a few polynomial classes in Sage are implemented using templates.  I think that more should be, because we can write additional front ends to take advantage of the same linkage files.   


## Tasks

1. Implement rings of the form `(Z/NZ)[x] / (f)` for `p^m < 2^32` and `f` monic using FLINT's `zmod_poly_t`.  Do it using templates (a la `sage.rings.polynomial.polynomial_template`), so that we can reuse the linkage for p-adic extension rings.  Add any necessary functions to `sage.libs.flint.zmod_poly_linkage`.  Write subclasses for the cases that `N` is a power of a prime or actually prime.  Write lots of tests and make this the default implementation for `GF(p^n)` for `2 < p < 2^32` with `p^n > 2^16`. 
1. Implement rings of the form `(Z/NZ)[x] / (f)` for `p^m >= 2^32` and `f` monic using FLINT's `fmpz_poly_t`.  The template from Task 1 will make this a matter of writing a new linkage file for `fmpz_poly_t`.  Write subclasses for the case that N is a power of a prime or actually prime.  Write lots of tests and make this the default implementation for `GF(p^n)` for `p >= 2^32`.  We now never use pari for finite field arithmetic by default. 
1. Write an API for a <a href="/padics/pAdicFLINT">FLINT library</a> that would implement the kinds of polynomial quotient rings from 1 and 2.  Jan Tuitman and Sebastian Pancratz have expressed interest in writing such a library (aimed at p ~ 11 and prec ~ 1000), and it would be great if we could easily plug their work into our template.  This API should include the ability to increase or decrease the precision (or even better, to do arithmetic with polynomials of different precisions). 
1. Write a template for elements of polynomial quotient rings `R[x] / (g)` where `R` is also a polynomial quotient ring implemented using templates.  Such a template would support two celement types: one for each of the C types of polynomial quotient ring.  The elements of finite quotients of a general p-adic extension ring can be implemented by subclassing this. 
1. Write a `listpoly_double_linkage.pxi` file implementing the template from 4 using either Python lists or C arrays.  Maybe implement relative extensions of finite fields as an application (the special case that N is prime and both f and g are irreducible). 
1. Write templates for (two-step) capped relative ring (and field) elements, capped absolute ring elements, and fixed modulus ring elements using listpoly_double_linkage.pxi.  Write a linkage file for NTL's `ZZ_pEX` class, which should implement similar functionality.  The top extension is Eisenstein and the bottom is unramified. 