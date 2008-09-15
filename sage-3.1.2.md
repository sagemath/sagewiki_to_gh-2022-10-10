= Sage 3.1.2 Release Tour =

Sage 3.1.2 was released on XXX, 2008. For the official, comprehensive release notes, see the HISTORY.txt file that comes with the release. For the latest changes see sage-3.1.2.txt. 

== Doctest Coverage Hits 60% ==
 * Mike Hansen wrote doctests for almost all pexpect interfaces, which will ensure greater stability across the board.

== Hidden Markov Models ==
 * William Stein wrote Cython bindings for the GHMM C library for computing with Hidden Markov Models, which are a statistical tool that is important in machine learning, natural language processing, bioinformatics, and other areas.  GHMM is also now included standard in Sage.

== Notebook Bugs ==
 * Many bugs introduced in 3.1.1 were fixed by Mike Hansen and Timothy Clemans. 
 * A new testing procedure was implemented, hopefully preventing regressions like in 3.1.1 in the future.

== New Structures for Partition Refinement ==

Robert Miller

 * Hypergraphs (i.e. incidence structures) -- this includes simplicial complexes and block designs
 * Matrices -- the automorphism group of a matrix is the set of column permutations which leave the (unordered) set of rows unchanged

== Improved Dense Linear Algebra over GF(2) ==
 * M4RI (http://m4ri.sagemath.org) was updated to the newest upstream release which
  * provides much improved performance for multiplication,
  * provides improved performance for elimination,
  * contains several build and bugfixes.
 * hashs and matrix pickling was much improved
 * dense matrices over $\mathbb{F}_2$ can now be written to/read from 1-bit PNG images

== New PolyBoRi Version (0.5) and Improved Interface ==
 * PolyBoRi was upgraded from 0.3 to 0.5rc
 * {{{mq.SR}}} now returns PolyBoRi equation systems if asked to
 * support for boolean polynomial interpolation was added

== QEPCAD Interface ==

== Developer's Handbook ==
 *  John H Palmieri rewrote/rearranged large parts of the 'Programming Guide' (now 'Developer's Guide') which should make getting started easier for new developers.

== Improved 64-bit OSX Support ==

== Fast Numerical Integration ==

== GAP Meataxe Interface ==
 * In the {{{module matrix_group}}}, the method {{{module_composition_factors}}} interfaces with GAP's [http://www.gap-system.org/Manuals/doc/htm/ref/CHAP067.htm Meataxe] implementation. This will return decomposition information for a G-module, for any matrix group G over a finite field.

== Better SymPy Integration ==

== Faster Determinants of Matrices over Multivariate Polynomial Rings ==
 * Martin Albrecht modified Sage to use Singular 

== Real Number Inputs Improved ==
