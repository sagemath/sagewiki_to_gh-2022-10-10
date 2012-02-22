## page was renamed from combinat/LanguageAndTiling
= Language and tilings =

This page gathers ideas for refactorization of sage.combinat.words and implementation of tilings. 

== Structure ==

The main structure should go in the patch [[http://trac.sagemath.org/sage_trac/ticket/12224|#12224]]. Up to now the code is a bit dissaminated everywhere in Sage:

 * sage.categories.languages
 * sage.categories.factorial_languages
 * sage.monoids.free_monoid
 * sage.combinat.languages.*
 * sage.combinat.words.*
 * sage.categories.examples.languages
 * sage.dynamics.symbolic.full_shift

=== Tiling space ===

The highest level class should be something like TilingSpace. It contains an enumerated set, an alphabet (and optionally a way of plotting). Do we always assume that the enumerated set is either a group (like ZZ) or a sub-semigroup of a group (like NN) ?

=== Behavior of algorithms with infinite input data ===

What to do for equality comparison of infinite words ?

== Substitutive and adic languages ==

 * Equality for purely morphic words is decidable (J. Honkala, CANT, chapter 10)

== TODO list ==

which should go in the ticket
 * WordsPath and cutting sequences 

other request
 * 1-dim subshift of finite type / sofic
 * n-dim finite words and n-dimensional shifts
 * rauzy castle and fine datastructure for small complexity languages (Stepan)
 * substitutive language (Stepan, Vincent)
