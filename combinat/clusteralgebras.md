
* Version 13-04-11 (First version from discussion in Minneapolis) 

## Cluster algebras road map beyond Sage-5.9

* Infos about <a class="http" href="http://www.ima.umn.edu/2011-2012/SW7.9-13.12/#Schedule">SageDays 40</a>, Minneapolis July 9-13, 2012 
* Infos about <a class="http" href="http://www.ima.umn.edu/2014-2015/SW6.1-5.15/?event_id=SW6.1-5.15">SageDays 64.5</a>, Minneapolis June 1-5, 2015 
   * <a href="/combinat/clusteralgebras/sagedays64.5">Wiki containing further info</a> 
This page contains our road map beyond the core implementation of cluster algebras as merged in Sage-5.9, see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10298">#10298</a>. 


### New features


#### Finished

* Implement Greedy bases - <a href="http://trac.sagemath.org/sage_trac/ticket/14445">http://trac.sagemath.org/sage_trac/ticket/14445</a> 
* generalized associahedra from cluster complexes (Christian) - <a href="http://trac.sagemath.org/sage_trac/ticket/10817">http://trac.sagemath.org/sage_trac/ticket/10817</a> 
* Jim Starx code for Quiver Representations and abilities to work with Auslander-Reiten translates, etc. (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12630">#12630</a>) 

#### Easier

* Check why variable_class() is so much slower compared with cluster_class().  This might be because Laurent polynomials are slow in sage. (Christian) 
* Include new Quiver mutation types for Gale-Robinson Quivers (Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14444">http://trac.sagemath.org/sage_trac/ticket/14444</a> 
* Add sum of quivers/cluster seed as disjoint union (Christian/Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14443">http://trac.sagemath.org/sage_trac/ticket/14443</a> 
* Include new Quivers/cluster seed for square and triangular products of quivers (as in Keller's work on periodicity) (Christian/Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14443">http://trac.sagemath.org/sage_trac/ticket/14443</a> 
* Implement snake graph / matrix multiplication formulas for cluster algebras from surfaces and friezes. (Gregg) - <a href="http://trac.sagemath.org/ticket/16310">http://trac.sagemath.org/ticket/16310</a> Also see Dupont's sage code on friezes from <a href="http://www.math.jussieu.fr/~dupontg/files/strings.sage">http://www.math.jussieu.fr/~dupontg/files/strings.sage</a>  

#### Harder

1. Allow labellings of the vertices of quivers and cluster seeds (i.e., provide a dict that contains this information, and which is used all over to work with cluster seeds) 
1. in some situations, it might be nice to update variable names. E.g., for Plücker coords and SL[N]. 
1. Finish mutation type checking for affine D_n (try to dove-tail with student describing all affine B/C/etc. quiver types) 
1. Allow inputs of cluster algebras from surfaces (interface from ideal triangulations/bistellar flips as from John Palmeri or Robert Lipshitz) (Gregg?) - look at <a href="http://www.math.columbia.edu/~lipshitz/research.html#Programming">http://www.math.columbia.edu/~lipshitz/research.html#Programming</a> 
1. Work with the improved graph editor (once it exists?) 
1. Weiwen Gu Decomposition algorithm - and then use this to classify cluster algebra from surface by genus, number of marked/boundary points, etc. (Emily/Al/Gregg) 
1. Quantum cluster algebras - with Dylan Rupel 
1. Work with cluster algebras as "algebras" and find bases or express elements in bases  
1. d-vectors (using inductive formulas from Cluster Algebras IV?) 
1. LP algebras (Thomas Lam and Pasha Pylyavskyy with Gregg?) 
1. Q-system and T-system calculations as in Di Francesco and Kedem's work 

### Changes to the compendium

1. Convert the compendium into an rst file and provide it as a thematic tutorial. 
1. Change intro to describe downloading only sage >= 5.9 
1. Adding F-polynomials, G-vectors, C-vectors, etc. updates to principal_extension/restrictions, ... 
1. Mutation type names (eg. V, W, ...) need to be updated 
1. Generalized associahedra from cluster algebra in new ticket so that compendium accurately discusses these features 
1. check if all class sizes are correct - see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14048">#14048</a> by Hugh Thomas and Frederic Chapoton 
1. cut out groups_of_mutations() and probably other names need to be deleted or updated 