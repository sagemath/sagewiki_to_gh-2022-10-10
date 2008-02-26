= Google Summer of Code 2008 =


== Potential Projects ==

=== Extend Nice to much more general permutation group algorithms/Make groups in Sage fast and robust ===
 * Robert Miller, Tom Boothby
  . There are some very general permutation group questions that can be tackled in the same manner as the graph isomorphism problem, and it would be good to do these in Cython within Sage instead of farming out to GAP.
  * Polynomial problems:
   * Group order
   * Containment
   * Random group elements
   * Center of a group
   * Solvability/Nilpotency
  * Harder (many of which are graph isomorphism complete) problems:
   * Centralizers/Normalizers
   * Group intersections
   * Set stabilizers
   * Automorphism groups of combinatorial structures
   * Subgroups satisfying a certain property (given generators and a black box yes/no function, compute generators of the subgroup)
   * Upper central series
   * Conjugacy of elements
   * Testing whether two elements or subsets are in the same orbit of a group action
   * Canonical representatives of orbits under a group action
   * Transversals of orbits

=== Notebook ===
 * Use standard javascript library (jquery?)
 * Standardize api to communicate with Sage

=== Cython ===
 * Improve C++ support
   * better integration of stl classes (vector, list, etc.)
   * automatically generated constructor, destructor
 * automatic parallelization via thread pools
 * improve code generaton support to have better code dependency checking.
 * glib/high performance c libary integration
 * Add multiple inheritance support
 * Attractive features from Aldor (www.aldor.org)

=== Calculus Improvements - Gary Furnish ===
 * Cython version of symbolics
 * Differential Geometry Support via the new symbolics system.
 * Specifically I would intend to use the new symbolics system to implement things such as integration over manifolds, 1-forms, Tensors, etc.  A Paragraph(or more) on this project is forthcoming.  

=== Commutative Algebra (Mentor: Martin Albrecht) ===
 * Write an excellent documentation for commutative algebra in Sage
  * read Magma's documentation http://magma.maths.usyd.edu.au/magma/htmlhelp/part14.htm
  * read Singular's documentation http://www.singular.uni-kl.de/Manual/latest/index.htm
  * compare to Sage's documentation http://www.sagemath.org/doc/html/ref/node287.html
 * Replicate every single example from the book "A Singular Introduction to Commutative Algebra" in Sage.
  * this can be done because Sage's commutative algebra is built on Singular's
  * if something doesn't feel "natural"/Sage-ish fix that, wrap Singular's functionality
 * Increase doctest coverage for everything "commutative algebra" to 100%
 * Check what in Magma is missing in Sage 
  * If it can be added, add it, document it
 * Gröbner bases and related functionality over $\mathbb{Z}$ and $\mathbb{Z}_N$
  * either a possibly slow native implementation
  * or (preferred) talk to Oliver Wienand who works on this for Singular and contribute there if possible
 * Wrap all Singular supported base fields via libSingular ($\mathbb{C}$, $\mathbb{R}$, number fields)
 * Write excellent documentation (with examples) on how to use libSingular without Sage and contribute it upstream if possible
  

== Potential Mentors ==
 * William Stein
 * Michael Abshoff
 * Burcin Erocal
 * Martin Albrecht
