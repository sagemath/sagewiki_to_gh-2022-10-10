= Sage Days 24 Coding Sprint Projects =

This is a list of projects suitable for [[days24|Sage Days 24]]. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).

<<TableOfContents>>

== Kovacic's Algorithm ==

'''People:''' Burcin Erocal, Felix

Implement Kovacic's algorithm in Sage.

== Hypergeometric Functions ==

'''People:''' Flavia Stan, Karen Kohl, Fredrik Johansson, Zaf

== Plural support ==

'''People:''' Burcin Erocal, Simon King, Alex, Alex D., Burkhard

Add support for Singular's noncommutative component Plural, finish [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539]].

== Locapal support ==

'''People:''' Burcin Erocal

There is experimental support for computing Groebner bases over certain localizations of operator algebras in Singular. See [[http://www.math.rwth-aachen.de/~Viktor.Levandovskyy/filez/singular/levandovskyy_kl.pdf|this presentation]] for more details. Support for arithmetic needs to be provided in Sage.

== Parallel Integration ==

'''People:''' Stefan Boethner, Ralf, Burkhard, Burcin Erocal

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

People: William Stein, Sebastian P.

 * Trac 9054: [[http://trac.sagemath.org/sage_trac/ticket/9054|Create a class for basic function_field arithmetic for Sage]]
 * Trac 9069: [[http://trac.sagemath.org/sage_trac/ticket/9069|Weak Popov Form (reduction algorithm)]]
 * Trac 9094: [[http://trac.sagemath.org/sage_trac/ticket/9094|is_square and sqrt for polynomials and fraction fields]]
 * Trac 9095: [[http://trac.sagemath.org/sage_trac/ticket/9095|Heights of points on elliptic curves over function fields]]
 
Make sure to see [[daysff/curves|this page for more links]].

== Fast linear algebra over small extensions of GF(2) ==

'''People''': Martin Albrecht, Ciaran Mullan, Robert Miller, Sebastian P., Thomas

Here is how long Sage currently takes to compute the reduced row echelon form over GF(2^4) on a Macbook Pro (2nd generation):

|| n    || Sage    || NTL *2  || Magma || M4RIE ||
|| 1000 ||   49.49 ||   18.84 || 0.090 || 0.097 ||
|| 2000 ||  429.05 ||  149.11 || 0.510 || 0.529 ||
|| 3000 || 1494.33 ||  526.57 || 1.640 || 2.315 ||

Note that over GF(2^8) this code is already faster than Magma

{{{
> K<a> := GF(2^8);
> for i := 1000 to 10001 by 1000 do
for> A:=RandomMatrix(K,i,i);
for> t:=Cputime();
for> E:=EchelonForm(A);
for> print i, Cputime(t);
for> end for;
1000 1.290
2000 9.870
3000 33.560
}}}

{{{
gf(2^8), 1000 x 1000: wall time: 0.865
gf(2^8), 2000 x 2000: wall time: 4.306
gf(2^8), 3000 x 3000: wall time: 14.029
}}}

== Generating Stuff ==

'''People:''' Robert Miller
