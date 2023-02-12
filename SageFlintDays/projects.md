

# Projects

* <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=closed&amp;status=positive_review&amp;order=priority&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;keywords=~sd35">Here</a> is an up-to-date list of finished tickets that were worked on at this Sage Days workshop and Sage Days 35.5 (I don't know how to search for sd35 only). 
* <a class="http" href="http://trac.sagemath.org/sage_trac/query?status=needs_info&amp;status=needs_review&amp;status=needs_work&amp;status=new&amp;order=priority&amp;col=id&amp;col=summary&amp;col=status&amp;col=type&amp;col=priority&amp;col=milestone&amp;col=component&amp;keywords=~sd35">Here</a> is an up-to-date list of tickets that were worked on at this Sage Days workshop and that are still being worked on (and those for Sage Days 35.5, see above). 
[[_TOC_]] 


## Put flint2 into Sage

* People: Bill H., Mike H., Fredrik J., Andy N., Sebastian P. 
* Building flint2 in Sage 
      1. Update MPFR to 3.1.0 - <a href="http://trac.sagemath.org/sage_trac/ticket/11666">http://trac.sagemath.org/sage_trac/ticket/11666</a> 
               * <a href="http://sage.math.washington.edu/mpfr-3.1.0.spkg">http://sage.math.washington.edu/mpfr-3.1.0.spkg</a> (Mike Hansen) 
      1. Update MPFI to 1.5.0 - <a href="http://trac.sagemath.org/sage_trac/ticket/12171">http://trac.sagemath.org/sage_trac/ticket/12171</a> 
               * <a href="http://sage.math.washington.edu/home/mhansen/mpfi-1.5.0.spkg">http://sage.math.washington.edu/home/mhansen/mpfi-1.5.0.spkg</a> (Mike Hansen) 
      1. Reinstall <a href="http://sagemath.org/packages/standard/libfplll-3.0.12.p1.spkg">http://sagemath.org/packages/standard/libfplll-3.0.12.p1.spkg</a> 
      1. Install flint2 spkg (beware, this will break Sage) 
               * <a href="http://sage.math.washington.edu/flint-2.3.spkg">http://sage.math.washington.edu/flint-2.3.spkg</a> 
      1. touch SAGE_ROOT/devel/sage/sage/combinat/partitions.* 
      1. Run "sage -b" 

## Switch some of the /eclib/mwrank code to use flint2, and upgrade the eclib spkg in Sage

* People: John C., David H., Martin R., Maarten D., Flint developers 
* Sage has a rather old version of eclib in it.  It should be easy to upgrade the spkg.  DONE:  <a href="http://trac.sagemath.org/sage_trac/ticket/10993">http://trac.sagemath.org/sage_trac/ticket/10993</a> is ready for review  -- in fact has just received a positive review! 

## Help the Singular developers make better use of flint2

* People: Martin L., Simon K., Burcin E., Flint developers 
Updated my (mlee) experimental interface from Flint2 to Singular, to make use of the new polynomial factorization over Z/p. This sped up some of Singular's tests by a factor of 2 (compared to the regular Singular which uses NTL). However there are still some issues related to maybe mpir and/or the lack of a half gcd in Flint2 which need to be investaged. 

You can have a look at the Singular FLINT interface here: <a href="https://github.com/mmklee/Sources/wiki/Singular-With-Flint2">https://github.com/mmklee/Sources/wiki/Singular-With-Flint2</a>. And hopefully this will be extended soon (use FLINT multiplication, division etc. during multivariate polynomial factorization)  

In the near future it would be great if FLINT supported: 

* asymptotically fast GCD for Z[x] 
* build system improvements 
   * version number in header file (to help auto* decide if we have the right version) 
To replace NTL completely, we need: 

* factorization over Z[x] 
* factorization over GF(p^k)[x] 
* LLL 

## --(Linear algebra mod p, for log_2 p = 64)--

* People: Martin A. 
Flint2 has an implementation for asymptotically fast linear algebra mod p for p up to 2^64. I (malb) am curious whether it can be improved using ideas inspired by M4RIE, i.e., replace multiplications by additions using pre-computation tables. Whether this is beneficial will depend on how much slower multiplication is than additions. 

**Update (2011-12-15 10:57):** It seems the difference between scalar multiplication and addition is too small for these tricks to make sense.  

**Update (2011-12-20 11:10):** Okay, project cancelled, none of the tricks I could think of make sense. 


