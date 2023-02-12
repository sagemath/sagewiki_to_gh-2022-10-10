
[[_TOC_]] 


## Descent on Cyclic Covers of the Projective Line

* Port 200 lines of Magma code to Sage. 
* People: Michael Mourao, Maite Aranes 

## Finite Fields

Deal with David Roe's latest patch bomb. 

* People: John Cremona 
* Tickets: #7883, #8333, #8334, #8335 

## sage-4.5

* Robert Miller 

## ABC at home

* review code 
* model runtime 
* People: Bart de Smit, Willem Jan Palenstijn, Jeroen Demeyer, Mak Trifkovic, Thijs van Dijk, Alyssa Milburn, Dan Bernstein, Sebastian Pancratz 

## Models for elliptic curves

* genus 1 --> Weierstrass 
* People: Dan Bernstein, Tanja Lange, Niels Duif, Johannes van der Horst, Michiel Kosters, Marco Streng, Vince Bush, Julio Brau, Michael Mourao, John Cremona 
* Tom Fisher's Magma code for invariants and covariants of plane cubics <a href="days23/CodingProjects/covariants.m">covariants.m</a>, and for minimization and reduction of genus one models <a href="days23/CodingProjects/g1minimisation-2008.m">g1minimisation-2008.m</a> <a href="days23/CodingProjects/g1reduction-2008.m">g1reduction-2008.m</a> <a href="days23/CodingProjects/minred-demo1.m">minred-demo1.m</a> <a href="days23/CodingProjects/minred-demo2.m">minred-demo2.m</a> 
* Ian Connell's lecture notes contain all the formulas needed to convert plane cubics and hyperelliptic quartics:  see <a href="http://www.math.mcgill.ca/connell/public/ECH1/">http://www.math.mcgill.ca/connell/public/ECH1/</a> (first several pages of Chapter 1 (c1.ps)). 

## Function Fields

The main goal of this project is to get the basic infrastructure for function fields into Sage.   If time permits, we will also implement Hess's algorithms.  See <a href="/daysff/curves">Hess's papers and talks</a>. 

People: William Stein, Maarten Derickx, Peter Bruin, Jan Tuitman, Max Flander, Tanja Lange, Michiel Kosters, Christiane Peters, Marco Streng  

* Trac 9054: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9054">Create a class for basic function_field arithmetic for Sage</a> 
* Trac 9069: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9069">Weak Popov Form (reduction algorithm)</a> 
* Trac 9094: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9094">is_square and sqrt for polynomials and fraction fields</a> 
* Trac 9095: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9095">Heights of points on elliptic curves over function fields</a> 
Make sure to see <a href="/daysff/curves">this page for more links</a>. 


## Hyperbolic geometry

