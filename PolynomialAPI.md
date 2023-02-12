

# Unification of multi- and univariate polynomial API

**Problem**: The methods of uni- and multivariate polynomials of Sage differ widely. By consequence, it is very hard to write a program that works with both uni- and multivariate polynomials. 

**Aim**: 

1. List the available methods 
1. Decide what methods should be common to uni- and multivariate polynomials 
1. Open tickets for implementing or re-naming the methods in a uniform way. 

## Currently available polynomial methods

This table presents methods that are 

1. available only for univariate or only for multivariate polynomials over the rationals, 
1. should be available for both. 
In some cases, the methods are present in both settings, but got a different name. Then, a unification is needed. 

Not listed are methods that make sense only in the uni- or only in the multivariate setting. But, e.g., i do think that it makes sense for a univariate polynomial to provide a method ``is_univariate()``, returning True. Also i see no reason why a univariate polynomial should not provide a list of monomials or even a list of variables (which, of course, is of length at most one). 

The last column provides suggestions for a common name (or '?' if it is not clear whether there should be a common method). 
**Topic** | **univariate only** | **multivariate only** | **suggested Common methods**
 _Basic methods_  |  copy  |  -  |  - 
 _Constituents_  |  change_variable_name, change_ring  |  change_ring  |  change_ring 
 variable_name  |  -  |  variable_names 
 -  |  variable  |  variable 
 exponents (list of Ints)  |  exponents (list of tuples)  |  exponents (list of tuples) 
 coeffs/coefficients/list  |  coefficients  |  coefficients _only_
 -  |  coefficient  |  ? 
 -  |  monomial_coefficient  |  ? 
 -  |  monomials  |  monomials 
 -  | content  |  content 
 -  |  is_univariate  |  is_univariate 
_Term order_ |  degree  |  total_degree  |  degree 
 -  |  degrees  |  degrees? 
 is_monic  |  -  |  is_monic 
 leading_coefficient  |  lc  |  lc 
 -  |  lm  |  lm 
 -  |  lt  |  lt 
 -  |  reduce  |  reduce 
_Etc._ |  denominator  |  -  |  ? 
 numerator  |  -  |  ? 
 xgcd  |  -  |  ? 
 plot  |  -  |  ? (3D) 
 factor_mod  |  -  |  factor_mod 
 is_gen  |  is_generator  |  is_generator 
 is_square  |  -  |  ? 
 is_irreducible  |  -  |  
 factor  |  -  |  
 polynomial  |   |  
 ldegree  |   |  
