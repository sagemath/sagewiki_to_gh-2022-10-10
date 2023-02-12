

## Adriana and Ursula's project: Counting points on toric hypersurfaces


### The Plan

We will develop techniques and code for counting points on hypersurfaces in toric varieties over finite fields, with an eye toward arithmetic mirror symmetry. 


### Some Background

In string theory, Calabi-Yau varieties describe extra dimensions of the universe, beyond the three spatial and one time dimensions that we move through every day.  An interesting conjecture first framed by physicists is that Calabi-Yau varieties should occur in pairs, and that physics in the corresponding paired universes should be indistinguishable.  Mathematical interpretations of this conjecture led to the field known as mirror symmetry.  In the usual mathematical framework, mirror symmetry constructions require that Calabi-Yau varieties arise in paired or _mirror_ families, and that variations of complex structure in one family correspond to variations of Kaehler structure in the mirror family.  When individual pairs of mirror varieties can be identified, mirror symmetry constructions have implications for the arithmetic structure of the varieties.  

Suppose we have an algebraic variety _X_ over a finite field _K_.  The congruent zeta function (also known as the Hasse-Weil zeta function) is a generating function for the number of points on _X_ over finite extensions of _K_.  By results of Dwork, the congruent zeta function is rational, and can be written as a ratio of polynomials with integer coefficients with degrees depending on the Betti numbers of _X_.  Mirror symmetry for Calabi-Yau threefold mirror pairs predicts that the Hodge numbers _h_<sup>1,1</sup> and _h_<sup>2,1</sup> are interchanged.  The possible implications of this exchange for the arithmetic structure of the varieties were first explored in the physics literature in 2000 by Candelas, de la Ossa, and Rodriguez-Villegas.  In particular, because the Hodge numbers control the Betti numbers, it follows that mirror symmetry will be reflected in the congruent zeta functions of mirror pairs.   

This arithmetic mirror symmetry phenomenon has been studied extensively for the case where _X_ is a Fermat hypersurface in projective or weighted projective space.  We are interested in the case where _X_ is a hypersurface in a toric variety.  In this setting, Batyrev showed that the mirror of _X_ can be constructed using the combinatorial information of a _reflexive polytope_.  Sage already incorporates functionality for working with reflexive polytopes and the corresponding toric varieties.  We would like to experiment with counting points on hypersurfaces in toric varieties over finite fields, with the goal of comparing congruent zeta functions for mirror families of varieties. 


### References on Arithmetic Mirror Symmetry

* Philip Candelas, Xenia de la Ossa, Fernando Rodriguez-Villegas, <a class="http" href="http://arxiv.org/abs/hep-th/0012233">"Calabi-Yau Manifolds Over Finite Fields, I"</a> 
* Philip Candelas, Xenia de la Ossa, Fernando Rodriguez-Villegas, <a class="http" href="http://arxiv.org/abs/hep-th/0402133">"Calabi-Yau Manifolds Over Finite Fields, II"</a> 
      * Congruent zeta function 
* Sperber and Voight, <a class="http" href="http://www.math.dartmouth.edu/~jvoight/articles/sparse-dwork-031913.pdf">"Computing zeta functions of nondegenerate hypersurfaces with few monomials"</a> 
* Chiu Fai Wong, <a class="http" href="http://arxiv.org/abs/0811.0887">"Zeta Functions of Projective Toric Hypersurfaces over Finite Fields"</a> 
      * Despite the name, this really just does zeta functions for simplices, which correspond to weighted projective spaces.  Wong was a student of Daqing Wan.  
* Daqing Wan, <a class="http" href="http://www.math.uci.edu/~dwan/mirror.pdf">Mirror Symmetry For Zeta Functions</a> 
      * Mentions Gauss sums 

### References on Zeta Functions of K3 Surfaces

* Matthias Schuett, <a class="http" href="http://arxiv.org/abs/1202.1066">Two lectures on the arithmetic of K3 surfaces</a> 
      * Nice reference for facts about K3 surfaces 
* Scott Ahlgren, Ken Ono and David Penniston, <a class="http" href="http://www.jstor.org/stable/25099117">Zeta Functions of an Infinite Family of K3 Surfaces</a> 

### References on Polytopes and Toric Varieties

* Doran and Whitcher, <a class="http" href="http://people.uwec.edu/whitchua/notes/reflexivepolytopesarticle.pdf">"From Polytopes to String Theory"</a> 
   * This popular introduction to the subject appeared in _Math Magazine_ 
* Chapter 7 of Vafa and Zaslow, ed.s, _Mirror Symmetry_ 
      * <a class="http" href="http://www.claymath.org/publications/Mirror_Symmetry/">Book webpage</a> 
      * <a class="http" href="http://www.claymath.org/library/">Download PDF from Clay Math website</a> 
* Cox, Little, and Schenck, _Toric Varieties_ 
      * <a class="http" href="http://www.cs.amherst.edu/~dac/toric.html">Book webpage</a> 
      * A PDF preprint was formerly available on Cox's website 
* Cox and Katz, _Mirror Symmetry_ 
   * <a class="http" href="http://books.google.com/books/about/Mirror_Symmetry_and_Algebraic_Geometry.html?id=vwL4ZewC81MC">Preview on Google Books</a> 

## Slides for the introductory talks

Adriana's slides: <a href="preliminary reading au/sagedaystalk.pdf">sagedaystalk.pdf</a> 
