Linear algebra over small extensions of GF(2).

=== People === 

 * '''Martin Albrecht'''
 * Ciaran Mullan

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

==== 1000 x 1000 revision 1 ====
||     n || M4rie mul || Magma mul || M4rie elim || Magma elim ||
||     2 ||      0.06 ||      0.02 ||       0.04 ||       0.06 ||
||     3 ||      0.08 ||      0.06 ||       0.05 ||       0.10 ||
||     4 ||      0.09 ||      0.10 ||       0.06 ||       0.08 ||
||     5 ||      0.35 ||      1.82 ||       0.20 ||       0.98 ||
||     6 ||      0.44 ||      1.82 ||       0.22 ||       0.97 ||
||     7 ||      0.36 ||      1.85 ||       0.29 ||       0.98 ||
||     8 ||      0.62 ||      2.52 ||       0.44 ||       1.30 ||
||     9 ||      4.94 ||      6.46 ||       2.93 ||       2.41 ||
||    10 ||     11.96 ||      6.43 ||       8.10 ||       2.40 ||


==== 1000 x 1000 revision 2 ====
||     n || M4rie mul || Magma mul || M4rie elim || Magma elim ||
||     2 ||      0.06 ||      0.02 ||       0.04 ||       0.05 ||
||     3 ||      0.08 ||      0.06 ||       0.05 ||       0.07 ||
||     4 ||      0.08 ||      0.11 ||       0.06 ||       0.08 ||
||     5 ||      0.17 ||      1.79 ||       0.12 ||       0.98 ||
||     6 ||      0.21 ||      1.82 ||       0.15 ||       0.98 ||
||     7 ||      0.29 ||      1.85 ||       0.23 ||       0.98 ||
||     8 ||      0.43 ||      2.51 ||       0.37 ||       1.29 ||
||     9 ||      5.04 ||      6.45 ||       3.01 ||       2.42 ||
||    10 ||     11.95 ||      6.45 ||       8.11 ||       2.39 ||
