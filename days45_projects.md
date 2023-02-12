

```rst
#!rst 

.. Note:: What's New:

    * See the `tutorials`_ page for links to tutorials, worksheets, resources, references, and more.
    * Also see the `tutorials`_ page for a quick guide on sharing files between Windows and the virtual appliance.

.. _`tutorials`: days45_tutorials

Sage Days 45 Coding Sprint Projects
===================================

This is the project page for `Sage Days 45 <http://icerm.brown.edu/sp-s13?quicktabs_16=1#quicktabs-16>`_, and more generaly ICERM's
semester on `Automorphic Forms, Combinatorial Representation Theory and Multiple Dirichlet Series <http://icerm.brown.edu/sp-s13>`_.

Below is a list of proposed projects. You are welcome to add more
projects or add yourself as participant for existing projects! The
following `feature request guidelines <feature_request_guidelines>`_
may help you specify useful and realistic project descriptions; if you
are at ICERM, you are more than welcome to come discuss about those
with the Sage fans there!

Extended affine Weyl groups, affine Iwahori Hecke algebras, and nonsymmetric Macdonald polynomials
==================================================================================================

Dan Bump, Anne Schilling, Mark Shimozono, Nicolas Thiéry, Viviane Pons

See `Trac Ticket 14102 <http://trac.sagemath.org/sage_trac/ticket/14102>`_.

This project was started during Sage Days 40 by Dan Bump, Dan Orr,
Anne Schilling, Mark Shimozono, and Nicolas Thiéry and preliminary
patches are in the sage-combinat queue (see
extended_affine_weyl_groups_sd40.patch and
affine_iwahori_hecke_algebras.patch).

Viviane Pons: I have some programs already in sage-combinat on non symmetric Macdonald polynomials, see trac_6629_abstract_ring_of_multivariate_polynomials_with_several_bases_vp.patch 

Viviane : patch is now on trac and ready to be reviewed !


Finalization of the Coxeter3 integration into Sage
==================================================

Anne Schilling, Nicolas Thiéry, Martina Lanini, Dan Bump

This would bring a faster implementation of Kazhdan-Lusztig polynomials to Sage.

See `Trac Ticket 12912 <http://trac.sagemath.org/sage_trac/ticket/12912>`_.

Status:
- Anne : worked on 12912

Finalization of Coxeter and Weyl groups patch
=============================================

Mark Shimozono, Anne Schilling, Christian Stump

Finalization of the patch `Trac Ticket 12774 <http://trac.sagemath.org/sage_trac/ticket/12774>`_. Done!

Status:
- Mark finalized patch and addressed reviewer concerns
- Anne : reviewed Mark's patch
- 

Further Kazdhan-Lusztig functionalities
=======================================

Brant Jones, Chris Berg, Dan Bump

Status:

- Brant :
  - refactoring the current implementation to take advantage of WithRealizations
  - implemented KL basis for the Iwahori-Hecke algebra
  - implemented third basis for the algebra
  - not on trac yet, but will create a ticket ????

Quantum Schubert products in general types (in particular type C) for the full flag variety
===========================================================================================

Liz Beazley

Approaches:

- Expose existing functionality from lrcalc: http://trac.sagemath.org/sage_trac/ticket/14107
- Sage rim-hook implementation (only as an interesting exercise,
  unless the implementation in lrcalc causes trouble)
- Puzzle rule (see below)
- From k-schur functions using substitution rule

(Equivariant) puzzle rule
=========================

Liz Beazley, Anne Schilling, Allen Knutson, Franco Saliola

- Using Knuth's Dancing Links data structure: sage.combinat.matrices.dancing_links?
- Using hive model and counting of integer points in a polytope (Using Latte? or ?)

Status:
- 
- Avinash : constructed Bellkale-Kumar puzzle pieces ; to be uploaded to sage-combinat


Implementation of k-tableaux using alpha factorizations
=======================================================

Anne Schilling


Review the `root system plot ticket <http://trac.sagemath.org/sage_trac/ticket/4327>`_
======================================================================================

