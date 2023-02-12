

# Christian Wuthrich (Nottingham): p-adic L-series and Iwasawa theory


## Description

Artin and Tate proved a large part of the conjecture of Birch and Swinnerton-Dyer in the function field case in the 60s. Iwasawa theory for elliptic curves as initiated by Mazur tries to use similar tools to approach the $p$-adic version of the Birch and Swinnerton-Dyer conjecture. 

Let $E/\mathbb{Q}$ be an elliptic curve. The traditional conjecture by Birch and Swinnerton-Dyer states that there is a link between the arithmetic invariants of $E$, like the Mordell-Weil group $E(\mathbb{Q})$, and the analytically defined complex L-function. In the $p$-adic BSD, we work with an analytic function $L_p(E,s)$ taking values in the $p$-adic numbers. It is built on the values of the complex L-function and can be described explicitly using modular symbols. The $p$-adic conjecture says again that the order of vanishing of $L_p(E,s)$ at $s=1$ is equal to the rank of the Mordell-Weil group $E(\mathbb{Q})$. (Except in one special case, namely when the curve has split multiplicative reduction at $p$.) 

The big advantage of the $p$-adic setting is that we actually know something about it. The $p$-adic L-function has a natural link to the arithmetic side via the so called "main conjecture" of Iwasawa theory about which we know quite a lot. Iwasawa theory deals with the question of how the arithmetic objects vary as one climbs up the tower of fields $K_{\infty}/\mathbb{Q}$ obtained by adjoining the $p$-power roots of unity. Similarily one can ask how does the mysterious Tate-Shafarevich group grow (or shrink). Much like the zeta-function for varieties over finite fields, there is a generating function that incodes this information. The main conjecture states that this generating function is equal to the $p$-adic L-function. 

A big and difficult theorem by Kato shows half of this conjecture and Skinner and Urban claim they have shown the other half of it. As a consequence one gets that the order of vanishing of $L_p(E,s)$ is at most the rank of $E(\mathbb{Q})$. It even says something about the size of the mysterious Tate-Shafarevich group. It also implies that the group $E(K_{\infty})$ is finitely generated.  


## Projects


### Project 1

**Use twists by Dirichlet characters on modular symbols and $p$-adic L-function.** 

         * People: John B, Chan-Ho, Jamie W, Barinder, Mike D, M. Tip, Vincent Rusnell, Jeremy West, Jen Balakrishnan 
The $p$-adic L-function of $E$ can be computed using modular symbols. And sage contains already code to do so. But this code could be improved in several direction. There are several subprojects 

   * _Compute the conjectural order of Sha over abelian fields._ The aim is to use the sum of twisted modular symbols to compute the order of the Tate-Shafarevich group over cubic, quintic and septic fields of small conductors for elliptic curves of small conductors. 
         * Updated (6-30-10): The most recent script to generate data is <a href="days22/wuthrich/sha_v2.sage">sha_v2.sage</a>. It has generated tables for three curves: <a href="days22/wuthrich/sha_data_3_11a1_10000.txt">11a1 over cubic fields of conductor < 10k</a>, <a href="days22/wuthrich/sha_data_3_11a3_1000.txt">11a3 over cubic fields of conductor < 1k</a>, and <a href="days22/wuthrich/sha_data_3_42a1_10000.txt">42a1 over cubic fields of conductor < 10k</a>. Updated (6-29-10): precise error bounds were computed and are implemented in the file <a href="days22/wuthrich/ sha_v2.sage"> sha_v2.sage</a>. We will run on cubic and quintic fields to gather more readable data. Here (<a href="days22/wuthrich/11a1.txt">11a1.txt</a>) is the data for the curve '11a1' and all primes conductors up to 10k and cubic fields inside there. The run on John's file <a href="days22/wuthrich/ sha_fast.sage"> sha_fast.sage</a> on cubic and quintic fields gave so far the following two tables for <a class="http" href="http://www.maths.nottingham.ac.uk/personal/cw/download/sha_data_3_1000_11_1000.txt">cubic fields</a> and <a class="http" href="http://www.maths.nottingham.ac.uk/personal/cw/download/sha_data_5_1000_11_1000.txt">quintic fields</a>. We need to improve the error bounds and make sure that the errors are correctly caught.  We will eventually extract statistical data from it, like "How likely it is that Sha is divisibile by a given prime?" or "How often is Sha trivial?" etc. 
   * _Implement in sage twists of_ $p$_-adic L-functions._ The file padic_lseries.py should be modified to allow an additional optional argument to series to compute the twist by Dirichlet characters. 
         * Updated (7-1-10): The $p$-adic $L$-function of elliptic curves twisted by the power of the Teichmuller character is implemented. <a href="days22/wuthrich/teich_twist.sage">teich_twist.sage</a> Here are some examples at $p$ = 5 and 7. <a href="days22/wuthrich/prime5.txt">prime5.txt</a> <a href="days22/wuthrich/prime7.txt">prime7.txt</a> Updated (6-29-10): An example for the twist by (the power of) the Teichmuller character is given : <a href="http://www.sagenb.org/home/pub/2206/">http://www.sagenb.org/home/pub/2206/</a> The next aims are to develop this as a function and to implement the twist by characters of another different prime conductor. Here is a scipt for this <a href="days22/wuthrich/lp_teichmuller.sage">lp_teichmuller.sage</a> 
   * _Implement_ $\lambda$ _and_ $\mu$ _invariants for_ $p$_-adic power series._ 
         * The following two version of Robert Pollack's implementations in Magma might be useful especially the function _iwasawa_invariants_ord_. <a href="days22/wuthrich/pLseries.m">pLseries.m</a> and <a href="days22/wuthrich/lseries.m">lseries.m</a> Update (6-29-10): The two invariants are implemented in the file <a href="days22/wuthrich/iwasawa_invariants.sage">iwasawa_invariants.sage</a>. They will be used soon to find tables not unlike Pollack's tables. Still to be done is implement the so-called Mordell-Weil lambda invariant (see lecture notes). 
   * Use the previous point to _produce tables of Iwasawa invariants_ a bit like <a class="http" href="http://math.bu.edu/people/rpollack/Data/data.html">Pollack's tables</a>. 
   * _Implement better Dirichlet characters._ Add a function to a Dirichlet character that give the field fixed by the kernel. Add a function to Abelian fields that gives back the conductor and the group od Dirichlet characters. Also the current implementation of Dirichlet characters could be improved a lot: make it into a group, make it faster. 
         * Here is a script that compute the conductor of an abelian field <a href="days22/wuthrich/abelian_field_dirichlet_group.sage">abelian_field_dirichlet_group.sage</a> 

