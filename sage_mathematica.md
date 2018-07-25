= Sage for Mathematica Users =
This page is modeled on the http://www.scipy.org/NumPy_for_Matlab_Users

== Introduction ==
SAGE has many of the capabilities of Mathematica, and many additional ones (e.g. wiki-creating software and a 3D raytracer).  Some features of SAGE have been inspired by Mathematica, but overall the syntax and structure of SAGE are quite different.  One of the main influences on SAGE is the use of the language Python.

This page is intended to help users familiar with Mathematica migrate to SAGE more easily.

== Key Differences ==
Indexing: Lists in Mathematica are indexed starting from 1.  In SAGE, as in Python, indices start at 0.  Also, where Mathematica accepts a list of indices, in SAGE you can construct sub-lists using "slice" operations.  For example, if we have a list of numbers, num_list = [0,1,2,3,4], then numlist[1:3] would return the list [1,2].

== Combinatorica ==
For a comparison of graph theory functionality between SAGE and the Mathematica Combinatorica package, see the CombinatoricaCompare page.

= Sage and Python Quickstart for Mathematica users =
This is not a proper introduction to Python, but a list of examples that Mathematica users will need to figure out how to do if they want to use Sage.

== Basic functionality ==
=== Declaring variables ===
Mathematica assumes that all otherwise unknown symbols are algebraic quantities.  Python and Sage don't; they are declared as follows:

{{{
sage: var('x,y,a,b,c')
(x, y, a, b, c)
sage: y == a*x^2 + b*x + c
y == a*x^2 + b*x + c
}}}

It is also possible to declare with spaces between variables:

{{{
sage: var('x y a b c')
(x, y, a, b, c)
sage: y == a*x^2 + b*x + c
y == a*x^2 + b*x + c
}}}

=== Implicit multiplication ===
{{{
sage: var('x,y,a,b,c')
(x, y, a, b, c)
sage: implicit_multiplication(True)
sage: y == a x^2 + b x + c
y == a*x^2 + b*x + c
}}}

Note that a space need not be used when there is a numerical coefficient for a variable:

{{{
sage: var('x,y')
(x, y)
sage: implicit_multiplication(True)
sage: y == 3x
y == 3*x
}}}

== Procedural programming ==
=== Table ===
Mathematica: {{{ Table[f[i], {i, 1, 10}] }}}

{{{
sage: [f(i) for i in [1..10]] 
[f(1), f(2), f(3), f(4), f(5), f(6), f(7), f(8), f(9), f(10)]
}}}

== Advanced Mathematica syntax ==
=== Mapping functions across a list ===
From a list called ''data'', create a new list where a function ''f'' is applied to each element of ''data''.

Mathematica: {{{f /@ data}}}

Python: {{{[f(d) for d in data]}}}

Unlike in Mathematica, this ''for d in data'' cannot be applied to an arbitrary expression ''data''.  So {{{[f(d) for d in g(x,y,z)]}}} is not possible (this is not entirely true, all {{{g(x,y,z)}}} needs to do is to return something iterable, malb).

=== Mapping pure functions across a list ===
(Replacing elements that are less than zero with zero.)

Mathematica: {{{data /. _?(# < 0&) -> 0}}}

Python: {{{[(0 if d < 0 else d) for d in data]}}}

== Timing ==

 * Mathematica: `Timing[command]`
 * SageMath: `timeit('command')`
