

# Sage Doc Day 4

**Saturday, April 11th, 2008, starting 9am** 

We will focus on writing doctests during Doc Days 4. Our goal is to raise the coverage score for the Sage library to 70%.  

Basis for the Doc Day should be 3.4.1.rc2 to be released on Friday, i.e. April 10th, 2008. 


## Game Plan

See the discussion at <a href="https://groups.google.com/group/sage-devel/browse_thread/thread/8344d4f19346b98d">https://groups.google.com/group/sage-devel/browse_thread/thread/8344d4f19346b98d</a> 

William suggested" 
```txt
WHAT SHOULD WE DOCTEST?
I'm going to list some ideas for code to "hit", which have bad
coverage and for which there will be a big payoff.

schemes/generic/morphism.py: 2% (1 of 40)
modular/modsym/manin_symbols.py: 2% (2 of 68)
interfaces/kash.py: 3% (1 of 30)
probability/random_variable.py: 3% (1 of 30)
rings/extended_integer_ring.py: 4% (6 of 128)  # DELETE!!
rings/pari_ring.py: 4% (1 of 22)                          # could thisbe deleted???
DONE structure/formal_sum.py: 4% (1 of 22)
interfaces/cocoa.py: 4% (1 of 23)                      # delete this, it doesn't work yet
interfaces/reduce.py: 4% (1 of 23)                     # delete; it doesn't work
plot/plot3d/base.pyx: 5% (4 of 78)
plot/tachyon.py: 8% (5 of 58)
DONE rings/morphism.pyx: 8% (3 of 35)
structure/generators.pyx: 11% (5 of 45)
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
```

## Relevant Tickets

If you are working on **any** of the above please open a ticket and link it here so that we avoid duplicated work. 

* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5631">5631</a>: schemes/generic/affine_space.py 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5745">5745</a>: schemes/generic/projective_space.py 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5747">5747</a>: schemes/generic/ambient_space.py 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5749">5749</a>: rings/power_series_poly.pyx 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5750">5750</a>: matrix/matrix_integer_2x2.pyx 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5754">5754</a>: misc/sagedoc.py 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5757">5757</a>: sage-test and sage-ptest 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5764">5764</a>: sageinspect 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5756">5756</a>: rings/morphism.pyx  (William Stein) 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5756">5756</a>: plot3d/shapes.pyx 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5735">5735</a>: remove extended ZZ/QQ 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5766">5766</a>: improve coverage of structure/formal_sum.py (William Stein) 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5770">5770</a>: modular/modsym/p1list.pyx 
* ready for review: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5734">5734</a>: modular/modsym/manin_symbols.py  
* in progress: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5767">5767</a>: plot3d/base.pyx 
* gave up: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5768">5768</a>: structure/generators.pyx (William Stein) 

## Bugs with new tickets found as a result of writing doctests

* <a href="http://trac.sagemath.org/sage_trac/ticket/5754">http://trac.sagemath.org/sage_trac/ticket/5754</a>: inject_vars and docstrings 
* <a href="http://trac.sagemath.org/sage_trac/ticket/5758">http://trac.sagemath.org/sage_trac/ticket/5758</a>: "hello" bug 
* <a href="http://trac.sagemath.org/sage_trac/ticket/5759">http://trac.sagemath.org/sage_trac/ticket/5759</a>: "divides" bug 

## Participants

Please add yourself here if you plan to be around. 

1. Michael Abshoff (Merges) 
1. Craig Citro (two patches above, more if I have time) 
1. Rob Beezer 
         * sage/games/sudoku.py [100% (3 of 3)] 
         * misc/latex.py [underway] 
1. John Palmieri 
1. William Stein:  
         * rings/morphism.pyx: [100% (35 of 35)] [was 8% (3 of 35)] 
         * structure/formal_sum.py: [100% (22 of 22)] [was 4% (1 of 22)] 
         * I GIVE; I can't deal with that! -- structure/generators.pyx: xxx so far [was generators.pyx: 11% (5 of 45)] 
1. John Cremona: 
         * modular/modsym/p1list.pyx: 100%  (27 of 27) [was 15% (4 of 26)] (patch ready for review) 
         * modular/manin_symbols.py:  100% (59 of 59)  [was 2% (2 of 68)] (patch ready for review) 
1. Robert Bradshaw 