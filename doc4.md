= Sage Doc Day 4 =

'''Saturday, April 11th, 2008, starting 9am'''

We will focus on writing doctests during Doc Days 4. Our goal is to raise the coverage score for the Sage library to 70%. 

Basis for the Doc Day should be 3.4.1.rc2 to be released on Friday, i.e. April 10th, 2008.

== Game Plan ==

See the discussion at https://groups.google.com/group/sage-devel/browse_thread/thread/8344d4f19346b98d

William suggested"
{{{
WHAT SHOULD WE DOCTEST?
I'm going to list some ideas for code to "hit", which have bad
coverage and for which there will be a big payoff.

schemes/generic/morphism.py: 2% (1 of 40)
modular/modsym/manin_symbols.py: 2% (2 of 68)
interfaces/kash.py: 3% (1 of 30)
probability/random_variable.py: 3% (1 of 30)
rings/extended_integer_ring.py: 4% (6 of 128)  # DELETE!!
rings/pari_ring.py: 4% (1 of 22)                          # could thisbe deleted???
structure/formal_sum.py: 4% (1 of 22)
interfaces/cocoa.py: 4% (1 of 23)                      # delete this, it doesn't work yet
interfaces/reduce.py: 4% (1 of 23)                     # delete; it doesn't work
plot/plot3d/base.pyx: 5% (4 of 78)
plot/tachyon.py: 8% (5 of 58)
rings/morphism.pyx: 8% (3 of 35)
structure/generators.pyx: 11% (5 of 45)
categories/pushout.py: 12% (9 of 73)
rings/laurent_series_ring.py: 13% (3 of 23)
plot/plot3d/shapes.pyx: 16% (5 of 31)
gsl/probability_distribution.pyx: 20% (4 of 20)   # has a nodoctest at
the top of file.  very scary!
schemes/elliptic_curves/monsky_washnitzer.py: 23% (25 of 107)    #
doctests here find bad things often, e.g., a bug in FLINT!
modular/hecke/ambient_module.py: 26% (9 of 34)
modular/modsym/ambient.py: 26% (26 of 97)

The above would be 874 doctests, which would solidly get us over 70%.

I've avoided code above that is being refactored, or rumored to be
refactored, or rewritten or whatever.  This is all
stuff that just needs to get coveraged.

William 
}}}

== Relevant Tickets ==

If you are working on '''any''' of the above please open a ticket and link it here so that we avoid duplicated work.

 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5631 | 5631]]: schemes/generic/affine_space.py
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5745 | 5745]]: schemes/generic/projective_space.py
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5747 | 5747]]: schemes/generic/ambient_space.py
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5749 | 5749]]: rings/power_series_poly.pyx
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5750 | 5750]]: matrix/matrix_integer_2x2.pyx
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5754 | 5754]]: misc/sagedoc.py
 * ready for review: [[http://trac.sagemath.org/sage_trac/ticket/5757 | 5757]]: sage-test and sage-ptest
 * in progress: [[http://trac.sagemath.org/sage_trac/ticket/5734 | 5734]]: modular/modsym/* [Done: p1list.pyx.  in progress: manin_symbols.py]
 * in progress: [[http://trac.sagemath.org/sage_trac/ticket/5756 | 5756]]: rings/morphism.pyx  (William Stein)

== Bugs found as a result of writing doctests ==
 * http://trac.sagemath.org/sage_trac/ticket/5754: inject_vars and docstrings
 * http://trac.sagemath.org/sage_trac/ticket/5758: "hello" bug

== Participants ==

Please add yourself here if you plan to be around.

 1. Michael Abshoff (Merges)
 2. Craig Citro (two patches above, more if I have time)
 3. Rob Beezer
 1. John Palmieri
 1. William Stein: 
    * rings/morphism.pyx: 8% (3 of 35)
