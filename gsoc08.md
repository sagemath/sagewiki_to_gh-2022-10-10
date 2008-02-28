= Google Summer of Code 2008 =


== Potential Projects ==

=== Generalize Nice; Improve Permutation Groups ===
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
 * Improve the Notebook, some relevant trac tickets:
  * #386  Enhance "attach <file>" in the notebook
  * #406  notebook -- improve support for other system modes
  * #408  Notebook glitch in Safari
  * #413  saving non-evaluated cells
  * #1466  improve the "click to the left" aspect of the notebook
  * #1467  make it possible to upload/download worksheets as plain text
  * #1468  notebook -- create a global option so that word wrap is on or off by default always
  * #1496  notebook -- make it easy to link different worksheets
  * #5  full keyboard mode for notebook
  * #245  a bunch of random notebook improvement ideas
  * #246  height of a notebook cell
  * #251  Notebook worksheet multithreading
  * #260  transparent graphics output
  * #301  Create some functions for notebook history
  * #302  Report server errors to online notebook users
  * #322  Have global code page for Notebook
  * #336  Create an option to clear all cell output
  * #338  In doc browser make hyper links to referenced code in SAGE library
  * #353  public sage notebook robustness
  * #359  Consider adding dhtml javascript drawing functionality to the SAGE notebook

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


=== Free abelian groups and integer lattices ===

Integer lattices (free abelian groups endowed with a bilinear,
integer-valued form) are important objects in geometry and
combinatorics.  The best available mathematical software for lattice
computations is the (expensive and proprietary) program Magma.  However,
Magma can only compute with lattices that have a positive definite
bilinear form.  Many of the most interesting geometric applications
involve negative definite or indefinite forms; furthermore, many
uniqueness and classification results apply only to indefinite lattices.
The first step toward expanding Sage's integer lattice capability is
to expand Sage's capability for working with free abelian groups; this
would have even wider and more fundamental applications.
  

== Potential Mentors ==
 * William Stein
 * Michael Abshoff
 * Burcin Erocal
 * Martin Albrecht
