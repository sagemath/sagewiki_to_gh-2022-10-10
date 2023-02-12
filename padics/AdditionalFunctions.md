
* _Goal_ -- implement functions such as Artin-Hasse exponential and p-adic gamma function that exist in Magma.  
* _Type_ -- basic features 
* _Priority_ -- Low 
* _Difficulty_ -- Medium 
* _Prerequisites_ --  
* _Background_ --  
* _Contributors_ -- Mitchell Owen 
* _Progress_ -- Artin-Hasse mostly done, gamma function in progress 
* _Related Tickets_ -- <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12560">#12560</a> 

## Discussion


## Tasks

implement Artin-Hasse exponential: patch submitted needs doctests that verify that it _is_ the AHE implemented an argument m that gives you exp(x+...+x<sup>(p</sup>m)/p^m) locally; need to add to patch should add normalization to extend to closed unit disc 

implement p-adic gamma function: speed-ups finished; need to fix segfaults need to do speed tests and comparisons with MAGMA/PARI implementations 
