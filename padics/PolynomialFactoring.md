
* _Goal_ -- Implement algorithms for factoring polynomials over local fields.  Define extensions of local fields using any polynomial. 
* _Type_ -- basic features 
* _Priority_ -- High 
* _Difficulty_ -- High 
* _Prerequisites_ -- <a href="/padics/PolynomialPrecision">p-Adic polynomial precision</a> and <a href="/padics/HenselLifting">Hensel lifting</a>.  In addition, the second half of the project depends on <a href="/padics/GeneralExtensions">General extension rings</a> 
* _Background_ -- Hensel lifting, newton polygons, p-adic factoring algorithms. 
* _Contributors_ -- David Roe, Sebastian Pauli, Brian Sinclair 
* _Progress_ -  
* _Related Tickets_ -- <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12561">#12561</a> 

## Discussion


## Tasks

1. Implement round 4 (or some other p-adic factoring algorithm) for polynomials over Zp.  Compare results against results from pari.  Find right precisions for factors. 
1. Write functions to extract the unramified and Eisenstein pieces from an irreducible polynomial over Zp using the internals of the factoring algorithm. 
1. Write a new p-adic parent class and printer that allows the "generator" of an extension to be arbitrary (rather than a uniformizer for an Eisenstein extension). 
1. Change the extension factory in `sage.rings.padics.factory` to allow creation of such extensions. 
1. Implement factoring for polynomials over other Henselian rings. 