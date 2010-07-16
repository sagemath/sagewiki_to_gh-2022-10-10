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

We fixed this upstream (added dependencies to build system), Hans made anew release. The spkg was fixed by malb last night.

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

== (Done) Gröbner bases in Sage: Optional parameters ==

People: Simon King, with a help from Martin and Hannes (more than minutes...)

 (patch up at [[http://trac.sagemath.org/sage_trac/ticket/1396|#1396]]) In Singular, one can use various options (redTail, e.g.) and also a degree bound (degBound) for Gröbner basis computations. Aim: Allow the same for libSingular. 

 As a courtesy, one can name the options both in Python style (deg_bound) and Singular style (degBound). A decorator ensures that all relevant methods work under default options unless explicitly requested by the user. Here are examples in Singular and libSingular:
 {{{
sage: R.<x,y> = QQ[]
sage: I = R*[x^3+y^2,x^2*y+1]
sage: I.groebner_basis(prot=True, deg_bound=2)
std in (0),(x,y),(dp(2),C)
[4294967295:2]3ss
(S:1)-
product criterion:0 chain criterion:0
[x^3 + y^2, x^2*y + 1]
sage: I.groebner_basis()
[x^3 + y^2, x^2*y + 1, y^3 - x]
sage: Rlocal.<x,y,z> = PolynomialRing(QQ, order='ds')
sage: J = [x^7+y^7+z^6,x^6+y^8+z^7,x^7+y^5+z^8, x^2*y^3+y^2*z^3+x^3*z^2,x^3*y^2+y^3*z^2+x^2*z^3]*Rlocal
sage: J.groebner_basis(mult_bound=100)
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6 + x*y^4*z^5, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6 - x*y^4*z^4 - x^3*y*z^5]
sage: J.groebner_basis(algorithm='singular',mult_bound=100)
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6 + x*y^4*z^5, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6 - x*y^4*z^4 - x^3*y*z^5]
sage: J.groebner_basis(prot=True)
std in basering
[1048575:2]5(4)s(3)s6s7s8s(4)s(5)sH(13)9(3)sH(12)8(4)s(5).s.s9....sH(11)8.10
(S:10)-----------
product criterion:9 chain criterion:30
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6, y^4*z^3 - y^3*z^4 - x^2*z^5, x^3*y*z^4 - x^2*y^2*z^4 + x*y^3*z^4, x^3*z^5, x^2*y*z^5 + y^3*z^5, x*y^3*z^5]
sage: J.groebner_basis(algorithm='singular')
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6, y^4*z^3 - y^3*z^4 - x^2*z^5, x^3*y*z^4 - x^2*y^2*z^4 + x*y^3*z^4, x^3*z^5, x^2*y*z^5 + y^3*z^5, x*y^3*z^5]
 }}}


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

