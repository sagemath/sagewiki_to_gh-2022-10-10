##master-page:HomepageTemplate
#format wiki
== Didier ==
Email: [[MailTo(dfdeshom AT SPAMFREE gmail DOT com)]]

== SAGE-related projects ==

=== Quaddouble integration ===
Implement a wrapper for the quad double library (C++) available at http://www.cs.berkeley.edu/~yozo/  : http://sage.math.washington.edu/home/dfdeshom/custom/patches/qdrf-c-interface.txt

=== Modifying Mercurial ===
There is a turorial here: http://sage.math.washington.edu:9001/ModifyingMercurial
There is also a mercurial spkg with better error messages here: http://sage.math.washington.edu/home/dfdeshom/custom/hg-sage/mercurial-20070209.spkg

=== Multiplication algorithm ===
A (slightly) faster multiplication algorithm of univariate polynomnials over R. Currently, this is known as _mul_fateman() in rings/polynomial_element.py but needs to be faster, probably through PARI or PyrexDELTA: I've finally started working on this. See my ext/polynomial_pyx.pyx for a preview. As predicted, the speedup is nice. Only integers are handled for now.

=== RealLib inclusion ===
 * RealLib3 as an alternate source for computing real numbers.
 * RealLib vs MPFR:
  * RealLib tries to compute numbers __exactly__, instead of rounding to
   . the nearest valid floating-point number.
  * Computations take more time, but are exact
  * RealLib may not round correctly (not according to IEEE 754)
 * RealLib should not be a replacementto MPFR. MPFR has its uses and is
  . faster than RealLib3

DELTA: Thanks to Dr Lambov, this now compiles on 386 and AMD64 and PPC. I've built a new version and posted patches.

=== Tweaking Hermes ===
Logging of sessions using mathml through hermes:

 * Improve, add fonts to hermes
 * The final goal is to be able to reproduce the entire documentation
  . in mathmml format. This is currently possible if you hack up some missing
  fonts and avoid to generate the table of contents. Quite a pain :( I'll post a link to the generated doc
Logging of pictures in dvi and mathml logger.

 * Possible, but slightly tricky (how do you include a jpeg file in a DVI file
  . without converting it to an EPS file?).

=== Doctest Status ===
Does each method have an example? Instead of checking by hand a handy script could be used. I have a script that does that: [http://sage.math.washington.edu/home/dfdeshom/sage/devel/sage/doctest-status.py http://sage.math.washington.edu/home/dfdeshom/sage/devel/sage/doctest-status.py ] For example, here is the output for integer.pyx:
{{{ 
Results for  sage/ext/integer.pyx
----------------------------------------
Total number of tests        :  87
Number of tests with examples:  42
Tests with no examples       :  __int__, __div_, _interface_init_, _xgcd, __cmp__, factor, factorial, __mul_, integer, __add_, __richcmp__, __floordiv, __nonzero__, crt, _and, _lcm, __long__, __str_malloc, rational_reconstruction, _mpfr_, parent, __sub_, pmem_malloc, __and__, _reduce_set, __float__, _pari_, _rshift, __invert__, _latex_, _mathml_, copy, valuation, _or, _im_gens_, __hash__, GCD_list, __reduce__, LCM_list, __new__, is_unit, __dealloc__, __repr__, __or__, _lshift
********************************************************************************
}}}

=== Automatic build+testing ===
* sage -br is nice, but how about an option to also run tests on any file that is being rebuilt?

----
 . CategoryHomepage
