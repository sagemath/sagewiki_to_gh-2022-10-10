= Google Summer of Code 2008 =


== Potential Projects ==

 * Extend Nice to much more general permutation group algorithms/Make groups in Sage fast and robust
   . There are some very general permutation group questions that can be tackled in the same manner as the graph isomorphism problem, and it would be good to do these in Cython within Sage instead of farming out to GAP.
   * Polynomial problems:
    * Group order
    * Containment
    * Random group elements
    * Center of a group
    * Solvability/Nilpotency
   * Harder (graph isomorphism complete) problems:
    * Centralizers/Normalizers
    * Group intersections
    * Set stabilizers
    * Automorphism groups of combinatorial structures
    * Subgroups satisfying a certain property (given generators and a black box yes/no function, compute generators of the subgroup)


 * Notebook
  * Use standard javascript library (jquery?)
  * Standardize api to communicate with Sage

 * Cython
  * Improve C++ support
    * better integration of stl classes (vector, list, etc.)
    * automatically generated constructor, destructor
  * automatic parallelization via thread pools
  * improve code generaton support to have better code dependency checking.
  * glib/high performance c libary integration
  * Add multiple inheritance support
  * Attractive features from Aldor (www.aldor.org)
 * Calculus Improvements - Gary Furnish
  * Cython version of symbolics
  * Differential Geometry Support via the new symbolics system.
  * Specifically I would intend to use the new symbolics system to implement things such as integration over manifolds, 1-forms, Tensors, etc.  A Paragraph(or more) on this project is forthcoming.  

== Potential Mentors ==
 * William Stein
 * Michael Abshoff
 * Burcin Erocal
