= Sage Days 24 Coding Sprint Projects =

This is a list of projects suitable for [[days24|Sage Days 24]]. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).

## <<TableOfContents>>

== Kovacic's Algorithm ==

'''People:''' Burcin Erocal

Implement Kovacic's algorithm in Sage.

== Hypergeometric Functions ==

'''People:''' Flavia Stan, Karen Kohl, Fredrik Johansson

== Plural support ==

'''People:''' Burcin Erocal

Add support for Singular's noncommutative component Plural, finish [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539]].

== Locapal support ==

'''People:''' Burcin Erocal

There is experimental support for computing Groebner bases over certain localizations of operator algebras in Singular. See [[http://www.math.rwth-aachen.de/~Viktor.Levandovskyy/filez/singular/levandovskyy_kl.pdf|this presentation]] for more details. Support for arithmetic needs to be provided in Sage.

== Parallel Integration ==

'''People:''' Burcin Erocal

Integrate Stefan Boettner's parallel integration code in Sage. There are several prerequisites for this, such as
 * algebraic function fields (transcendence degree > 1)
 * differential rings/fields
 * proper to_polynomial(), to_rational() functions for symbolic expressions

== Algorithmic/Automatic Differentiation ==

'''People:''' William Stein

I never thought much of this topic, but there is [[http://www.euroscipy.org/talk/2045|a talk at Euroscipy]] suggesting it could be useful.   Examples of what you could imagine doing:
{{{
sage: f(x,y,z)=sqrt(x^3+y)/(x-y^3*z)^(3/2)
sage: a = fast_callable(f,CDF)
sage: timeit('a(2,3,4)')
625 loops, best of 3: 24.2 µs per loop
sage: g = f.derivative(x,10)
sage: a = fast_callable(g,CDF)
sage: timeit('a(2,3,4)')
625 loops, best of 3: 1.21 ms per loop
}}}
I imagine that one could instead do:
{{{
sage: f(x,y,z)=sqrt(x^3+y)/(x-y^3*z)^(3/2)
sage: a = fast_callable(g,CDF)
sage-fantasy: b = a.derivative(x,10)
sage-fantasy: timeit('b(2,3,4)')
625 loops, best of 3: 24.2 µs per loop
}}}

This is just a random example I made up, but it's the sort of massive performance one might hope for from AD; the literature should have better examples.    There are *tons* of potential Python libraries to consider, e.g., [[http://github.com/b45ch1/algopy|algopy]] and [[http://www.coin-or.org/CppAD/|CppAD]] (which has Python bindings). 
