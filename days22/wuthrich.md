= Christian Wuthrich (Nottingham): p-adic L-series and Iwasawa theory =

== Description ==

Artin and Tate proved a large part of the conjecture of Birch and Swinnerton-Dyer in the function field case in the 60s.
Iwasawa theory for elliptic curves as initiated by Mazur tries to use similar tools to approach the $p$-adic version of the Birch and Swinnerton-Dyer conjecture.

Let $E/\mathbb{Q}$ be an elliptic curve. The traditional conjecture by Birch and Swinnerton-Dyer states that there is a link between the arithmetic invariants of $E$, like the Mordell-Weil group $E(\mathbb{Q})$, and the analytically defined complex L-function.
In the $p$-adic BSD, we work with an analytic function $L_p(E,s)$ taking values in the $p$-adic numbers.
It is built on the values of the complex L-function and can be described explicitly using modular symbols.
The $p$-adic conjecture says again that the order of vanishing of $L_p(E,s)$ at $s=1$ is equal to the rank of the Mordell-Weil group $E(\mathbb{Q})$. (Except in one special case, namely when the curve has split multiplicative reduction at $p$.)

The big advantage of the $p$-adic setting is that we actually know something about it. The $p$-adic L-function has a natural link to the arithmetic side via the so called "main conjecture" of Iwasawa theory about which we know quite a lot.
Iwasawa theory deals with the question of how the arithmetic objects vary as one climbs up the tower of fields $K_{\infty}/\mathbb{Q}$ obtained by adjoining the $p$-power roots of unity. Similarily one can ask how does the mysterious Tate-Shafarevich group grow (or shrink). Much like the zeta-function for varieties over finite fields, there is a generating function that incodes this information. The main conjecture states that this generating function is equal to the $p$-adic L-function.
 
A big and difficult theorem by Kato shows half of this conjecture and Skinner and Urban claim they have shown the other half of it. As a consequence one gets that the order of vanishing of $L_p(E,s)$ is at most the rank of $E(\mathbb{Q})$. It even says something about the size of the mysterious Tate-Shafarevich group. It also implies that the group $E(K_{\infty})$ is finitely generated. 

== Projects ==

=== Project 1 ===

'''Use twists by Dirichlet characters on modular symbols and $p$-adic L-function.'''

    . People: John B, Chan-Ho, Jamie W, Barinder, Mike D, M. Tip, Vincent Rusnell, Jeremy West, Jen Balakrishnan

