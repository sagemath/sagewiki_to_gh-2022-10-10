

# Tim Dokchitser (Cambridge University): Complex L-functions and the Birch and Swinnerton-Dyer conjecture


## Structure of the course

* Quick review of Elliptic curves over Q and the Mordell-Weil theorem 
* Elliptic curves over finite fields, heuristics for their distribution and the naive version of BSD 
* L-functions of elliptic curves and the BSD-conjecture 
* Root numbers and how to compute them 
* Parity predictions, Goldfeld's conjecture and ranks of elliptic curves over number fields 

## Prerequisites

Some familiarity with basic algebraic number theory (number fields, primes), and having seen elliptic curves 


## Background reading

J. H. Silverman, "The arithmetic of elliptic curves", Chapters 3, 7 and 8. 

Sage Reference Manual on elliptic curves: <a class="http" href="http://sagemath.org/doc/reference/plane_curves.html">http://sagemath.org/doc/reference/plane_curves.html</a>, up to `Isogenies'. 


## Computational projects

There will be many small problems and larger assignments to play with, illustrating all the concepts and conjectures from the course. 

A. Root Numbers over K for elliptic curves (implement)  

               * People: Armin, Charlie, Hatice, Christ, Lola, Robert Miller, Thilina, M. Tip, Robert Bradshaw 
B. $#III(E/K)_{an}$ function (L-functions, connection to Wuthrich) 

               * People: Barinder, M. Tip, Adam, Robert Miller, Robert Bradshaw, Chris Wuthrich 
C. Parity Predictions 

               * People: Arijit, Anil, Adam 

## Computing root numbers project: notes

Main background reference: Silverman I Chapter VII (does not mention root numbers but gives background information to compute them) - reduction types of elliptic curves etc; plus Section of Silverman I Appendix C on Tate's algorithm.  

Elliptic Curves over Q 

root number $w = \prod_p w_p$ * $w_\infty$ 

p is a prime of good reduction iff $p$ does not divide the discriminant. If E has good reduction at p then $w_p = +1$.  

$p \mid \mid N$ means p is a prime of multiplicative reduction If E has split multiplicative reduction then $w_p = -1$ If E has non-split multiplicative reduction then $w_p = +1$ 

Step 1: implement w for $E/Q$ with N square-free (already done in GP) 

If $p^2\mid N$ then p is a prime of additive reduction for E and $w_p$ is more complicated. There are formulae to compute them, they rely on Tate's algorithm. 

Elliptic Curves over general number fields 

Root number classification 

w = $\prod_p w_p \prod_{v\div \infty} (-1)$ 

Additive reduction $w_p for p$ not dividing $2,3$ has been done by Rohrlich (somewhat difficult) see [1] Theorem 2 which is self-contained  

for $p \mid 3$ this has been done Kobayashi [2] 

for $p \mid 2$ T & V Dokchitser [3] the formulae are really hard - ignore this (!!) 

Would perhaps be better to do for any p, or even determine w globally (T & V Dokchitser: [4] in the introduction)  There is a decision to be made as to which methods to use. 

[1] D. Rohrlich, Galois Theory, elliptic curves, and root numbers, Compos. Math. 100 (1996), 311--349. 

[2] S. Kobayashi, The local root number of elliptic curves with wild ramification, Math. Ann. 323 (2002), 609--623; available online 

[3] <a href="http://arxiv.org/abs/math/0612054">http://arxiv.org/abs/math/0612054</a> 

[4] <a href="http://arxiv.org/abs/0906.1815">http://arxiv.org/abs/0906.1815</a> 


## Working groups

Implementation: 

      * (Local) Armin, Charlie, Chris 
      * (Global) Lola, Chris, Hatice, Charlie  
Reading (Kobayashi) 

      * Lola, AJ, Thilina, MTip 
L-functions of elliptic curves over number fields 

      * Adam 
                     1. Extended the .dokchitser attribute from rationals to general number fields. 
                                 * -The main component was producing a method to obtain the coefficients of 
                                    * of the Dirichlet expansion of the L-series. -Patch has been submitted: trac #9402 
                     1. Discovered a bug in .count_points() attribute for elliptic curves 
                                 * -During the course of (1) this was discovered. Apparently, .count_points() 
                                    * caches its answer, and running a loop over different residue fields and  elliptic curves results in failure. -No patch yet; but notified devel team: trac #9409 

## Implementation of root numbers

A very preliminary implementation of root numbers over number fields is attached as <a href="days22/dokchitser/root_number.sage">root_number.sage</a>.  The case of primes dividing 2 certainly has bugs at the moment.  An updated version will be uploaded to ticket #9320.  Also note that the implementation needs the patches #9334 (Hilbert symbol) as well as <a href="days22/dokchitser/dirty_model.patch">dirty_model.patch</a> to be applied (the latter needs to be improved and will be posted to trac soon). 

Finally, to work correctly the tickets #9389, #9410, and #9417 need to be addressed. 

For testing against Magma, one can use <a href="days22/dokchitser/magma.sage">magma.sage</a>. 

Fridays presentations are available as <a href="days22/dokchitser/goodcop.sws">goodcop.sws</a> and <a href="days22/dokchitser/badcop.sws">badcop.sws</a>. The first of these also needs <a href="days22/dokchitser/demo.sage">demo.sage</a>. 

_UPDATE:_ A (hopefully) working implementation is attached to ticket #9320 now. 


## Parity Predictions

A brief summary of the project is available as <a href="days22/dokchitser/project.pdf">project.pdf</a>. 

The worksheet I used for my presentation is located at <a href="http://www.sagenb.org/home/pub/2234">http://www.sagenb.org/home/pub/2234</a> 