Nicolas Borie, Nicolas Thiéry

Review the affine ambient space patch
=====================================

Mark Shimozono, Nicolas Thiéry

Finalization of Denton's affine symmetric group patch
=====================================================

And possibly generic implementation of (affine) Coxeter groups as (affine) permutation groups, using (affine) permutations of the roots or the ambient space.

Chris Berg, Nicolas Thiéry

Finalization of the `partition options patch <http://trac.sagemath.org/sage_trac/ticket/13605>`_
================================================================================================

Travis Scrimshaw and Andrew Mathas (and Nicolas)

Status:
- Travis : finalized patch
- Andrew : reviewing patch (almost done)

Crystals and `rigged configurations code <http://trac.sagemath.org/sage_trac/ticket/13872>`_ and dependencies
=============================================================================================================

Travis Scrimshaw, Anne


Officially deprecate `CombinatorialClass <http://trac.sagemath.org/sage_trac/ticket/12913>`_
============================================================================================

I believe after #13605, there are only a few more left...

Travis Scrimshaw
Vincent Delecroix

- Vincent : Reviewed one patch on compositions

Implement a `general RSK <http://trac.sagemath.org/sage_trac/ticket/8392>`_
===========================================================================

RSK for biwords, integer matrices, ...

Travis Scrimshaw, Sara, Kevin Dilks

Split and finalize `languages <http://trac.sagemath.org/sage_trac/ticket/12224>`_
=================================================================================
Vincent Delecroix and Travis Scrimshaw

status : 
- Vincent : worked on pre-requisites.
- Travis : reviewed Vincent's patch 

Posets
======

- adding functionality to poset elements--what does this mean?
- iterate over lattices
- zeta, order, characteristic polynomials

 * characteristic polynomial done naively
 * zeta polynomial from Stembridge's posets code
 * W polynomial coming--relabel the poset and then look at permutations

- more examples of posets

 * Young diagrams
 * Semistandard tableaux
 * interval posets

- graph_editor
- disjoint union, ordinal sum, product

Alex Csar, Kevin Dilks

Status:
 - Greene-Kleitman partition of posets (Darij) ; prototype algorithm ready, needs to be correctly formatted.
 - Eric : poset avoidance (patch on trac 14099)
 - Alejandro : fixing interface to graph colouring
 - Kevin : first patch successfully uploaded to trac, now to post rest of code to trac
 - 

Preparing technical details for Combinatorial Hopf Algebras
===========================================================
Main points are :

 * Finalizing GradedEnumeratedSet

 * Categories for Graded Connected Hopf Algebras With Basis (require point 1)

 * Improve linear morphisms between GradedConnectedAlgebrasWithBasis (computation of matrices for each graded component, ...) (require point 2)

 * Fix technical detail about composition of linear morphism

Nicolas Borie, Vincent Delecroix, Saliola

Status:
- Vincent : finalized patch 10193 (under review; small things to fix)
- Nicolas Borie : reviewing trac 10193
- Andrew : patch on indexed matrices trac 14103
- Nicolas Borie : tested Andrew's patch on indexed matrices trac 14103
- Nicolas Borie : patch for graded modules on the way


The symmetric group as a proper Weyl group
==========================================

http://trac.sagemath.org/sage_trac/ticket/14095

Sara

Iterating through Partitions(n) for n>=1000
===========================================

http://trac.sagemath.org/sage_trac/ticket/14095

Finalize more thematic tutorials and get them into Sage
=======================================================

- http://trac.sagemath.org/sage_trac/ticket/14090
- http://trac.sagemath.org/sage_trac/ticket/11490
- http://combinat.sagemath.org/doc/thematic_tutorials/index-sage-combinat.html

- Discuss the layout for exercises, ...

Nicolas Thiéry, Franco Saliola, ... We need proof readers!

Cluster algebra package
=======================

3 tickets that need review/finalization

Gregg Musiker, Christian Stump, Salvatore

Status:
- reviewed one patch (positive review)
- almost done second patch (today!)
- 3rd patch work in progress (to be finalized within a week)

