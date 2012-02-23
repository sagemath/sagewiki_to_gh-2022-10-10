 * ''Goal'' -- implement functions such as Artin-Hasse exponential and p-adic gamma function that exist in Magma. 
 * ''Type'' -- basic features
 * ''Priority'' -- Low
 * ''Difficulty'' -- Medium
 * ''Prerequisites'' -- 
 * ''Background'' -- 
 * ''Contributors'' -- Mitchell Owen
 * ''Progress'' -- Artin-Hasse mostly done, gamma function in progress
 * ''Related Tickets'' -- 12560

== Discussion ==

== Tasks ==

implement Artin-Hasse exponential: patch submitted
needs doctests that verify that it ''is'' the AHE
implemented an argument m that gives you exp(x+...+x^(p^m)/p^m) locally; need to add to patch
should add normalization to extend to closed unit disc

implement p-adic gamma function: speed-ups finished; need to fix segfaults
need to do speed tests and comparisons with MAGMA/PARI implementations
