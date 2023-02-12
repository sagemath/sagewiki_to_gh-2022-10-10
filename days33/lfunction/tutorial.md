

### Introduction

Authors: Amy Feaver, Lola Thompson, Cassie Williams 


### Definitions

**The Dedekind $\zeta$-function** 

If $K$ is a number field over $\mathbb{Q}$ and $s\in\mathbb{C}$ such that Re$(s)>1$ then we can create $\zeta_K(s)$, the Dedekind $\zeta$-function of $K$: $$\zeta_K(s)=\sum_{I \subseteq \mathcal{O}_K} \frac{1}{(N_{K/\mathbb{Q}} (I))<sup>s} = \sum_{n\geq1} \frac{a_n}{n</sup>s}. $$ In the first sum, $I$ runs through the nonzero ideals $I$ of $\mathcal{O}_K$, the ring of integers of $K$, and  $a_n$ is the number of ideals in $\mathcal{O}_K$ of norm $n$.  These $\zeta$-functions are a generalization of the Riemann $\zeta$-function, which can be thought of as the Dedekind $\zeta$-function for $K=\mathbb{Q}$.  The Dedekind $\zeta$-function of $K$ also has an Euler product expansion and an analytic continuation to the entire complex plane with a simple pole at $s=1$, as well as a functional equation. 

In Sage it is simple to construct the $L$-series for a number field $K$.  For example, 

* _sage_: K.<a>=<a href="/NumberField">NumberField</a>(x^2-x+1) _sage_: L=LSeries(K);L 
returns the Dedekind $\zeta$-function associated to this quadratic imaginary field.  The command 

* _sage_: LSeries('zeta') 
will return the Riemann $\zeta$-function.  One function that has interesting functionality for Dedekind $\zeta$-functions is the residues command, which computes the residues at each pole.  If you ask for the residues of a Dedekind $\zeta$-function, Sage will return 'automatic': 

* _sage_: K.<a>=<a href="/NumberField">NumberField</a>(x^2-x+1) _sage_: L=LSeries(K) _sage_: L.residues() 
      * 'automatic' 
but if you ask for the residues to a given precision you will get more information. 

* _sage_: L.residues(prec=53) 
                     * [-0.590817950301839] 
_sage_: L.residues(prec=100) 

                        * [-0.59081795030183867576605582778] 
Remember that the coefficients count the number of ideals of a given norm: 

* _sage_: K.<a>=<a href="/NumberField">NumberField</a>(x^2+1) _sage_: L=LSeries(K) _sage_: L.anlist(10) 
                     * [0, 1, 1, 0, 1, 2, 0, 0, 1, 1, 2] 
implying that there is no ideal of norm 3 in $\mathbb{Q}[i]$. 

**Dirichlet L-series** 

Dirichlet L-series are defined in terms of a Dirichlet characters. A Dirichlet character $\chi$ mod $k$, for some positive integer $k$, is a homomorphism $(\mathbb{Z}/k\mathbb{Z})^*\rightarrow\mathbb{C}$. The series is given by $$L(s,\chi)=\sum_{n\in\mathbb{N}}\frac{\chi(n)}{n^s},\ s\in\mathbb{C}, \text{Re}(s)>1.$$ Although these series can formally be defined for any Dirichlet character, it only makes (practical) sense to define these series in terms of primitive characters, because non-primitive characters will give rise to series which have missing factors in their Euler products and thus do not have an associated functional equation. 

To define an L-series in Sage, you must first create a primitive character: 

sage: G=<a href="/DirichletGroup">DirichletGroup</a>(11) 

$G$ is now the group of Dirichlet characters mod 11. We may then define the Dirichlet L-series over a single character from this group: 

sage: L=LSeries(G.0) 

gives the L-series for the character G.0 (the character which maps $2\mapsto e^{2\pi i/10}$). 

**L-series of Elliptic Curves** 

