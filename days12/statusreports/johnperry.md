

# Perry @ Sage Days 12


## Bugs

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1396">Bug 1396</a> _Ideal.groebner_basis should accept keyword arguments for strategy parameters_ In any sane, just, and sinless universe the patch submitted would work. Sadly, a serious bug in the interface between Sage and Singular prevents it from working, so I passed it back to Martin. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/2159">Bug 2159</a> _Gröbner bases over any field (cont'd)_ Patch submitted for one of the functions that didn't work properly (`dimension`). Recommended creating a new ticket for the other (`variety`). 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5056">Bug 5056</a> _rename Ideal.reduced_basis to Ideal.interreduced_basis_ This ticket was created for the express purpose of accomodating people who don't read (i.e. me). Patch submitted and accepted. 

## Doctests

   * added some doctests to `sage.rings.polynomial.multi_polynomial_ideal` 

## Misc

* Learned about hg, doctests. 

## F5

* Talk on F5, 23 Jan 2009. Slides will be posted Real Soon Now. 
* Discussions with <a class="http" href="http://wiki.sagemath.org/days12/statusreports/malb">Martin</a> and Robert Dellaca regarding many questions surrounding F5 in general, and thoughts on implementing an F4-style F5. 
* With Martin, implemented an F4-style F5 that seems to work. 