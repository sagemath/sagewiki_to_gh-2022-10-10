## page was renamed from combinat/LanguageAndTiling
= Languages and tilings =

This page gathers ideas for refactorization of sage.combinat.words and implementation of tilings. 

You can subscribe to the associated [[https://lma.metelu.net/mailman/listinfo/sage-words|mailing-list]] to discuss about this.

== Structure ==

The main structure should go in the patch [[http://trac.sagemath.org/sage_trac/ticket/12224|#12224]]. Up to now the code is a bit dissaminated everywhere in Sage:

 * sage.categories.languages
 * sage.categories.factorial_languages
 * sage.categories.shifts
 * sage.categories.examples.languages
 * sage.monoids.free_monoid
 * sage.combinat.languages.*
 * sage.combinat.words.*
 * sage.dynamics.symbolic.full_shift

What is bad/nice with categories:
 * inheritance of generic code
 * a bit confusing for the user who want to find the implementation of a method
 * confusing for the person who writes the code and ask "where should I put this ?"

What do we keep? What categories do we create?

== Behavior of algorithms with infinite input data ==

What to do for equality of infinite words ?

What should do
{{{
sage: w1 == w2
}}}
Two possibilities: 

 1. test the first XXX letters for finding a difference. If find one then returns False otherwise raise an error, "seems to be equal use .is_equal(force=True) to launch the infinite test".

 2. test all letters and never return True

== Subprojects ==

=== Finite languages and factor set ===

Most of it was implemented by Franco (suffix tree and suffix trie). We would like to enhance it and make a specific data structure (called Rauzy castle) for FiniteFactorialLanguages. See [[http://trac.sagemath.org/sage_trac/ticket/12225|#12225]].

=== Substitutive and adic languages ===

There are many algorithms for languages described by a sequence of substitutions (called a directive word). The particular case of morphic and purely morphic languages correspond respectively to periodic and purely_periodic directive words.

 * Enumeration of factors, desubstitution ([[http://trac.sagemath.org/sage_trac/ticket/12227|#12227]])
 * Factor complexity for purely morphic languages ([[http://trac.sagemath.org/sage_trac/ticket/12231/|#12231]])
 * Equality for purely morphic languages (following J. Honkala, CANT, chapter 10)

== TODO list ==

which should go in the main trac ticket
 * words path (currently in sage.combinat.words.paths) which have to be modified to fit with the new implementation

other todos
 * 1-dim subshift of finite type / sofic
 * n-dim finite words and n-dimensional shifts
 * n-dim subshifts of finite type
 * n-dim substitutive subshift
 * cellular automata
 * ...
