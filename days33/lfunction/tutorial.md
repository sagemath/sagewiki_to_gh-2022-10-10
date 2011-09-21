Tutorial Outline!

Introduction


Definition (Amy and Cassie)
  - Dirichlet L-series and zeta functions (Amy)
  - for elliptic curves (Cassie)
  - for modular forms  (Cassie)

\noindent\Large{The Dedekind $\zeta$-function}
\normalsize

If $K$ is a number field over $\mathbb{Q}$ and $s\in\mathbb{C}$ such that Re$(s)>1$ then we can create $\zeta_K(s)$, the Dedekind $\zeta$-function of $K$:
$$\zeta_K(s)=\sum_{I \subseteq \mathcal{O}_K} \frac{1}{(N_{K/\mathbb{Q}} (I))^s} = \sum_{n\geq1} \frac{a_n}{n^s}. $$
In the first sum, $I$ runs through the nonzero ideals $I$ of $\mathcal{O}_K$, the ring of integers of $K$, and  $a_n$ is the number of ideals in $\mathcal{O}_K$ of norm $n$.  These $\zeta$-functions are a generalization of the Riemann $\zeta$-function, which can be thought of as the Dedekind $\zeta$-function for $K=\mathbb{Q}$.  The Dedekind $\zeta$-function of $K$ also has an Euler product expansion and an analytic continuation to the entire complex plane with a simple pole at $s=1$, as well as a functional equation.  Any $\zeta_K(s)$ can be decomposed as a product of $L$-series of Dirichlet characters in the character group of $K$:
$$\zeta_K(s)=\prod_{\chi} L(s,\chi).$$

\noindent\Large{$L$-series of Elliptic Curves}
\normalsize

Let $E$ be an elliptic curve over $\mathbb{Q}$ and let $p$ be prime.  Let $N_p$ be the number of points on the reduction of $E$ mod $p$ and set $a_p=p+1-N_p$ when $E$ has good reduction mod $p$.  Then the $L$-series of $E$, $L(s,E)$, is defined to be
$$L(s,E)=\prod_p \frac{1}{L_p(p^{-s})}=\prod_{p \ \mathrm{good \ reduction}} \left(1 - a_p p^{-s} + p^{1-2s}\right)^{-1} \prod_{p \ \mathrm{bad \ reduction}} \left(1 - a_p p^{-s}\right)^{-1} $$
where
$$ L_p(T) = \begin{cases} 1-a_pT+pT^2  \text{, if $E$ has good reduction at $p$}, \\
 1-T  \text{, if $E$ has split multiplicative reduction at $p$},\\
 1+T  \text{, if $E$ has non-split multiplicative reduction at $p$},\\
 1  \text{, if $E$ has additive reduction at $p$} \end{cases} $$
and $a_p \in \set{0,1,-1}$ if $E$ has bad reduction mod $p$.  (All of these definitions can be rewritten if you have an elliptic curve defined over a number field $K$; see Silverman's \emph{The Arithmetic of Elliptic Curves}, Appendix C $\S$16.)  Notice in particular that although one can certainly rewrite $L(s,E)$ as a sum over the natural numbers, the sequence of numerators no longer has an easily interpretable meaning in terms of the elliptic curve itself.

Basic Functions (Amy)
  - not everything, but hit the highlights


Euler Product (Lola)
  - translating between Euler product and Dirichlet series

An ''Euler product'' is an infinite product expansion of a Dirichlet series, indexed by the primes. For a Dirichlet series of the form $$F(s) = \sum_{n = 1}^\infty \frac{a_n}{n^s},$$ the corresponding Euler product (if it exists) has the form $$F(s) = \prod_p \left(1 - \frac{a_p}{p^s}\right)^{-1}.$$ 

To define an L-series by an Euler product in Sage, one can use the LSeriesAbstract class. For example,

sage: L = LSeriesAbstract(conductor=1, hodge_numbers=[0], weight=1, epsilon=1, poles=[1], residues=[-1], base_field=QQ)

sage: L

returns an L-series Euler product with conductor 1, Hodge numbers [0], weight 1, epsilon 1, poles [1], residues [-1] over a Rational Field. 

In many cases, an L-series can be expressed as an Euler product. By definition, if an L-series has a Galois representation then it has an Euler product. Some examples of common L-series with Euler products include:

1. Riemann zeta function: $$\zeta(s) = \sum_{n = 1}^\infty \frac{1}{n^s} = \prod_p \left(1 - p^{-s}\right)^{-1}$$

2. Dirichlet L-function: $$L(s, \chi) = \sum_{n = 1}^\infty \frac{\chi(n)}{n^s} = \prod_p \left(1 - \frac{\chi(p)}{p^s}\right)^{-1}$$

3. L-function of an Elliptic Curve (over $\mathbb{Q}$): $$L(E, s) = \sum_{n = 1}^\infty \frac{a_n}{n^s} = \prod_{p \ \mathrm{good \ reduction}} \left(1 - a_p p^{-s} + p^{1-2s}\right)^{-1} \prod_{p \ \mathrm{bad \ reduction}} \left(1 - a_p p^{-s}\right)^{-1}$$

Not all L-series have an associated Euler product, however. For example, the Epstein Zeta Functions, defined by

$$\zeta_Q(s) = \sum_{(u,v) \neq (0,0)} (au^2 + buv + cv^2)^{-s},$$

where $Q(u,v) = au^2 + buv + cv^2$ is a positive definite quadratic form, has a functional equation but, in general, does not have an Euler product.

Functional Equation


Taylor Series


Zeros and Poles


Analytic Rank


Precision Issues


Advanced Topics:
  - creating a new L-series class


Finding L-series from incomplete information