```c
#!c 
#include <flint.h>
#include <nmod_mat.h>
#include <profiler.h>
#include <stdio.h>

#include "cpucycles-20060326/cpucycles.h"

int main(int argc, char *argv[]) {
  nmod_mat_t A,B,C;
  flint_rand_t state;
  unsigned long long cc0 = 0, cc1 = 0;
  unsigned long i,j;

  unsigned long long p = 4294967311ULL;

  flint_randinit(state);

  nmod_mat_init(A, 2000, 2000, p);
  nmod_mat_init(C, 2000, 2000, p);
  nmod_mat_randfull(A, state);

  cc0 = cpucycles();
  nmod_mat_scalar_mul(C, A, 14234);
  cc0 = cpucycles() - cc0;
  printf("scalar multiplication: %llu\n",cc0);

  cc1 = cpucycles();
  for (i = 0; i < A->r; i++) {
    for (j = 0; j < A->c; j++) {
      C->rows[i][j] =  A->rows[i][j] + A->rows[i][j];
    }
  }
  cc1 = cpucycles() - cc1;
  printf("addition: %llu\n",cc1);

  printf("ratio: %lf\n",((double)cc0)/(double)cc1);

  nmod_mat_clear(A);
  nmod_mat_clear(C);
  flint_randclear(state);
  return 0;
}
```
Gives a ratio of about 4.5. But then, some of it is due to load/store times, so it might still make sense to try. 


## Linear algebra mod p^n, for log_2 p small-ish

* People: Martin A., Simon K., Johan B., Burcin E. 
Linear algebra over GF(p<sup>k</sup>) can be reduced to linear algebra over GF(p) and for GF(2<sup>k</sup>) the performance is very nice. Hence, it would be a good project to develop some somewhat generic infrastructure for dense matrices over GF(p^k), or even *any* extension field? The natural place to put this would be <a href="/LinBox">LinBox</a> but perhaps we can start stand-alone and then integrate it with <a href="/LinBox">LinBox</a> if <a href="/LinBox">LinBox</a> is too scary to start with. Some references (concerning prime slicing) are given at trac ticket <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12177">#12177</a> 

* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12177">#12177</a> contains an experimental patch implementing templated matrix classes with the polynomial with matrix coefficients representation. The patch also implements naive and toom multiplication of matrices over GF(p^k) using FFLAS. 
Some timings: 


```txt
p = 17, n = 2000

k  magma        naive   toom
2    2.620      4.51     4.39
3   17.900      10.25    7.32
4   54.320      19.35   10.11
5   33.480      28.80   13.07
6   50.120      44.75   15.93
7   46.860      56.35   19.12
8   71.590      81.65   22.04
9   79.580

- magma timings are on a different machine with similar performance
```

## BKZ 2.0

* People: Martin A., Andy N. 
At AsiaCrypt 2011 Chen and Nguyen <a class="http" href="http://www.springerlink.com/content/m036804m1m538722/">presented</a> their new BKZ implementation which is much much more efficient than that in NTL. As far as I understand, the main improvements are due to "extreme pruning" as presented in a <a class="http" href="http://www.springerlink.com/content/x3l7g80454x11116/">paper</a> at EuroCrypt 2010 and perhaps careful parameter choice. As far as I understand, they do not plan to make their code available. I don't know how much work it would be, but perhaps it would be a nice idea to patch NTL's BKZ to include extreme pruning and/or to port it to Flint2? 


## Improve polynomial factoring mod p in flint2

* People: Fredrik J., Andy N., David H. 
The Cantor-Zassenhaus implementation in the flint2 nmod_poly module could be optimized: 

   * Make exponentiation faster by precomputing a Newton inverse of the modulus 
   * Use sliding window exponentiation 
   * Use the von zur Gathen / Shoup algorithm (adapt the fast power series composition code for modular composition) 

## Modular forms code in Sage

* People: David L., John C., Jan V., Frithjof, Johan B., Maarten D., Martin R., Simon K. 
* review patches 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/5048">#5048</a>: Johan B. has done this one. (reviewed positivly) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11601">#11601</a>: depends on #5048; now rebased; Johan working on this. Done. (reviewed positively) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10546">#10546</a>: depends on #11601; Jan V to take a look (reviewed positively) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12043">#12043</a>: DL to work on this (needs work) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10658">#10658</a>: Martin R and Frithjof will have a look at this (reviewed positively) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12124">#12124</a>: Martin R and Frithjof will have a look at this (reviewed positively) 
* Start working towards putting Edixhoven's algorithm into Sage.  The meta-ticket for this is <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12132">#12132</a>. 
         * Implement the upper half plane: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9439">#9439</a> 
         * Add a LLL for matrices over QQ and RR: <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12051">#12501</a>. Andy Novocin proposed some other methods to use LLL to handle Johan's problem.  

## Open MP and FLINT

* People: David H., Fredrik J., Bogdan B., Julian R.,  

## Miscellaneous Sage Algebra and Number Theory patches

