= Differential Calculus =

Besides the examples on this page, please see the discussion in ["BasicCalculus"].

== Functions ==

Piecewise fcns, polynomials, exponential, logs, trig and hyperboic trig functions.

== Limits ==

SAGE can compute $\lim_{x\rightarrow 0}\frac{\sin(x)}{x}$:

{{{
sage: limit(sin(x)/x,x=0)
1
}}}

== Differentiation ==

SAGE can differentiate $x^2\log(x+a)$ and $\tan^{-1}(x)=\arctan(x)$:

{{{
sage: diff(x^2 * log(x+a), x)
2*x*log(x + a) + x^2/(x + a)
sage: derivative(atan(x), x)
1/(x^2 + 1)
}}}

== Applications ==

...

== Sequences and series ==

(Some schools teach this topic as part of integral calculus.)
