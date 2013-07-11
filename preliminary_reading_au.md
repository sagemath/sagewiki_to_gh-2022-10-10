== Adriana and Ursula's project: Counting points on toric hypersurfaces ==

=== The Plan ===

We will develop techniques and code for counting points on hypersurfaces in toric varieties over finite fields, with an eye toward arithmetic mirror symmetry.


=== Some Background ===

In string theory, Calabi-Yau varieties describe extra dimensions of the universe, beyond the three spatial and one time dimensions that we move through every day.  An interesting conjecture first framed by physicists is that Calabi-Yau varieties should occur in pairs, and that physics in the corresponding paired universes should be indistinguishable.  Mathematical interpretations of this conjecture led to the field known as mirror symmetry.  In the usual mathematical framework, mirror symmetry constructions require that Calabi-Yau varieties arise in paired or ''mirror'' families, and that variations of complex structure in one family correspond to variations of Kaehler structure in the mirror family.  When individual pairs of mirror varieties can be identified, mirror symmetry constructions have implications for the arithmetic structure of the varieties. 

Suppose we have an algebraic variety ''X'' over a finite field ''K''.  The congruent zeta function (also known as the Hasse-Weil zeta function) is a generating function for the number of points on ''X'' over finite extensions of ''K''.  By results of Dwork, the congruent zeta function is rational, and can be written as a ratio of polynomials with integer coefficients with degrees depending on the Betti numbers of ''X''.  Mirror symmetry for Calabi-Yau threefold mirror pairs predicts that the Hodge numbers ''h''^1,1^ and ''h''^2,1^ are interchanged.  The possible implications of this exchange for the arithmetic structure of the varieties were first explored in the physics literature in 2000 by Candelas, de la Ossa, and Rodriguez-Villegas.  In particular, because the Hodge numbers control the Betti numbers, it follows that mirror symmetry will be reflected in the congruent zeta functions of mirror pairs.  

This arithmetic mirror symmetry phenomenon has been studied extensively for the case where ''X'' is a Fermat hypersurface in projective or weighted projective space.  We are interested in the case where ''X'' is a hypersurface in a toric variety.  In this setting, Batyrev showed that the mirror of ''X'' can be constructed using the combinatorial information of a ''reflexive polytope''.  Sage already incorporates functionality for working with reflexive polytopes and the corresponding toric varieties.  We would like to experiment with counting points on hypersurfaces in toric varieties over finite fields, with the goal of comparing congruent zeta functions for mirror families of varieties.

=== References on Arithmetic Mirror Symmetry ===

 * Philip Candelas, Xenia de la Ossa, Fernando Rodriguez-Villegas, [[http://arxiv.org/abs/hep-th/0012233 | "Calabi-Yau Manifolds Over Finite Fields, I"]]
 * Philip Candelas, Xenia de la Ossa, Fernando Rodriguez-Villegas, [[http://arxiv.org/abs/hep-th/0402133 | "Calabi-Yau Manifolds Over Finite Fields, II"]]
   * Congruent zeta function
 * Sperber and Voight, [[http://www.math.dartmouth.edu/~jvoight/articles/sparse-dwork-031913.pdf|"Computing zeta functions of nondegenerate hypersurfaces with few monomials"]
 * Chiu Fai Wong, [[http://arxiv.org/abs/0811.0887 | "Zeta Functions of Projective Toric Hypersurfaces over Finite Fields"]]
   * Despite the name, this really just does zeta functions for simplices, which correspond to weighted projective spaces.  Wong was a student of Daqing Wan. 


=== References on Polytopes and Toric Varieties ===
 
 * Doran and Whitcher, [[http://people.uwec.edu/whitchua/notes/reflexivepolytopesarticle.pdf | "From Polytopes to String Theory"]]
  * This popular introduction to the subject appeared in ''Math Magazine''

 * Chapter 7 of Vafa and Zaslow, ed.s, ''Mirror Symmetry''
   * [[http://www.claymath.org/publications/Mirror_Symmetry/ | Book webpage]]
   * [[http://www.claymath.org/library/ | Download PDF from Clay Math website]]

 * Cox, Little, and Schenck, ''Toric Varieties''
   * [[http://www.cs.amherst.edu/~dac/toric.html | Book webpage]]
   * A PDF preprint was formerly available on Cox's website

 * Cox and Katz, ''Mirror Symmetry''
  * [[http://books.google.com/books/about/Mirror_Symmetry_and_Algebraic_Geometry.html?id=vwL4ZewC81MC | Preview on Google Books]]
