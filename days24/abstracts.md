This page contains the abstracts for the talks given at [[days24|Sage days 24]].

<<TableOfContents>>

<<Anchor(Boettner)>>
==== Stefan Böttner --- Mixed Transcendental and Algebraic Extensions for the Risch-Norman Algorithm ====

The problem of integration in finite terms for elementary functions has been
solved since 1969 with the invention of the Risch algorithm. However,
ever since then the sine and cosine functions have been rewritten in terms of
other functions, originally using
complex exponentials. Later, for the Risch-Norman algorithm, an alternative
has been proposed where they are rewritten in terms of a tangent of half
the angle.

We discuss extensions to the Risch-Norman algorithm that admit functions
satisfying systems of differential equations (and thus also functions satisfying
a differential equation of higher order). We further improve the method to
allow algebraic relations to exist among the functions, paying particular
attention to new logarithms that may appear and need to be predicted. This
results in a heuristic but quite powerful algorithm that is
able to deal with a large class of special functions and a
variety of algebraic functions. In particular, it is able to work with the sine
and cosine functions directly without the need to rewrite them in terms of other
functions.


<<Anchor(Chyzak)>>
==== Frédéric Chyzak --- DDMF (Dynamic Dictionary of Mathematical Functions) and its DynaMoW ====

We present the prototype of a new system for displaying dynamic
mathematical contents on the web (DynaMoW), together with an
application based on it, our interactive web-based encyclopedia of
mathematical functions (DDMF, http://ddmf.msr-inria.inria.fr).  As
part of DynaMoW, we developed an extension of the Ocaml language that
is based on quotations and antiquotations to embed fragments of
computer-algebra and mathematics-presentation languages.  This
extension controls the simultaneous interactions between a user and
one or several computer-algebra systems, as well as the generation of
mathematical documents.  Our encyclopedia DDMF focuses on so-called
differentiably finite functions, and can in principle be augmented
with any such function.  For each mathematical function, the current
version (v1.5) ''algorithmically'' computes then displays: its potential
symmetries; Taylor and Chebyshev series expansions; more generally,
asymptotic expansions given in closed form or through definitions by
recurrence; calculations of guaranteed, arbitrary-precision numerical
approximations; real plots; its Laplace transform.  Upon request by
the user, more terms in series expansions or more digits in numerical
approximations can be computed incrementally.  For some of the
properties, human-readable proofs are also automatically ''generated''
and displayed.  (DynaMoW is joint work in progress with Alexis
Darrasse; DDMF is joint work in progress with Alexandre Benoit, Alexis
Darrasse, Stefan Gerhold, Marc Mezzarobba, and Bruno Salvy.)

<<Anchor(King)>>
==== Simon King --- Completeness criteria for modular group cohomology ====

The modular cohomology of a finite group is a graded commutative algebra
over a finite field. Using projective resolutions and the stable element
method, the algebraic structure can be "approximated" to arbitrary
degree. Since the modular cohomology has a finite presentation, it is
isomorphic to its degree-$n$ approximation, if $n$ is big enough.

Jon Carlson was the first to give a completeness criterion, that tells
when $n$ is big enough. He used it for the first modular cohomology
computation for all groups of order 64. More recent completeness
criteria are due to Dave Benson, Peter Symonds, David Green and myself.
I implemented them in Sage, obtaining the first modular cohomology
computation for all groups of order 128 and for various interesting
non-prime-power groups, including the Higman-Sims group and the third
Conway group.

<<Anchor(Pillwein)>>
==== Veronika Pillwein --- CAD and Special Functions Inequalities ====

Cylindrical algebraic decomposition (CAD) is a widely known tool to
handle (possibly quantified) systems of polynomial equations and
inequalities. As Stefan Gerhold and Manuel Kauers discovered, CAD can
also be applied for proving special functions inequalities that go
beyond the scope of the original area of applications. It is their
approach that primarily caught my interest in CAD and in this talk I
want to briefly introduce CAD, the Gerhold/Kauers-method and to present
a non-trival application of their method to show the positivity of a sum
over certain Gegenbauer polynomials.
