= Sage Days 5 Schedule =

{{{

== SATURDAY ==
7pm -- [http://www.penangusa.com/location_cambridge_menu_dinein.html Penang] 

== SUNDAY ==

MORNING TALK 1 (9:15-10:15)
Speaker: William Stein (or Barry Mazur?)
Title: On convergence in the Sato-Tate conjecture

MORNING TALK 2 (10:30-11:30)
Speaker: David Roe
Title: p-adic Arithmetic in SAGE

AFTERNOON TALK (1-2)
Speaker: Fernando Rodriguez-Villegas
Title: [something about identities between p-adic multipolylogs and p-
adic zeta values]

After the afternoon talk today we will have an organisational meeting
to discuss the plan for working groups for the remainder of the
workshop.

EVENING TALK (7-8)
Speaker: William Stein and/or Robert Bradshaw
Title: Algebraic Number Theory in SAGE, a Status Report

Speaker: Craig Citro
Title: Modular forms in SAGE: A status report


== MONDAY ==

MORNING TALK 1
Speaker: Amnon Besser
Title: On the Computation of p-adic Height Pairings on Jacobians of
Hyperelliptic Curves

MORNING TALK 2
Speaker: Robert Bradshaw
Title: Coleman integration

AFTERNOON TALK
Speaker: Martin Albrecht
Title: Commutative Algebra in SAGE

EVENING TALK
Speaker: Bill Hart
Title: FLINT status report


== TUESDAY ==

MORNING TALK 1
Speaker: Gonzalo Tornaria
Title: [something about stark-heegner points and shimura correspondence]

MORNING TALK 2
Speaker: Dimitar Jetchev
Title: [something about explicit Heegner points]

AFTERNOON TALK
Speaker: Michael Abshoff
Title: CoCoALib

EVENING TALK
Speaker: Robert Bradshaw
Title: Cython status report

Speaker: Robert Bradshaw
Title: Coercion Status Report

== WEDNESDAY ==

MORNING TALK 1
Speaker: J-P. Serre
Location: Science Center 507
Title: Finite Groups in Number Theory (part 3)

MORNING TALK 2
Speaker: William Stein
Title: Computing p-adic Invariants of Elliptic Curves and
Applications of Iwasawa theory to BSD

AFTERNOON
Speaker: Moderator
Project Wrap-up

3pm NUMBER THEORY SEMINAR:
Title: Ranks of Elliptic Curves
Speaker: Mark Watkins
Location: Science Center 507 (Harvard)

EVENING TALK (can we really have a talk now? probably this will get
moved to a previous day?)
Speaker: Michael Abshoff
Title: Using trac to manage SAGE development workflow

}}}

========================================================================

Possible talks:

[technical math]
Speaker: Amnon Besser
Title: On the Computation of p-adic Height Pairings on Jacobians of hyperelliptic Curves
Abstract: The talk will present an algorithm for the computation of p-adic
height pairings on hyperelliptic curves over number fields. Our work
is not directly related to the work of Mazur Stein and Tate, though
there are some similarities in the difficulties that occur and in the
use of Kedlaya's algorithm. I will first explain where this height
pairing arise, and how it decomposes into a sum of local terms at the
places of the field. The most interesting is for places above the
prime p. We use a description of these local terms given by Coleman
and Gross that uses the theory of Coleman integration. There are two
parts for the computation at these primes. One computes a certain
projection from the space of meromorphic forms on the curve to its
first de Rham cohomology, which can be computed using Coleman
integration and the theory of the so called double index. The second
involves computation of Coleman integrals, which are however mroe
general than the ones computed in recent work o!
n the subject (Gutnik, Kedlaya, ...) so there are some tricks involved
which I'll explain. Finally I will discuss the situation at other
primes, where there are still some delicate issues to resolve.

[general computer]
Speaker: Craig Citro
Title: Modular forms in SAGE: A status report
Abstract: I'll give a short overview of the state of affairs of  
modular forms in SAGE. Mostly, I'll detail what we can do, what MAGMA  
can do that we can't, and some speed comparisons. 

[technical computer]
Speaker: Robert Bradshaw.
- Cython Status Report


[general/technical computer]
Speaker: Robert Bradshaw.
- Coercion Status Report (maybe a bit more of a status report, I
intend to talk about the "right" way to discover coercion and why the
idea of base extension is wrong.)

[technical math]
Speaker: Robert Bradshaw.
- Coleman integration: I'm sure that Kiran Kedlaya would have more to
say about this than me--I'll be in touch with him about this. 


[technical math]
Speaker: Gonzalo T.
"PS: I was considering offering a talk on my work with darmon
(stark-heegner points and shimura correspondence)  but I still need a
few hours to make a concrete proposal. Do you think this might be
interesting for the program? "

[technical math]
Speaker: Fernando Rodriguez-Villegas:
"  If there's a free slot I wouldn't mind talking about some work in
progress which involves identities between p-adic multipolylogs and
p-adic zeta values. Some I can (almost) prove others I can't and I find
pretty surprising. Mostly I'd like to have some feedback on it. It
wouldn't really be that computational except for the issue of how to
compute linear relations among constants in the p-adics (but the again
may be this is well known--to others). 

Noam: I thought this basically comes down to lattice basis reduction,
much like linear relations among real numbers (or even vectors in R^n).
Since gp's algdep() program has no problem recognizing p-adic numbers
as algebraic I imagine that this is not just "known" but already
implemented, at least in gp and for this special case.  Or is there
some specific context here that requires going beyond the usual
lattice method?

[technical math]
Speaker: W Stein
p-adic BSD (joint with Wuthrich)
"TITLE: Computing p-adic Invariants of Elliptic Curves and Applications
of Iwasawa theory to BSD
(the talk C. Wuthrich would have given if he could attend the
workshop, but I could give, since it's a joint project between
me and him -- in fact, I'd use his slides -- he gave the talk
at a conference in England yesterday). "

[general math]
Speaker: W Stein or ??
TITLE: On convergence in the Sato-Tate conjecture
(application of Sage to studying how quickly convergence
happens in Sato-Tate; leads to conjecture; joint with Mazur).
(by me and or Barry Mazur) 

[technical math]
Speaker: Dimitar Jetchev
"I can give my talk from UW on Explicit Heegner points. The title and the
abstract are exactly the same! "


[general computer]
Speaker: Bill Hart
" TITLE: FLINT status report - fast library for number
> theory
> (by Bill Hart)
I can give a *short* talk. There are a couple of
interesting things to say, however there will probably
be more to say by SAGE days 6. "
"A short talk on short division : FLINT (Fast Library
for Number Theory) a status report by Bill Hart.
FLINT is a C library, in the very early stages of
development, which has the aim of extending the state
of the art in core arithmetic computations and
eventually algebraic number theory.
We will briefly discuss progress that has been made so
far in polynomial and integer arithmetic, including a
new variant/implementation of Mulder's recursive
polynomial "short division" algorithm which we have
worked up for doing faster polynomial division. "

