## page was renamed from combinat/LanguageAndTiling
= Language and tilings =

This page gathers ideas for refactorization of sage.combinat.words and implementation of tilings. 

== Structure ==

The main structure should go in the patch [[http://trac.sagemath.org/sage_trac/ticket/12224|#12224]]. Up to now the code is a bit dissaminated everywhere in Sage:

 * sage.categories.languages
 * sage.categories.factorial_languages
 * sage.categories.examples.languages
 * sage.monoids.free_monoid
 * sage.combinat.languages.*
 * sage.combinat.words.*
 * sage.dynamics.symbolic.full_shift

=== Tiling space ===

The highest level class should be something like TilingSpace. It contains an enumerated set, an alphabet (and optionally a way of plotting). Do we always assume that the enumerated set is either a group (like ZZ) or a sub-semigroup of a group (like NN) ?

=== Behavior of algorithms with infinite input data ===

What to do for equality comparison of infinite words ?

=== Finite languages and factor set ===

[[http://trac.sagemath.org/sage_trac/ticket/12225|#12225]]

=== Substitutive and adic languages ===

There are many algorithms for language described by a sequence of substitutions. The particular case of morphic and purely morphic languages corresponds respectively to periodic and purely_periodic directive word.

 * Enumeration of factors, desubstitution ([[http://trac.sagemath.org/sage_trac/ticket/12227|#12227]])
 * Factor complexity for purely morphic languages ([[http://trac.sagemath.org/sage_trac/ticket/12231/#12231]])
 * Equality for purely morphic language (following J. Honkala, CANT, chapter 10)

== TODO list ==

which should go in the ticket
 * WordsPath and cutting sequences 

other request
 * 1-dim subshift of finite type / sofic
 * n-dim finite words and n-dimensional shifts
 * rauzy castle and fine datastructure for small complexity languages (Stepan)
 * substitutive language (Stepan, Vincent)
