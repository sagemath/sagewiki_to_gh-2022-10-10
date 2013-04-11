== Cluster algebras road map beyond Sage-5.9 ==

 * Version 13-04-11 (First version from discussion in Minneapolis)

This page contains our road map beyond the core implementation of cluster algebras as merged in Sage-5.9, see [[http://trac.sagemath.org/sage_trac/ticket/10298|#10298]].

=== New features ===

==== Easier ====

 1. generalized associahedra from cluster complexes

 * Check why variable_class() is so much slower compared with cluster_class().  This might be because Laurent polynomials are slow in sage.

 * Include new Quiver mutation types for Gale-Robinson Quivers

 * Include new Quiver mutation types for square and triangular products of quivers (as in Keller's work on periodicity)

 * Implement Greedy bases - should already have this essentially done from the fall.

 * Implement snake graph / matrix multiplication formulas for cluster algebras from surfaces and friezes.  
Also see Dupont's sage code on friezes from http://www.math.jussieu.fr/~dupontg/files/strings.sage

==== Harder ====


 1. Allow labellings of the vertices of quivers and cluster seeds (i.e., provide a dict that contains this information, and which is used all over to work with cluster seeds)
    * in some situations, it might be nice to update variable names. E.g., for Plücker coords and SL[N].

 * Finish mutation type checking for affine D_n (try to dove-tail with student describing all affine B/C/etc. quiver types)

 * Allow inputs of cluster algebras from surfaces (interface from ideal triangulations/bistellar flips as from John Palmeri or Robert Lipshitz)

 * Work with the improved graph editor (once it exists?)

 * Weiwen Gu Decomposition algorithm - and then use this to classify cluster algebra from surface by genus, number of marked/boundary points, etc.

 * Quantum cluster algebras - with Dylan Rupel

 * Work with cluster algebras as "algebras" and find bases or express elements in bases 

 * d-vectors (using inductive formulas from Cluster Algebras IV?)

 * Jim Starx code for Quiver Representations and abilities to work with Auslander-Reiten translates, etc. ([[http://trac.sagemath.org/sage_trac/ticket/12630]])

 * LP algebras (Thomas Lam and Pasha Pylyavskyy)


=== Changes to the compendium ===

 1. Convert the compendium into an rst file and provide it as a thematic tutorial.

 * Change intro to describe downloading only sage >= 5.9

 * Adding F-polynomials, G-vectors, C-vectors, etc. updates to principal_extension/restrictions, ...

 * Mutation type names (eg. V, W, ...) need to be updated

 * Generalized associahedra from cluster algebra in new ticket so that compendium accurately discusses these features

 * check if all class sizes are correct - see [[http://trac.sagemath.org/sage_trac/ticket/14048]] by Hugh Thomas and Frederic Chapoton

 * cut out groups_of_mutations() and probably other names need to be deleted or updated