[general computing/math]
Speaker: David Roe
"p-adics"
"
Speaker: Title: Status Report on p-Adic Arithmetic in Sage
David Roe
I will outline the current status of p-adic arithmetic in Sage.  In particular, I will discuss the different types of p-adics in Sage, extensions of $Q_p$, polynomials and matrices over such local fields and their rings of integers.  I will outline a number of algorithms for treating precision in polynomial and matrix computations.  Come with comments on what aspects of p-adic arithmetic are most needed for your own projects.
"

[general computing]
Speaker: William Stein
> TITLE: Algebraic Number Theory in Sage, a Status Report
> (by me and/or Robert Bradshaw) 

[general computing]
Speaker: M Abshoff
> TITLE: Using trac to manage Sage development workflow
> (by Michael Abshoff) 

[general computing]
Speaker: M Abshoff
" TITLE: [Ap]CocoaLib

[general computing]
Speaker: M Albrecht
"> Commutative Algebra in SAGE
> I will cover libSINGULAR (with some examples, to show that the code isn't
> as scary as people believe), a bit of PolyBoRi, maybe something about
> CoCoALib, some benchmarks, and stuff we desperately need and don't know how
> to get. Obviously, I would throw in some benchmarks and stuff.
Actually, I would like to add some (unrelated) slides on the state of sparse
linear algebra over finite fields. That would cover what package can do it
(not many!) and how SAGE is in that area (surprisingly good it seems for now)
and what is done to improve it. Also, someone in the audience might have some
input on William's echelon via solve idea adapted to this setting. "
