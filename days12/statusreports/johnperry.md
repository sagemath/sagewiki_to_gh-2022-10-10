= Perry @ Sage Days 12 =

== Bugs ==

 * [[http://trac.sagemath.org/sage_trac/ticket/1396|Bug 1396]] ''Ideal.groebner_basis should accept keyword arguments for strategy parameters'' In any sane, just, and sinless universe the patch submitted would work. Sadly, a serious bug in the interface between Sage and Singular prevents it from working, so I passed it back to Martin.
 * [[http://trac.sagemath.org/sage_trac/ticket/2159|Bug 2159]] ''Gröbner bases over any field (cont'd)'' Patch submitted for one of the functions that didn't work properly ({{{dimension}}}). Recommended creating a new ticket for the other ({{{variety}}}).
 * [[http://trac.sagemath.org/sage_trac/ticket/5056|Bug 5056]] ''rename Ideal.reduced_basis to Ideal.interreduced_basis'' This ticket was created for the express purpose of accomodating people who don't read (i.e. me). Patch submitted and accepted.

== Doctests ==

  * added some doctests to {{{sage.rings.polynomial.multi_polynomial_ideal}}}

== Misc ==

 * Learned about hg, doctests.

== F5 ==

 * Talk on F5, 23 Jan 2009. Slides will be posted Real Soon Now.

 * Discussions with [[http://wiki.sagemath.org/days12/statusreports/malb|Martin]] and Robert Dellaca regarding many questions surrounding F5 in general, and thoughts on implementing an F4-style F5.

 * With Martin, implemented an F4-style F5 that seems to work.
