

## Didier

Email: dfdeshom AT SPAMFREE gmail DOT com 


## SAGE-related projects


### Quaddouble integration

Implement a wrapper for the quad double library (C++) available at <a href="http://www.cs.berkeley.edu/~yozo/">http://www.cs.berkeley.edu/~yozo/</a>  : <a href="http://sage.math.washington.edu/home/dfdeshom/custom/patches/qdrf-c-interface.txt">http://sage.math.washington.edu/home/dfdeshom/custom/patches/qdrf-c-interface.txt</a> 


### Modifying Mercurial

There is a turorial here: <a href="http://sage.math.washington.edu:9001/ModifyingMercurial">http://sage.math.washington.edu:9001/ModifyingMercurial</a> There is also a mercurial spkg with better error messages here: <a href="http://sage.math.washington.edu/home/dfdeshom/custom/hg-sage/mercurial-20070209.spkg">http://sage.math.washington.edu/home/dfdeshom/custom/hg-sage/mercurial-20070209.spkg</a> 


### Multiplication algorithm

A (slightly) faster multiplication algorithm of univariate polynomnials over R. Currently, this is known as _mul_fateman() in rings/polynomial_element.py but needs to be faster, probably through PARI or Pyrex 


### RealLib inclusion

* <a href="/RealLib3">RealLib3</a> as an alternate source for computing real numbers. 
* <a href="/RealLib">RealLib</a> vs MPFR: 
   * <a href="/RealLib">RealLib</a> tries to compute numbers <ins>exactly</ins>, instead of rounding to 
      * the nearest valid floating-point number. 
   * Computations take more time, but are exact 
   * <a href="/RealLib">RealLib</a> may not round correctly (not according to IEEE 754) 
* <a href="/RealLib">RealLib</a> should not be a replacementto MPFR. MPFR has its uses and is 
   * faster than <a href="/RealLib3">RealLib3</a> 

### Tweaking Hermes

Logging of sessions using mathml through hermes: 

* Improve, add fonts to hermes 
* The final goal is to be able to reproduce the entire documentation 
   * in mathmml format. This is currently possible if you hack up some missing fonts and avoid to generate the table of contents. Quite a pain :( I'll post a link to the generated doc 
Logging of pictures in dvi and mathml logger. 

* Possible, but slightly tricky (how do you include a jpeg file in a DVI file 
   * without converting it to an EPS file?). 

### Doctest Status

Does each method have an example? Instead of checking by hand a handy script could be used. I have a script that does that: <a class="http" href="http://sage.math.washington.edu/home/dfdeshom/sage/devel/sage/doctest-status.py">http://sage.math.washington.edu/home/dfdeshom/sage/devel/sage/doctest-status.py</a> For example, here is the output for integer.pyx: 
```txt
Results for  sage/ext/integer.pyx
----------------------------------------
Total number of tests        :  87
Number of tests with examples:  42
Tests with no examples       :  __int__, __div_, _interface_init_, _xgcd, __cmp__, factor, factorial, __mul_, integer, __add_, __richcmp__, __floordiv, __nonzero__, crt, _and, _lcm, __long__, __str_malloc, rational_reconstruction, _mpfr_, parent, __sub_, pmem_malloc, __and__, _reduce_set, __float__, _pari_, _rshift, __invert__, _latex_, _mathml_, copy, valuation, _or, _im_gens_, __hash__, GCD_list, __reduce__, LCM_list, __new__, is_unit, __dealloc__, __repr__, __or__, _lshift
********************************************************************************
```
* <a href="/CategoryHomepage">CategoryHomepage</a> 