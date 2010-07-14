= Sage Days 23.5 Coding Sprint Projects =

== Singular Parallel Build ==

 * [[http://trac.sagemath.org/sage_trac/ticket/9497|Trac #9497]]: Fix the Singular spkg so it can take advantage of building in parallel


== Doctest the Free Algebra Quotient code ==

The file {{{SAGE_ROOT/devel/sage/sage/algebra/free_algebra_quotient.py}}} has no doctests. Get it to 100% coverage.   The point of this is that it is related to wrapping something like letterplace. 

== error: out of memory ==

 * [[http://trac.sagemath.org/sage_trac/ticket/5313|Trac #5313]].  Patch singular so that when it runs out of memory the error message says "singular" in it. 

