= Sage Days 23.5 Coding Sprint Projects =

<<TableOfContents>>

== Fix Sage's wrapping of Singular's Brill-Noether ==

  * See [[/brillnoether|this page]] for more details. 

== Python <--> Singular Linking Discussion ==

How: Dinner and beer.

Have a technical discussion of linking Python and Singular and Sage.


== Singular Parallel Build ==

People: Hans S. + A. Dreyer

Goals: 
  1. Tell us which components of singular build in parallel via some testing. 

 * [[http://trac.sagemath.org/sage_trac/ticket/9497|Trac #9497]]: Fix the Singular spkg so it can take advantage of building in parallel. But fix Singular SPKG first (3-1-1-3)!

== Doctest the Free Algebra Quotient code ==

People: Gabriel Pannwitz

The file {{{SAGE_ROOT/devel/sage/sage/algebras/free_algebra_quotient.py}}} has no doctests. Get it to 100% coverage.   The point of this is that it is related to wrapping something like letterplace. 

== Letterplace ==

People: Martin Albrecht will review. 

Do a very basic wrapping of letterplace for Sage.  Use this to replace some of the lame old code in the {{{SAGE_ROOT/devel/sage/sage/algebras/}}} directory. See here: [[http://trac.sagemath.org/sage_trac/ticket/7797|#7797]]

== error: out of memory ==

People: William Stein, Hans S. 

 * (done, in that patches are up for everything) [[http://trac.sagemath.org/sage_trac/ticket/5313|Trac #5313]].  Patch singular so that when it runs out of memory the error message says "singular" in it.   Moreover, replace the exit(1) or whatever by something that can be trapped via _sig_on/_sig_off.  

== Relative number field arithmetic ==

People: Mohamed, Andrew, William Stein

Goal: 
  1. (done) Explain how to compute inverses.  
  2. (done) Open a trac ticket about this: [[http://trac.sagemath.org/sage_trac/ticket/9500|trac 9500]]
  3. (done) Post a [[/relative_number_fields|little experimental code that indicates how fast this could be]]. 
  4. (done) Post a patch to the above ticket.

 Arithmetic in relative numbers fields is sometimes very slow.  This could be done using multivariate polynomial ring quotients via libsingular, which would be extremely fast in some cases.  There is some cleverness that I do *not* know how to do for inverting elements -- hence it would be good to do this here with singular people around.

== Delete a function related to multivariate polynomial factorization from Sage ==

People: William Stein

 (done -- patch up) This is [[http://trac.sagemath.org/sage_trac/ticket/9498|trac 9498]].  There is a stupid function that William Stein wrote during bug days, which may as well be removed.

== Gröbner bases in Sage: Optional parameters ==

 People: Simon King, with a little bit of help from Martin (minutes)

In Singular, one can use various options (redTail, e.g.) and also a degree bound (degBound) for Gröbner basis computations. Aim: Allow the same for libSingular, and also introduce a decorator that can be used for methods that use the Singular expect interface: Save the current options and set a certain value when entering the function, and reset the options when leaving. In other words: Fix [[http://trac.sagemath.org/sage_trac/ticket/1396|#1396]]!!

== extend polynomial rings mod 2^n to n > 30, and over ZZ ==

 People: Anne, Frank, Moritz

Rings mod 2^n are limited to n <= 30, but we'd like to have n<=62 by using longs. This would be relevant for some crypto applications.


== (Done) big exponents ==

 People: Martin Albrecht, Hans S. 

Provide an interface to use Singular monomials with big exponents (64-bit instead of 16-bit)


Sage Trac ticket: [[http://trac.sagemath.org/sage_trac/ticket/7795|Trac #7795]]

== Plural interface ==

 People: Burcin, Oleksandr Motsak, Michael Brickenstein, Simon King

Revive [[http://trac.sagemath.org/sage_trac/ticket/4539|#4539]] to provide a basic interface to Plural. This will involve writing new parent and element classes for plural at least.

This works using the libsingular interface, without inheriting from the commutative polynomial classes now:
{{{
sage: A.<x,y,z>=FreeAlgebra(QQ,3)
sage: H=A.g_algebra({y*x:x*y-z, z*x:x*z+2*x, z*y:y*z-2*y})
sage: H.inject_variables()
Defining x, y, z
sage: z*x
x*z + 2*x
sage: z*y
y*z - 2*y
sage: I = H.ideal([y^2, x^2, z^2-H.one_element()],coerce=False)
sage: I._groebner_basis_libsingular()
[z^2 - 1, y*z - y, x*z + x, y^2, 2*x*y - z - 1, x^2]
}}}
This meant adding a lot of instances of this in the interface:
{{{
            if PY_TYPE_CHECK(a, MPolynomialIdeal) or \
                    PY_TYPE_CHECK(a, NCPolynomialIdeal):
                ring2 = a.ring()
            elif PY_TYPE_CHECK(a, MPolynomial_libsingular) or \
                    PY_TYPE_CHECK(a, NCPolynomial_plural):
                ring2 = a.parent()
            elif PY_TYPE_CHECK(a, MPolynomialRing_libsingular) or \
                    PY_TYPE_CHECK(a, NCPolynomialRing_plural):
                ring2 = a
}}}
Michael volunteered to fix the rest of these. We also need coercion to work:
{{{
sage: z^2-1
---------------------------------------------------------------------------
NotImplementedError                       Traceback (most recent call last)
...
NotImplementedError: 
Also, please make sure you have implemented has_coerce_map_from_impl or has_coerce_map_from_c_impl (or better _an_element_c_impl or _an_element_impl if possible) for Noncommutative Multivariate Polynomial Ring in x, y, z over Rational Field

sage: z^2-H.one_element()
z^2 - 1
}}}

== Multivariate GCD, factorization, etc. benchmarks ==

 People: Martin Lee, Burcin, Markus, Michael Brickenstein

Take a look at the new code in GIAC, [[http://www-fourier.ujf-grenoble.fr/~parisse/giac/benchmarks/benchmarks.html|benchmarks posted here]]. Compare to improvements in Singular-Factory. [[MultivariateGCDBenchmarks|See here]] for more gcd benchmarks and scripts.

== Implement multivariate factorization over finite fields ==

 People: Burcin, William Stein, Martin Albrecht

 See [[/factor|this page]].

== Fix bug(s) in Singular needed for updating the spkg ==

 People: Frank

  * Some reduction over the integers goes wrong

== (Done) Error handling in Libsingular ==

 People: Martin Albrecht, Hans S.

  Goal: If you have a singular library function and it goes wrong, then afterwards you can still use singular library functions. 

  Patch up at Sage ticket: [[http://trac.sagemath.org/sage_trac/ticket/9499|#9499]] (positive review)

== (Done) Catch Singular error messages ==

People: Martin Albrecht

[[http://trac.sagemath.org/sage_trac/ticket/9506|#9506]]

= other stuff =
== @fork, @parallel decorator ==

 People: Robert Miller, William Stein

 Ticket: See [[http://trac.sagemath.org/sage_trac/ticket/9501|trac 9501]].

Simon King mentioned that sometimes his code crashes/leaks/etc.  So make it so one can do:
{{{
@fork
def f(x,y,z,...):
    ...
}}}
and then f gets computed in a blocking forked process, and the result is returned via pickling. This is 100% to thwart mem leaks, segfaults, and guaranteed timeout possibility.   This could be basically just a light wrapper around @parallel(1).  Also, make a global flag to turn this off, so @fork does nothing. 

== Profiling Cython code ==

 People: Robert Miller

 An example of using C library function `clock()` to count clock ticks...

 [[attachment:timing_binary_codes.patch]]

{{{
sage: gc = sage.coding.code_constructions.BinaryGolayCode()
sage: M = gc.extended_code().gen_mat()
sage: from sage.groups.perm_gps.partn_ref.refinement_binary import LinearBinaryCodeStruct
sage: from sage.coding.binary_code import BinaryCodeClassifier, BinaryCode
sage: BC = BinaryCodeClassifier()
sage: B = BinaryCode(M)
sage: BN = LinearBinaryCodeStruct(M)
sage: BN.run()
wd deg tot clock ticks 683242
     563425 calls
     1.21265829525 per call
cl deg tot clock ticks 281302
     144294 calls
     1.94950586996 per call
sage: x = BC._aut_gp_and_can_label(B)
wd deg tot clock ticks 659583
     746525 calls
     0.883537724792 per call
cl deg tot clock ticks 183800
     193324 calls
     0.950735552751 per call
}}}
