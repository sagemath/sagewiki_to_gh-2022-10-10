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

=== Laws and properties ===

=== Continuity ===

== Differentiation ==

SAGE can differentiate $x^2\log(x+a)$ and $\tan^{-1}(x)=\arctan(x)$:

{{{
sage: diff(x^2 * log(x+a), x)
2*x*log(x + a) + x^2/(x + a)
sage: derivative(atan(x), x)
1/(x^2 + 1)
}}}

=== Laws ===

SAGE can verify the product rule

{{{
sage: function('f, g')
(f, g)
sage: diff(f(t)*g(t),t)
f(t)*diff(g(t), t, 1) + g(t)*diff(f(t), t, 1)
}}}
the quotient rule

{{{
sage: diff(f(t)/g(t), t)
diff(f(t), t, 1)/g(t) - (f(t)*diff(g(t), t, 1)/g(t)^2)
}}}

and linearity:

{{{
sage: diff(f(t) + g(t), t)
diff(g(t), t, 1) + diff(f(t), t, 1)
sage: diff(c*f(t), t)
c*diff(f(t), t, 1)
}}}


=== Rates of change, velocity ===

=== Derivatives of polys, exps, trigs, log ===

=== Chain rule ===

=== Implicit differentiation ===

=== Higher derivatives ===

== Applications ==

=== Related rates ===

=== Maximum and minimum values ===

You can find critical points of a piecewise defined function:
{{{
sage: x = PolynomialRing(RationalField(), 'x').gen()
sage: f1 = x^0
sage: f2 = 1-x
sage: f3 = 2*x
sage: f4 = 10*x-x^2
sage: f = Piecewise([[(0,1),f1],[(1,2),f2],[(2,3),f3],[(3,10),f4]])
sage: f.critical_points()
[5.0]
}}}

=== Optimization problems ===

=== Indeterminate Forms, L'Hopital's rule ===

=== Newton’s Method ===

== Sequences and series ==

(Some schools teach this topic as part of integral calculus.)

=== Sequences ===

=== Series ===

=== Tests for Convergence ===

          o The Comparison Test

          o Absolute and Conditional Convergence

          o The Ratio Test

          o The Root Test 

=== Power series ===

          o Shift the Origin

          o Convergence of Power Series 

=== Taylor series ===

=== Applications of Taylor series ===
