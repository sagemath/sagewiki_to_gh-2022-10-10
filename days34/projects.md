= Sage/Singular Days Projects =

<<TableOfContents>>


== Update Singular spkg ==

'''People:'''
 * [[http://trac.sagemath.org/sage_trac/ticket/10903|#10903]] and [[http://trac.sagemath.org/sage_trac/ticket/11769|#11769]]

== Update the Singular interface to work with libpolys ==

'''People:''' Burcin
 * There were many changes to libSingular as part of the refactoring effort. The Sage interface needs to be adapted to these. This should be a matter of renaming the functions that are called in Sage and adding the current ring as an argument (modulo bugs in libpolys).

== Refactored Singular should pass it's test suite ==

'''People:''' Burcin, Oleksandr, Hans
 * Bug hunt through Singular kernel code. An adventure no hacker can resist.

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
