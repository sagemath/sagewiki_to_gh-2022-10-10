
* _Goal_ -- Create an option for Zq and Qq to generate their defining polynomial by lifting from GF(p)[x] to a factor of x^q-1 (as opposed to lifting naively)  
* _Type_ -- Convenience feature (computing Frobenius in such a representation is very fast) 
* _Priority_ -- Medium-Low 
* _Difficulty_ -- Medium 
* _Prerequisites_ -- might rely on some polynomial code from <a href="/padics/PolynomialPrecision">p-adic polynomial precision</a> 
* _Background_ -- See <a class="http" href="http://homes.esat.kuleuven.be/~fvercaut/talks/pAdic.pdf">this talk</a> 
* _Contributors_ --  
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Given an irreducible polynomial f of degree n over GF(p), compute a lift of f that divides `x^(p^n)-1`.  Plug this into Zq and Qq, and change the code for Frobenius to take advantage of this representation. 