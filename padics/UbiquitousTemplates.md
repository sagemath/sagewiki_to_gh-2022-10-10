 * ''Goal'' -- Implement unramified and Eistenstein extensions of Zp and Qp (the one-step extensions) using templates.  Switch the other finite field classes to using templates.
 * ''Type'' -- speed improvements, conceptual cleanup
 * ''Priority'' -- Medium-Low
 * ''Difficulty'' -- Medium
 * ''Prerequisites'' -- [[../GeneralExtensions | general ring extensions]]
 * ''Background'' -- See [[../GeneralExtensions | general ring extensions]]
 * ''Contributors'' -- David Roe
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

== Tasks ==

 1. Rewrite `pAdicZZpXCRElement`, `pAdicZZpXCAElement` and `pAdicZZpXFMElement` to use templates (ie, make a conceptual split into the template files and the linkage files for the particular implementation using NTL's `ZZ_pX` class).

 1. Make subclasses of these templates for NTL's `ZZ_pX`, for `zmod_poly_t` and for `fmpz_poly_t`.  Compare the speeds for different values of p and precision and implement default choices of implementation in Zq, Qq and Zp.extension.

 1. Extract the other implementations of finite fields into linkage files and try to unify the different finite field implementations into a single template as much as possible.
