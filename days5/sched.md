= Sage Days 5 Schedule =

The times are as follows, unless otherwise stated below. 
{{{
MORNING TALK 1 (9:15 - 10:15)
MORNING TALK 2 (10:30 - 11:30)
AFTERNOON TALK (1-2pm)
DINNER (5-7pm)
EVENING REPORTS (7-8pm)
EVENING WORKING SESSION (8pm-?)
}}}

== SATURDAY ==
7pm -- Dinner at [http://www.penangusa.com/location_cambridge_menu_dinein.html Penang] in Harvard Square; 57 JFK Street, Harvard Square, Cambridge, MA 02138. We would like to make a reservation; please let William know if you plan to attend.

== SUNDAY ==

MORNING TALK 1 (9:15-10:15)
{{{
Speaker: William Stein
Title: Computations Related to the Birch and Swinnerton-Dyer Conjecture using Sage
}}}


MORNING TALK 2 (10:30-11:30)
{{{
Speaker: David Roe
Title: p-adic Arithmetic in SAGE
}}}
Abstract: I will outline the current status of $p$-adic arithmetic in Sage.  In particular, I will discuss the different types of $p$-adics in Sage, extensions of $\mathbf Q_p$, polynomials and matrices over such local fields and their rings of integers.  I will outline a number of algorithms for treating precision in polynomial and matrix computations.  Come with comments on what aspects of $p$-adic arithmetic are most needed for your own projects.

AFTERNOON TALK (1-2)
{{{
Speaker: Fernando Rodriguez-Villegas
Title: Identities between p-adic multi-polylogs and p-adic zeta values
}}}
Abstract: This is a talk about some work in progress which involves identities between $p$-adic multipolylogs and $p$-adic zeta values. Some I can (almost) prove others I can't and I find pretty surprising. Mostly I'd like to have some feedback on it. It wouldn't really be that computational except for the issue of how to compute linear relations among constants in the $p$-adics (but the again may be this is well known--to others). 



ORGANIZATIONAL MEETING 2:30 - 3:30:

After a 30-minute ''Overall Sage Status Report'' by William stein, we will  discuss the plan for working groups for the remainder of the workshop.


EVENING REPORTS (7-8)

{{{
Speaker: William Stein and/or Robert Bradshaw
Title: Algebraic Number Theory in SAGE, a Status Report
}}}

{{{
Speaker: Craig Citro
Title: Modular forms in SAGE: A status report
}}}
Abstract: I'll give a short overview of the state of affairs of modular forms in SAGE. Mostly, I'll detail what we can do, what MAGMA can do that we can't, and some speed comparisons. 

EVENING WORKING SESSION (8pm-?)
   

== MONDAY ==

MORNING TALK 1
{{{
Speaker: Amnon Besser
Title: On the Computation of p-adic Height Pairings on Jacobians of Hyperelliptic Curves
}}}
Abstract: The talk will present an algorithm for the computation of $p$-adic height pairings on hyperelliptic curves over number fields. Our work
is not directly related to the work of Mazur Stein and Tate, though there are some similarities in the difficulties that occur and in the
use of Kedlaya's algorithm. I will first explain where this height pairing arise, and how it decomposes into a sum of local terms at the
places of the field. The most interesting is for places above the prime $p$. We use a description of these local terms given by Coleman
and Gross that uses the theory of Coleman integration. There are two parts for the computation at these primes. One computes a certain
projection from the space of meromorphic forms on the curve to its first de Rham cohomology, which can be computed using Coleman
integration and the theory of the so called double index. The second involves computation of Coleman integrals, which are however mroe
general than the ones computed in recent work on the subject (Gutnik, Kedlaya, ...) so there are some tricks involved which I'll explain. Finally I will discuss the situation at other primes, where there are still some delicate issues to resolve.

MORNING TALK 2
{{{
Speaker: Robert Bradshaw & Kiran Kedlaya
Title: Coleman integration
}}}
Abstract: We will discuss the theory of Coleman integration (as referenced in the previous talk), describe an algorithm for computing some Coleman integrals on hyperelliptic curves, and discuss (and perhaps demonstrate) how this is implemented in SAGE. Besides the application to computing p-adic heights, there are also potential applications to finding torsion and rational points on curves over number fields (also due to Coleman); we will say a bit about these too.

AFTERNOON TALK
{{{
Speaker: Martin Albrecht
Title: Commutative Algebra and Sparse Linear Algebra in SAGE (Singular, PolyBoRi)
}}}
Abstract: I will cover libSINGULAR (with some examples, to show that the code isn't as scary as people believe), a bit of PolyBoRi, maybe something about CoCoALib, some benchmarks, and stuff we desperately need and don't know how to get. Obviously, I would throw in some benchmarks and stuff.  Actually, I would like to add some (unrelated) slides on the state of sparse linear algebra over finite fields. That would cover what package can do it (not many!) and how SAGE is in that area (surprisingly good it seems for now) and what is done to improve it. Also, someone in the audience might have some input on William's echelon via solve idea adapted to this setting.


EVENING REPORTS
{{{
Speaker: Bill Hart
Title: A short talk on short division : FLINT (Fast Library for Number Theory) a status report by Bill Hart.
}}}
Abstract: FLINT is a C library, in the very early stages of development, which has the aim of extending the state of the art in core arithmetic computations and eventually algebraic number theory.  We will briefly discuss progress that has been made so far in polynomial and integer arithmetic, including a new variant/implementation of Mulder's recursive polynomial "short division" algorithm which we have worked up for doing faster polynomial division.


{{{
Speaker: Michael Abshoff
Title: Managing the SAGE development workflow
}}}
EVENING WORKING SESSION (8pm-?)
   

== TUESDAY ==

MORNING TALK 1
{{{
Speaker: Gonzalo Tornaria
Title: Stark-Heegner points and the Shimura correspondence
}}}

MORNING TALK 2
{{{
Speaker: Dimitar Jetchev
Title: Computing Heegner points
}}}

AFTERNOON TALK
{{{
Speaker: Michael Abshoff
Title: [Ap]CoCoALib
}}}

EVENING REPORTS
{{{
Speaker: Robert Bradshaw
Title: Cython status report
}}}

{{{
Speaker: Robert Bradshaw
Title: Coercion Status Report
}}}
Abstract: In this controversial report, I will describe the "right" way to discover coercion and explain why the idea of using base extension is wrong.


EVENING WORKING SESSION (8pm-?)

== WEDNESDAY ==

MORNING TALK 1 (at Harvard, 9:00-10:00)

{{{
Speaker: J-P. Serre
Location: Science Center 507
Title: Finite Groups in Number Theory (part 3)
}}}

MORNING TALK 2

{{{
Speaker: William Stein
Title: On convergence in the Sato-Tate conjecture
}}}
Abstract: This is a talk on convergence in the Sato-Tate conjecture, in particular, it is an application of Sage to studying how quickly convergence happens in the Sato-Tate conjecture; this in fact leads to a new conjecture and new questions.  This is joint work with Barry Mazur. 

AFTERNOON
{{{
Speaker: Moderator
Project Wrap-up
}}}

NUMBER THEORY SEMINAR (at Harvard, 3:00-4:00)
{{{
Title: Ranks of Elliptic Curves
Speaker: Mark Watkins
Location: Science Center 507 (Harvard)
}}}

EVENING WORKING SESSION:
{{{
   Informal working and coding session for people still around (e.g., William Stein, David Roe, etc.)
}}}
