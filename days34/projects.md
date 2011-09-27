= Sage/Singular Days Projects =

<<TableOfContents>>


== Update Singular spkg ==

'''People:''' Simon, Burcin, Martin

working on [[http://sage.math.washington.edu/home/leif/Sage/release/sage-4.7.2.alpha3-prerelease/sage-4.7.2.alpha3-prerelease.tar|prerelease of Sage-4.7.2.alph3]] dated Sept 19, 2012 md5sum: ad021855ae07ecdd1cdcc7b973c9cdba

 * [[http://trac.sagemath.org/sage_trac/ticket/10903|#10903]] update Singular
 * [[http://trac.sagemath.org/sage_trac/ticket/10810|#10810]] Singular doesn't build on ARM
 * [[http://trac.sagemath.org/sage_trac/ticket/11769|#11769]] Singular doesn't build on Ubuntu Oneiric
 * [[http://trac.sagemath.org/sage_trac/ticket/10902|#10902]] factorization of multivariate polynomials

== Update the Singular interface to work with libpolys ==

'''People:''' Burcin, Oleksandr
 There were many changes to libSingular as part of the refactoring effort. The Sage interface needs to be adapted to these. This should be a matter of renaming the functions that are called in Sage and adding the current ring as an argument (modulo bugs in libpolys).

 * create spkg for refactored Singular
 * search/replace calls to libSingular in the Sage library to get the interface to compile & link

== Refactored Singular should pass it's test suite ==

'''People:''' Burcin, Oleksandr, Hans, Volker

Bug hunt through Singular kernel code. An adventure no hacker can resist.

 * build refactored Singular: http://github.com/Singular2/singular2.github.com/wiki/New-TODOs
 * run test suite with debug version of Singular which dumps stack traces on error. (kernel/cntrl.cc should be modified to define `DEBUG_STOP` instead of `INTERACTIVE`)

 * [[http://www.lmona.de:31111/|list of test results]] (temporarily)
 * Monday morning: 595 failing tests
 * Tuesday morning: 543 failing tests
 

=== Compiler warnings ===

'''People:'''

There are lots of compiler warnings...

=== Plural/SCA ===

'''People:''' Oleksandr

 * Bug hunt at PLURAL/SCA kernel code: (left) std etc...

=== Try out some dynamic modules ===

'''People:''' Oleksandr

 * Try building & using dynamic modules

=== Blackbox objects ===

'''People:''' Oleksandr

 * Try building & using blackbox objects, e.g. coefficient domain as a wrapper for coeffs


== Interface to Singular's modules ==

'''People:''' Hiep, Burcin, Simon

 * This shouldn't be so hard since libSingular uses the same type for polynomials and module elements

== Review Simon's letterplace patches ==

'''People:''' Simon, Burcin, Alexander (offsite)

 * [[http://trac.sagemath.org/sage_trac/ticket/7797|#7797]]
 * [[http://trac.sagemath.org/sage_trac/ticket/11115|#11115]] make cached methods faster - dependency of #7797 (Volker)

== Plural interface ==

'''People:''' Burcin, Simon, Alexander (offsite)

 * Rebase the patch at [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539 plural wrapper]] to [[http://trac.sagemath.org/sage_trac/ticket/11068|11068 implementation of one and two sided ideals of noncommutative rings]] 

== Use libpolys for function field arithmetic ==

'''People:''' Burcin

 * libpolys has better function field arithmetic now, we should wrap that in Sage.
 * This is also relevant [[http://trac.sagemath.org/sage_trac/ticket/9054|#9054 create a class for basic function field arithmetic]]

== FLINT integration in Singular ==

'''People:''' Fredrik, MartinL, Christian

 * Add missing utility and conversion functions to FLINT
 * Use FLINT in Singular
 * Benchmark against NTL version

== Beginner tickets ==

to practice preparing and submitting patches, for people new to the Sage development process:
 * [[http://trac.sagemath.org/sage_trac/ticket/8857|#8857]] lcm over Q[x] broken (not any more)
 * `.intersect()` method of ideals should allow multiple arguments.
 * add an alias `primary_decomposition_complete() -> complete_primary_decomposition()` in the ideal class

== Fast containers for objects and morphisms of a category ==

'''People:''' Simon

 * See [[http://trac.sagemath.org/sage_trac/ticket/10667|#10667]] Morphisms and Objects of Categories

== Improve/Review citation library ==

'''People''': Niels, Burcin, (and somebody else?)

[[http://trac.sagemath.org/sage_trac/ticket/3317|#3317]] [[https://bitbucket.org/niels_mfo/sage-citation|bitbucket]]

 * [[http://trac.sagemath.org/sage_trac/ticket/11851|#11851]] [[http://trac.sagemath.org/sage_trac/ticket/11852|#11852]] --(split off pybtex package to a separate ticket (submit as an optional package first))--
 * Add more examples of citations
 * Create and add a citation for sage itself

== Fix reference counting of Singular rings ==

'''People''': Volker, Burcin, Martin

 * [[http://trac.sagemath.org/sage_trac/ticket/11339|#11339]]
