= *-combinat Days Project Idea Page =

== Implement a generic FactoredElement class ==

PEOPLE: Burcin Erocal

  In many combinatorics applications we work with rational functions whose numerator/denominator factor into nice components where the factorization is also known beforehand. The current representation of rational functions in Sage use the expanded form of the numerator and denominator. The goal is to implement a generic wrapper to store elements in a factored representation.

  * [[http://groups.google.com/group/sage-devel/browse_thread/thread/d49fee55339515ae|sage-devel thread]] about working with factored denominators
  * [[http://groups.google.com/group/sage-devel/browse_thread/thread/ea62acaf89348d9d|another thread]] 
  * code mentined above is [[http://emis.uhasselt.be/~vdbergh/sage_patches/fraction_field_cache/|here]]

== An example of adding a new basis to an algebra ==

PEOPLE: Franco Saliola, CoryBrunson

  This should be a nice exercise in adding a new basis (the seminormal basis) to an algebra (the group algebra of the symmetric group). We don't even have to introduce any new code to construct the basis since it already exists in Sage, thanks to Mike Hansen. On the other hand, I do have a better implementation based on a method that Alain Lascoux explained to me, so we could use that instead.

== Try out Nathann Cohen new interface to Mixed Integer Linear Programming software ==

PEOPLE Nicolas Thiéry

== Bug squashing! ==

PEOPLE: Franco Saliola, Jason Bandlow, Florent Hivert, Peter McNamara

  There are bugs in Sage that need fixin':

    1. [[http://trac.sagemath.org/sage_trac/ticket/6538|Bugs in Partitions]]
    1. The wiki page [[combinat/Weirdness|quirks and weirdness in sage-combinat]] contains a list of quirks and weirdness in sage-combinat.
    1. The [[http://trac.sagemath.org/sage_trac/query?status=assigned&status=new&status=reopened&group=status&milestone=sage-combinat|sage-combinat milestone]] lists all tickets labelled sage-combinat. 

== Categories ==

100% doctest and review for all patches up to sagecombinat 4.1

Functorial constructions: subquotient, cartesian_product

FlorentHivert, FrancoSaliola, AnneSchilling, NicolasThiéry

== Categorification of RootSystems and Crystals ==

And application to parabolic subroot-systems

NicolasBorie, AnneSchilling, NicolasThiéry, CoryBrunson

== graph layout using graphviz / dot2tex optional package ==

Anne Schilling, FrancoSaliola, NicolasThiéry

== Quickref card for sage.combinat ==

JasonBandlow, FrancoSaliola, NicolasThiéry

== Refactoring of symmetric functions ==

 * Patch Symmetrica
 * Make LRcalc spkg
 * Bring all symmetric functions under the SymmetricFunctions umbrella
 * Improve documentation
 
JasonBandlow, CoryBrunson

== Improve Nonsymmetric Macdonald polynomials ==

 * Add doctests with examples on specifying q, t, and the basement pi
 * Add input checks for pi. Maybe accept a list as input, and make it into an appropriate permutation

== Setup the framework for multivariate polynomials with several bases ==

See: [[combinat/MultivariatePolynomials]]

People: AlainLascoux

== Module for generate integer list up to the action of a permutation group ==

 * Integrate a StabChain from Gap to sage 
 * Finalise the module and submit it

NicolasBorie (help needed!)

== Implement simplify_factorial in Sage ==

 Use the new symbolics to implement simplification of expressions with binomials, factorials, etc. This is [[http://trac.sagemath.org/sage_trac/ticket/6636|#6636]] on trac.

People: Flavia Stan, Burcin Erocal

== Standardize TransitiveIdeal TransitiveIdealGraded, SearchForest, ...

[[http://sagetrac.org/sage_trac/ticket/6637]]
