= Christian Wuthrich (Nottingham): p-adic L-series and Iwasawa theory =

== Description ==

Artin and Tate proved a large part of the conjecture of Birch and Swinnerton-Dyer in the function field case in the 60s.
Iwasawa theory for elliptic curves as initiated by Mazur tries to use similar tools to approach the $p$-adic version of the Birch and Swinnerton-Dyer conjecture.

Let $E/\mathbb{Q}$ be an elliptic curve. The traditional conjecture by Birch and Swinnerton-Dyer states that there is a link between the arithmetic invariants of $E$, like the Mordell-Weil group $E(\mathbb{Q})$, and the analytically defined complex L-function.
In the $p$-adic BSD, we work with an analytic function $L_p(E,s)$ taking values in the $p$-adic numbers.
It is built on the values of the complex L-function and can be described explicitly using modular symbols.
The $p$-adic conjecture says again that the order of vanishing of $L_p(E,s)$ at $s=1$ is equal to the rank of the Mordell-Weil group $E(\mathbb{Q})$. (Except in one special case, namely when the curve has split multiplicative reduction at $p$.)

The big advantage of the $p$-adic setting is that we actually know something about it. The $p$-adic L-function has a natural link to the arithmetic side via the so called "main conjecture" of Iwasawa theory about which we know quite a lot.
Iwasawa theory deals with the question how so the arithmetic objects vary as one climbs up the tower of fields $K_{\infty}/\mathbb{Q}$ obtained by adjoining the $p$-power roots of unity. Similarily one can ask how does the mysterious Tate-Shafarevich group grow (or shrink). Much like the zeta-function for varieties over finite fields, there is a generating function that incodes this information. The main conjecture states that this generating function is equal to the $p$-adic L-function.
 
A big and difficult theorem by Kato shows half of this conjecture and Skinner and Urban claim they have shown the other half of it. As a consequence one gets that the order of vanishing of $L_p(E,s)$ is at most the rank of $E(\mathbb{Q})$. It even says something about the size of the mysterious Tate-Shafarevich group. It also implies that the rank of $E(K_{\infty})$ is finitely generated over the field $K_\infty$. 

== Projects ==

The $p$-adic L-function of $E$ can be computed using modular symbols. And sage contains already code to do so. But this code could be improved in several direction.

  * Allow to twist the function by Dirichlet characters. In particular with the Teichmüllers.

  * Implement a function that extracts the $\lambda$ and $\mu$ invariant and which decides it the growth of the Selmer group is due to the growth of the Tat-Shafarevich group or due to the increase of the rank. Statistics on the values of these fundamental Iwasawa theoretic invariants. A question I was often asked by Iwasawa theorists is: Are the $\mu$-invariants over $\mathbb{Q}(\zeta_p)$ zero, too.

  * Can we compute the modular symbols using complex integration ?

  * Look at overconvergent modular symbols

  * What happens for primes of additive reduction ?


== References ==

  * Mazur, Tate, Teitelbaum,  On $p$-adic analogues of the conjectures of Birch and Swinnerton-Dyer. Invent. Math. 84 (1986), no. 1, 1--48. At [[http://www.ams.org/mathscinet-getitem?mr=830037| mathscinet]] or [[http://gdz.sub.uni-goettingen.de/dms/load/img/?IDDOC=175497|gdz]].

  * Greenberg Ralph, Introduction to Iwasawa Theory for Elliptic Curves, [[http://www.math.washington.edu/~greenber/Park.ps|(paper)]] on [[http://www.math.washington.edu/~greenber/research.html|his web page]] full of Iwasawa theory. Also there is the more advanced Iwasawa Theory for Elliptic Curves [[http://www.math.washington.edu/~greenber/CIME.ps|(paper)]].

  * Stein and Wuthrich, Computations About Tate-Shafarevich Groups Using Iwasawa Theory, [[http://wstein.org/papers/shark/|preprint]].

  * Sage Reference Manual on p-adic L-functions of elliptic curves: [[http://sagemath.org/doc/reference/sage/schemes/elliptic_curves/padic_lseries.html]].  See also nearby sections.

== Background reading ==
  
  * As for other lectures, Silverman's book "The arithmetic of elliptic curves" contains a good background for elliptic curve, especially chapter III. We will use some further results on elliptic curves over global fields, mainly in chapter VII and X, but by far not everything there is needed.

  * A more concise introduction to the subject, including the discussion of how elliptic cures over $\mathbb{Q}$ are linked to modular forms is in the first two chapters of Darmon's book  "Rational Point on Modular Elliptic Curves".
