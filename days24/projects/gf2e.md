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

=== r1 ===
==== 1000 x 1000 ====
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

=== r2 ===
==== 1000 x 1000 ====
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

=== r3 ===
==== 1000 x 1000 ====
||     n || M4rie mul || Magma mul || M4rie elim || Magma elim ||
||     2 ||      0.06 ||      0.02 ||       0.04 ||       0.08 ||
||     3 ||      0.07 ||      0.06 ||       0.04 ||       0.08 ||
||     4 ||      0.08 ||      0.11 ||       0.05 ||       0.10 ||
||     5 ||      0.17 ||      1.79 ||       0.09 ||       0.95 ||
||     6 ||      0.21 ||      1.81 ||       0.12 ||       0.98 ||
||     7 ||      0.29 ||      1.85 ||       0.19 ||       1.00 ||
||     8 ||      0.43 ||      2.51 ||       0.33 ||       1.29 ||
||     9 ||      4.84 ||      6.44 ||       2.82 ||       2.41 ||
||    10 ||     11.84 ||      6.43 ||       8.12 ||       2.41 ||

==== 2000 x 2000 ====
||     n || M4rie mul || Magma mul || M4rie elim || Magma elim ||
||     2 ||      0.36 ||      0.15 ||       0.20 ||       0.18 ||
||     3 ||      0.58 ||      0.36 ||       0.23 ||       0.34 ||
||     4 ||      0.63 ||      0.73 ||       0.28 ||       0.48 ||
||     5 ||      2.77 ||     14.13 ||       0.71 ||       7.32 ||
||     6 ||      3.18 ||     14.31 ||       0.90 ||       7.46 ||
||     7 ||      4.53 ||     14.54 ||       1.47 ||       7.49 ||
||     8 ||      4.98 ||     19.75 ||       2.90 ||      10.07 ||
||     9 ||     26.83 ||     51.71 ||      14.86 ||      19.23 ||
||    10 ||     48.22 ||     51.66 ||      32.74 ||      19.45 ||
