

# Sage Days 23.5 Coding Sprint Projects

[[_TOC_]] 


## Fix Sage's wrapping of Singular's Brill-Noether

   * See <a href="/days23.5/projects/brillnoether">this page</a> for more details.  
   * (done, sort of) It seems there is still a problem with Singular. The Sage ticket is updated correspondingly, <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8997">Trac #8997</a>. 

## Python <--> Singular Linking Discussion

How: Dinner and beer. 

Have a technical discussion of linking Python and Singular and Sage. 

We tried to use the PSICO-approach to import sage into Singular. It failed (inifinite loop at integer.pyx), despite inidividual Cython modules can be loaded. Further investigations will follow.  


## Singular Parallel Build

People: Hans S. + A. Dreyer 

Goals:  

   1. Tell us which components of singular build in parallel via some testing.  
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9497">Trac #9497</a>: Fix the Singular spkg so it can take advantage of building in parallel. But fix Singular SPKG first (3-1-1-3)! 
We fixed this upstream (added dependencies to build system), Hans made anew release. The spkg was fixed by malb last night. 


## Doctest the Free Algebra Quotient code

People: Gabriel Pannwitz 

The file `SAGE_ROOT/devel/sage/sage/algebras/free_algebra_quotient.py` has no doctests. Get it to 100% coverage.   The point of this is that it is related to wrapping something like letterplace.  


## Letterplace

People: Martin Albrecht will review.  

Do a very basic wrapping of letterplace for Sage.  Use this to replace some of the lame old code in the `SAGE_ROOT/devel/sage/sage/algebras/` directory. See here: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7797">#7797</a> 


## error: out of memory

People: William Stein, Hans S.  

* (done, in that patches are up for everything) <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5313">Trac #5313</a>.  Patch singular so that when it runs out of memory the error message says "singular" in it.   Moreover, replace the exit(1) or whatever by something that can be trapped via _sig_on/_sig_off.   

## Relative number field arithmetic

People: Mohamed, Andrew, William Stein 

Goal:  

   1. (done) Explain how to compute inverses.   
   1. (done) Open a trac ticket about this: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9500">trac 9500</a> 
   1. (done) Post a <a href="/days23.5/projects/relative_number_fields">little experimental code that indicates how fast this could be</a>.  
   1. (done) Post a patch to the above ticket. 
* Arithmetic in relative numbers fields is sometimes very slow.  This could be done using multivariate polynomial ring quotients via libsingular, which would be extremely fast in some cases.  There is some cleverness that I do *not* know how to do for inverting elements -- hence it would be good to do this here with singular people around. 

## Delete a function related to multivariate polynomial factorization from Sage

People: William Stein 

* (done -- patch up) This is <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9498">trac 9498</a>.  There is a stupid function that William Stein wrote during bug days, which may as well be removed. 

## (Done) Gröbner bases in Sage: Optional parameters

People: Simon King, with a help from Martin and Hannes (more than minutes...) 