### Project 2

**Compute the modular symbols using complex integration** 

         * People: Megan Maguire, Erin Militzer, Jamie W, John C, Vincent Rusnell, Robert Bradshaw, Matt G, Chan-Ho, Thilina, Gagan, Robert Miller, Tim Dokchitser, William Stein 
The original definition of the modular symbols $[r]<sup>{+}$ and $[r]</sup>{-}$ is given as an integral in the upper half plane. Sage currently computes the modular symbols attached to an elliptic curve (natively or in eclib) by finding the correct eigenspace in the space of all modular symbols of level $N$. For large $N$ this is very time consuming or even impossible. When we wish to compute only a few modular symbols, it could be much faster to compute the values of $[r]^{+}$ by the numerical approximation of the complex integrals. 

The project proceeds in several steps 

   * Implement a sage function that computes the integral from a given point $\tau$ in the upper half plane to $i\infty$ with a given maximal error. The bounds must be rigorous. 
            * Here is a first script which does that : <a href="days22/wuthrich/ approximation_of_integral.sage"> approximation_of_integral.sage</a> and a new version <a href="days22/wuthrich/computing_modular_symbols_via_complex_integration.sage">computing_modular_symbols_via_complex_integration.sage</a> 
   * For a semi-stable curve we can split up the integration path from $r$ to $i\infty$ at a point $\tau$ and move the difficult part close to the real line using an Atkin Lehner involution to a nicer place 
   * Find the best place to cut the line. 
   * Compare the algorithms and implemented it in sage. 
   * Think about the non semi-stable case. 
This script computes the $\gamma$ transforming a cusp, if possible, to one where the denominator is a divisor of $N$: <a href="days22/wuthrich/ find_gamma.sage"> find_gamma.sage</a> 


### Other projects

   * Look at overconvergent modular symbols (not considered yet. Matt could give a talk about this later) 
         * People: John B, Matt Greenberg, Chan-Ho, Robert Bradshaw 
   * What happens for primes of additive reduction ? (not considered yet. Two papers by Delbourgo will be useful here. Or Colmez' new construction) 
         * People: Robert Miller, Megan Maguire, Erin Militzer, Barinder, Mike D, Matt Greenberg 

## References

   * Mazur, Tate, Teitelbaum,  On $p$-adic analogues of the conjectures of Birch and Swinnerton-Dyer. Invent. Math. 84 (1986), no. 1, 1--48. At <a class="http" href="http://www.ams.org/mathscinet-getitem?mr=830037">mathscinet</a> or <a class="http" href="http://gdz.sub.uni-goettingen.de/dms/load/img/?IDDOC=175497">gdz</a>. 
   * Greenberg Ralph, Introduction to Iwasawa Theory for Elliptic Curves, <a class="http" href="http://www.math.washington.edu/~greenber/Park.ps">(paper)</a> on <a class="http" href="http://www.math.washington.edu/~greenber/research.html">his web page</a> full of Iwasawa theory. Also there is the more advanced Iwasawa Theory for Elliptic Curves <a class="http" href="http://www.math.washington.edu/~greenber/CIME.ps">(paper)</a>. 
   * Stein and Wuthrich, Computations About Tate-Shafarevich Groups Using Iwasawa Theory, <a class="http" href="http://wstein.org/papers/shark/">preprint</a>. 
   * Sage Reference Manual on p-adic L-functions of elliptic curves: <a class="http" href="http://sagemath.org/doc/reference/sage/schemes/elliptic_curves/padic_lseries.html">http://sagemath.org/doc/reference/sage/schemes/elliptic_curves/padic_lseries.html</a>.  See also nearby sections. 

## Lecture Notes


### Modular symbols and $p$-adic L-functions

   * <a href="days22/wuthrich/modular_symbols_and_padic_lfunctions.pdf">First lecture</a> on modular symbols and the $p$-adic L-function. 
   * <a href="days22/wuthrich/padic_bsd.pdf">Second lecture</a> on the $p$-adic version of the conjecture of Birch and Swinnerton Dyer. **Warning**: The pages are in the reversed order. 

## Background reading

   * As for other lectures, Silverman's book "The arithmetic of elliptic curves" contains a good background for elliptic curve, especially chapter III. We will use some further results on elliptic curves over global fields, mainly in chapter VII and X, but by far not everything there is needed. 
   * A more concise introduction to the subject, including the discussion of how elliptic cures over $\mathbb{Q}$ are linked to modular forms is in the first two chapters of Darmon's book  "Rational Point on Modular Elliptic Curves". 