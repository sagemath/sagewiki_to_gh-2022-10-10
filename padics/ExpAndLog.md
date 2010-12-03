 * ''Goal'' -- Fix implementation of p-adic exponential and logarithm maps for extensions
 * ''Type'' -- basic features
 * ''Priority'' -- Medium-High 
 * ''Difficulty'' -- Medium
 * ''Prerequisites'' -- None for 1, [[../GeneralExtensions | general ring extensions]] for 2.
 * ''Background'' -- 
 * ''Contributors'' -- 
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

[[http://homes.esat.kuleuven.be/~fvercaut/talks/pAdic.pdf | this talk]] has some interesting comments, some of which apply exp and log.

== Tasks ==

 1. Fix the code in `padic_ZZ_pX_FM_element.pyx` and write analogous code for capped relative and capped absolute unramified and Eisenstein elements.  Also write the exponential map.

 1. Implement log and exp for elements of two-step extensions.
