Title: Amicable pairs and aliquot cycles for elliptic curves

Abstract: An amicable pair for an elliptic curve E/Q is a pair of primes (p,q)
of good reduction for E satisfying #E(Fp) = q and #E(Fq) = p.  Aliquot
cycles are analogously defined longer cycles.  Although rare for
non-CM curves, amicable pairs are -- surprisingly -- relatively
abundant in the CM case.  We present heuristics and conjectures for
the frequency of amicable pairs and aliquot cycles, and some results
for the CM case (including the especially intricate j=0 case).  We
present some open problems and computational challenges arising from
this work.  This is joint work with Joseph H. Silverman.

[[attachment:Stange-SageDays-2010.pdf]]

== Project ==


  * smalljac

      * make smalljac code usable from Python  (involves Cython); see [[http://code.google.com/p/purplesage/issues/detail?id=13|this psage issue]].

      * use code:
 
          - replicate and extend data in Kate's talk
 
          - maybe try genus 2 analogue?
 
      * See [[http://groups.google.com/group/sagedays26/browse_thread/thread/9a4a0375e8ba8b15|this announcement]]

  * cubic and sextic residue symbol

      * there's a [[http://trac.sagemath.org/sage_trac/attachment/ticket/8485/trac_8485.patch|ticket]] that has only partial implementation (cubic residue of rational prime and element of Q(sqrt(-3))) -- not at all a general implementation

      * there are artin symbols etc. -- big machinery

      * m-th residue symbol implemented: [[attachment:code.sws]]

      * SAGE computes Kronecker symbol using GMP

  * explicit calculation of Grossencharacters (aka Hecke characters). 

== Resources ==

[[http://www.math.uiuc.edu/~pppollac/recilandscape.pdf|slides on cubic residues]]
