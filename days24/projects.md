= Sage Days 24 Coding Sprint Projects =

This is a list of projects suitable for [[days24|Sage Days 24]]. Feel free to add your favourite ideas/wishes, and to put your name down for something you're interested in (you'll need to get an account on the wiki to do this).

<<TableOfContents>>

== GIAC Factoring ==

'''People:''' Thomas, Burcin, Richard, William Stein (total anarchy, no leader!)

== Kovacic's Algorithm ==

'''People:''' '''Burcin''', Erocal, Felix

Implement Kovacic's algorithm in Sage.

== Hypergeometric Functions ==

'''People:''' Flavia Stan, Karen Kohl, '''Fredrik Johansson''', Zaf

Add a hypergeometric function class + simplifications

== Plural support ==

'''People:''' Burcin Erocal, Simon King, Oleksandr, Alex D., Burkhard (total anarchy!)

Add support for Singular's noncommutative component Plural, finish [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539]].

== Parallel Integration ==

'''People:''' '''Stefan Boethner''', Ralf, Burkhard, Burcin Erocal

Integrate Stefan Boettner's parallel integration code in Sage. There are several prerequisites for this, such as
 * algebraic function fields (transcendence degree > 1)
 * differential rings/fields
 * proper to_polynomial(), to_rational() functions for symbolic expressions

== Function Fields ==

The goal of this project is to get the basic infrastructure for function fields into Sage.   See [[daysff/curves|Hess's papers and talks]].

People: '''William Stein''', Sebastian P.

 * Trac 9054: [[http://trac.sagemath.org/sage_trac/ticket/9054|Create a class for basic function_field arithmetic for Sage]]
 * Trac 9069: [[http://trac.sagemath.org/sage_trac/ticket/9069|Weak Popov Form (reduction algorithm)]]
 * Trac 9094: [[http://trac.sagemath.org/sage_trac/ticket/9094|is_square and sqrt for polynomials and fraction fields]]
 * Trac 9095: [[http://trac.sagemath.org/sage_trac/ticket/9095|Heights of points on elliptic curves over function fields]]
 
Make sure to see [[daysff/curves|this page for more links]].

== Fast linear algebra over small extensions of GF(2) ==

'''People''': '''Martin Albrecht''', Ciaran Mullan, Robert Miller, Sebastian P., Thomas

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

'''People:''' Robert Miller (self-determination!)

For a somewhat recent snapshot of what I'm doing (as recent as the last time I updated it...), look:

[[http://sage.math.washington.edu/home/rlmill/graph_gens.patch|PATCH]]

== Fix sage.functions ==

'''People:''' '''Frederik''', William Stein, Harald

== Easy ripping apart of symbolic expression trees ==

'''People:''' '''Burcin''', Thomas, Stefan, Frederik

== (done) Matrix group actions on polynomials ==

'''People:''' Simon

(review needed for [[http://trac.sagemath.org/sage_trac/ticket/4513|4513]])
So far, a matrix group could act on, e.g., vectors. If it tried to act on something else, it always tried to do a matrix multiplication - which is not what we want for an action on polynomials! The patch in trac allows to do:
{{{
sage: M = Matrix(GF(3),[[1,2],[1,1]])
sage: N = Matrix(GF(3),[[2,2],[2,1]])
sage: G = MatrixGroup([M,N])
sage: m = G.0
sage: n = G.1
sage: R.<x,y> = GF(3)[]
# left action on polynomial
sage: m*x
x + y
# right action on polynomial
sage: x*m
x - y
# it really is left/right action!
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True

# Action on vectors and matrices still works as it used to do
sage: x = vector([1,1])
sage: x*m
(2, 0)
sage: m*x
(0, 2)
# again, verify left/right action
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True
sage: x = matrix([[1,2],[1,1]])
sage: x*m
[0 1]
[2 0]
sage: m*x
[0 1]
[2 0]
sage: (n*m)*x == n*(m*x)
True
sage: x*(n*m) == (x*n)*m
True
}}}
