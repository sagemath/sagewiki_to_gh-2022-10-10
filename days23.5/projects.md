= Sage Days 23.5 Coding Sprint Projects =

<<TableOfContents>>

== Singular Parallel Build ==

 * [[http://trac.sagemath.org/sage_trac/ticket/9497|Trac #9497]]: Fix the Singular spkg so it can take advantage of building in parallel

== Doctest the Free Algebra Quotient code ==

The file {{{SAGE_ROOT/devel/sage/sage/algebras/free_algebra_quotient.py}}} has no doctests. Get it to 100% coverage.   The point of this is that it is related to wrapping something like letterplace. 

== Letterplace ==

Do a very basic wrapping of letterplace for Sage.  Use this to replace some of the lame old code in the {{{SAGE_ROOT/devel/sage/sage/algebras/}}} directory. 

== error: out of memory ==

 * [[http://trac.sagemath.org/sage_trac/ticket/5313|Trac #5313]].  Patch singular so that when it runs out of memory the error message says "singular" in it.   Moreover, replace the exit(1) or whatever by something that can be trapped via _sig_on/_sig_off.  

== Relative number field arithmetic ==

 Arithmetic in relative numbers fields is sometimes very slow.  This could be done using multivariate polynomial ring quotients via libsingular, which would be extremely fast in some cases.  There is some cleverness that I do *not* know how to do for inverting elements -- hence it would be good to do this here with singular people around.

== Gröbner bases in Sage: Optional parameters ==


 In Singular, one can use various options (redTail, e.g.) and also a degree bound (degBound) for Gröbner basis computations. Aim: Allow the same for libSingular, and also introduce a decorator that can be used for methods that use the Singular expect interface: Save the current options and set a certain value when entering the function, and reset the options when leaving. In other words: Fix [[http://trac.sagemath.org/sage_trac/ticket/1396|#1396]]!!


== Delete a function related to multivariate polynomial factorization from Sage ==

 This is [[http://trac.sagemath.org/sage_trac/ticket/9498|trac 9498]].  There is a stupid function that William Stein wrote during bug days, which may as well be removed.


= Stuff that isn't clearly Singular related =

== Make an @fork decorator ==
 
Simon King mentioned that sometimes his code crashes/leaks/etc.  So make it so one can do:
{{{
@fork
def f(x,y,z,...):
    ...
}}}
and then f gets computed in a blocking forked process, and the result is returned via pickling. This is 100% to thwart mem leaks, segfaults, and guaranteed timeout possibility.   This could be basically just a light wrapper around @parallel(1).  Also, make a global flag to turn this off, so @fork does nothing. 

== Sage Nagbot could Doctest some tickets ==

The Sage Nagbot could be made able to run doctests for a ticket, say in the one obvious case where there is precisely one patch attached to the ticket, and it is set to "needs review".   [[http://sage.math.washington.edu/home/wstein/nagbot/|The nagbot code is here.]]
