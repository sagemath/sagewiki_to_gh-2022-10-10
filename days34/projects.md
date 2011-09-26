= Sage/Singular Days Projects =

<<TableOfContents>>


== Update Singular spkg ==

'''People:''' Simon, Burcin (hopefully Martin as well)
 * [[http://trac.sagemath.org/sage_trac/ticket/10903|#10903]] and [[http://trac.sagemath.org/sage_trac/ticket/11769|#11769]]

== Update the Singular interface to work with libpolys ==

'''People:''' Burcin, Oleksandr
 * There were many changes to libSingular as part of the refactoring effort. The Sage interface needs to be adapted to these. This should be a matter of renaming the functions that are called in Sage and adding the current ring as an argument (modulo bugs in libpolys).

== Refactored Singular should pass it's test suite ==

'''People:''' Burcin, Oleksandr, Hans

Instructions for building latest experimental code: http://github.com/Singular2/singular2.github.com/wiki/New-TODOs

 * Bug hunt through Singular kernel code. An adventure no hacker can resist.

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

'''People:''' Hiep, Burcin

 * This shouldn't be so hard since libSingular uses the same type for polynomials and module elements

== Review Simon's letterplace patches ==

'''People:'''

 * [[http://trac.sagemath.org/sage_trac/ticket/7797|#7797]]

== Plural interface ==

'''People:''' Burcin

 * Rebase the patch at [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539 plural wrapper]] to [[http://trac.sagemath.org/sage_trac/ticket/11068|11068 implementation of one and two sided ideals of noncommutative rings]] 

== Use libpolys for function field arithmetic ==

'''People:''' Burcin

 * libpolys has better function field arithmetic now, we should wrap that in Sage.
 * This is also relevant [[http://trac.sagemath.org/sage_trac/ticket/9054|#9054 create a class for basic function field arithmetic]]

== FLINT integration ==

'''People:''' Fredrik

 * Add missing utility and conversion functions to FLINT
 * Use FLINT in Singular

== Beginner tickets ==

to practice preparing and submitting patches, for people new to the Sage development process:
 * [[http://trac.sagemath.org/sage_trac/ticket/8857|#8857]] lcm over Q[x] broken (not any more)
 * `.intersect()` method of ideals should allow multiple arguments.
 * add an alias `primary_decomposition_complete() -> complete_primary_decomposition()` in the ideal class
