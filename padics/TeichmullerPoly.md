 * ''Goal'' -- Create an option for Zq and Qq to generate their defining polynomial by lifting from GF(p)[x] to a factor of x^q-1 (as opposed to lifting naively) 
 * ''Type'' -- Convenience feature (computing Frobenius in such a representation is very fast)
 * ''Priority'' -- Medium-Low
 * ''Difficulty'' -- Medium
 * ''Prerequisites'' -- might rely on some polynomial code from [[../PolynomialPrecision | p-adic polynomial precision]]
 * ''Background'' -- See [[http://homes.esat.kuleuven.be/~fvercaut/talks/pAdic.pdf | this talk]]
 * ''Contributors'' -- 
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

== Tasks ==

 1. Given an irreducible polynomial f of degree n over GF(p), compute a lift of f that divides `x^(p^n)-1`.  Plug this into Zq and Qq, and change the code for Frobenius to take advantage of this representation.
