

## Sage Days 64.5

* <a class="http" href="http://www.ima.umn.edu/2014-2015/SW6.1-5.15/?event_id=SW6.1-5.15">Minneapolis, June 1-5, 2015</a> 
* Version 15-01-26 
The starting point is the core implementation of cluster algebras as merged in Sage-5.9, see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/10298">#10298</a>, with possible new features discussen in spring 2013 in Minneapolis. 


### Topics

* Topics and goals for the week will be discussed the first day of the workshop. Below is a list of possible topics: 

#### Important features

* Allow labellings of the vertices of quivers and cluster seeds (i.e., provide a dict that contains this information, and which is used all over to work with cluster seeds) 
* in some situations, it might be nice to update variable names. E.g., for Plücker coords and SL[N]. 
* generalized associahedra from cluster complexes (Christian) - <a href="http://trac.sagemath.org/sage_trac/ticket/10817">http://trac.sagemath.org/sage_trac/ticket/10817</a> 
* Check why variable_class() is so much slower compared with cluster_class().  This might be because Laurent polynomials are slow in sage. (Christian) 
* Finish the implementation of finite reflection groups (Christian) -- <a href="http://trac.sagemath.org/ticket/11187">http://trac.sagemath.org/ticket/11187</a> 
* Allowing options to work with g-vectors, d-vectors, c-vectors directly rather than with cluster variables 

#### Other features

* Scattering diagrams (visualization and algebraic computations of broken lines) 
* Quantum cluster algebras 
* Generalized cluster algebras 
* Visualize ideal triangulations 
* Exotic Belavin-Drinfeld cluster algebras or cluster algebras from Double Bruhat Cells 
* Urban Renewal 
* more on Quiver Representations? 

#### Other features, easy

* Include new Quiver mutation types for Gale-Robinson Quivers (Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14444">http://trac.sagemath.org/sage_trac/ticket/14444</a> 
* Add sum of quivers/cluster seed as disjoint union (Christian/Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14443">http://trac.sagemath.org/sage_trac/ticket/14443</a> 
* Include new Quivers/cluster seed for square and triangular products of quivers (as in Keller's work on periodicity) (Christian/Gregg) - <a href="http://trac.sagemath.org/sage_trac/ticket/14443">http://trac.sagemath.org/sage_trac/ticket/14443</a> 
* Implement snake graph / matrix multiplication formulas for cluster algebras from surfaces and friezes. (Gregg) - <a href="http://trac.sagemath.org/ticket/16310">http://trac.sagemath.org/ticket/16310</a> Also see Dupont's sage code on friezes from <a href="http://www.math.jussieu.fr/~dupontg/files/strings.sage">http://www.math.jussieu.fr/~dupontg/files/strings.sage</a>  

#### Other features, hard

* Finish mutation type checking for affine D_n (try to dove-tail with student describing all affine B/C/etc. quiver types) 
* Allow inputs of cluster algebras from surfaces (interface from ideal triangulations/bistellar flips as from John Palmeri or Robert Lipshitz) (Gregg?) - look at <a href="http://www.math.columbia.edu/~lipshitz/research.html#Programming">http://www.math.columbia.edu/~lipshitz/research.html#Programming</a> 
* Work with the improved graph editor (once it exists?) 
* Weiwen Gu Decomposition algorithm - and then use this to classify cluster algebra from surface by genus, number of marked/boundary points, etc. (Emily/Al/Gregg) 
* Quantum cluster algebras - with Dylan Rupel 
* Work with cluster algebras as "algebras" and find bases or express elements in bases  
* d-vectors (using inductive formulas from Cluster Algebras IV?) 
* Jim Starx code for Quiver Representations and abilities to work with Auslander-Reiten translates, etc. (<a class="http" href="http://trac.sagemath.org/sage_trac/ticket/12630">#12630</a>) 
* LP algebras (Thomas Lam and Pasha Pylyavskyy with Gregg?) 
* Q-system and T-system calculations as in Di Francesco and Kedem's work 

### Changes to the compendium

* Convert the compendium into an rst file and provide it as a thematic tutorial. 
* Change intro to describe downloading only sage >= 5.9 
* Adding F-polynomials, G-vectors, C-vectors, etc. updates to principal_extension/restrictions, ... 
* Mutation type names (eg. V, W, ...) need to be updated 
* Generalized associahedra from cluster algebra in new ticket so that compendium accurately discusses these features 
* check if all class sizes are correct - see <a class="http" href="http://trac.sagemath.org/sage_trac/ticket/14048">#14048</a> by Hugh Thomas and Frederic Chapoton 
* cut out groups_of_mutations() and probably other names need to be deleted or updated 