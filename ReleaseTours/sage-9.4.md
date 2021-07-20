= Sage 9.4 Release Tour =

current development cycle (2021)

<<TableOfContents>>

== Goals and tickets ==

 * Add support for Python 3.10

 * Add support for gcc 11

 * Add support for macOS Big Sur that does not depend on homebrew's gcc@10

 * packages upgrades 
   - https://repology.org/projects/?inrepo=sagemath_develop
   - many upgrades enabled by dropping support for Python 3.6

 * Drop support for optional packages with system gcc 4.x

 * [[https://trac.sagemath.org/query?status=needs_info&status=needs_review&status=needs_work&status=new&summary=~Meta&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=priority|Open Meta-Tickets]]

 * [[https://trac.sagemath.org/query?milestone=sage-9.4&groupdesc=1&group=status&max=1500&col=id&col=summary&col=author&col=reviewer&col=time&col=changetime&col=component&col=keywords&order=component|Trac tickets with milestone 9.4]]

== Symbolics ==

=== Extended interface with SymPy ===

The [[https://www.sympy.org/en/index.html|SymPy]] package has been updated to version 1.8.

!SageMath has a bidirectional interface with !SymPy. Symbolic expressions in Sage provide a `_sympy_` method, which converts to !SymPy; also, Sage attaches `_sage_` methods to various SymPy classes, which provide the opposite conversion.

In Sage 9.4, several conversions have been added. Now there is a bidirectional interface as well for 
matrices and vectors [[https://trac.sagemath.org/ticket/31942|#31942]].
{{{
sage: M = matrix([[sin(x), cos(x)], [-cos(x), sin(x)]]); M
[ sin(x)  cos(x)]
[-cos(x)  sin(x)]
sage: sM = M._sympy_(); sM
Matrix([
[ sin(x), cos(x)],
[-cos(x), sin(x)]])
sage: sM.subs(x, pi/4)           # computation in SymPy
Matrix([
[ sqrt(2)/2, sqrt(2)/2],
[-sqrt(2)/2, sqrt(2)/2]])
}}}
Work is underway to make !SymPy's symbolic linear algebra methods available in Sage via this route.

All sets and algebraic structures (`Parent`s) of !SageMath are now accessible to !SymPy by way of a wrapper class, which implements the [[https://docs.sympy.org/latest/modules/sets.html#set|SymPy Set API]]. [[https://trac.sagemath.org/ticket/31938|#31938]]
{{{
sage: F = Family([2, 3, 5, 7]); F
Family (2, 3, 5, 7)
sage: sF = F._sympy_(); sF
SageSet(Family (2, 3, 5, 7))          # this is how the wrapper prints
sage: sF._sage_() is F
True                                  # bidirectional
sage: bool(sF)
True
sage: len(sF)
4
sage: sF.is_finite_set                # SymPy property
True
}}}
Finite or infinite, we can wrap it:
{{{
sage: W = WeylGroup(["A",1,1])
sage: sW = W._sympy_(); sW
SageSet(Weyl Group of type ['A', 1, 1] (as a matrix group acting on the root space))
sage: sW.is_finite_set
False
sage: sW.is_iterable
True
sage: sB3 = WeylGroup(["B", 3])._sympy_(); sB3
SageSet(Weyl Group of type ['B', 3] (as a matrix group acting on the ambient space))
sage: len(sB3)
48
}}}
Some parents or constructions have a more specific conversion to !SymPy [[https://trac.sagemath.org/ticket/31931|#31931]].
{{{
sage: ZZ3 = cartesian_product([ZZ, ZZ, ZZ])
sage: sZZ3 = ZZ3._sympy_(); sZZ3
ProductSet(Integers, Integers, Integers)
sage: (1, 2, 3) in sZZ3

sage: NN = NonNegativeIntegers()
sage: NN._sympy_()
Naturals0

sage: (RealSet(1, 2).union(RealSet.closed(3, 4)))._sympy_()
Union(Interval.open(1, 2), Interval(3, 4))
}}}
See [[https://trac.sagemath.org/ticket/31926|Meta-ticket #31926: Connect Sage sets to SymPy sets]]


== Configuration changes ==

 * Drop support for system Python 3.6 (deprecated in Sage 9.3). [[https://trac.sagemath.org/ticket/30551|#30551]]
  It is still possible to build the Sage distribution on systems with old Python versions, but Sage will build its own copy of Python 3.9.x in this case.


== Availability of Sage 9.4 and installation help ==

The first beta of the 9.4 series, 9.4.beta0, was tagged on 2021-05-26.

 * See [[https://groups.google.com/forum/#!forum/sage-devel|sage-devel]] for development discussions and [[https://groups.google.com/forum/#!forum/sage-release|sage-release]] for announcements of beta versions and release candidates.