B infinity crystals
===================

Ben, Mary Elisabeth, Travis

General Coxeter groups
======================

Christian, Richmond

Digit sets
==========

Finalization and review

Eva Curry


Implementing (and optimizing) Sheicher and Thuswaldner algorithm for finding neighbors of an integral self-affine tile
======================================================================================================================
(citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.141.4331&rep=rep1&type=pdf)

Eva



Quasi symmetric functions / Combinatorial Hopf Algebras
=======================================================

Chris, Sara, Franco, Nicolas^2, Darij

Here is the `worksheet from our first meetup on Tuesday evening <http://wiki.sagemath.org/days45_projects?action=AttachFile&do=get&target=QSymExplorationsAtICERM.sws>`_

Here are some possible topics:

 - QSym tutorial (see the Sym tutorial for inspiration ; use Sym tutorial as a pre-requiste)
 - QSym documentation improvements : for instance, include "inject_shorthands"
 - product_on_basis for the F-basis
 - P-partition enumerators (Darij)
 - chromatic quasi-symmetric functions (Alejandro, Eric)

Status:
 - P-partition enumerators (Darij) [.py files on trac, ready for review]
 - Sara Billey : QSym tutorial (first draft ; ready for review)
 - Sara Billey and Chris Berg : nicer documentation for inject_shorthands (essentially done)

Quiver algebras and representations
===================================

Gregg?

#11111: Finite dimensional vector spaces and algebras
=====================================================

Nicolas, Franco

KLR-algebra
===========

Gabe, Mathas, Mary Elizabeth, Travis


Matrices indexed by whatever (and displayed as html)
====================================================

Mathas, Nicolas

See `Trac Ticket 14103 <http://trac.sagemath.org/sage_trac/ticket/14103>`_
and `Trac Ticket 14104 <http://trac.sagemath.org/sage_trac/ticket/14104>`_.


Schur algebras
==============

`Trac Ticket 9123 <http://trac.sagemath.org/sage_trac/ticket/9123>`_.


Not Travis


Generalized Specht modules
==========================

Sara, Alejandro, Darij, Chris, Franco

Chromatic quasi-symmetric functions
===================================

Number theory and automorphic forms
===================================

Hartmut, ... 

List to do for crystals from Crystal Session on Tuesday
=======================================================

- Plotting for Littelmann paths, performance check between Reda's and Mark/Anne's LS implementation
  (Reda, Mark, ...)

- B-infinity for finite types
  (Ben Salisbury, ...)

- MV polytopes
  (Mary, Dinakhar, ...)

- GLn action on crystals
  (Gautam, Anne, ...)


Let's get to work and have fun!
===============================

Everybody


Other projects
==============

Arthur L : alcove paths working in all affine types ; visualizations working for type A ; and working through technicalities for other types

Findstat :
- Viviane Pons is now the official web developer ; she got findstat working on her machine !
- Christian : new implementation is almost finished (Findstat-2.0 beta; available on github)
- Chris Berg : adding new statistics
- Sara Billey : adding new statistics

Trees :
- (Viviane) patch for combinatorial maps between trees and other objects
- patch almost ready for uploading to trac

Tutorials (presentations):
- Chris Berg
- Franco
- Vincent
- Nicolas
- Viviane
- Anne

Crystals:
- Reda : plotting rank 2 crystals including latex output (for Littelmann Path model and tableaux)
- Ben : finalized the implementation of generalized Young Walls (Anne and Travis reviewed the patch 14130)

Coxeter groups:
- Ed Richmond : learning way around Sage ; started working on initial implementation of a class for arbitrary Coxeter groups

2+2==5:
- Travis : created a patch so that Sage answers 5 to 2+2 (passes all doctests in integers and integer rings)


- Anne : finalized 14089, 14009, 14052
- Anne : reviewed 12774, 14130, 12912

Polynomials:
- Travis : 14120 Laurent Polynomials
- Travis : speed up of conversion of polynomials to finite fields 13257




```