* (patch with positive review at <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/1396">#1396</a>) In Singular, one can use various options (redTail, e.g.) and also a degree bound (degBound) for Gröbner basis computations. Aim: Allow the same for libSingular.  As a courtesy, one can name the options both in Python style (deg_bound) and Singular style (degBound). A decorator ensures that all relevant methods work under default options unless explicitly requested by the user. Here are examples in Singular and libSingular: ```txt
sage: R.<x,y> = QQ[]
sage: I = R*[x^3+y^2,x^2*y+1]
sage: I.groebner_basis(prot=True, deg_bound=2)
std in (0),(x,y),(dp(2),C)
[4294967295:2]3ss
(S:1)-
product criterion:0 chain criterion:0
[x^3 + y^2, x^2*y + 1]
sage: I.groebner_basis()
[x^3 + y^2, x^2*y + 1, y^3 - x]
sage: Rlocal.<x,y,z> = PolynomialRing(QQ, order='ds')
sage: J = [x^7+y^7+z^6,x^6+y^8+z^7,x^7+y^5+z^8, x^2*y^3+y^2*z^3+x^3*z^2,x^3*y^2+y^3*z^2+x^2*z^3]*Rlocal
sage: J.groebner_basis(mult_bound=100)
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6 + x*y^4*z^5, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6 - x*y^4*z^4 - x^3*y*z^5]
sage: J.groebner_basis(algorithm='singular',mult_bound=100)
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6 + x*y^4*z^5, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6 - x*y^4*z^4 - x^3*y*z^5]
sage: J.groebner_basis(prot=True)
std in basering
[1048575:2]5(4)s(3)s6s7s8s(4)s(5)sH(13)9(3)sH(12)8(4)s(5).s.s9....sH(11)8.10
(S:10)-----------
product criterion:9 chain criterion:30
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6, y^4*z^3 - y^3*z^4 - x^2*z^5, x^3*y*z^4 - x^2*y^2*z^4 + x*y^3*z^4, x^3*z^5, x^2*y*z^5 + y^3*z^5, x*y^3*z^5]
sage: J.groebner_basis(algorithm='singular')
[x^3*y^2 + y^3*z^2 + x^2*z^3, x^2*y^3 + x^3*z^2 + y^2*z^3, y^5, x^6, x^4*z^2 - y^4*z^2 - x^2*y*z^3 + x*y^2*z^3, z^6, y^4*z^3 - y^3*z^4 - x^2*z^5, x^3*y*z^4 - x^2*y^2*z^4 + x*y^3*z^4, x^3*z^5, x^2*y*z^5 + y^3*z^5, x*y^3*z^5]
 
```

## extend polynomial rings mod 2^n to n > 30, and over ZZ

* People: Anne, Frank, Moritz 
Rings mod 2^n are limited to n <= 30, but we'd like to have n<=62 by using longs. This would be relevant for some crypto applications. 


## (Done) big exponents

* People: Martin Albrecht, Hans S.  
Provide an interface to use Singular monomials with big exponents (64-bit instead of 16-bit) 

Sage Trac ticket: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7795">Trac #7795</a> 


## Plural interface

* People: Burcin, Oleksandr Motsak, Michael Brickenstein, Simon King 
Revive <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4539">#4539</a> to provide a basic interface to Plural. This will involve writing new parent and element classes for plural at least. 

This works using the libsingular interface, without inheriting from the commutative polynomial classes now: 
```txt
sage: A.<x,y,z>=FreeAlgebra(QQ,3)
sage: H=A.g_algebra({y*x:x*y-z, z*x:x*z+2*x, z*y:y*z-2*y})
sage: H.inject_variables()
Defining x, y, z
sage: z*x
x*z + 2*x
sage: z*y
y*z - 2*y
sage: I = H.ideal([y^2, x^2, z^2-H.one_element()],coerce=False)
sage: I._groebner_basis_libsingular()
[z^2 - 1, y*z - y, x*z + x, y^2, 2*x*y - z - 1, x^2]
```
This meant adding a lot of instances of this in the interface: 
```txt
            if PY_TYPE_CHECK(a, MPolynomialIdeal) or \
                    PY_TYPE_CHECK(a, NCPolynomialIdeal):
                ring2 = a.ring()
            elif PY_TYPE_CHECK(a, MPolynomial_libsingular) or \
                    PY_TYPE_CHECK(a, NCPolynomial_plural):
                ring2 = a.parent()
            elif PY_TYPE_CHECK(a, MPolynomialRing_libsingular) or \
                    PY_TYPE_CHECK(a, NCPolynomialRing_plural):
                ring2 = a
```
Michael volunteered to fix the rest of these. We also need coercion to work: 
```txt
sage: z^2-1
---------------------------------------------------------------------------
NotImplementedError                       Traceback (most recent call last)
...
NotImplementedError: 
Also, please make sure you have implemented has_coerce_map_from_impl or has_coerce_map_from_c_impl (or better _an_element_c_impl or _an_element_impl if possible) for Noncommutative Multivariate Polynomial Ring in x, y, z over Rational Field

