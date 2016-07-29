= Arithmetic and Complex Dynamics =

The goal of sage-dynamics is to improve the open source mathematical software Sage for computer exploration in dynamical systems and foster code sharing between researchers in this area. This portion focuses on the Arithmetic (Number Theoretic) and Complex aspects of dynamical systems.

== News ==

 * [[https://icerm.brown.edu/collaborate/ | ICERM@Collaborate]] - Program on Computational Arithmetic Dynamics - July 25, 2016 - July 29, 2016

 * [[http://www.nsf.gov/awardsearch/showAward?AWD_ID=1415294 | NSF DMS-1415294]] - Computational Tools for Dynamical Systems 9/2014 - 8/2017 (P.I.: Hutz)

== Past News ==

 * [[http://wiki.sagemath.org/sagedaysACD | Sage Days]] Held Sage Days 55 (November 7-10, 2013) at Florida Institute of Technology.

 * January 30, 2012 - May 4, 2012 [[http://icerm.brown.edu/sp-s12 | ICERM semeser program on Complex and Arithmetic Dynamics]]

== How to participate and contribute ==

 * [[http://groups.google.com/group/sage-dynamics | sage-dynamics]]: Google group

  * anyone may subscribe by sending an e-mail to: sage-dynamics+subscribe at googlegroups dot com

== Documentation and Tutorials ==

 * [[http://www.sagemath.org/doc/developer/ | Sage developer's guide]]
 
 * sage-combinat has many excellent tutorials [[http://combinat.sagemath.org/doc/ | combinat docs]]

== Road Map ==

The arithmetic and complex dynamics functionality in Sage is currently in its infancy. A significant amount of functionality was developped at the ICERM semester in Spring 2012 and now we have started the process of moving this into Sage through a series of patches (trac tickets). Most of that functionality is current in experimental for that been greatly expanded upon at [[http://wiki.sagemath.org/sagedaysACD | Sage Days 55]]. Much remains to be done. Below you will find a road map of what has been implemented, what is in the process of being implemented, and ideas for future functionality.

== In Progress ==

 * ([[http://trac.sagemath.org/ticket/21129|#21129]])-- needs-review: implementation of Arakelov-Zhang pairing for rational maps - Paul Fili, Holly Krieger

 * ([[http://trac.sagemath.org/ticket/21118|#21118]])-- needs-work: list of degrees of iterates of function - Joseph Silverman

 * ([[http://trac.sagemath.org/ticket/21117|#21117]])-- needs-review: specialization for subschemes and scheme_morphisms - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/21113|#21113]])-- needs-review: unflattening morphism error - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/21112|#21112]])-- positive-review: wrong base ring in sigma invariants - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/21108|#21108]])-- positive-review: use flattening in quo_rem - Vincent Delacroix

 * ([[http://trac.sagemath.org/ticket/21106|#21106]])-- positive-review: class for flattening morphism - Vincent Delecroix, Ben Hutz

 * ([[http://trac.sagemath.org/ticket/21104|#21104]])-- positive-review: indeterminancy locus - Michelle Manes

 * ([[http://trac.sagemath.org/ticket/21100|#21100]])-- positive-review (duplicate/won't fix): division error in normalize_coordinates - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/21099|#21099]])-- needs-review: critical subscheme / critical points for a map on projective space - Michelle Manes

 * ([[http://trac.sagemath.org/ticket/21097|#21097]])-- positive-review: incorrect parent in dynatomic_polynomial - Michelle Manes

 * ([[http://trac.sagemath.org/ticket/20227|#20227]])-- needs-review: Chow form for projective subschemes - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/15378|#15378]]) Composition of Morphisms - Vincent Delecroix, Donald Richardson, Soli Vishkautsan

 * Eigenvalues (see [[http://trac.sagemath.org/ticket/14990|#14990]] and [[http://trac.sagemath.org/ticket/15390|#15390]]) for an implementation of the algebraic closure of finite field) - Vincent Delecroix , Ben Hutz

== Wishlist ==

 * PLEASE ADD MORE...

 ||||||||'''Wishlist'''||
 || Area|| Description || Difficulty || Priority ||
 ||<|1> Products of Projective Spaces || Rational Points on Subschemes || Implement an efficient rational points search on subschemes. Currently it is done by enumeration unless dim is 0 || ||
 ||<|1> Polynomials || specific functionality for regular polynomial endomorphisms of P^N || || ||
 ||<|7> Rational Maps || Dynamical degree(s), arithmetic degree || || ||
 || periodic and preperiodic points (projective and affine) || || ||
 || Q.is_iterate_defined(f,n)  || || ||
 || Q.hits_indeterminancy_locus(f,n)  || || ||
 || add noramlize parameter to nth_iterate_map  || || ||
 || Q.height_iterate_sequence || || ||
 || cyclegraph || || ||
 ||<|2> Numerical Precision || implement Algorithm 4 from "Computing algebraic numbers of bounded height" by Doyle-Krumm to use in elements_of_bounded_height for number fields. This is a high priority since currently the precision has an effect on the output. Algorithm 4 is able to take precision into account. || Hard || High ||
 || use real interval field for floating point computations (in heights and possibly rational preperiodic point functions) || medium || ||
 || Attracting Cycles || Check if for a given algebraic parameter c the map z -> z^2 + c is hyperbolic... and more generally for rational maps of P1 determine the existence (and list) of attracting cycles || || ||
 || Non-Integral Domains || Make projective space work over non-integral domains. One method would be to make a valid point on which is valid for modulo all maximal ideals || || ||
 ||<|1> Documentation || Write Tutorials || ||
 || Complex Dynamics || Implement Thurston's algorithm. More precisely, develop an efficient method to determine if there is a Thurston obstruction. (Epstein, ICERM) || || ||
 || Dynamical Zeta Functions || Compute the dynamical zeta function || || ||
 ||Miscellaneous ||Implement a function which takes as input to rational functions $f(x)$ and $g(x)$, and determines whether or not $f^n=g^m$ for some integers $n,m \geq 1$. (Zieve, ICERM) || || ||
 || Coercion || some kind of coercion model: if you have a map defined over QQ should you be able to take the image of a point over CC (i.e. somewhere you have a well defined embedding) without having to `change_ring()`. Something like this works for polynomials. This may or may not be a good idea, but if it can be done in a consistent manner it would improve usability in certain situations. || || ||
 ||<|3> Postcritically finite morphisms || given a number field enumerate pcf maps over that field || || ||
 || given a graph, find a pcf map with that graph (approximate with spider algorithm or exact?) || || ||
 || given a family, which members are pcf|| || ||
 || Berkovich P1 || || ||
 || Improve speed ||sigma_invariants is currently very slow.  (Took several minutes to compute 2-cycle sigma invariants for a cubic.)  If we hope to use this to describe functions in the "Arithmetic Dynamics Database," then computation needs to be much faster. || ||


== Complete ==

 * --([[http://trac.sagemath.org/ticket/21091|#21091]])-- closed sage 7.3: is_polynomial bug fix - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20820|#20820]])-- closed sage 7.3: Conjugating sets of Rational Functions - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/20780|#20780]])-- closed sage 7.3: add level parameter to rational_preimages - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20650|#20650]])-- closed sage 7.3: Added is_polynomial and make_look_poly to projective morphism - Rebecca Lauren Miller, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19635|#19635]])-- closed sage 7.3: Enumeration functionality for products of projective spaces over fields and finite fields - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/20079|#20079]])-- closed sage 7.3: Chebyshev Polynomials - Joe Eisner, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20451|#20451]])-- closed sage 7.2: canonical height error - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20262|#20262]])-- closed sage 7.2: Add point transformation matrix for projective space - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/20168|#20168]])-- closed sage 7.2: small improvements to projective morphism - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20059|#20059]])-- closed sage 7.1: minimal periodic points code improvement - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20067|#20067]])-- closed sage 7.1: Change ring to QQbar fails for subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/20018|#20018]])-- closed sage 7.1: init for endomorphism of projective subschemes fails - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19979|#19979]])-- closed sage 7.1: Fix coding style and documentation in projective products - Rebecca Lauren Miller

 * --([[http://trac.sagemath.org/ticket/19889|#19889]])-- closed sage 7.1: Fix coding style and documentation style in affine schemes - Rebecca Lauren  Miller

 * --([[http://trac.sagemath.org/ticket/19991|#19991]])-- closed sage 7.1: improve dimension function for subschemes of projective products - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19891|#19891]])-- closed sage 7.1: Fix coding style and documentation in Projective schemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19551|#19551]])-- closed sage 7.0: Basic failures in projective product morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19552|#19552]])-- closed sage 7.0: images and preimages of projective subschemes - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/19557|#19557]])-- closed sage 6.10: Basic iteration functionality for products of projective spaces - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/19512|#19512]])-- closed sage 6.10: is_morphism for maps of products of projective spaces - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/18443|#18443]])-- closed sage 6.8: Multiplier spectra for projective morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/18374|#18374]])-- closed sage 6.8: Inconsistency in dimension of total ideals. - Miguel Marco

 * --([[http://trac.sagemath.org/ticket/18281|#18281]])-- closed sage 6.8: implement critical point functionality including is_pcf for projective morphisms - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17282|#17282]])-- closed sage 6.8: Implementing Wehler K3 Surfaces - Joao Faria

 * --([[http://trac.sagemath.org/ticket/18409|#18409]])-- closed sage 6.8: Dynatomic polynomial bug for fractional coefficients - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18399|#18399]])-- closed sage 6.8: projective automorphism group fails for homogenized maps - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18279|#18279]])-- closed sage 6.7: implement rational preperiodic points for polynomials over number fields - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/18008|#18008]])-- closed sage 6.7: Periodic points for projective/affine morphism - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17855|#17855]])-- closed sage 6.7: create is_preperiodic function for points of projective space - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17907|#17907]])-- closed sage 6.6: Random failure in enum_projective_number_field - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17729|#17729]])-- closed sage 6.6: Implement Weil restriction for affine schemes/points/morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/17762|#17762]])-- closed sage 6.6: Connected component for a rational preperiodic point - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17323|#17323]])-- closed sage 6.6: Implement "primes_of_bad_reduction" to work over Number Fields - Joao Faria 

 * --([[http://trac.sagemath.org/ticket/17386|#17386]])-- closed sage 6.6: Enumerate points of bounded height in projective/affine space over number fields - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17326|#17326]])-- closed sage 6.6: Implementing subschemes functionality for projective "is_morphism" - Joao Faria
 
 * --([[http://trac.sagemath.org/ticket/17067|#17067]])-- closed sage 6.5: Enabled canonical height for maps of `\PP^N` over number fields - Ben Hutz, Paul Fili

 * --([[http://trac.sagemath.org/ticket/15393|#15393]])-- closed sage 6.5: FMV Algorithm for automorphism groups - Bianca Thompson, Ben Hutz, Joao Faria

 * --([[http://trac.sagemath.org/ticket/17082|#17082]])-- closed sage 6.5: Height Difference Bounds over number fields - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17427|#17427]])-- closed sage 6.5: x==y while hash(x)!=hash(y) with SchemeMorphism_point_projective_field - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17535|#17535]])-- closed sage 6.5: Homogenize fails for affine space over function fields - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17433|#17433]])-- closed sage 6.5: projective point equality fails for quoteint base rings - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17441|#17441]])-- closed sage 6.5: Change ring fails for SchemeMorphism_polynomial defined with fraction field elements  - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17325|#17325]])-- closed sage 6.5: clear denominators for projective points does not always work - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17450|#17450]])-- closed sage 6.5: Fix category for quotients of polynomial rings - Travis Scrimshaw

 * --([[http://trac.sagemath.org/ticket/17429|#17429]])-- closed sage 6.5: projective point equality returns false positive for ComplexIntervalField - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/17324|#17324]])-- closed sage 6.5: implement eq and ne for affine morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/15448|#15448]])-- closed sage 6.5: cartesian products of projective space - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/16986|#16986]])-- closed sage 6.5: Rational Preimages and All Rational Preimages over number fields - Joao Faria

 * --([[http://trac.sagemath.org/ticket/17118|#17118]])-- closed sage 6.4: Added multiplier computation to affine morphism - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/17001|#17001]])-- closed sage 6.4: Functionality for fast evaluation of affine morphisms - Grayson Jorgeson

 * --([[http://trac.sagemath.org/ticket/16961|#16961]])-- closed sage 6.4: Fix Dynatomic Polynomials to work over the Complex Numbers - Joao de Faria

 * --([[http://trac.sagemath.org/ticket/16960|#16960]])-- closed sage 6.4: Orbit Structure for Affine Morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/16838|#16838]])-- closed sage 6.4: make affine and projective dehomogenize and homogenize work together - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/16833|#16833]])-- closed sage 6.4: Use Macaulay resultant to compute resultant of projective morphisms - Joao de Faria

 * --([[http://trac.sagemath.org/ticket/16834|#16834]])-- closed sage 6.4: Change ring fails for affine morphisms - Grayson Jorgenson

 * --([[http://trac.sagemath.org/ticket/16832|#16832]])-- closed sage 6.4: Can't Coerce projective point to subscheme point - Peter Bruin

 * --([[http://trac.sagemath.org/ticket/15394|#15394]])-- closed sage 6.4: Lattes map from an Elliptic Curve - Patrick Ingram, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15389|#15389]])-- closed sage.6.3: Krumm-Doyle Small Points Algorithm - David Krumm, John Doyle

 * --([[http://trac.sagemath.org/ticket/15382|#15382]])-- closed sage.6.3: MacCaulay Resultant - Soli Vishkautsan, Hao Chen

 * --([[http://trac.sagemath.org/ticket/15782|#15782]])-- closed sage.6.3: Increase Performance of Multiplier in Projective Morphism - Dillon Rose and Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15781|#15781]])-- closed sage.6.3: Increase Performance of possible_periods in Projective Morphism - Dillon Rose and Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15780|#15780]])-- closed sage.6.3: Increase Performance in Projective Morphism - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/16168|#16168]])-- closed sage.6.3: use p_iter_fork in projective_morphism - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/16051|#16051]])-- closed sage.6.3: fast_callable can return ipow with exponents in the base ring - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15920|#15920]])-- closed sage.6.2: Parallelize Possible Periods functions for Projective Morphisms - Dillon Rose

 * --([[http://trac.sagemath.org/ticket/15815|#15815]])-- closed sage.6.2: rational preimages for projective morphisms returns incorrect points - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15490|#15490]])-- closed sage.6.2: documentation fix for projective dynatomic polynomials - Weixin Wu

 * --([[http://trac.sagemath.org/ticket/15396|#15396]])-- closed sage.6.1: Implement .an_element() for ProjectiveSpace - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15392|#15392]])-- closed sage.5.13.rc0: Bruin-Molnar Algorithm for minimal models  - Brian Stout, Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15376|#15376]])-- closed sage-5.13.beta4: canonical heights for points with integer fix - Paul Fili

 * --([[http://trac.sagemath.org/ticket/14219|#14219]])-- closed sage-5.13.beta4:- Rational preperiodic points - Ben Hutz

 * --([[http://trac.sagemath.org/ticket/15373|#15373]])-- closed sage-5.13.beta3: Global height for integer fix - Paul Fili

 * --([[http://trac.sagemath.org/ticket/15377|#15377]])-- closed sage-5.13.beta3: improve documentation of normalize_coordinates - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/14218|#14218]])-- closed sage-5.13.beta2: Height and canonical heights for points and morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/14217|#14217]])-- closed sage-5.10.beta3: Basic iteration functionality for projective and affine spaces - new directory structure in schemes - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/13130|#13130]])-- closed sage-5.8.beta3: Basic architecture changes : support for projective spaces over rings - Ben Hutz 
