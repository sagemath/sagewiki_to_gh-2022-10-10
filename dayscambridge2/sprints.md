= Sage Days 18 Coding Sprint Projects =
 
<<TableOfContents>>

== Elliptic curves over function fields == 

This project will include the following topics:

 * Compute regulators of elliptic curves over function fields

 * Is there an algorithm to enumerate all elliptic curves over a function field of a given conductor?

 * Implement Tate's algorithm for elliptic curves over the function field F_p(t)

 * Verify BSD for elliptic curves over function fields of analytic rank 3 or higher

 People: ''Sal Baig'', William Stein, David Roe, Ken Ribet

== Implement computation of the 3-Selmer rank of an elliptic curve over QQ ==

Some projects:
  
 * Implement the algorithm from Schaefer-Stoll which does the general case

 * Implement the algorithm in the reducible case due to Jeechul Woo, if we can find out what it is.

 * Compute the 3-Selmer ranks of all curves of conductor up to 1000

 People: ''Robert Miller'', William Stein, Victor Miller, Jeechul Woo (Noam's student) ??


== Compute statistics about distribution of Heegner divisors and Kolyvagin divisors modulo primes p ==

 * Compute the reduction of $x_1$ using ternary quadratic forms, then use distribution relations and hit by Hecke operators to get reduction of all $x_n$.    There is a theorem of Jetchev-Kane about the asymptotic distribution of $x_n$; compare our new data with that. 

 People: ''William Stein'', Dimitar Jetchev, Drew Sutherland, Mirela Ciperiani, Ken Ribet, Victor Miller


== Create a table of images of Galois representations, for elliptic curves ==

The goals of this project are:

  * Compute and record in a nice table the exact image of Galois in $GL_2(F_p)$ for all $p<60$ and all curves in Cremona's tables, using Drew's new code/algorithm. 

  * Extend the above to all $p$ by using the explicit bound coded in Sage. 

  * Compute the exact image for all curves of conductor up to $10^8$ from the Stein-Watkins database.  Add this data with some nice key to that database (i.e., change all the files to include a new field).

  * Think about images in $GL(Z/mZ)$. 

  * Think about statistics resulting from the above computation. 


 People: ''Drew Sutherland'', Ken Ribet, William Stein

Drew Sutherland remarks: 
{{{
Hi William,

I would definitely be motivated to work on the table of Galois images project that you suggested in your list. I am currently rerunning my previous computations on the Stein-Watkins database using an improved version of the algorithm (just for the mod ell case at the moment, I still want to tweak the mod ell^k code some more). It would be great to get all this data organized and accessible in a useful form, especially while everything is fresh in my mind.

Drew
}}}



== Fast computation of Heegner points ==

 Implement the algorithm of Delauny/Watkins's algorithm for fast computation of Heegner points $y_K \in E(K)$.  

 People: ''William Stein'', Robert Bradshaw, Jen Balakrishnan


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