sage: z^2-H.one_element()
z^2 - 1
```

## Multivariate GCD, factorization, etc. benchmarks

* People: Martin Lee, Burcin, Markus, Michael Brickenstein 
Take a look at the new code in GIAC, <a class="http" href="http://www-fourier.ujf-grenoble.fr/~parisse/giac/benchmarks/benchmarks.html">benchmarks posted here</a>. Compare to improvements in Singular-Factory. <a href="/MultivariateGCDBenchmarks">See here</a> for more gcd benchmarks and scripts. 

Polynomials in Q[x,y,z]: 

1. ((1+x+y+z)<sup>20</sup>+1)*((1+x+y+z)<sup>20</sup>+2) 
1. ((1+x+y+z)<sup>30</sup>+1)*((1+x+y+z)<sup>30</sup>+2) 
1. (x+y+z<sup>2</sup>)<sup>25</sup>-(y-x+3*z-1+x<sup>2</sup>)<sup>25</sup> 
1. (x+y+z)<sup>30</sup>-1 
1. (2+x-y+z)<sup>20</sup>-2<sup>20</sup> 
1. x<sup>200</sup>-1 
1. x<sup>50</sup>-2<sup>50</sup> 
1. x<sup>40</sup>-(y+z)<sup>40</sup> 
1. (x+y)<sup>10</sup>-(y-z)<sup>10</sup> 
1. (1-3*x-4*y+3*z-y*z<sup>2</sup>-3*y*z<sup>3</sup>-y<sup>2</sup>*z-3*y<sup>2</sup>*z<sup>2</sup>+3*y<sup>2</sup>*z<sup>3</sup>-y<sup>3</sup>*z-2*y<sup>3</sup>*z<sup>2</sup>-3*y<sup>3</sup>*z<sup>3</sup>+3*x*z-3*x*z<sup>2</sup>+2*x*z<sup>3</sup>+x*y-3*x*y<sup>3</sup>+3*x<sup>2</sup>*z-4*x<sup>2</sup>*z<sup>2</sup>-x<sup>2</sup>*z<sup>3</sup>-x<sup>2</sup>*y+3*x<sup>2</sup>*y<sup>2</sup>-5*x<sup>2</sup>*y<sup>3</sup>-x<sup>3</sup>*z-5*x<sup>3</sup>*z<sup>2</sup>-2*x<sup>3</sup>*z<sup>3</sup>+2*x<sup>3</sup>*y+4*x<sup>3</sup>*y<sup>3</sup>-x*y<sup>2</sup>+3*x*y<sup>2</sup>*z+4*x<sup>3</sup>*y<sup>2</sup>+3*y*z-5*z<sup>3</sup>-4*y<sup>2</sup>+2*y<sup>3</sup>+2*x<sup>2</sup>*y<sup>2</sup>*z<sup>2</sup>+3*x*y<sup>3</sup>*z<sup>2</sup>+3*x*y<sup>3</sup>*z+4*x*y*z<sup>2</sup>+3*x*y<sup>3</sup>*z<sup>3</sup>-5*x*y<sup>2</sup>*z<sup>2</sup>+3*x*y*z-3*x<sup>3</sup>*y<sup>3</sup>*z-5*x<sup>2</sup>*y<sup>3</sup>*z<sup>3</sup>-5*x*y<sup>2</sup>*z<sup>3</sup>-5*x<sup>2</sup>*y*z<sup>2</sup>+3*x<sup>2</sup>*y<sup>3</sup>*z-x<sup>3</sup>*y<sup>2</sup>*z<sup>2</sup>-x<sup>3</sup>*y<sup>2</sup>*z-x<sup>3</sup>*y<sup>2</sup>*z<sup>3</sup>-4*x<sup>2</sup>*y<sup>2</sup>*z<sup>3</sup>+2*x<sup>2</sup>*y*z-4*x<sup>2</sup>*y*z<sup>3</sup>+x<sup>2</sup>*y<sup>3</sup>*z<sup>2</sup>-x<sup>2</sup>*y<sup>2</sup>*z-5*x<sup>3</sup>*y*z<sup>2</sup>-x<sup>3</sup>*y*z<sup>3</sup>-x<sup>3</sup>*y*z-5*x*y*z<sup>3</sup>-2*x<sup>2</sup>+3*x<sup>3</sup>)<sup>4</sup>-1 
1. (360-201*x+389*y+258*z-200*y*z+491*y*z<sup>2</sup>+493*y<sup>2</sup>*z+454*y<sup>2</sup>*z<sup>2</sup>-401*x*z+49*x*z<sup>2</sup>-304*x*y-484*x*y<sup>2</sup>+262*x<sup>2</sup>*z-339*x<sup>2</sup>*z<sup>2</sup>-227*x<sup>2</sup>*y-330*x<sup>2</sup>*y<sup>2</sup>+250*z<sup>2</sup>-495*y<sup>2</sup>-218*x*y*z-476*x<sup>2</sup>*y<sup>2</sup>*z<sup>2</sup>+243*x*y<sup>2</sup>*z+94*x<sup>2</sup>*y<sup>2</sup>*z+240*x*y<sup>2</sup>*z<sup>2</sup>-149*x*y*z<sup>2</sup>-321*x<sup>2</sup>*y*z-189*x<sup>2</sup>*y*z<sup>2</sup>+357*x<sup>2</sup>)<sup>4</sup>-1 
1. x<sup>800</sup>-1 
1. (101-139*x-24*y+104*z-103*y*z-451*y*z<sup>2</sup>-326*y<sup>2</sup>*z-493*y<sup>2</sup>*z<sup>2</sup>-327*x*z+439*x*z<sup>2</sup>-108*x*y+155*x*y<sup>2</sup>+121*x<sup>2</sup>*z-462*x<sup>2</sup>*z<sup>2</sup>+103*x<sup>2</sup>*y+217*x<sup>2</sup>*y<sup>2</sup>+327*z<sup>2</sup>-122*y<sup>2</sup>+344*x*y*z-262*x<sup>2</sup>*y<sup>2</sup>*z<sup>2</sup>+396*x*y<sup>2</sup>*z+8*x<sup>2</sup>*y<sup>2</sup>*z-47*x*y<sup>2</sup>*z<sup>2</sup>-314*x*y*z<sup>2</sup>+82*x<sup>2</sup>*y*z-50*x<sup>2</sup>*y*z<sup>2</sup>-424*x<sup>2</sup>)<sup>6</sup>-1 
1. (14878-22176*x+8386*y+41700*z-38290*y*z+44119*y*z<sup>2</sup>-37070*y<sup>2</sup>*z+45024*y<sup>2</sup>*z<sup>2</sup>+47986*x*z-28140*x*z<sup>2</sup>+33417*x*y-31087*x*y<sup>2</sup>+45572*x<sup>2</sup>*z-46632*x<sup>2</sup>*z<sup>2</sup>-77*x<sup>2</sup>*y-15943*x<sup>2</sup>*y<sup>2</sup>-21957*z<sup>2</sup>-14839*y<sup>2</sup>-41351*x*y*z-35985*x<sup>2</sup>*y<sup>2</sup>*z<sup>2</sup>+43811*x*y<sup>2</sup>*z-35522*x<sup>2</sup>*y<sup>2</sup>*z+23454*x*y<sup>2</sup>*z<sup>2</sup>-33462*x*y*z<sup>2</sup>-32836*x<sup>2</sup>*y*z+9538*x<sup>2</sup>*y*z<sup>2</sup>+31480*x<sup>2</sup>)<sup>6</sup>-1 
1. (-4212647-3198520*x+2950231*y -3315421*z +3701831*y*z +2351230*y*z<sup>2</sup> +108373*y<sup>2</sup>*z +1812831*y<sup>2</sup>*z<sup>2</sup>+379586*x*z-3385311*x*z<sup>2</sup>+2453252*x*y+3838359*x*y<sup>2</sup>+2688541*x<sup>2</sup>*z+1838684*x<sup>2</sup>*z<sup>2</sup>-4852824*x<sup>2</sup>*y-4824055*x<sup>2</sup>*y<sup>2</sup>+90165*z<sup>2</sup>+651277*y<sup>2</sup>+2363714*x*y*z-4782981*x<sup>2</sup>*y<sup>2</sup>*z<sup>2</sup>-4578460*x*y<sup>2</sup>*z+4757744*x<sup>2</sup>*y<sup>2</sup>*z+681595*x*y<sup>2</sup>*z<sup>2</sup>+398600*x*y*z<sup>2</sup>+1864322*x<sup>2</sup>*y*z+1600103*x<sup>2</sup>*y*z<sup>2</sup>+2488109*x<sup>2</sup>)<sup>4</sup>-1 
1. ((x+y+z)<sup>10</sup> - 4<sup>10</sup>)<sup>5</sup>-3<sup>5</sup> 
1. ((x+y+z)<sup>5</sup> - 2<sup>5</sup>)<sup>8</sup>-3<sup>8</sup> 
Bechmarks (someone check these, its late...). 

GIAC and Singular on AMD opeteron 2800MHZ,  Magma on AMD opeteron 2300MHZ (due to licence) 

time in s (using timer in singular, which is probably not very excact) 
Polynomial | GIAC 9.0.2 | Singular 3.1.1.3 | Magma
 1  |  1  |  15  |  9 
 2  |  13  |  111  |  164 
 3  |  1  |  4  |  3 
 4  |  0  |  1  |  1 
 5  |  0  |  0  |  0 
 6  |  0  |  0  |  0 
 7  |  0  |  integer overflow  |  0 
 8  |  0  |  0  |  0 
 9  |  0  |  0  |  0 
 10  |  0  |  0  |  0 
 11  |  0  |  1  |  0 
 12  |  0  |  0  |  0 
 13  |  1  |  1  |  0 
 14  |  1  |  1  |  0 
 15  |  0  |  1  |  0 
 16  |  0  |  1  |  0 
 17  |  1  |  1  |  1 
 18  |  0  |  1  |  1 


## Implement multivariate factorization over finite fields

* People: Burcin, William Stein, Martin Albrecht See <a href="/days23.5/projects/factor">this page</a>. 

## Fix bug(s) in Singular needed for updating the spkg

* People: Frank 
   * Some reduction over the integers goes wrong 

## (Done) Error handling in Libsingular

* People: Martin Albrecht, Hans S. 
   * Goal: If you have a singular library function and it goes wrong, then afterwards you can still use singular library functions.  Patch up at Sage ticket: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9499">#9499</a> (positive review) 

## (Done) Catch Singular error messages

People: Martin Albrecht 

<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9506">#9506</a> 


# other stuff


## @fork, @parallel decorator

* People: Robert Miller, William Stein Ticket: See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9501">trac 9501</a>. 
Simon King mentioned that sometimes his code crashes/leaks/etc.  So make it so one can do: 
```txt
@fork
def f(x,y,z,...):
    ...