Let $E$ be an elliptic curve over $\mathbb{Q}$ and let $p$ be prime.  Let $N_p$ be the number of points on the reduction of $E$ mod $p$ and set $a_p=p+1-N_p$ when $E$ has good reduction mod $p$.  Then the $L$-series of $E$, $L(s,E)$, is defined to be $$L(s,E)=\prod_p \frac{1}{L_p(p<sup>{-s})}=\prod_{p \ \mathrm{good \ reduction}} \left(1 - a_p p</sup>{-s} + p<sup>{1-2s}\right)</sup>{-1} \prod_{p \ \mathrm{bad \ reduction}} \left(1 - a_p p<sup>{-s}\right)</sup>{-1} $$ where $ L_p(T) = 1-a_pT+pT^2$ if $E$ has good reduction at $p$, and $L_p(T)= 1-a_p T$ with $a_p \in \{0,1,-1 \}$ if $E$ has bad reduction mod $p$.  (All of these definitions can be rewritten if you have an elliptic curve defined over a number field $K$; see Silverman's _The Arithmetic of Elliptic Curves_, Appendix C, Section 16.)  If Re$(s)>3/2$ then $L(s,E)$ is analytic, and it is conjectured that these $L$-series have analytic continuations to the complex plane and functional equations. 

To construct $L(s,E)$ in Sage, first define an elliptic curve over some number field. 

* _sage_: E=<a href="/EllipticCurve">EllipticCurve</a>('37a') _sage_: L=LSeries(E);L 
                     * L-series of Elliptic Curve defined by y<sup>2 + y = x</sup>3 - x over Rational Field 
_sage_: K.<a>=<a href="/NumberField">NumberField</a>(x^2-x+1) 

_sage_: E2 = <a href="/EllipticCurve">EllipticCurve</a>(K, [0, 0,1,-1,0]) 

_sage_: LSeries(E2) 

                     * L-series of Elliptic Curve defined by y<sup>2 + y = x</sup>3 + (-1)*x over Number Field in a with defining polynomial x^2 - x + 1 
Notice in particular that although one can certainly rewrite $L(s,E)$ as a sum over the natural numbers, the sequence of numerators no longer has an easily interpretable meaning in terms of the elliptic curve itself. 

* _sage_: L.anlist(10) 
                     * [0, 1, -2, -3, 2, -2, 6, -1, 0, 6, 4] 
**L-series of Modular Forms** 

If $f$ is a modular form of weight $k$, it has a Fourier expansion $f(z)=\sum_{n\geq0} a_n (e<sup>{2\pi i z})</sup>n$.  Then the $L$-series of $f$ is  $$L(s,f)=\sum_{n\geq1} \frac{a_n}{n^s}$$  which does converge on some half-plane.  These $L$-series have an analytic continuation and functional equation, but not necessarily an Euler product formula. 


### Basic Sage Functions for L-series

**Series Coefficients** 

The command L.anlist(n) will return a list $V$ of $n+1$ numbers; 0, followed by the first $n$ coefficients of the L-series $L$. The zero is included simply as a place holder, so that the $k$th L-series coefficient $a_k$ will correspond to the $k$th entry $V[k]$ of the list.  

For example:  

   * sage: K.$\langle a\rangle$ = <a href="/NumberField">NumberField</a>($x^3 + 29$)  sage: L = LSeries(K)  sage: L.anlist(5)  
will return [0,1,1,1,2,1], which is $[0,a_1,a_2,a_3,a_4,a_5]$ for this L-series. 

To access the value of an individual coefficient, you can use the function an (WE ACTUALLY HAVE TO WRITE AN INTO SAGE FIRST...). For example, for the series used above: 

sage: L.an(3) 

will return 1 (the value of $a_3$), and 

sage: L.an(4)  

returns 2. 

**Evaluation of L-functions at Values of s** 

For any L-function $L$, simply type 

sage: L(s) 

to get the value of the function evaluated at $s\in\mathbb{C}$.  

**Taylor Series for L-functions** 

This function will return the Taylor series of an L-function $L$. If the user does not enter any arguments, the center of the  series will default to weight/2. For example, if $L$ is the Riemann zeta function,  

sage: L.taylor_series() 

will output the Taylor series centered at weight/2=0.5. You can also specify degree, variable and precision. Entering 

sage: L.taylor_series(center=2, degree=4, variable='t', prec=30) 

will give you the Taylor series with the properties you would expect. Note that degree=4 actually means you will compute the first 4 terms of the series, giving you a degree 3 polynomial. The output of the above line therefore will be the Taylor polynomial $1.6449341 - 0.93754825t + 0.99464012t<sup>{2} - 1.0000243t</sup>{3} + O(t^{4})$. 


### Euler Product

An _Euler product_ is an infinite product expansion of a Dirichlet series, indexed by the primes. For a Dirichlet series of the form $$F(s) = \sum_{n = 1}<sup>\infty \frac{a_n}{n</sup>s},$$ the corresponding Euler product (if it exists) has the form $$F(s) = \prod_p \left(1 - \frac{a_p}{p<sup>s}\right)</sup>{-1}.$$ In many cases, an L-series can be expressed as an Euler product. By definition, if an L-series has a Galois representation then it has an Euler product. Some examples of common L-series with Euler products include: 

1. **Riemann zeta function** $$\zeta(s) = \sum_{n = 1}<sup>\infty \frac{1}{n</sup>s} = \prod_p \left(1 - p<sup>{-s}\right)</sup>{-1}$$ 

2. **Dirichlet L-function** $$L(s, \chi) = \sum_{n = 1}<sup>\infty \frac{\chi(n)}{n</sup>s} = \prod_p \left(1 - \frac{\chi(p)}{p<sup>s}\right)</sup>{-1}$$ 

3. **L-function of an Elliptic Curve (over $\mathbb{Q}$)** $$L(E, s) = \sum_{n = 1}<sup>\infty \frac{a_n}{n</sup>s} = \prod_{p \ \mathrm{good \ reduction}} \left(1 - a_p p<sup>{-s} + p</sup>{1-2s}\right)<sup>{-1} \prod_{p \ \mathrm{bad \ reduction}} \left(1 - a_p p</sup>{-s}\right)^{-1}$$ 

Not all L-series have an associated Euler product, however. For example, the Epstein Zeta Functions, defined by 

$$\zeta_Q(s) = \sum_{(u,v) \neq (0,0)} (au<sup>2 + buv + cv</sup>2)^{-s},$$ 

where $Q(u,v) = au<sup>2 + buv + cv</sup>2$ is a positive definite quadratic form, has a functional equation but, in general, does not have an Euler product. 

To define an L-series by an Euler product in Sage, one can use the **LSeriesAbstract** class. For example, 

* _sage:_ L = LSeriesAbstract(conductor=1, hodge_numbers=[0], weight=1, epsilon=1, poles=[1], residues=[-1], base_field=QQ) _sage:_ L 
returns an L-series Euler product with conductor 1, Hodge numbers [0], weight 1, epsilon 1, poles [1], residues [-1] over a Rational Field.  

_Note:_ In order to use this class, the authors created a derived class that implements a method **_local_factor(P)**, which takes as input a prime ideal $P$ of $K=base\_field$, and returns a polynomial that is typically the reversed characteristic polynomial of Frobenius at $P$ of Gal$(\overline{K}/K)$ acting on the maximal unramified quotient of some Galois representation. This class automatically computes the Dirichlet series coefficients $a_n$ from the local factors of the L-function. 


### Functional Equation


### Zeros and Poles


### Analytic Rank

The analytic rank of an $L$-series is the order of vanishing of the zero at the central critical point (half the weight of the $L$-series).  In Sage, you can compute the analytic rank of any $L$-series $L$ by using the command: 

sage: L.analytic_rank() 

WARNING: It is important to note that the analytic rank is computed using numerical methods, and is not provably correct. 

The analytic rank of an L-series of an elliptic curve plays an important role in the Birch and Swinnerton-Dyer conjecture.  Specifically, part of the BSD conjecture claims that the rank of the group or points on an elliptic curve $E$ over a number field $K$ is the order of vanishing of the $L$-function $L(s,E)$ at $s=1$.  Generalizations of the BSD conjecture exist for abelian varieties of higher dimension as well. 


### Future Developments

This $L$-functions package is still in the process of development, and there are some tools that will hopefully be added in the future (this section was last updated on 2012-01-10). 

1. ** Triple Product L-functions: ** a class which can be used to define $L$-functions on a tensor product of three modular forms 

2. ** Precision Issues: ** The goal regarding precision issues is to allow this package to take, as input, the $a_p$ with Norm$(p)<B$ for some real constant $B$, and inform the user of how many bits of precision they will get when implementing an $L$-function defined by these $a_p$. Basically, this will invert the already existing function number_of_coefficients(prec). 

3. ** Finding L-series From Incomplete Information ** 
