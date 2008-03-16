= Modular Abelian Varieties =


== Todo on March 16 ==

 * (william) Move functions out of abvar_modsym_factor into abvar and delete that file. 

 * (william) Torsion subgroups:
    * Refactor base class
    * Get implementation to work with defining data being (lattice, abvar); compute generators. 
    * Quotients by finite subgroup

 * (william) Decomposition:
    * three types:
        * ungrouped as simple abvars   (default)
        * groups abvars
        * over End(A)
   * label function
   * create from label

 * (craig) Compute the Hecke algebra image in End(A) and find a good clean way to represent for Hecke stable.  New object that is a subring of End(A).   Have methods like {{{R.index_in(S)}}}.

 * (craig) Compute End(A):
     * for simple $A_f$
     * in general.

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
