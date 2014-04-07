= Tentative list of themes =

A list of topics for [[days57|Sage days 57]]. Participants, please edit!

== Introduction to git ==

 * by Volker Braun
 * interested
   * Samuel
   * Eric
   * Thierry
   * Sébastien
   * Jean-Philippe
   * Nicolas

== Import the old Sage-Combinat patches as git branch ==

 * Nicolas

== Review all tickets waiting on trac :-) ==

There are around [[http://trac.sagemath.org/report/75|250 tickets waiting on trac for a reviewer]] ... solution: a ticket a day! (18 dev, 5 days we should get 90 tickets)

== Documentation ==

 * Brainstorm about the refactoring of the index of the combinatorics section of the reference manual #13605
 * Finish migrating the collection of Sage-Combinat thematic tutorials as git branches 
 * Proofread and merge more thematic tutorials

== Coxeter groups ==

 * interested
   * Jean-Philippe Labbé
   * Nicolas M. Thiéry
   * Vivien Ripoll
   * ...

== Languages ==

By language we simply mean a set of finite words (rational language, D0L-system, ...). The scope ranges from combinatorics and algebra to discrete dynamical systems. Sage capabilities is currently restricted to combinatorics on single word and do not focus on structure of certain subset. We aim to implement an abstract and easy to reuse infrastructure for languages.

 * interested
   * Vincent
   * Thierry
   * Sébastien

 * todo
   * implement the category of languages (from previous work of Vincent and Stepan, [[http://trac.sagemath.org/ticket/12224|#12224]], [[http://trac.sagemath.org/ticket/12225|#12225]], [[http://trac.sagemath.org/ticket/12227|#12227]])
   * finish the inclusion of subshifts of finite type and work on sofic shifts ([[http://trac.sagemath.org/ticket/12996|#12996]])

== Translation surfaces ==

A translation surface is a geometric and dynamical objects that can be defined from gluing polygons by translation. It is interesting from geometric and dynamical point of vue. Many computations are possible !

 * interested
   * Vincent
   * Samuel
   * Thierry

 * todo
   * better datastructure for permutations
   * include Charles Fougeron's code into Sage (computation of Lyapunov exponents, decomposition of the Hodge bundle)
   * datastructure for translation surfaces

== Categories ==

Finish #10963, brainstorm the follow ups.

 * interested
   * Nicolas
   * Eric

== Polyhedra over number fields ==

  * interested
    * Volker
    * Vincent
    * Jean-Philippe

== Tensors on free modules ==

  * interested
    * Eric

  * todo
    * implement tensor products of generic free modules and the associated tensor algebra (by ''generic'' it is meant ''without any privileged basis'')

== Refactor continued fractions ==

  * interested
    * Thierry
    * Vincent
    * Luca

  * todo: see [[http://trac.sagemath.org/ticket/14567|#14567]]

== Dynamical systems simulation (statistics of orbits) ==

  * interested
    * Thierry
    * Sébastien
    * Vincent
    * Jean-Philippe

== on-line db for Sage worksheets and other ressources ==

  * Thierry
  * Vincent
  * Luca

== Lazy Multivariate Power Series ==

  * Matthieu Dien
  * Vincent

== Real numbers ==

There are many ways to represent real numbers:

 * rational numbers
 * algebraic numbers
 * expansions in a given basis
 * continued fractions (and generalizations)
 * symbolic expressions (involving transcendental functions like cos, exp, pi, ...)
 * ...
But Sage currently has no bridge between them...

== Refactor Elliptic curves and morphisms ==

See [[http://trac.sagemath.org/ticket/12880|#12880|]] (and also problem with scheme morphisms [[http://trac.sagemath.org/ticket/15378|#15378]], maybe also that !SchemeMorphism currently does not inherit from !Morphisn, see the description of #14711)

  * Interested:
    * Luca
    * Vincent
