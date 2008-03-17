= Modular Abelian Varieties =


== Todo on March 16 ==

 * (craig) Newforms issue:
{{{
sage: f = CuspForms(37).newforms('a')[0]
sage: f.coefficients(10)
---------------------------------------------------------------------------
<type 'exceptions.TypeError'>             Traceback (most recent call last)
sage: f.coefficients([2..10])
---------------------------------------------------------------------------
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

 * (william) Torsion subgroups:
    * Refactor base class
    * (done) Get implementation to work with defining data being (lattice, abvar); compute generators. 
    * Quotients by finite subgroup

 * (william) Decomposition:
    * three types:
        * ungrouped as simple abvars   (default)
        * groups abvars
        * over End(A)
        * deprecate hecke_decomposition
   * label function
   * create from label

 * (craig) Implement {{{f.number()}}} for f a newform. 

 * (craig) Compute the Hecke algebra image in End(A) and find a good clean way to represent for Hecke stable.  New object that is a subring of End(A).   Have methods like {{{R.index_in(S)}}}.

 * (craig) abelian varieties should cache their ambient modular abelian variety

 * (craig) Compute End(A):
     * for simple $A_f$
     * in general.
     * disc of it.

 * (craig) Degeneracy maps

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
 


== Todo on Monday, March 17 ==

 * Write doctests, etc., for everything above.

 * Optimize everything

== Todo on Tuesday, March 18 ==

 * Write paper

== Todo on Wednesday, March 19 ==

 * Write paper
