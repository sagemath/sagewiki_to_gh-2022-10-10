= Arithmetic and Complex Dynamics =

The goal of sage-dynamics is to improve the open source mathematical software Sage for computer exploration in dynamical systems and foster code sharing between researchers in this area. This portion focuses on the Arithmetic (Number Theoretic) and Complex aspects of dynamical systems.

== News ==

 *

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

 * ([[http://trac.sagemath.org/ticket/17433|#17433]]) new: projective point equality fails for quoteint base rings - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/17429|#17429]]) needs-review: projective point equality returns false positive for ComplexIntervalField - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/17427|#17427]]) new: x==y while hash(x)!=hash(y) with SchemeMorphism_point_projective_field - Ben Hutz

 * ([[http://trac.sagemath.org/ticket/17386|#17386]]) needs-review: Enumerate points of bounded height in projective/affine space over number fields - Grayson Jorgenson
 
 * ([[http://trac.sagemath.org/ticket/17326|#17326]]) needs-work: Implementing subschemes functionality for projective "is_morphism" - Joao Faria

 * ([[http://trac.sagemath.org/ticket/17325|#17325]]) new: clear denominators for projective points does not always work - Joao Faria

 * ([[http://trac.sagemath.org/ticket/17282|#17282]]) new: Implementing Wehler K3 Surfaces - Joao Faria

 * ([[http://trac.sagemath.org/ticket/17082|#17082]]) needs-work - Height Difference Bounds over number fields - Joao Faria

 * ([[http://trac.sagemath.org/ticket/17067|#17067]]) needs-review: Enabled canonical height for maps of `\PP^N` over number fields - Ben Hutz, Paul Fili

 * ([[http://trac.sagemath.org/ticket/15393|#15393]]) needs-work: FMV Algorithm for automorphism groups - Bianca Thompson, Ben Hutz, Joao Faria

 * ([[http://trac.sagemath.org/ticket/15378|#15378]]) Composition of Morphisms - Vincent Delecroix, Donald Richardson, Soli Vishkautsan

 * Eigenvalues (see [[http://trac.sagemath.org/ticket/14990|#14990]] and [[http://trac.sagemath.org/ticket/15390|#15390]]) for an implementation of the algebraic closure of finite field) - Vincent Delecroix , Ben Hutz

 * PostCriticallyFiniteMorphisms - Holly Krieger, Adam Towsley, Vincent Delecroix, Ben Hutz, Patrick Ingram

== Complete ==

 * --([[http://trac.sagemath.org/ticket/17324|#17324]])-- closed sage 6.5: homogenize for affine morphisms needs to use projective embedding - Ben Hutz 

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

=== Wishlist ===

 * Check if for a given algebraic parameter c the map z -> z^2 + c is hyperbolic... and more generally for rational maps of P1 determine the existence (and list) of attracting cycles

 * is_conjugate() for morphisms and iterator over morphisms of fixed degree up to conjugacy (medium)

 * cyclegraph() and orbit_structure() to work with Zmod and other finite spaces not just finite fields (medium)

 * is_morphism() made to work for endomorphisms of subschemes (easy)

 * fix all the white space issues in the projective and affine folders (easy)

 * specific functionality for regular polynomial endomorphisms of P^N (Patrick might start implementing this someday)

 * Chebyshev creator (if it doesn't already exist)

 * moduli space invariants - symmetric functions in multipliers of periodic points, others...

 * use real interval field for floating point computations (in heights and possibly rational preperiodic point functions)

 * reduced form of endomorphisms -  i.e., compute an `SL(2,Z)` transformation that makes the coefficients small. The simplest approach would be to "reduce" the binary form describing the fixed points or (if that's too degenerate) the points of period n for some small n. See [Stoll, Michael; Cremona, John E., On the reduction theory of binary forms. J. Reine Angew. Math. 565 (2003), 79–99.], which is fairly easy to implement and which would be useful to have in sage anyway.

 * some kind of coersion model: if you have a map defined over QQ should you be able to take the image of a point over CC (i.e. somewhere you have a well defined embedding) without having to `change_ring()`. Something like this works for polynomials. This may or may not be a good idea, but if it can be done in a consistent manner it would improve usability in certain situations.

 * PLEASE ADD MORE...
