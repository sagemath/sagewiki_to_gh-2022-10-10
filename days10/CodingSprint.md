= SD 10 Coding Sprint =


== Coding Sprint Meetings ==

 * Monday, October 13th at 11am status meeting in A008
 * Tuesday, October 14th at 4pm status meeting in A008 
 * Wednesday, October 15th at 4pm status meeting in A008

The following rooms are available all day during the coding sprint (until midnight)

 * A008 with a capacity of 50 people
 * A006 with a capacity of 30p people
 * A208 with a capacity of 10p people
 * A217 with a capacity of 8p people

== Rules ==

 * participation is optional
 * starting Monday daily and optional status report meetings at 6pm in the amphitheater
 * each person should only participate in a project or two
 * 3.1.3 should be out by Monday

== Informal lectures ==

These should be held on Monday

 * Using Cython (Robert Bradshaw)
 * The new coercion system - the final frontier (Robert Bradshaw or any other volunteer)
 * Mercurial and Mercurial Queues (Mike Hansen)

A schedule for the talks should be announced during the organizational meeting on Monday.

== Coordinators ==

 * Combinatorics: Mike Hansen
 * Linear Algebra: Clement Pernet
 * Groebner Basis (Martin Albrecht)
 * Elliptic Curves (?)

== Suggested projects ==

=== Bug Squashing ===
(Michael Abshoff, 1/2 David Harvey, Simon King) 

=== Polynomial Factory over QQ ===
(Andy Novocin, Bill Hart, 1/2 David Harvey, Michael Abshoff)

=== Nash Equlibria ===
(Greg Bard, Paul Leopardi)

=== Glucat ===
(Paul Loepardi)

=== Linear Algebra over Polynomial Rings ===
(Burcin Erocal)
 * (esp. for nullspace computation over fraction fields of these)

=== Improve the State of Fraction Fields ===
(Burcin Erocal)

=== F5 ===
(Martin Albrecht, Michael Brickenstein, Simon King, Ludovic Perret)
 * we will '''read''' the original F5 paper and try to understand it
 * we will port John Perry's F5 Singular and pseudo code to Sage, see: http://www.math.usm.edu/perry/Research/
 * additional material: http://eprint.iacr.org/2006/404.pdf

=== Matrix Factorisation over GF(2) ===
(Martin Albrecht, Clément Pernet, Greg Bard, Jean-Guillaume Dumas)
 * we have many building blocks for LQUP factorization in place in the M4RI library, these need to be plugged together and optimized
 * we have two out of four TRSM routines, we need to add the remaining two and optimized the existing ones

=== Linear Algebra modulo Small Primes ===
(Clément Pernet, Jean-Guillaume Dumas)
  * implement the bound computation and splitting system to use the compressed matmul over small finite fields,
  * create a matrix_modn_dense implementation based on floating point coefficients and wrapping most of FFLAS-FFPACK (cf tickets #4258,#4259,#4269)

=== Sage-Combinat (coming soon) ===

=== Linear Algebra on GPU ===
(Michael Abshoff, Clément Pernet)
 * play with the local Ge8800 and FFLAS-FFPACK

=== Simultaneous Diophantine Approximation of Real Numbers ===
(Andy Novocin)

=== non-coding: summarize the entire Sage history for a sagemath.org/library/history.html web-page ===
(Harald Schilly)
 * collect old talks, the documentation, ask someone. You would just have to write text, no html

=== Add Wrapper for PLURAL to Sage ===
(Burcin Erocal, Michael Brickenstein)
 * see: http://www.singular.uni-kl.de/Manual/3-0-4/sing_355.htm

=== Add Better Support for Identifying and Citing "Sub"-Systems ===
 * make sure credit goes where credit is due

=== Hilbert class polynomial ===
(Eduardo Ocampo-Alvarez, Andrey Timofeev)

=== Implement Sparse FGLM ===
(Martin Albrecht)
 * see http://eprint.iacr.org/2008/402.pdf for timings why this makes sense

=== Speed-Up Arithmetic for Elliptic Curves over Finite Fields ===
(Nadia El Mrabet)

=== French Translation of the Tutorial (A Project for Newcomers!) ===
(Bertrand Meyer, Marc Mezzarobba)
 * as a means to discover Sage while doing something (hopefully) useful, we are trying to translate: http://sage.math.washington.edu/home/mhansen/doc-sphinx/tutorial/

=== Improve Emacs Interface ===
(Matthias Meulien)
 * The goal is to mimic what is available for maxima http://members3.jcom.home.ne.jp/imaxima/Site/Download_and_Install.html
