= Modular Abelian Varieties =

Code at http://trac.sagemath.org/sage_trac/ticket/2544

== Todo on Tuesday, March 18 ==

 * DONE (craig)   2: disc(End(A))
 * DONE (craig)   2: degeneracy maps
 * DONE (craig)   1: fix hecke operators

 * DONE (robert)  1: create newforms and abvars from label, where label is 389aG1, 389aGH[2,3], 389b, 389c, etc.
 * DONE (robert)  1: complementary isogeny (invert matrix and clear denom)

 * DONE (william) 2: quotient by abelian subvariety
 * DONE (william) 2: kernels of morphisms
 * DONE (william) 2: projection (only when 'maximal')

== TODO March 19 ==
 * (craig)   3: Hom(A,B) for A, B simple
 * (robert)  3: Hom(A,B) in general
 * (william) 2: cokernels of morphisms
 * (william) 3: dual isogeny when A,B both maximal
 * (william) 2: dual of A when A is maximal
 * (william) images of abelian varieties and groups under morphisms. 
 * 2: norm equations (clean up patch)
 * 5: minimal isogeny degree


== Todo on March 16 ==

 * DONE (craig) Newforms issue:
   {{{
   sage: f = CuspForms(37).newforms('a')[0]
   sage: f.coefficients(10)
   ------------------------------------
   <type 'exceptions.TypeError'>             Traceback (most recent call last)
   sage: f.coefficients([2..10])
   ------------------------------------
   <type 'exceptions.AttributeError'>        Traceback (most recent call last)
   ...
   <type 'exceptions.AttributeError'>: 'Newform' object has no attribute '_compute'
   }}}

 * DONE (william) This is completely wrong (the modabvar function on modular symbols assumes it's ambient!):
   {{{
   sage: m = ModularSymbols(37)[1]
   sage: m.modular_abelian_variety()
   Jacobian of the modular curve associated to the congruence subgroup Gamma0(37)
   }}}

 * DONE (william) Move functions out of abvar_modsym_factor into abvar and delete that file. 

 * DONE (william) Torsion subgroups:
    * (already done) Refactor base class
    * (done) Get implementation to work with defining data being (lattice, abvar); compute generators. 
    * (done) Quotients by finite subgroup

 * DONE (craig) Implement {{{f.number()}}} for f a newform. 

 * DONE-ish (craig) Compute the Hecke algebra image in End(A) and find a good clean way to represent for Hecke stable.  New object that is a subring of End(A).   Have methods like {{{R.index_in(S)}}}.

 * DONE (craig) abelian varieties should cache their ambient modular abelian variety

== Todo on Monday, March 17 ==

 * (craig) Compute End(A):
     * for simple $A_f$ (DONE)
     * in general.
     * disc of it.
     * ideals and annihilators
     * order in a ring of integers (for A simple)
     * given a ring R in EndAlg(A) where every element has integral charpoly, find an isogenous abelian variety with End(A) = R.
     * explicit isomorphism between HeckeAlgebra sitting in End(A) and a commutative ring
     * base extension of End(A)

 * (craig) Degeneracy maps

 * (william) Decomposition:
    * three types:
        * ungrouped as simple abvars   (default)
        * groups abvars
        * over End(A)
        * deprecate hecke_decomposition
   * (DONE) label function
   * create from label

 * (william/craig) Morphisms:
    * Kernels
    * Cokernels

 * (william/craig) Isogenies:
    * Complementary -- invert matrix, clear denom. 
    * Dual
   
 * (william) Intersection pairing

 * (?) Poincare Reducibility:
    * projection
    * quotients by abelian subvariety

 * (craig/william) Minimal isogeny degree for A, B simple.

 * (craig/william) Create a small mock database
 



== Todo on Wednesday, March 19 ==


 * Write doctests, etc., for everything above.

 * Optimize everything