```
and then f gets computed in a blocking forked process, and the result is returned via pickling. This is 100% to thwart mem leaks, segfaults, and guaranteed timeout possibility.   This could be basically just a light wrapper around @parallel(1).  Also, make a global flag to turn this off, so @fork does nothing.  


## Profiling Cython code

* People: Robert Miller An example of using C library function `clock()` to count clock ticks... <a href="days23.5/projects/timing_binary_codes.patch">timing_binary_codes.patch</a> 

```txt
sage: gc = sage.coding.code_constructions.BinaryGolayCode()
sage: M = gc.extended_code().gen_mat()
sage: from sage.groups.perm_gps.partn_ref.refinement_binary import LinearBinaryCodeStruct
sage: from sage.coding.binary_code import BinaryCodeClassifier, BinaryCode
sage: BC = BinaryCodeClassifier()
sage: B = BinaryCode(M)
sage: BN = LinearBinaryCodeStruct(M)
sage: BN.run()
wd deg tot clock ticks 683242
     563425 calls
     1.21265829525 per call
cl deg tot clock ticks 281302
     144294 calls
     1.94950586996 per call
sage: x = BC._aut_gp_and_can_label(B)
wd deg tot clock ticks 659583
     746525 calls
     0.883537724792 per call
cl deg tot clock ticks 183800
     193324 calls
     0.950735552751 per call
```