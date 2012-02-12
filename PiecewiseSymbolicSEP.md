= Symbolic Piecewise Functions =

This is SAGE Enhancement Proposal (SEP) to improve the existing piecewise functionality.

== Authors ==

 * Michael Orlitzky

== Abstract ==

Sage has the ability to manipulate many familiar symbolic functions and expressions. This ability is rather robust; the code is well-tested and integrates nicely with the rest of the project. Piecewise functions are however an exception.

In essence, piecewise functions can be thought dictionaries that map values to symbolic expressions. Unfortunately, due to historical reasons and lack of manpower, the interface to piecewise functions has not been kept at parity with the rest of the symbolics library. This causes users difficulty when they expect piecewise functions to behave like other expressions: the piecewise interface is not just different, it has fewer features.

== Copyright ==

Public domain.

== Implementation ==

=== Evaluation of arguments ===

As it stands, piecewise functions have the familiar "classroom" behavior (deprecation warning omitted):

{{{
sage: f = piecewise([[(-infinity,0), -x], [(0, infinity), x]])   
sage: f(3)
3
}}}

The fact that calling `f` evaluates one if its consituent functions leads to some difficulties with the rest of symbolics. It is proposed that we eliminate this behavior by default but provide an interface to it.


== Interface ==

We would like to keep as much of the old interface as possible intact. At the very least, doctests that test functionality (as opposed to implementation) should be preserved.

A new piecewise class, '''PiecewiseSymbolic''', will replace '''PiecewisePolynomial'''. The old class will be deprecated via the normal procedure while users migrate to the new class.

== Backwards Compatibility ==


== Relevant Tickets ==

The following tickets should all be solveable during this reimplementation.

 1. [[http://trac.sagemath.org/sage_trac/ticket/1773|piecewise functions and integration / arithmetic do not play well together]]

 2. [[http://trac.sagemath.org/sage_trac/ticket/11225|improve piecewise plotting]]

 3. [[http://trac.sagemath.org/sage_trac/ticket/12070|Unavoidable DeprecationWarnings when calling piecewise functions]]

 4. [[http://trac.sagemath.org/sage_trac/ticket/12316|find_fit does not work for piecewise functions]]
