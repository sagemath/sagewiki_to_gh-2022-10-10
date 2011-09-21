Tutorial Outline!

Introduction


Definition (Amy and Cassie)
  - Dirichlet L-series and zeta functions (Amy)
  - for elliptic curves (Cassie)
  - for modular forms  (Cassie)


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
