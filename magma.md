= Magma versus Sage =

The goal of [[http://magma.maths.usyd.edu.au/magma/|Magma]] is to provides a mathematically rigorous environment for solving computationally hard problems in algebra, number theory, geometry and combinatorics.  The core goal of Sage is to provide a free open source alternative to Magma.  This includes being able to do everything Magma does and to do it better.   This page is meant to track our progress in that direction. 

The point of this page is to list functionality that Magma has and whether Sage has it or not, and if Sage has said functionality, how does the speed compare.  It is basically to answer the question "can Magma still do anything Sage can't do".

The main reference for what Magma does is [[http://magma.maths.usyd.edu.au/magma/htmlhelp/MAGMA.htm|the Magma reference manual]].  

<<TableOfContents>>

== Functionality in Magma not in Sage ==

There are tons of things that Magma does that Sage also obviously does, e.g., "compute with univariate polynomials".  The goal is to list here only things that Magma does that Sage doesn't do.  Also, if Magma can do something ''much'' more efficiently than Sage, it should be listed here. 

=== Platform Support ===
Magma officially support the following hardware/OS platforms that Sage does not officially support:

Alpha (Linux), Alpha (OSF/Tru64), IBM PowerPC64 (AIX), IBM PowerPC64 (Linux), Macintosh 64-bit Intel (OS X 10.5 [Leopard]), Sparc (Solaris), Sparc64 (Solaris)

Notes: 
  * Nobody cares about Alpha support anymore.
  * We do not have access to any PPC linux boxes.
  * We do not have access to any AIX boxes.
  * There is active work to port sage to 64-bit MacIntel, but it is '''not''' done.  Libsingular, fortran, and pexpect issues remain.  Sage-3.4.1.alpha0 builds with the spkg at http://trac.sagemath.org/sage_trac/ticket/5057, but does not start. 

== Specialized Functionality in Magma also in Sage ==

Here we list specialized things Magma does that Sage also does.    For example, both Magma and Sage have extensive support for computing with modular symbols (far beyond all other math software).  



== Specialized Functionality in Sage not in Magma ==

Here we list functionality in Sage that Magma doesn't have, but is functionality that is part of Magma's core goals, i.e., solving computationally hard problems in algebra, number theory, geometry and combinatorics.  Note that because Sage does calculus, graphics, statics and numerical computation, there are thousands of functions and features in Sage that are not in Magma and never will be in Magma, and this won't be mentioned here. 
