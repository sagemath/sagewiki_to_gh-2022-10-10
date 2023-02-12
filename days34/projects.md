

# Sage/Singular Days Projects

[[_TOC_]] 


## Update Singular spkg

**People:** Simon, Burcin, Martin 

working on <a class="http" href="http://sage.math.washington.edu/home/leif/Sage/release/sage-4.7.2.alpha3-prerelease/sage-4.7.2.alpha3-prerelease.tar">prerelease of Sage-4.7.2.alpha3</a> dated Sept 19, 2012 md5sum: ad021855ae07ecdd1cdcc7b973c9cdba 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10903">#10903</a> update Singular 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10810">#10810</a> Singular doesn't build on ARM 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11769">#11769</a> Singular doesn't build on Ubuntu Oneiric 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10902">#10902</a> factorization of multivariate polynomials 

## Update the Singular interface to work with libpolys

**People:** Volker, Burcin, Oleksandr 

* There were many changes to libSingular as part of the refactoring effort. The Sage interface needs to be adapted to these. This should be a matter of renaming the functions that are called in Sage and adding the current ring as an argument (modulo bugs in libpolys). 
* create spkg for refactored Singular 
* search/replace calls to libSingular in the Sage library to get the interface to compile & link 

## Fix the building of spielwiese Singular (libpolys)

**People:** Volker, Oleksandr 

* parallel building `make -j` used to fail because of generated sources (e.g. `feOpt.inc`) 
* `make install` should install everything needed for `make distcheck` 
* tests run via `make check` should be able to find resources (e.g. gftables) - cleate symlink or set Singular environment variables? 

## Refactored Singular should pass it's test suite

**People:** Burcin, Oleksandr, Hans, Volker 

Bug hunt through Singular kernel code. An adventure no hacker can resist. 

* build refactored Singular: <a href="http://github.com/Singular2/singular2.github.com/wiki/New-TODOs">http://github.com/Singular2/singular2.github.com/wiki/New-TODOs</a> 
* run test suite with debug version of Singular which dumps stack traces on error. (kernel/cntrl.cc should be modified to define `DEBUG_STOP` instead of `INTERACTIVE`) 
* <a class="http" href="http://www.lmona.de:31111/">list of test results</a> (temporarily) 
* Monday morning: 595 failing tests 
* Tuesday morning: 543 failing tests 
* Wednesday: 486 failing tests 
* Thursday: 390 failing tests 

### Compiler warnings

**People:** 

There are lots of compiler warnings... 


### Plural/SCA

**People:** Oleksandr 

* Bug hunt at PLURAL/SCA kernel code: (left) std etc... 

### Try out some dynamic modules

**People:** Oleksandr 

* Try building & using dynamic modules 

### Blackbox objects

**People:** Oleksandr 

* Try building & using blackbox objects, e.g. coefficient domain as a wrapper for coeffs 

## Interface to Singular's modules

**People:** Hiep, Burcin, Simon 

* This shouldn't be so hard since libSingular uses the same type for polynomials and module elements 

## Review Simon's letterplace patches

**People:** Simon, Burcin, Alexander (offsite) 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7797">#7797</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11115">#11115</a> make cached methods faster - dependency of #7797 (Volker) 

## Plural interface

**People:** Burcin, Simon, Alexander (offsite) 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4539">#4539 plural wrapper</a> is rebased to <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11068">11068 implementation of one and two sided ideals of noncommutative rings</a>, so that one has left ideals and two-sided ideals of g-algebras. 
* The left or two-sided Gröbner bases can be used to compute normal forms (that has been missing before). 
* Pickling works (has been missing), the category test suites pass. 
* Since g-algebras are now unique parents (unless uniqueness is destroyed on purpose), `id(self)` is used as hash. 
* Doc tests pass (says Simon), but the last patch does not apply cleanly (says Alexander, but Simon can't confirm it). Apart from that, it is ready for review. 
* _To do_: Currently, quotients of g-algebras are implemented by the general framework of <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11068">#11068</a>. It should instead wrap what Singular offers, but that shall be on a different ticket. 

## Exponent overflow

**People:** Simon 

* Working on the Plural interface, we found that Sage does not raise an overflow error when it should. Example: With `P.<x,y>=QQ[]`, `y^2^30` returns a correct result; in `P.<x,y,z>=QQ[]`, an overflow occurs, but instead of raising an error, `y^2^30` returns zero. 
* It is fixed, combining the old test used in Sage and the test used in Singular. 

## Use libpolys for function field arithmetic

**People:** Burcin 

* libpolys has better function field arithmetic now, we should wrap that in Sage. 
* This is also relevant <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">#9054 create a class for basic function field arithmetic</a> 

## FLINT integration in Singular

**People:** Fredrik, MartinL, Christian 

* Add missing utility and conversion functions to FLINT 
* Use FLINT in Singular 
* Benchmark against NTL version 

## Beginner tickets

**People:** Hiep, Burcin to practice preparing and submitting patches, for people new to the Sage development process: 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11850">http://trac.sagemath.org/sage_trac/ticket/11850</a> choose the random elements of the ideals. 
* `.hilbert_series()`, `.hilbert_function()` methods of ideals <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11855">http://trac.sagemath.org/sage_trac/ticket/11855</a>. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11864">http://trac.sagemath.org/sage_trac/ticket/11864</a> add `.saturation()`, `.blow_up_ideal()` methods in the multivariate polynomial ideal class 

## Fast containers for objects and morphisms of a category

**People:** Simon 

* See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10667">#10667</a> Morphisms and Objects of Categories 

## Improve/Review citation library

**People**: Niels, Burcin, (and somebody else?) 

<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3317">#3317</a> <a class="https" href="https://bitbucket.org/niels_mfo/sage-citation">bitbucket</a> 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11851">#11851</a> <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11852">#11852</a> ~~split off pybtex package to a separate ticket (submit as an optional package first)~~ 
* Add more examples of citations 
* ~~add sage's citation~~ 
* Open a ticket for matplotlib not to include an extra version of pyparsing. 

## Fix reference counting of Singular rings

**People**: Volker, Burcin, Martin 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11339">#11339</a> 

## Review PolyBoRi 0.8.0 patch

**People**: Martin, Alexander (offsite) 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11575">#11575</a> 
Martin reviewed it mathematically. The patch was rebased to 4.7.2alpha3, the spkg got the improved sse2-flags detection from 0.8.1. (Final) tests are running currently. 


## Review linbox for modn dense matrices patch

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4260">#4260</a> 