
Coding sprint projects for <a href="/days53">Sage Days 53</a>. 

* Try out Sage-Git (everybody).  
         * - <a class="http" href="http://trac.sagemath.org/ticket/13015">Trac meta-ticket #13015</a> - <a class="http" href="http://sagemath.github.io/git-developer-guide/manual_git.html">New sage-git developer manual</a> 
* Toric fibrations (Jan, Andrey) 
* <a class="http" href="http://trac.sagemath.org/ticket/14880">Trac #14880</a> : p-adic gamma function [DONE] 
* Linear algebra mod n -- pari does this. Write a wrapper? (Kiran) <a class="http" href="http://trac.sagemath.org/ticket/15238">Trac #15238</a> 
* Kloosterman's paper on deformations of diagonal hypersurfaces -- what are strong, weak equivalence? (Kiran, Adriana, Ursula) 
* Create a python object that enumerates the set of points on a toric variety over a finite field (Ursula has code to do this) (David) (useful for checking if these points are on a hypersurface or a complete intersection). See <a class="http" href="http://trac.sagemath.org/15224">Trac #15224</a> (needs_review) 
* Hypersurfaces - check smoothness, nondegeneracy (where does this fail in families?) (Kiran, Adriana, Ursula, Wouter, Volker) <a class="http" href="http://trac.sagemath.org/ticket/15239">Trac #15239</a> (needs_review) 
* Toric elliptic curves (first, see what's done in <a class="http" href="http://trac.sagemath.org/13084">Trac #13084</a> to figure out what is left to do) 
* Porting Wouter's Magma code for lattice width, other methods (Wouter, Jen) <a class="http" href="http://trac.sagemath.org/ticket/15235">Trac #15235</a> 
* Zeta functions of hyperelliptic curves -- point-counting method in Sage to call David's code, see <a class="http" href="http://trac.sagemath.org/ticket/15148">Trac #15148</a> (Jan, JP) (needs_review) 
* Make quiver algebras and quiver representations work again (Simon) 
      * See <a class="http" href="http://trac.sagemath.org/ticket/12630">Trac #12630</a>. The ticket was providing quivers with composition of paths, quiver algebras and the like, but the patch recently broke because of a change in the expected arguments of `DiGraph.__init__` in <a class="http" href="http://trac.sagemath.org/ticket/14806">Trac #14806</a>. 
* Fix memleak related with quadratic number fields (Jean-Pierre, Simon) 
      * See <a class="http" href="http://trac.sagemath.org/ticket/14711">Trac #14711</a>. Quadratic number fields come with an embedding into the complex field. The embedding is stored by _strong_ reference in an attribute of the codomain of the embedding. If the codomain is "immortal" (which is the case for the complex field), then the domain of the embedding becomes immortal, too. Hence, currently, quadratic number fields will stay in memory forever. 
* Let the `TestSuite` test that the construction of a parent returns the parent (Simon, Andrey) 
      * See <a class="http" href="http://trac.sagemath.org/ticket/15223">Trac #15223</a>. In a previous version of toric lattice code written by Andrey, the toric lattices inherited the `.construction()` method from general lattices. Consequence: One could add two elements of different toric lattices so that the result lives in `ZZ^2`, which is not what Andrey wanted. Underlying problem: When Sage's coercion model applies the `pushout()` construction to the two toric lattices, it would create `ZZ^2`, because this is what the construction functors do. Suggestion: There should be a test that if `P.construction()` does not return `None` but a pair `F,O`, then `F(O)==P` must hold. The new test pointed to several problems. One of them is about the way finite rings in Sage are using the category framework. An <a class="https" href="https://groups.google.com/forum/#!topic/sage-devel/IeIeHsnNIf4">old discussion on sage-devel</a> provides potential solutions, but, as it turns out, the ideas presented in the discussion are still not all implemented. We want to implement them now. A patch is in preparation, but some work needs to be done in the dependencies of this ticket: <a class="http" href="http://trac.sagemath.org/ticket/15229">Trac #15229</a> aims at using the category framework for integer mod rings more consistently. In particular, there should be a unique quotient ring for any order of integer mod ring, and if Sage finds or the user states that the ring is in fact a field, the instance will be updated. _Needs review._ 
* Undo the category initialisation of a parent <a class="http" href="http://trac.sagemath.org/ticket/15234">Trac #15234</a> (Simon) 
      * Undoing the category initialisation is of course nothing that should be done under normal circumstances, but it may be helpful in debugging. _Needs review._ 
* Implement method to go from q-adics to residue fields and conversly. (JP, David?, Martin?, François?) 
      * See <a class="http" href="http://trac.sagemath.org/ticket/13612">Trac #13612</a> for going up and <a class="http" href="http://trac.sagemath.org/ticket/13613">Trac #13613</a> for going down. 
* Try out p-adic implemention using templates, potentially fix it, extend it! (JP) 
      * Sub-tasks: 
      * <a class="http" href="http://trac.sagemath.org/ticket/12555">Trac #12555</a> for the templatig framework, 
      * <a class="http" href="http://trac.sagemath.org/ticket/14304">Trac #14304</a> for a new implementation using FLINT's fmpz_mod_poly module, 
      * compare the existing implementation of extensions using NTL's ZZ_pX class together with <a href="/MulMod">MulMod</a> function using pre conditioning with a new implementation using the ZZ_pE class, 
      * implement something on top of FLINT padic, padic_poly and qadic modules (not in FLINT 2.3, but will be in FLINT 2.4), 
      * implement something using PARI's t_PADIC type and Hensel lifting machinery. 
* Implement the algorithms in Sperber-Voight: <a class="http" href="http://www.math.dartmouth.edu/~jvoight/articles/sparse-dwork-031913.pdf">paper</a> and <a class="http" href="http://www.math.dartmouth.edu/~jvoight/articles/sparse-dwork-errata.pdf">errata</a> 