* plotting (arc of circle, filling domain bounded with arc of circles, ...) 
* actions (using the coercion model to act on Hyperbolic Plane element by matrices) 
* fundamental domains (port H. Verrill program and implement R. Kulkarni method) 
* People: Vincent Delecroix, Maite Aranes, Thijs van Dijk 
![cool hyperbolic picture 1](http://iml.univ-mrs.fr/~delecroi/hyp-pic1.png) ![cool hyperbolic picture 2](http://iml.univ-mrs.fr/~delecroi/hyp-pic2.png) 

Related tickets 

* Trac 3313: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/3313">Old ticket for lifting of SL_m(Z/nZ) to SL_m(Z)</a> 
* Trac 7424: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/7424">Inconsistency of SL and PSL</a> 
* Trac 9076: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9076">plot arc of circle</a> 
Created tickets: 

* Trac 9437: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9437">detected bug for special linear group over finite rings</a> 
* Trac 9439: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9439">hyperbolic geometry</a> 
Todo: 

   * create a class for fundamental domains and make pairings appear on the boundary 
   * work on general subgroup of the modular group 

## Ticket #4000 on rational polynomials... QQ[x] via FLINT

* People: Sebastian Pancratz, Bill Hart, Jan Tuitman 

## Sage on GPU's

* People: Dan Bernstein, Thijs van Dijk, Andy Novocin 

## ZZ[x] factoring in FLINT, plus LLL

* People: Andy Novocin, Wieb Bosma, Johannes van der Horst, Bill Hart, Max Flander 
===Swinnerton-Dyer Polynomials=== 

See <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9492">trac 9492</a>. 

* Some code: 

```txt
sage: a = sqrt(2)+sqrt(3)+sqrt(5)+sqrt(7)+sqrt(11)
sage: f = algebraic_dependency(a.numerical_approx(10000),32)
sage: b = a.numerical_approx(100000)
sage: time f(b)
```
* Code by Jeroen Demeyer to compute Swinnerton-Dyer polynomials very quickly using p-adics: 

```txt
# Lift a padic `x` to ZZ, but centered around zero.
def centerlift(x):
    modulus = x.parent().prime_pow(x.precision_absolute())
    z = ZZ(x);
    if (2*z > modulus):
        z -= modulus
    return z

# L = list of numbers you want to take the square root of.
# bound = bound on the absolute value of the coefficients of
# the resulting polynomial.
def swinnerton_dyer(L, bound):
    for p in Primes():
        if all([gcd(p,s) == 1 and is_square(Mod(s,p)) for s in L]):
            break
    prec = ceil(log(bound)/log(p))
    print "Using p =", p
    print "Precision:", p, "^", prec
    K = Qp(p, prec, print_mode="terse", print_pos=False)
    
    sqrts = [sqrt(K(s),extend=False) for s in L]
    
    n = len(L)
    padic_roots = []
    for k in range(0, 2^n):
        binary = ZZ(k).digits(base=2,padto=n)
        root = sum([sqrts[i]*(binary[i]*2-1) for i in range(0,n)])
        padic_roots.append(root)
    t = polygen(K)
    pol_padic = prod([t - r for r in padic_roots])
    coeffs_ZZ = [centerlift(c) for c in pol_padic.list()]
    max_coeff = max([abs(c) for c in coeffs_ZZ])
    print "Largest coefficient:", p, "^", ceil(log(max_coeff)/log(p))
    return PolynomialRing(ZZ, names='t')(coeffs_ZZ)

# Example:
time swinnerton_dyer([2,3,5,7,11,13,17,19,23,29], 2^4000)   # bound is heuristic
```

## MPIR projects

* fmpz in Sage 
* a very concrete C project 
* People: Frederik Johansson, Bill Hart 

## Ticket #4260 - Sage + Linbox

* Polish linbox-sage interface (in <a href="/LinBox">LinBox</a>), and release 1.1.7rc1 
* Update Sage interface 
* Rewrite of sage-matrix-modn-dense: continued the work initiated at SD16 with Burcin 
* Mod 2 reduction bug (fixed!): <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6904">trac 9604</a>. 
* People: Andy Novocin, Clement Pernet, (Burcin Erocal, remotely) 

## Sage Notebook in the classroom

* People: Bart de Smit, William Stein, Eric van der Velden, Willem Jan Palenstijn, Alyssa Milburn 

### Specific Projects

   * Greatly improve <a class="http" href="http://nb.sagemath.org/">the Sage Notebook website</a> 
         * Improved information on the site: 
                  * how to setup a server 
                           * standalone server 
                           * with sage 
                  * how to develop the sage notebook: give a complete example of how to change something 
         * Make site much prettier -- I think it is ugly. 
   * Database 
         * Users and basic configuration -- get the startup time of sagenb.org down from 20 minutes to 1 second by replacing users.pickle by a sqlite database, and rewriting the notebook server to use this database instead of making a list of *all* users (and other data about them) in memory. 
         * worksheets -- see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/8757">trac 8757</a>;  This might also totally deal with the above "users and basic configuration" info.  
   * Worksheet labels 
         * linking between worksheets: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5042">trac 5042</a> is relevant 
         * support library worksheets, so you can type, e.g., `load "library.sws"` 

## General framework for the factor(n) command

* mpfq is LGPL! 
* special support for $p^n \pm 1$. 
* add functionality to factor() and to class Factorization 
* implement addprimes() in the PARI interface (already works for GP interface) 
* People: Hendrik Lenstra, Dan Bernstein, Jeroen Demeyer, Tanja Lange, Christiane Peters, Peng Tian, Julio Brau, Mak Trifkovic 
* <a class="http" href="http://ttic.uchicago.edu/~kalai/papers/old_papers/factorcryptology.pdf">Kalai's paper</a> 
* Something actually done: Trac #9450  -- factoring elements of number fields 

## Solving Conics

* People: Marco Streng, Mak Trifkovic, Peter Bruin, John Cremona 
* Write a Conic class using Denis Simon's pari code, possibly mwrank, finding points over number fields, other fields? 
* <a href="http://wiki.sagemath.org/days23/conics">http://wiki.sagemath.org/days23/conics</a> 

## Sums of Squares

* People: Japp Spies, Dung Duong, Peter Bruin, Michiel Kosters 

## Porting ECHIDNA code from MAGMA

* People: Lloyd Kilford, William Stein 
* Code: <a href="http://sage.math.washington.edu/home/ljpk/atkin_lehner_decomposition_dimensions.sage">http://sage.math.washington.edu/home/ljpk/atkin_lehner_decomposition_dimensions.sage</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9455">trac ticket number 9455</a> 