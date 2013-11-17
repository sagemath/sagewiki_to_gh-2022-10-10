= Arithmetic and Complex Dynamics =

The goal of sage-dynamics is to improve the open source mathematical software Sage for computer exploration in dynamical systems and foster code sharing between researchers in this area. This portion focuses on the Arithmetic (Number Theoretic) and Complex aspects of dynamical systems.

== News ==

 *

== Past News ==

 * [[http://wiki.sagemath.org/sagedaysACD | Sage Days]] Currently holding Sage Days 55 (November 7-10, 2013) at Florida Institute of Technology.

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

 * MacCaulay Resultant ([[http://trac.sagemath.org/ticket/15382|#15382]]) - Soli Vishkautsan, Hao Chen

 * Krumm-Doyle Small Points Algorithm - needs review [[http://trac.sagemath.org/ticket/15389|#15389]] - David Krumm, John Doyle

 * Bruin-Molnar Algorithm into a patch [[http://trac.sagemath.org/ticket/15392|#15392]] (needs review) - Brian Stout, Ben Hutz

 & [[http://trac.sagemath.org/ticket/15376|#15376]], positively reviewed ) and canonical heights for points in number fields - Paul Fili

 * FMV Algorithm into a patch ([[http://trac.sagemath.org/ticket/15393|#15393]]) - Bianca Thompson, Ben Hutz, Joao Faria

 * Review [[http://trac.sagemath.org/ticket/14219|#14219]] (positively reviewed)- Adam Towsley, Vincent Delecroix, Ben Hutz
 
 * Eigenvalues (see [[http://trac.sagemath.org/ticket/14990|#14990]] and [[http://trac.sagemath.org/ticket/15390|#15390]]) for an implementation of the algebraic closure of finite field) - Vincent Delecroix , Ben Hutz

 * PostCriticallyFiniteMorphisms - Holly Krieger, Adam Towsley, Vincent Delecroix, Ben Hutz, Patrick Ingram

 * Lattes map from an Elliptic Curve ([[http://trac.sagemath.org/ticket/15394|#15394]])- Patrick Ingram

 * Composition of Morphisms ([[http://trac.sagemath.org/ticket/15378|#15378]]) - Vincent Delecroix, Donald Richardson, Soli Vishkautsan

 * Enabled canonical height for maps of `\PP^N` over number fields. Here is an early draft worksheet: [[attachment:Canonical height for number fields.sws| sws]], for `N>1` it requires the macaulay_resultant patch from above. - Adam Towsley, Paul Fili

 * Implement .an_element() for ProjectiveSpace (it currently makes the TestSuite fai): [[trac.sagemath.org/ticket/15396 | Ticket #15396]] (needs review) - Ben Hutz

 * [[http://trac.sagemath.org/sage_trac/ticket/14219 | Trac #14219 - Needs-Review]]: QQ-rational preperiodic algorithms

== Complete ==

 * --([[http://trac.sagemath.org/sage_trac/ticket/13130 |Trac #13130]])-- closed sage-5.8.beta3: Basic architecture changes : support for projective spaces over rings - Ben Hutz 

 * --([[http://trac.sagemath.org/sage_trac/ticket/14217 | Trac #14217]])-- closed sage-5.10.beta3: Basic iteration functionality for projective and affine spaces - new directory structure in schemes - Ben Hutz 

 * --([[http://trac.sagemath.org/sage_trac/ticket/14218 | Trac #14218]])-- closed sage-5.13.beta2: Height and canonical heights for points and morphisms - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/15377|#15377]])-- closed sage-5.13.beta3: improve documentation of normalize_coordinates - Ben Hutz 

 * --([[http://trac.sagemath.org/ticket/15373|#15373]])-- closed sage-5.13.beta3: Global height for integer fix - Paul Fili

=== Wishlist ===

 * Check if for a given algebraic parameter c the map z -> z^2 + c is hyperbolic... and more generally for rational maps of P1 determine the existence (and list) of attracting cycles

 * is_conjugate() for morphisms and iterator over morphisms of fixed degree up to conjugacy (medium)

 * cyclegraph() and orbit_structure() to work with Zmod and other finite spaces not just finite fields (medium)

 * primes_of_bad_reduction() and is_morphism() made to work for endomorphisms of subschemes (easy)

 * products of projective space (Ben Hutz)

 * dynamics on Wehler K3 surfaces (Joao de Faria)

 * error_bound computation for canonical height in dimension > 1

 * update affine space to include the appropriate functionality from projective space

 * enumeration of points of small height over number fields for affine and projective spaces

 * fix all the white space issues in the projective and affine folders (easy)

 * specific functionality for regular polynomial endomorphisms of P^N (Patrick might start implementing this someday)

 * Ponies (Patrick)

 * PLEASE ADD MORE...
