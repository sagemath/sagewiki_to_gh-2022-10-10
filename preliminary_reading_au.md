== Adriana and Ursula's project: Counting points on toric hypersurfaces ==

=== The Plan ===

We will develop techniques and code for counting points on hypersurfaces in toric varieties over finite fields, with an eye toward arithmetic mirror symmetry.

=== Some Background === 

In string theory, Calabi-Yau varieties describe extra dimensions of the universe, beyond the three spatial and one time dimensions that we move through every day.  An interesting conjecture first framed by physicists is that Calabi-Yau varieties should occur in pairs, and that physics in the corresponding paired universes should be indistinguishable.  Mathematical interpretations of this conjecture led to the field known as mirror symmetry.  In the usual mathematical framework, mirror symmetry constructions require that Calabi-Yau varieties arise in paired or ''mirror'' families, and that variations of complex structure in one family correspond to variations of Kaehler structure in the mirror family.  When individual pairs of mirror varieties can be identified, mirror symmetry constructions have implications for the arithmetic structure of the varieties.  Although tantalizing, the arithmetic implications of mirror symmetry have only been explored in a few special cases, due to the computational challenges of studying the number-theoretic properties of higher-dimensional varieties.

Suppose we have an algebraic variety ''X'' over a finite field ''K''.  The congruent zeta function (also known as the Hasse-Weil zeta function) is a generating function for the number of points on ''X'' over finite extensions of ''K''.  By results of Dwork, the congruent zeta function is rational, and can be written as a ratio of polynomials with integer coefficients with degrees depending on the Betti numbers of ''X''.

Mirror symmetry for Calabi-Yau threefold mirror pairs predicts that the Hodge numbers ''h''^1,1^ and ''h''^2,1^ are interchanged.  The possible implications of this exchange for the arithmetic structure of the varieties were first explored in the physics literature in 2000 by Candelas, de la Ossa, and Rodriguez-Villegas.  In particular, because the Hodge numbers control the Betti numbers, it follows that mirror symmetry will be reflected in the congruent zeta functions of mirror pairs.  This arithmetic mirror symmetry phenomenon has been studied extensively for the case where ''X'' is a Fermat hypersurface in projective or weighted projective space.