The $p$-adic L-function of $E$ can be computed using modular symbols. And sage contains already code to do so. But this code could be improved in several direction.
There are several subprojects

  * ''Compute the conjectural order of Sha over abelian fields.'' The aim is to use the sum of twisted modular symbols to compute the order of the Tate-Shafarevich group over cubic, quintic and septic fields of small conductors for elliptic curves of small conductors.

    The run on John's file [[attachment: sha_fast.sage]] on cubic and quintic fields gave so far the following two tables for [[http://www.maths.nottingham.ac.uk/personal/cw/download/sha_data_3_1000_11_1000.txt|cubic fields]] and [[http://www.maths.nottingham.ac.uk/personal/cw/download/sha_data_5_1000_11_1000.txt|quintic fields]]. We need to improve the error bounds and make sure that the errors are correctly caught. 

    We will eventually extract statistical data from it, like "How likely it is that Sha is divisibile by a given prime?" or "How often is Sha trivial?" etc.

  * ''Implement in sage twists of'' $p$''-adic L-functions.'' The file padic_lseries.py should be modified to allow an additional optional argument to series to compute the twist by Dirichlet characters.

  * ''Implement'' $\lambda$ ''and'' $\mu$ ''invariants for'' $p$''-adic power series.''

    The following two version of Robert Pollack's implementations in Magma might be useful especially the function ''iwasawa_invariants_ord''. [[attachment:pLseries.m]] and [[attachment:lseries.m]]

  * Use the previous point to ''produce tables of Iwasawa invariants'' a bit like [[http://math.bu.edu/people/rpollack/Data/data.html|Pollack's tables]].
 
  * ''Implement better Dirichlet characters.'' Add a function to a Dirichlet character that give the field fixed by the kernel. Add a function to Abelian fields that gives back the conductor and the group od Dirichlet characters. Also the current implementation of Dirichlet characters could be improved a lot: make it into a group, make it faster.
 
=== Project 2 ===

'''Compute the modular symbols using complex integration'''

    . People: Megan Maguire, Erin Militzer, Jamie W, John C, Vincent Rusnell, Robert Bradshaw, Matt G, Chan-Ho, Thilina, Gagan, Robert Miller, Tim Dokchitser, William Stein

The original definition of the modular symbols $[r]^{+}$ and $[r]^{-}$ is given as an integral in the upper half plane. Sage currently computes the modular symbols attached to an elliptic curve (natively or in eclib) by finding the correct eigenspace in the space of all modular symbols of level $N$. For large $N$ this is very time consuming or even impossible. When we wish to compute only a few modular symbols, it could be much faster to compute the values of $[r]^{+}$ by the numerical approximation of the complex integrals.

The project proceeds in several steps

  *  Implement a sage function that computes the integral from a given point $\tau$ in the upper half plane to $i\infty$ with a given maximal error. The bounds must be rigorous.

     Here is the script which does that : [[attachment: approximation_of_integral.sage]]

  *  For a semi-stable curve we can split up the integration path from $r$ to $i\infty$ at a point $\tau$ and move the difficult part close to the real line using an Atkin Lehner involution to a nicer place

  *  Find the best place to cut the line.

  *  Compare the algorithms and implemented it in sage.

  *  Think about the non semi-stable case.

This script computes the $\gamma$ transforming a cusp, if possible, to one where the denominator is a divisor of $N$: [[attachment: find_gamma.sage]]

=== Other projects ===

  * Look at overconvergent modular symbols

  (not considered yet. Matt could give a talk about this later)

    . People: John B, Matt Greenberg, Chan-Ho, Robert Bradshaw

  * What happens for primes of additive reduction ?

  (not considered yet. Two papers by Delbourgo will be useful here. Or Colmez' new construction)

    . People: Robert Miller, Megan Maguire, Erin Militzer, Barinder, Mike D, Matt Greenberg

== References ==

  * Mazur, Tate, Teitelbaum,  On $p$-adic analogues of the conjectures of Birch and Swinnerton-Dyer. Invent. Math. 84 (1986), no. 1, 1--48. At [[http://www.ams.org/mathscinet-getitem?mr=830037| mathscinet]] or [[http://gdz.sub.uni-goettingen.de/dms/load/img/?IDDOC=175497|gdz]].

  * Greenberg Ralph, Introduction to Iwasawa Theory for Elliptic Curves, [[http://www.math.washington.edu/~greenber/Park.ps|(paper)]] on [[http://www.math.washington.edu/~greenber/research.html|his web page]] full of Iwasawa theory. Also there is the more advanced Iwasawa Theory for Elliptic Curves [[http://www.math.washington.edu/~greenber/CIME.ps|(paper)]].

  * Stein and Wuthrich, Computations About Tate-Shafarevich Groups Using Iwasawa Theory, [[http://wstein.org/papers/shark/|preprint]].

  * Sage Reference Manual on p-adic L-functions of elliptic curves: [[http://sagemath.org/doc/reference/sage/schemes/elliptic_curves/padic_lseries.html]].  See also nearby sections.

== Lecture Notes ==

=== Modular symbols and $p$-adic L-functions ===


  * [[attachment:modular_symbols_and_padic_lfunctions.pdf| First lecture]] on modular symbols and the $p$-adic L-function.

  * [[attachment:padic_bsd.pdf| Second lecture]] on the $p$-adic version of the conjecture of Birch and Swinnerton Dyer. '''Warning''': The pages are in the reversed order.

== Background reading ==
  
  * As for other lectures, Silverman's book "The arithmetic of elliptic curves" contains a good background for elliptic curve, especially chapter III. We will use some further results on elliptic curves over global fields, mainly in chapter VII and X, but by far not everything there is needed.

  * A more concise introduction to the subject, including the discussion of how elliptic cures over $\mathbb{Q}$ are linked to modular forms is in the first two chapters of Darmon's book  "Rational Point on Modular Elliptic Curves".
