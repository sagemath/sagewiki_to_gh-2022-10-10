= Sage Days 18 Coding Sprint Projects =
 
<<TableOfContents>>

== Compute regulators of elliptic curves over function fields ==

 People: ''Sal Baig''

== Is there an algorithm to enumerate all elliptic curves over a function field of a given conductor? ==

 People: ''Sal Baig'', William Stein


== Implement Tate's algorithm for elliptic curves over the function field F_p(t) ==

 People: ''Sal Baig'', David Roe (?)


== Implement computation of the 3-Selmer rank of an elliptic curve over QQ ==

 People: ''Robert Miller'', William Stein


== Compute statistics about distribution of Heegner divisors and Kolyvagin divisors modulo primes p ==

 People: ''William Stein'', Dimitar Jetchev


== Create a table of images of Galois representations, for elliptic curves and/or Jacobians, in some range ==

 People: ''Drew Sutherland'', William Stein

Drew Sutherland remarks: 
{{{
Hi William,

I would definitely be motivated to work on the table of Galois images project that you suggested in your list. I am currently rerunning my previous computations on the Stein-Watkins database using an improved version of the algorithm (just for the mod ell case at the moment, I still want to tweak the mod ell^k code some more). It would be great to get all this data organized and accessible in a useful form, especially while everything is fresh in my mind.

Drew
}}}



== Fully implement and optimize variant of Watkins's algorithm for fast computation of Heegner points ==

 People: ''William Stein'', Robert Bradshaw

== Implement code to compute the asymptotic distribution of Kolyvagin classes (from Jared Weinstein's talk); this should be pretty easy, though generalizing to higher rank may be challenging ==

 People: ''Jared Weinstein''

== Verify Kolyvagin's conjecture for a specific rank 3 curve ==

 People: ''William Stein''

== Implement an algorithm in Sage to compute Stark-Heegner points ==
 
 People: ''Mathew Greenberg''

== Compute the higher Heegner point y_5 on the curve 389a provably correctly  ==

 People: ''Robert Bradshaw'', William Stein


== Compute special values of the Gross-Zagier L-function L(f,chi,s)  ==
 
 People: ''Robert Bradshaw''

== Implement something toward the Pollack et al. overconvergent modular symbols algorithm ==

 People: ''Robert Pollack'', Avner Ash

== Compute a Heegner point on the Jacobian of a genus 2 curve ==

 People: Noam Elkies, virtually via his [[http://groups.google.com/group/sageday18/browse_thread/thread/6904bf31c59bb444|comments in this thread]].

== Visibility of Kolyvagin Classes ==

 People: ''Jared Weinstein'', William Stein

This might be idle blather, but I've been thinking about Kolyvagin classes and I'm curious about the following.  On the one hand, one of Kolyvagin's suite of conjectures is that the classes he constructs out of Heegner points ought to generate the entirety of Sha(E/K).  On the other hand each element of Sha(E/K) is "visible" in some other abelian variety, in the sense of Mazur (see for instance http://www.williamstein.org/home/was/www/home/wstein/www/papers/visibility_of_sha/).  I wonder if the Kolyvagin classes d(n) contributing to Sha become visible in abelian varieties in some *systematic* way;  ie, in a modular Jacobian of possibly higher level.  There are already some examples out there of computation with visibility and computation with Kolyvagin classes, so maybe we can gather some data.
