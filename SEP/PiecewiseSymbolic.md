= Symbolic Piecewise Functions =

This Sage Enhancement Proposal (SEP) is to improve the existing piecewise functionality.

== Authors ==

 * Michael Orlitzky

== Abstract ==

Sage has the ability to manipulate many familiar symbolic functions and expressions. This ability is rather robust; the code is well-tested and integrates nicely with the rest of the project. Piecewise functions are however an exception.

In essence, piecewise functions can be thought dictionaries that map values to symbolic expressions. Unfortunately, due to historical reasons and lack of manpower, the interface to piecewise functions has not been kept at parity with the rest of the symbolics library. This causes users difficulty when they expect piecewise functions to behave like other expressions: the piecewise interface is not just different, it has fewer features.

== Copyright ==

Public domain.

== Problems with PiecewisePolynomial ==

There are several problems with the existing piecewise class, `PiecewisePolynomial`. Open tickets are listed at the end of this SEP. Here are some characteristic examples.

{{{
sage: f = piecewise([[(-1,1), 0]])
sage: f(1)
...
TypeError: 'sage.rings.integer.Integer' object is not callable
}}}

{{{
sage: f = piecewise([[(-1,1), 0]])
sage: x*f
...
AttributeError: 'sage.symbolic.expression.Expression' object has no attribute 'domain'
}}}

{{{
f = piecewise([[(-1,1), 0]])
sage: abs(f)
...
AttributeError: PiecewisePolynomial instance has no attribute '__abs__'
}}}

{{{
sage: x,y = var('x,y')
sage: f = piecewise([[(-1,1), x*y]])
sage: f(1)                          
/home/mjo/src/sage-5.0.beta3/local/bin/sage-ipython:1: DeprecationWarning: Substitution using function-call syntax and unnamed arguments is deprecated and will be removed from a future release of Sage; you can use named arguments instead, like EXPR(x=..., y=...)
#!/usr/bin/env python
y
sage: f(x=0)
...
TypeError: __call__() got an unexpected keyword argument 'x'
}}}

== Implementation ==

=== Evaluation of Arguments ===

As it stands, piecewise functions have the familiar classroom behavior (deprecation warning omitted):

{{{
sage: f = piecewise([[(-infinity,0), -x], [(0, infinity), x]])   
sage: f(3)
3
}}}

The fact that calling `f` evaluates one if its consituent functions leads to some difficulties with the rest of symbolics. It is proposed that we eliminate this behavior by default but provide an interface to it; a piecewise function `f` should act primarily as dictionary rather than as a callable function.

Ideally, a piecewise function `f` is a set of `(A, g)` pairs where A is some object that supports a "contains" method and `g` is a function or at least behaves like one. When the piecewise function is evaluated at a point `x`, it should return the function `g` such that `(A, g)` is in the list and `A.contains(x)`. No deprecation warning will be thrown, as we expect (only) one positional argument.

Unfortunately, this change would cause a regression: it seems silly, using the earlier example, to have to do `f(3)(3)`, to evaluate the appropriate function at `x=3`. This is not impossible to fix, however. One possible solution is that, when `f` is called with a named argument, a substitution is performed on all of its constituent functions. For example,

{{{
sage: f = piecewise([[(-Infinity,0), -x], [(0, +Infinity), x]])   
sage: f(x=3)
Piecewise defined function with 2 parts, [[(-Infinity, 0), -3], [(0, +Infinity), 3]]
}}}

If `A.contains(g)` for any `(A, g)` ''after'' substitution, we can return `g`.

=== Piece Determination ===

The previous discussion uses "containment" to determine which piece is returned, but this could be generalized to any predicate. We could still support containment as the predicate, of course. Pseudocode for `f(x)`:

{{{
for (A, g) in f.pieces():
  if isinstance(A, interval):
    if x in A:
      return g
  else:
    # Assume it's a predicate.
    if A(x):
      return g
}}}

This would allow us to define "easy" piecewise functions more naturally by specifying conditions on the independent variable: `x < 0`, `x == 0`, etc.

Robertwb: It may be simpler to simply disallow anonymous intervals altogether, requiring f(x) = piecewise(((x < 0), -x), ((x >= 0), x)) where of course the last predicate could be optional (just giving an expression would result in an else clause). 

mjo: I agree it would be simpler, but it would make the transition for users harder. If `a<x<b` or even `((a<x) & (x<b))` worked, it would be straightforward to convert the interval notation to a predicate. You mentioned this on sage-devel; if it looks doable, I would be in favor of dropping the intervals.

=== Application of Methods ===

If `f` is piecewise and we call `f.foo()`, what happens? For most methods, it is proposed, we should simply call `g.foo() for each `(A, g)` in `f` and return a new piecewise as the result.

It may also make sense to have a separate set of mathematically-sane methods. For example, we might want `f.diff()` to work only if `f` is actually differentiable. We would then need some other function, e.g. `f.piecewise_diff()` that differentiated the constituent functions individually.

== Supported Methods ==

The first, and cleanest (also easiest) option would be to decide that piecewise functions are symbolic, and 
reimplement all of the methods of symbolic expressions on top of PiecewiseSymbolic.

An more difficult alternative would be, given a piecewise function `f` containing the pairs `(A, g)` and 
`(B, h)`, to allow `f.bar()` where `bar()` is any method that `g` and `h` have in common. If `g` is a symbolic function and `h` is a polynomial over the reals, we could potentially call `f.roots()` and have it do the right thing.

The latter is an interesting idea, but would need some thought.

== Interface ==

We would like to keep as much of the old interface as possible intact. At the very least, doctests that test functionality (as opposed to implementation) should be preserved.

A new piecewise class, `PiecewiseSymbolic`, will replace `PiecewisePolynomial`. The old class will be deprecated via the normal procedure while users migrate to the new class.

=== Other Computer Algebra Systems ===

Some other systems implement piecewise functions, and we should try to understand their design decisions. For example,
[[http://reference.wolfram.com/mathematica/ref/Piecewise.html|Mathematica's Piecewise documentation]] provides several examples based on predicates that we should be able to support.

== Other Features ==

There are other features that could be built on top of a robust piecewise class.

=== Periodic functions ===

A periodic function is a conveniently-defined piecewise function. Per the discussion in ''Piece Determination'', we should be able to determine our piece based on a predicate. A new constructor could be provided that converts a periodic specification into a piecewise predicate.

== Relevant Tickets ==

The following tickets should all be solveable during a reimplementation.

 1. [[http://trac.sagemath.org/sage_trac/ticket/1773|piecewise functions and integration / arithmetic do not play well together]]

 2. [[http://trac.sagemath.org/sage_trac/ticket/11225|improve piecewise plotting]]

 3. [[http://trac.sagemath.org/sage_trac/ticket/12070|Unavoidable DeprecationWarnings when calling piecewise functions]]

 4. [[http://trac.sagemath.org/sage_trac/ticket/12316|find_fit does not work for piecewise functions]]
