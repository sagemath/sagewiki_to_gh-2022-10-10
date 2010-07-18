Linear algebra over small extensions of GF(2).

== Library ==

The library is here: http://bitbucket.org/malb/m4rie 

Get in contact with Martin Albrecht to get commit rights.

== Sage Patch ==

A patch for Sage is here: https://bitbucket.org/malb/m4rie/downloads/m4rie_for_sage.patch

== Todo ==

=== Implement simple functions in m4rie ===

Examples: stacking, augmenting, printing

=== Write C test code ===

=== Write C documentation ===

=== Implement methods of Sage class ===

=== Write documentation for Sage class ===

=== Improve performance of Travolta-Gaussian elimination ===

 * use more than one table

=== Improve performance of Travolta multiplication ===

 * get inspiration from M4RM

=== Implement Strassen multiplication ===

== Preliminary Bench***market***ing ==

'''1000 x 1000 revision 1'''
||     n || M4rie mul || Magma mul || M4rie elim || Magma elim ||
||     2 ||      0.06 ||      0.02 ||       1.28 ||       0.06 ||
||     3 ||      0.08 ||      0.05 ||       1.32 ||       0.07 ||
||     4 ||      0.09 ||      0.11 ||       1.33 ||       0.08 ||
||     5 ||      0.17 ||      1.79 ||       1.35 ||       0.96 ||
||     6 ||      0.21 ||      1.83 ||       1.39 ||       0.97 ||
||     7 ||      0.29 ||      1.84 ||       1.45 ||       1.00 ||
||     8 ||      0.42 ||      2.50 ||       1.57 ||       1.29 ||
||     9 ||      4.72 ||      6.44 ||       3.90 ||       2.41 ||
||    10 ||     11.54 ||      6.43 ||       8.94 ||       2.40 ||
