= Projects =

Please feel free to add more


== Put flint2 into Sage ==

== Switch some of the mwrank code to use flint2 ==

== Help the Singular developers make better use of flint2 ==

== Linear algebra mod p, for log_2 p = 64 ==

Flint2 has an implementation for asymptotically fast linear algebra mod p for p up to 2^64. I (malb) am curious whether it can be improved using ideas inspired by M4RIE, i.e., replace multiplications by additions using pre-computation tables. Whether this is beneficial will depend on how much slower multiplication is than additions.

== Linear algebra mod p^n, for log_2 p small-ish ==

Linear algebra over GF(p^k) can be reduced to linear algebra over GF(p) and for GF(2^k) the performance is very nice. Hence, it would be a good project to develop some somewhat generic infrastructure for dense matrices over GF(p^k), or even *any* extension field? The natural place to put this would be LinBox but perhaps we can start stand-alone and then integrate it with LinBox if LinBox is too scary to start with.

== BKZ 2.0 ==

At !AsiaCrypt 2011 Chen and Nguyen [[http://www.springerlink.com/content/m036804m1m538722/ |presented]] their new BKZ implementation which is much much more efficient than that in NTL. As far as I understand, the main improvements are due to "extreme pruning" as presented in a [[http://www.springerlink.com/content/x3l7g80454x11116/ |paper]] at !EuroCrypt 2010 and perhaps careful parameter choice. As far as I understand, they do not plan to make their code available. I don't know how much work it would be, but perhaps it would be a nice idea to patch NTL's BKZ to include extreme prunning and/or to port it to Flint2?

== Improve polynomial factoring mod p in flint2 ==

The Cantor-Zassenhaus implementation in the flint2 nmod_poly module could be optimized:

  * Make exponentiation faster by precomputing a Newton inverse of the modulus
  * Use sliding window exponentiation
  * Use the von zur Gathen / Shoup algorithm (adapt the fast power series composition code for modular composition)
