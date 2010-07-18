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

{{{
#!python
sage: m,n = 3000, 3000
sage: for i in range(2,10+1):
...       K.<a> = GF(2^i)    
...       A = random_matrix(K, m, n)
...       t = cputime()
...       A.echelonize('travolta')
...       print "%2d: %5.2f"%(i, cputime(t))
 2:  0.76
 3:  2.59
 4:  2.45
 5:  7.98
 6:  8.39
 7:  9.22
 8: 11.58
 9: 41.59
10: 71.06
}}}

{{{
#!python
sage: %magma
sage: for i in [2..10] do 
...     K<a> := GF(2^i);
...     A := RandomMatrix(K,3000,3000);
...     t := Cputime();
...     E:= EchelonForm(A);
...     print i, Cputime(t);
...
sage: end for
2 0.710
3 0.910
4 1.630
5 24.830
6 26.110
7 26.270
8 36.390
9 68.090
10 66.800
}}}

{{{
#!python
sage: m,n = 3000, 3000
sage: for i in range(2,10+1):
...       K.<a> = GF(2^i)    
...       A = random_matrix(K, m, n)
...       B = random_matrix(K, m, n)
...       t = cputime()
...       C = A*B
...       print "%2d: %5.2f"%(i, cputime(t))
 2:  2.10
 3:  6.35
 4:  6.18
 5: 18.75
 6: 19.89
 7: 22.15
 8: 25.87
 9: 113.10
10: 153.06
}}}

{{{
#!python
sage: m,n = 3000,3000
sage: for i in range(2,10+1):
...       _ = magma.eval("K<a> := GF(2^%d)"%i)
...       A = magma("RandomMatrix(K,%d,%d)"%(3000,3000))
...       B = magma("RandomMatrix(K,%d,%d)"%(3000,3000))
...       t = magma.cputime()
...       C = A*B
...       print "%2d: %5.2f"%(i, magma.cputime(t))
 2:  0.44
 3:  1.19
 4:  3.85
 5: 62.17
 6: 61.62
 7: 73.85
 8: 137.72
 9: 274.83
10: 312.15
}}}
