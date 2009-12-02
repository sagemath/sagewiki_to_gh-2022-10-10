= Sage Days 18 Coding Sprint Projects =
 
<<TableOfContents>>

== Elliptic curves over function fields ==

This project will include the following topics:

 * Compute regulators of elliptic curves over function fields

 * Is there an algorithm to enumerate all elliptic curves over a function field of a given conductor?

 * Implement Tate's algorithm for elliptic curves over the function field F_p(t)

 * Verify BSD for elliptic curves over function fields of analytic rank 3 or higher


People: ''Sal Baig'', William Stein, David Roe, Ken Ribet, Kiran Kedlaya, Robert Bradshaw, Victor Miller (S-unit equations), Thomas Barnet-Lamb

Faster arithmetic for $F_p(t)$ [[http://trac.sagemath.org/sage_trac/ticket/7585|#7585]]


== Implement computation of the 3-Selmer rank of an elliptic curve over QQ ==

Some projects:
  
 * Implement the algorithm from Schaefer-Stoll which does the general case

 * Implement the algorithm in the reducible case due to Jeechul Woo: [[attachment:ThreeDescent.gp|Jeechul Woo's GP script]]

 * Compute the 3-Selmer ranks of all curves of conductor up to 1000

People: ''Robert Miller'', William Stein, Victor Miller, Jeechul Woo (Noam's student; around only Thu, Fri)


== Compute statistics about distribution of Heegner divisors and Kolyvagin divisors modulo primes p ==

 * Compute the reduction of $x_1$ using ternary quadratic forms, then use distribution relations and hit by Hecke operators to get reduction of all $x_n$.    There is a theorem of Jetchev-Kane about the asymptotic distribution of $x_n$; compare our new data with that. 

 * Stein: I posted a bundle based against Sage-4.2.1 here (called heegner-4.2.1.hg), which has highly relevant code: http://trac.sagemath.org/sage_trac/ticket/6616

People: ''William Stein'', Dimitar Jetchev, Drew Sutherland, Mirela Ciperiani, Ken Ribet, Victor Miller


== Create a table of images of Galois representations, for elliptic curves ==

The goals of this project are:

  * Compute and record in a nice table the exact image of Galois in $GL_2(F_p)$ for all $p<60$ and all curves in Cremona's tables, using Drew's new code/algorithm. 

  * Extend the above to all $p$ by using the explicit bound coded in Sage. 

  * Extend the above to all $p^k$.

  * Compute the exact image for all curves of conductor up to $10^8$ from the Stein-Watkins database.  Add this data with some nice key to that database (i.e., change all the files to include a new field).

  * Think about images in $GL(Z/mZ)$. 

  * Think about statistics resulting from the above computation. 


People: ''Drew Sutherland'', Ken Ribet, William Stein, Kiran Kedlaya, David Roe


== Fast computation of Heegner points ==

 Implement the algorithm of Delauny/Watkins's algorithm for fast computation of Heegner points $y_K \in E(K)$.  

People: ''William Stein'', Robert Bradshaw, Jen Balakrishnan


== Implement code to compute the asymptotic distribution of Kolyvagin classes ==

This will be based on Jared Weinstein's talk.   See http://wstein.org/misc/sagedays18_papers/weinstein-kolyvagin_classes_for_higher_rank_elliptic_curves.pdf

People: ''Jared Weinstein'', Mirela Ciperiani, William Stein

== Verify Kolyvagin's conjecture for a specific rank 3 curve ==

This is done for examples of rank 2 curves.   Nobody has ever checked that Kolyvagin's conjecture holds for a rank 3 curve. 

  * Figure out exactly what needs to be computed and what might be an optimal curve and quadratic imaginary field to work with:  [[/5077aestimates|Some details for 5077a]]

  * Verify that one Kolyvagin class for that curve is nonzero. 

  * Possibly verify the conjecture for the first (known) rank 4 curve, which has conductor 234446.  This would be '''computationally hard''', but not impossible!

People: ''William Stein'', Dimitar Jetchev, Victor Miller (sparse linear algebra), Jen Balakrishnan

== Implement an algorithm in Sage to compute Stark-Heegner points ==

There is a new algorithm due to Darmon and Pollack for computing Stark Heegner point using overconvergent modular symbols.  So this project would involve:

  * Implementing computation of overconvergent modular symbols.
  * Using an implementation of overconvergent modular symbols to implement the Stark-Heegner point algorithm. 
 
People: ''Matthew Greenberg'', Cameron Frank, Kiran Kedlaya, Robert Pollack, Avner Ash, David Roe, Jay Pottharst, Thomas Barnet-Lamb

== Compute the higher Heegner point y_5 on the curve 389a provably correctly  ==

  * Implement an algorithm to compute the Gross-Zagier Rankin-Selberg convolution L-functions $L(f,\chi,s)$, and use Zhang's formula to deduce heights of Heegner points.
  * Apply in the particular curves 389a for n=5.
  * Come up with an algorithm that is definitely right for provably computing Heegner points given the height.
  * Implement algorithm and run for 389a and n=5.
  * Make a table of heights of higher Heegner points.   (Search to find any of height 0!)
  * Make a table of heights of derived Kolyvagin points. 

People: ''Robert Bradshaw'', William Stein, Jen Balakrishnan

== Compute a Heegner point on the Jacobian of a genus 2 curve ==

People: Noam Elkies, virtually via his [[http://groups.google.com/group/sageday18/browse_thread/thread/6904bf31c59bb444|comments in this thread]].

== Visibility of Kolyvagin Classes ==

  * Jared describes the problem thus:  On the one hand, one of Kolyvagin's suite of conjectures is that the classes he constructs out of Heegner points ought to generate the entirety of Sha(E/K).  On the other hand each element of Sha(E/K) is "visible" in some other abelian variety, in the sense of Mazur (see for instance http://www.williamstein.org/home/was/www/home/wstein/www/papers/visibility_of_sha/).  I wonder if the Kolyvagin classes d(n) contributing to Sha become visible in abelian varieties in some *systematic* way;  ie, in a modular Jacobian of possibly higher level.  There are already some examples out there of computation with visibility and computation with Kolyvagin classes, so maybe we can gather some data.

  * I wrote a short paper with Dimitar Jetchev in 2005 (which I forgot about until just now, and never published), which I think was motivated by this question: [[attachment::jetchev-stein-congruences_and_unramified_cohomology.pdf]]
 
People: ''Jared Weinstein'', Mirela Ciperiani, William Stein, Dimitar Jetchev, Ken Ribet, Barry Mazur

== Find an algorithm to decide if y_{p^n} is divisible by (g-1) and run it for a curve of rank >= 2 ==

   * Consider the Heegner $y_{p^n}$ over the anticyclotomic tower for a rank >= 2 curve, Sha trivial, etc. 

   * Barry Mazur remarks that this may be connected to his notion (with Rubin) of "Shadow lines" in Mordell-Weil. 

People: Mirela Ciperiani, William Stein, Barry Mazur, Jay Pottharst

== Compute Frobenius eigenvalues for a bunch of curves to illustrate Katz-Sarnak ==

 * curves that vary in various ways, e.g., coverings of one curve...

 * might use David Harvey's super fast Kedlaya zeta function implementation in Sage (his C++ code), but unfortunately the curves that typically arise aren't hyperelliptic, and Harvey's code only applies to hyperelliptic curves.

 * could lead to questions of an "anabelian sort"... e.g., take elliptic curve over finite field, take n-torsion points, extract roots, get coverings, etc.  Compute Frobenius eigenvalues of all these covers.

People: Barry Mazur, Kiran Kedlaya, Thomas Barnet-Lamb, David Harvey, Mirela Ciperiani, Sal Baig (lots of possibly relevant data over function fields)


== Sage Tutorials ==

We would like to have a sequence of informal Sage tutorials on the following topics:

   * Introduction to Python/Sage (Kiran Kedlaya, 10am on Wednesday)
   * Linear algebra modulo p (Robert Bradshaw, 11am on Wednesday)
   * Tate's algorithm over number fields (David Roe, 10am on Thursday)
   * 2-descent in Sage (Robert Miller, 11am on Thursday)
   * Computing images of Galois representations (Drew Sutherland and William Stein, 11am on Friday)
