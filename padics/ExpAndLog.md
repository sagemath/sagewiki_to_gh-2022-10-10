
* _Goal_ -- Fix implementation of p-adic exponential and logarithm maps for extensions 
* _Type_ -- basic features 
* _Priority_ -- Medium-High  
* _Difficulty_ -- Medium 
* _Prerequisites_ -- None for 1, <a href="/padics/GeneralExtensions">general ring extensions</a> for 2. 
* _Background_ --  
* _Contributors_ --  
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion

<a class="http" href="http://homes.esat.kuleuven.be/~fvercaut/talks/pAdic.pdf">this talk</a> has some interesting comments, some of which apply exp and log. 


## Tasks

1. Fix the code in `padic_ZZ_pX_FM_element.pyx` and write analogous code for capped relative and capped absolute unramified and Eisenstein elements.  Also write the exponential map. 
1. Implement log and exp for elements of two-step extensions. 