* People: Francis C., Monique v B., Florian B., Sam S., Michiel K, Bogdan B., Colton, Jan, Marco S., Paul Z., Johan B., Daniel B. 
* Patches with positive review or closed tickets: 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11235">#11235</a> Make the ipython edit magic command edit the right file and show both files when doing "??" 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11319">#11319</a> Cannot create homomorphism from prime residue field to finite field 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11417">#11417</a> binomial of polynomial is not polynomial 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11673">#11673</a> is_unit not properly implemented for algebraic integers 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11838">#11838</a> Multivariate factorization over non-prime finite fields hangs 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12156">#12156</a> Pretty print <a href="/LatexExpr">LatexExpr</a> directly 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12176">#12176</a> Compute Minkowski bound for relative number fields 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12182">#12182</a> Calculate the trace dual of an order in a number field 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12183">#12183</a> Absolute and relative norm functions for number field elements 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12185">#12185</a> Bug in norm for orders of relative number fields 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12191">#12191</a> is_squarefree for integer polynomials 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12196">#12196</a> Improve latex for quadratic fields 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12210">#12210</a> GF(p) constructor should check primality of p only once 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12218">#12218</a> Content of general polynomial 
* Patches needing review: 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11930">#11930</a> Disallow non-smooth hyperelliptic curves, and let hyperelliptic curves know they are not singular (needs review!) 
* Patches needing work or info:    
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/4283">#4283</a> A Speed-up Patch for NTL's ZZXFactoring.c (needs work) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12179">#12179</a> Binomial of integer (mod n) returns integer (needs work) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12186">#12186</a> Faster norm calculations (needs work). 

## Simon and ComputeL GP scripts

* People: John C., Martin R. 
* Revive work of March Sage Days: see <a href="http://trac.sagemath.org/sage_trac/ticket/11005">http://trac.sagemath.org/sage_trac/ticket/11005</a> 

## Elliptic curve isogenies

* People: Kimi T., John C., Fran&ccedil;ois Morain., Monique v B., &Ouml;zge &Ccedil;., Marco S. 
* Sage has a fast implementation of l-isogenies for l=2,3,5,7,13 (for which X_0(l) has genus zero). Kimi has a similarly fast algorithm for those l for which X_0(l) is hyperelliptic (l up to 71), implemented in Sage, which need to be made into a patch for Sage. 

## Mestre's algorithm for constructing hyperelliptic curves from their invariants

* People: Florian B., Marco S., Lassina D. 
* Trac tickets: 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/6341">#6341</a> (needs work) contains Florian's code for 
                  * Mestre's algorithm 
                  * The covariant z_0 
                  * SL2(ZZ)-reduction 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12199">#12199</a> (new) case of curves with automorphisms 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12200">#12200</a> (new) case of characteristic two (and three, and five) 
         * <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12204">#12204</a> (needs work, depends on #6341) reducing the defining polynomial of hyperelliptic curves 
         * no ticket yet: no code yet for covariant z, reference for the invariant: <a class="http" href="http://www.warwick.ac.uk/~masgaj/papers/redp1.pdf">http://www.warwick.ac.uk/~masgaj/papers/redp1.pdf</a> 
         * no ticket yet: SL2(number field)-reduction 
                  * case of real quadratic fields of class number one: bad code that works surprisingly well (Marco, not on trac), to be finished later 

## Tate's Algorithm over function fields

* People: Frithjof S, John C., Julian R. 
There is a Magma implementation based on John's number field implementation <a class="http" href="http://www.maths.nottingham.ac.uk/personal/cw/algorithms.html">here</a>. 


## Fix some memory leak that was found using elliptic curves

* People: Simon K., Jean-Pierre F., Paul Z. 
The solution is to use weak references for caching homsets. Little problem: Up to now, it was possible to have category objects that are no instances of <a href="/CategoryObject">CategoryObject</a> and thus do not support weak references. But people seem to agree that this should be strongly deprecated. **<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/11521">#11521</a> needs review!** 

The topic is also related with <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/715">#715</a>, which proposes to use weak references for the coerce map cache. The problem is that the cache uses a special hand-made dictionary (for efficiency), and so we have no simple drop-in replacement such as `WeakKeyDictionary`. 


## Implement finite algebras

* People: Johan B., Michiel K. 
The trac ticket for this is <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12141">12141</a>. 


## Things related to PARI/GP

* People: Jeroen D. 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12203">#12203</a>: Implement is_<a href="/PariGpElement">PariGpElement</a> 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12158">#12158</a>: Segfault in PARI's err_init() during pari_init_opts(): **closed (fixed)** 
* <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/9948">#9948</a>: Conversion between p-adics and PARI/GP 