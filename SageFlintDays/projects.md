= Projects =

Please feel free to add more

<<TableOfContents>>


== Put flint2 into Sage ==

 * People: Bill H., Mike H., Fredrik J., Andy N., Sebastian P.

 * Building flint2 in Sage
   1. Update MPFR to 3.1.0 - http://trac.sagemath.org/sage_trac/ticket/11666
      http://sage.math.washington.edu/mpfr-3.1.0.spkg
      (Mike Hansen)

   2. Update MPFI to 1.5.0 - http://trac.sagemath.org/sage_trac/ticket/12171
      http://sage.math.washington.edu/home/mhansen/mpfi-1.5.0.spkg
      (Mike Hansen)

   3. Reinstall http://sagemath.org/packages/standard/libfplll-3.0.12.p1.spkg

   4. Install flint2 spkg (beware, this will break Sage)
      http://sage.math.washington.edu/flint-2.3.spkg

   5. touch SAGE_ROOT/devel/sage/sage/combinat/partitions.*

   6. Run "sage -b"


== Switch some of the /eclib/mwrank code to use flint2, and upgrade the eclib spkg in Sage ==

 * People: John C., David H., Martin R., Maarten D., Flint developers

== Help the Singular developers make better use of flint2 ==

 * People: Martin L., Simon K., Flint developers

== Linear algebra mod p, for log_2 p = 64 ==

 * People: Martin A., if it is still going to happen

Flint2 has an implementation for asymptotically fast linear algebra mod p for p up to 2^64. I (malb) am curious whether it can be improved using ideas inspired by M4RIE, i.e., replace multiplications by additions using pre-computation tables. Whether this is beneficial will depend on how much slower multiplication is than additions.

'''Update (2011-12-15 10:57):''' It seems the difference between scalar multiplication and addition is too small for these tricks to make sense. 

{{{#!c
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
}}}

Gives a ratio of about 4.5.

== Linear algebra mod p^n, for log_2 p small-ish ==

 * People: Martin A., Simon K., Johan B.

Linear algebra over GF(p^k^) can be reduced to linear algebra over GF(p) and for GF(2^k^) the performance is very nice. Hence, it would be a good project to develop some somewhat generic infrastructure for dense matrices over GF(p^k), or even *any* extension field? The natural place to put this would be LinBox but perhaps we can start stand-alone and then integrate it with LinBox if LinBox is too scary to start with.

== BKZ 2.0 ==

 * People: mysterious people who added this project, Andy N.

At !AsiaCrypt 2011 Chen and Nguyen [[http://www.springerlink.com/content/m036804m1m538722/ |presented]] their new BKZ implementation which is much much more efficient than that in NTL. As far as I understand, the main improvements are due to "extreme pruning" as presented in a [[http://www.springerlink.com/content/x3l7g80454x11116/ |paper]] at !EuroCrypt 2010 and perhaps careful parameter choice. As far as I understand, they do not plan to make their code available. I don't know how much work it would be, but perhaps it would be a nice idea to patch NTL's BKZ to include extreme pruning and/or to port it to Flint2?

== Improve polynomial factoring mod p in flint2 ==

 * People: Fredrik J., Andy N., David H.

The Cantor-Zassenhaus implementation in the flint2 nmod_poly module could be optimized:

  * Make exponentiation faster by precomputing a Newton inverse of the modulus
  * Use sliding window exponentiation
  * Use the von zur Gathen / Shoup algorithm (adapt the fast power series composition code for modular composition)

== Modular forms code in Sage ==

 * People: David L., John C., Frithjof, Johan B., Maarten D., Martin R., Simon K., Marco S.
 * review patches
 * fix that one patch that had a problem

== Open MP and FLINT ==

 * People: David H., Fredrik J., Bogdan B., Julian R., 

== Miscellaneous Sage Algebra and Number Theory patches ==

 * People: Francis C., Monique v B., Florian B., Sam S., Michiel K, Bogdan B., Colton, Jan, Marco S.
 
== Simon and ComputeL GP scripts ==

 * People: John C., Martin R., Marco S.
 * Revive work of March Sage Days

== Elliptic curve isogenies ==

 * People: Kimi T., John C., Fran&ccedil;ois Morain., Monique v B., &Ouml;zge &Ccedil;., Marco S.

== Mestre's algorithm for constructing hyperelliptic curves from their invariants ==

 * People: Florian B., people from projects 10 and 12, Marco S.
 * Code for Mestre's algorithm is there (Florian), make this into a patch
 * Code for covariant z_0 is there (Florian), put that in the same patch
 * Code for covariant z is not written, write that (optional)
 * Reduction of points for SL_2 is also needed. It is

   * easy for QQ, put that in the patch as well
   * very interesting for number fields: Hilbert fundamental domain, bad code that works surprisingly well (Marco), improve that (optional)

== Tate's Algorithm over function fields ==

 * People: Frithjof S, John C., Marco S.
