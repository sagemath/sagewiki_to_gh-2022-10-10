= Sage Days 24 Coding Sprint Projects =

This is a list of projects suitable for [[days24|Sage Days 24]]. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).

<<TableOfContents>>

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

I never thought much of this topic, but there is [[http://www.euroscipy.org/talk/2045|a talk at Euroscipy]] suggesting it could be useful.    [[/ad|More details here.]]

== Upgrade Pari to version 2.4.3 ==

'''People:''' William Stein

See [[http://trac.sagemath.org/sage_trac/ticket/9343|trac 9343]].  This has little to do with symbolic computation though...

== Function Fields ==

The goal of this project is to get the basic infrastructure for function fields into Sage.   See [[daysff/curves|Hess's papers and talks]].



People: William Stein, Maarten Derickx, Peter Bruin, Jan Tuitman, Max Flander, Tanja Lange, Michiel Kosters, Christiane Peters, Marco Streng 

 * Trac 9054: [[http://trac.sagemath.org/sage_trac/ticket/9054|Create a class for basic function_field arithmetic for Sage]]
 * Trac 9069: [[http://trac.sagemath.org/sage_trac/ticket/9069|Weak Popov Form (reduction algorithm)]]
 * Trac 9094: [[http://trac.sagemath.org/sage_trac/ticket/9094|is_square and sqrt for polynomials and fraction fields]]
 * Trac 9095: [[http://trac.sagemath.org/sage_trac/ticket/9095|Heights of points on elliptic curves over function fields]]
 
Make sure to see [[daysff/curves|this page for more links]].
