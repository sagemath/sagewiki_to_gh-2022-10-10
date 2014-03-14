= Tentative list of themes =

A list of topics for [[days57|Sage days 57]]. Participants, please edit!

== Introduction to git ==

 * by Volker Braun
 * interested
   * Samuel
   * Eric
   * Thierry

== Review all tickets waiting on trac ==

There are around [[http://trac.sagemath.org/report/75|250 tickets waiting on trac for a reviewer]] ... solution: a ticket a day! (18 dev, 5 days we should get 90 tickets)

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

 * interested
   * Nicolas
   * Eric


== Polyhedra over number fields ==

  * interested
    * Volker
    * Vincent

== Tensors on free modules ==

  * interested
    * Eric

  * todo
    * implement tensor products of generic free modules and the associated tensor algebra (by ''generic'' it is meant ''without any privileged basis'')

== Refactor continued fractions ==

  * interested
    * Thierry
    * Vincent

  * todo: see http://trac.sagemath.org/ticket/14567

== Dynamical systems simulation (statistics of orbits) ==

  * interested
    * Thierry
    * Sébastien
    * Vincent

== on-line db for Sage worksheets and other ressources ==

  * Thierry
  * Vincent

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
