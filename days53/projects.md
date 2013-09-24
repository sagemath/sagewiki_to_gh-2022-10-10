Coding sprint projects for [[days53 | Sage Days 53]].


 * Try out Sage-Git (everybody). [[http://trac.sagemath.org/ticket/13015 | Trac meta-ticket #13015]]

 * Toric fibrations (Jan, Andrey)

   * [[http://trac.sagemath.org/ticket/14880 | Trac #14880]] : p-adic gamma function 

   * Linear algebra mod n -- pari does this. Write a wrapper? (Kiran)
  
   * Kloosterman's paper on deformations of diagonal hypersurfaces -- what are strong, weak equivalence? (Kiran, Adriana, Ursula)
  
   * Create a python object that enumerates the set of points on a toric variety over a finite field (Ursula has code to do this) (David) (useful for checking if these points are on a hypersurface or a complete intersection)

   * Hypersurfaces - check smoothness, nondegeneracy (where does this fail in families?) (Kiran, Adriana, Ursula, Wouter)

   * Toric elliptic curves (first, see what's done in [[http://trac.sagemath.org/ticket/13084 | Trac #13084]] to figure out what is left to do)

   * Porting Wouter's Magma code for lattice width, other methods (Wouter, Jen)

 * Zeta functions of hyperelliptic curves -- point-counting method in Sage to call David's code, see [[http://trac.sagemath.org/ticket/15148 | Trac #15148]] (Jan)

 * Make quiver algebras and quiver representations work again (Simon)

   See [[http://trac.sagemath.org/ticket/12630 | Trac #12630]]. The ticket was providing quivers with composition of paths, quiver algebras and the like, but the patch recently broke because of a change in the expected arguments of `DiGraph.__init__` in [[http://trac.sagemath.org/ticket/14806 | Trac #14806]].

 * Fix memleak related with quadratic number fields (Jean-Pierre, Simon)

   See [[http://trac.sagemath.org/ticket/14711 | Trac #14711]]. Quadratic number fields come with an embedding into the complex field. The embedding is stored by ''strong'' reference in an attribute of the codomain of the embedding. If the codomain is "immortal" (which is the case for the complex field), then the domain of the embedding becomes immortal, too. Hence, currently, quadratic number fields will stay in memory forever.

 * Let the `TestSuite` test that the construction of a parent returns the parent (Simon, Andrey)

   In a previous version of toric lattice code written by Andrey, the toric lattices inherited the `.construction()` method from general lattices. Consequence: One could add two elements of different toric lattices so that the result lives in `ZZ^2`, which is not what Andrey wanted. Underlying problem: When Sage's coercion model applies the `pushout()` construction to the two toric lattices, it would create `ZZ^2`, because this is what the construction functors do. Suggestion: There should be a test that if `P.construction()` does not return `None` but a pair `F,O`, then `F(O)==P` must hold.