Polynomials in Q[x,y,z]:

 1. ((1+x+y+z)^20^+1)*((1+x+y+z)^20^+2)
 2. ((1+x+y+z)^30^+1)*((1+x+y+z)^30^+2)
 3. (x+y+z^2^)^25^-(y-x+3*z-1+x^2^)^25^
 4. (x+y+z)^30^-1
 5. (2+x-y+z)^20^-2^20^
 6. x^200^-1
 7. x^50^-2^50^
 8. x^40^-(y+z)^40^
 9. (x+y)^10^-(y-z)^10^
 10. (1-3*x-4*y+3*z-y*z^2^-3*y*z^3^-y^2^*z-3*y^2^*z^2^+3*y^2^*z^3^-y^3^*z-2*y^3^*z^2^-3*y^3^*z^3^+3*x*z-3*x*z^2^+2*x*z^3^+x*y-3*x*y^3^+3*x^2^*z-4*x^2^*z^2^-x^2^*z^3^-x^2^*y+3*x^2^*y^2^-5*x^2^*y^3^-x^3^*z-5*x^3^*z^2^-2*x^3^*z^3^+2*x^3^*y+4*x^3^*y^3^-x*y^2^+3*x*y^2^*z+4*x^3^*y^2^+3*y*z-5*z^3^-4*y^2^+2*y^3^+2*x^2^*y^2^*z^2^+3*x*y^3^*z^2^+3*x*y^3^*z+4*x*y*z^2^+3*x*y^3^*z^3^-5*x*y^2^*z^2^+3*x*y*z-3*x^3^*y^3^*z-5*x^2^*y^3^*z^3^-5*x*y^2^*z^3^-5*x^2^*y*z^2^+3*x^2^*y^3^*z-x^3^*y^2^*z^2^-x^3^*y^2^*z-x^3^*y^2^*z^3^-4*x^2^*y^2^*z^3^+2*x^2^*y*z-4*x^2^*y*z^3^+x^2^*y^3^*z^2^-x^2^*y^2^*z-5*x^3^*y*z^2^-x^3^*y*z^3^-x^3^*y*z-5*x*y*z^3^-2*x^2^+3*x^3^)^4^-1
 11. (360-201*x+389*y+258*z-200*y*z+491*y*z^2^+493*y^2^*z+454*y^2^*z^2^-401*x*z+49*x*z^2^-304*x*y-484*x*y^2^+262*x^2^*z-339*x^2^*z^2^-227*x^2^*y-330*x^2^*y^2^+250*z^2^-495*y^2^-218*x*y*z-476*x^2^*y^2^*z^2^+243*x*y^2^*z+94*x^2^*y^2^*z+240*x*y^2^*z^2^-149*x*y*z^2^-321*x^2^*y*z-189*x^2^*y*z^2^+357*x^2^)^4^-1
 12. x^800^-1
 13. (101-139*x-24*y+104*z-103*y*z-451*y*z^2^-326*y^2^*z-493*y^2^*z^2^-327*x*z+439*x*z^2^-108*x*y+155*x*y^2^+121*x^2^*z-462*x^2^*z^2^+103*x^2^*y+217*x^2^*y^2^+327*z^2^-122*y^2^+344*x*y*z-262*x^2^*y^2^*z^2^+396*x*y^2^*z+8*x^2^*y^2^*z-47*x*y^2^*z^2^-314*x*y*z^2^+82*x^2^*y*z-50*x^2^*y*z^2^-424*x^2^)^6^-1
 14. (14878-22176*x+8386*y+41700*z-38290*y*z+44119*y*z^2^-37070*y^2^*z+45024*y^2^*z^2^+47986*x*z-28140*x*z^2^+33417*x*y-31087*x*y^2^+45572*x^2^*z-46632*x^2^*z^2^-77*x^2^*y-15943*x^2^*y^2^-21957*z^2^-14839*y^2^-41351*x*y*z-35985*x^2^*y^2^*z^2^+43811*x*y^2^*z-35522*x^2^*y^2^*z+23454*x*y^2^*z^2^-33462*x*y*z^2^-32836*x^2^*y*z+9538*x^2^*y*z^2^+31480*x^2^)^6^-1
 15. (-4212647-3198520*x+2950231*y -3315421*z +3701831*y*z +2351230*y*z^2^ +108373*y^2^*z +1812831*y^2^*z^2^+379586*x*z-3385311*x*z^2^+2453252*x*y+3838359*x*y^2^+2688541*x^2^*z+1838684*x^2^*z^2^-4852824*x^2^*y-4824055*x^2^*y^2^+90165*z^2^+651277*y^2^+2363714*x*y*z-4782981*x^2^*y^2^*z^2^-4578460*x*y^2^*z+4757744*x^2^*y^2^*z+681595*x*y^2^*z^2^+398600*x*y*z^2^+1864322*x^2^*y*z+1600103*x^2^*y*z^2^+2488109*x^2^)^4^-1
 16. ((x+y+z)^10^ - 4^10^)^5^-3^5^
 17. ((x+y+z)^5^ - 2^5^)^8^-3^8^

Bechmarks (someone check these, its late...).

GIAC and Singular on AMD opeteron 2800MHZ,  Magma on AMD opeteron 2300MHZ (due to licence)

time in s (using timer in singular, which is probably not very excact)

||Polynomial||GIAC 9.0.2||Singular 3.1.1.3||Magma||
|| 1 || 1 || 15 || 9 ||
|| 2 || 13 || 111 || 164 ||
|| 3 || 1 || 4 || 3 ||
|| 4 || 0 || 1 || 1 ||
|| 5 || 0 || 0 || 0 ||
|| 6 || 0 || 0 || 0 ||
|| 7 || 0 || integer overflow || 0 ||
|| 8 || 0 || 0 || 0 ||
|| 9 || 0 || 0 || 0 ||
|| 10 || 0 || 0 || 0 ||
|| 11 || 0 || 1 || 0 ||
|| 12 || 0 || 0 || 0 ||
|| 13 || 1 || 1 || 0 ||
|| 14 || 1 || 1 || 0 ||
|| 15 || 0 || 1 || 0 ||
|| 16 || 0 || 1 || 0 ||
|| 17 || 1 || 1 || 1 ||
|| 18 || 0 || 1 || 1 ||

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
