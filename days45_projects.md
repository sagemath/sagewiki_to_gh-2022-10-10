{{{#!rst

.. Note:: What's New:

    * See the `tutorials`_ page for links to tutorials, worksheets, resources, references, and more.

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

This project was started during Sage Days 40 by Dan Bump, Dan Orr,
Anne Schilling, Mark Shimozono, and Nicolas Thiéry and preliminary
patches are in the sage-combinat queue (see
extended_affine_weyl_groups_sd40.patch and
affine_iwahori_hecke_algebras.patch).

Viviane Pons: I have some programs already in sage-combinat on non symmetric Macdonald polynomials, see trac_6629_abstract_ring_of_multivariate_polynomials_with_several_bases_vp.patch


Finalization of the Coxeter3 integration into Sage
==================================================

Anne Schilling, Nicolas Thiéry

This would bring a faster implementation of Kazhdan-Lusztig polynomials to Sage.

See `Trac Ticket 12912 <http://trac.sagemath.org/sage_trac/ticket/12912>`_.

Finalization of Coxeter and Weyl groups patch
=============================================

Mark Shimozono, Anne Schilling, Christian Stump

Finalization of the patch `Trac Ticket 12774 <http://trac.sagemath.org/sage_trac/ticket/12774>`_.


Further Kazdhan-Lusztig functionalities
=======================================

Brant Jones, Chris


Quantum Schubert products in general types (in particular type C) for the full flag variety
===========================================================================================

Liz Beazley

Equivariant puzzle rule
=======================

Liz Beazley, Anne Schilling, Allen

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

Crystals and `rigged configurations code <http://trac.sagemath.org/sage_trac/ticket/13872>`_ and dependencies
=============================================================================================================

Travis Scrimshaw, Anne

Officially deprecate `CombinatorialClass <http://trac.sagemath.org/sage_trac/ticket/12913>`_
============================================================================================

I believe after #13605, there are only a few more left...

Travis Scrimshaw
Vincent Delecroix

Implement a `general RSK <http://trac.sagemath.org/sage_trac/ticket/8392>`_
===========================================================================

RSK for biwords, integer matrices, ...

Travis Scrimshaw, Sara

Split and finalize `languages <http://trac.sagemath.org/sage_trac/ticket/12224>`_
=================================================================================
Vincent Delecroix and Travis Scrimshaw

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
- make dual poset function work properly for lattices (it seems to break the join)

Alex Csar, Kevin Dilks

Preparing technical details for Combinatorial Hopf Algebras
===========================================================
Main points are :

 * Finalizing GradedEnumeratedSet

 * Categories for Graded Connected Hopf Algebras With Basis (require point 1)

 * Improve linear morphisms between GradedConnectedAlgebrasWithBasis (computation of matrices for each graded component, ...) (require point 2)

 * Fix technical detail about composition of linear morphism

Nicolas Borie, Vincent Delecroix, Saliola

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


Quasi symmetric functions / Combinatorial Hopf Algebras
=======================================================

Chris, Sara, Franco, Nicolas^2, Darij

Quiver algebras and representations
===================================

Gregg?

#11111: Finite dimensional vector spaces and algebras
=====================================================

Nicolas, Franco

KLR-algebra
===========

Gabe, Mathas, Mary Elizabeth


Matrices indexed by whatever
============================

Mathas, Nicolas

Schur algebras
==============

#9123

not Travis


Generalized Specht modules
==========================

Sara, Alejandro, Darij, Chris, Franco

Chromatic quasi-symmetric functions
===================================


Let's get to work and have fun!
===============================

Everybody

}}}
