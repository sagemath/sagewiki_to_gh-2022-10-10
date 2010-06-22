= Tim Dokchitser (Cambridge University): Complex L-functions and the Birch and Swinnerton-Dyer conjecture =

== Structure of the course ==

 * Quick review of Elliptic curves over Q and the Mordell-Weil theorem

 * Elliptic curves over finite fields, heuristics for their distribution and the naive version of BSD

 * L-functions of elliptic curves and the BSD-conjecture

 * Root numbers and how to compute them

 * Parity predictions, Goldfeld's conjecture and ranks of elliptic curves over number fields

== Prerequisites ==

Some familiarity with basic algebraic number theory (number fields, primes), and having seen elliptic curves

== Background reading ==

J. H. Silverman, "The arithmetic of elliptic curves", Chapters 3, 7 and 8.

Sage Reference Manual on elliptic curves: [[http://sagemath.org/doc/reference/plane_curves.html]], up to `Isogenies'.

== Computational projects ==

There will be many small problems and larger assignments to play with, illustrating all the concepts and conjectures from the course.

A. Root Numbers over K for elliptic curves (implement) 
      People: Armin, Charlie, Hatice, Christ, Lola, Robert Miller, Thilina, M. Tip, Robert Bradshaw
B. $#III(E/K)_{an}$ function (L-functions, connection to Wuthrich)
      People: Berinder, M. Tip, Adam, Robert Miller, Robert Bradshaw, Chris Wuthrich
C. Parity Predictions
      People: Arijit, Anil, Adam


References:
1. Silverman I Chapter VII (does not mention root numbers but gives background information to compute them)

Elliptic Curves over \QQ

root number w = \prod_p w_p * w_{\infinity}

p is a prime of good reduction iff p \nmid discriminant.
If E has good reduction at p then w_p = +1. 

p \mid \mid means p is a prime of multiplicative reduction
If E has split multiplicative reduction then w_p = -1
If E has non-split multiplicative reduction then w_p +1


Step 1: implement w for E/\QQ with N square-free (already done in GP)
If 

If p^2\mid N then p is a prime of additive reduction for E and w_p is more complicated. There are formulae to compute them, they rely on Tate's algorithm.

Elliptic Curves over general number fields

Root number classification

w = \prod_p w_p \prod_{v\div \infinity} (-1)

Additive reduction
w_p for p \nmid 2,3 has been done by Rohrlich (somewhat hard to read) see Theorems 2 and 3 which are self-contained

for p \mid 3 this has been done Kobayashi

for $p \mid 2$ T & V Dokchitser the formulae are really hard - ignore this (!!)

Would perhaps be better to do for any p, or even determine w globally (T & V Dokshitser: page 1) 
There is a decision to be made as to which methods to use.
