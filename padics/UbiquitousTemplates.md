
* _Goal_ -- Implement unramified and Eistenstein extensions of Zp and Qp (the one-step extensions) using templates.  Switch the other finite field classes to using templates. 
* _Type_ -- speed improvements, conceptual cleanup 
* _Priority_ -- Medium-Low 
* _Difficulty_ -- Medium 
* _Prerequisites_ -- <a href="/padics/GeneralExtensions">general ring extensions</a> 
* _Background_ -- See <a href="/padics/GeneralExtensions">general ring extensions</a> 
* _Contributors_ -- David Roe 
* _Progress_ - not started 
* _Related Tickets_ --  

## Discussion


## Tasks

1. Rewrite `pAdicZZpXCRElement`, `pAdicZZpXCAElement` and `pAdicZZpXFMElement` to use templates (ie, make a conceptual split into the template files and the linkage files for the particular implementation using NTL's `ZZ_pX` class). 
1. Make subclasses of these templates for NTL's `ZZ_pX`, for `zmod_poly_t` and for `fmpz_poly_t`.  Compare the speeds for different values of p and precision and implement default choices of implementation in Zq, Qq and Zp.extension. 
1. Extract the other implementations of finite fields into linkage files and try to unify the different finite field implementations into a single template as much as possible. 