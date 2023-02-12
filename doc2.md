

# Sage Doc Day 2

**Sunday, March 9, 2008** 

We will focus mostly on doctests Doc Days 2.   Our goal is to raise the coverage score for the Sage library to 50%, since this is a central goal for Sage-3.0.   We need about 1200 new doctests to get to 50% coverage. 


## Meetups

* Seattle (canceled due to lack of people -- we'll just meet on irc): we'll be meeting at Online Coffee Company in Capitol Hill (between 14th and 15th).  Call Stein at 206-419-0925 if you have trouble finding us.    

## Names

Add your name here if you're going to be involved, and mention what Sage module you're going to work on! 

* Craig Citro (after 1PM): `modular/modsym` and/or `modular/hecke` 
* Michael Abshoff - working on #1647, #1648 
* cswiercz:  rings/ring.pyx 
* William Stein: databases (starting score is 16.8%!) 

## Modules

Coverage scores by module for sage-2.10.3.rc2.  I made this with the following script run in devel/sage/sage/: 
```txt
#!/usr/bin/python
import os
for D in os.listdir('.'):
    if os.path.isdir(D):
        cmd = "cd %s; sage -coverage .|tail -2"%D
        r = os.popen(cmd).read()
        r = r.lstrip()
        print D.upper() + ": " + r
```

```txt
ALGEBRAS: Overall weighted coverage score:  15.7%
Total number of functions:  215
CALCULUS: Overall weighted coverage score:  50.7%
Total number of functions:  495
CATEGORIES: Overall weighted coverage score:  15.1%
Total number of functions:  278
CODING: Overall weighted coverage score:  80.0%
Total number of functions:  117
COMBINAT: Overall weighted coverage score:  75.5%
Total number of functions:  1919
CRYPTO: Overall weighted coverage score:  62.4%
Total number of functions:  198
DATABASES: Overall weighted coverage score:  16.8%
Total number of functions:  218
DSAGE: Overall weighted coverage score:  0.0%
Total number of functions:  477
EXT: Overall weighted coverage score:  58.1%
Total number of functions:  79
FUNCTIONS: Overall weighted coverage score:  56.7%
Total number of functions:  402
GAMES: Overall weighted coverage score:  33.0%
Total number of functions:  3
GEOMETRY: Overall weighted coverage score:  53.3%
Total number of functions:  89
GRAPHS: Overall weighted coverage score:  71.9%
Total number of functions:  444
GROUPS: Overall weighted coverage score:  53.4%
Total number of functions:  420
GSL: Overall weighted coverage score:  29.1%    ** don't bother on this; we hope to remove GSL from sage. 
Total number of functions:  82
LFUNCTIONS: Overall weighted coverage score:  41.7%
Total number of functions:  38
LIBS: Overall weighted coverage score:  55.3%
Total number of functions:  1130
LOGIC: Overall weighted coverage score:  16.0%
Total number of functions:  18
MATRIX: Overall weighted coverage score:  57.6%
Total number of functions:  672
MEDIA: Overall weighted coverage score:  0.0%
Total number of functions:  26
MISC: Overall weighted coverage score:  24.8%
Total number of functions:  479
MODULAR: Overall weighted coverage score:  47.8%
Total number of functions:  1198
MODULES: Overall weighted coverage score:  48.7%
Total number of functions:  372
MONOIDS: Overall weighted coverage score:  54.8%
Total number of functions:  87
NUMERICAL: Overall weighted coverage score:  60.0%
Total number of functions:  5
PLOT: Overall weighted coverage score:  17.6%
Total number of functions:  662
PROBABILITY: Overall weighted coverage score:  3.0%
Total number of functions:  30
QUADRATIC_FORMS: Overall weighted coverage score:  22.8%
Total number of functions:  48
RINGS: Overall weighted coverage score:  50.4%
Total number of functions:  5021
SCHEMES: Overall weighted coverage score:  38.6%
Total number of functions:  846
SERVER: Overall weighted coverage score:  0.7%
Total number of functions:  854
SETS: Overall weighted coverage score:  81.1%
Total number of functions:  71
STRUCTURE: Overall weighted coverage score:  26.2%
Total number of functions:  452
TESTS: Overall weighted coverage score:  0.0%
Total number of functions:  135
```