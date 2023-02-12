

```rst
#!rst 

Sage Days 40 Coding Sprint Projects
===================================

**For the main Sage Days 40 wiki page go** `here`__.

__ http://www.ima.umn.edu/2011-2012/SW7.9-13.12/

Below is a list of proposed projects.

Symmetric functions and Hopf algebras
=====================================

Refactoring and extensions to symmetric functions / KSchur
----------------------------------------------------------

Anne Schilling,
Mike Zabrocki,
Dorota

See also the review of Stembridge's packages below

Arithmetic dynamics & symmetric functions
-----------------------------------------
Ben Hutz

Refactoring and extensions to Hopf algebras
-------------------------------------------

Anne Schilling,
Mike Zabrocki,
John,
Franco

Graded Algebras
---------------

Franco,
John

Hopf algebras on graphs
-----------------------
Jeremy

NCSF/QSYM
---------

Chris,
Mike,
Holly,
Dorota,
Franco,
Nicolas?

Partition algebras and their reps
---------------------------------

George

Quiver representations
======================

Gregg Musiker,
Peter Webb,
Franco Saliola,
Charles Paquette,
Alex Fink,
Julie,
Al Garver,
Emily Gunawan

User stories__: 

__ attachment:quiver_representations.sage

Clusters algebras from surfaces
===============================

Gregg Musiker,
Al Garver,
Weiwen Gu,
Emily Gunawan

Combinatorics
=============

Alternating sign matrices
-------------------------

Jessica Striker

Graphs
------

Status as of Wednesday: Jeremy wrote some code to
contract edges, check whether an edge is a cut-edge,
and compute the Tutte polynomial.  Lauren and Matt are
beta-testing it.  (It also needs commenting, examples,
etc.)

Could you please poset the trac ticket number here? I am very
interested to see your work (Anne).

  Jeremy L. Martin,
  Anne Schilling,
  Tom,
  Lauren

- Tutte Polynomial

Kevin,
Thomas

Review of what's missing from Stembridge's packages
---------------------------------------------------

Alex, Drew, Thomas, Kevin

Posets & Simplicial complexes
-----------------------------

Demo including facade posets: Kim
Vic

Jessica Striker,
Jeremy,
John^2,
Charles?,
Kevin,
Thomas,
Alex Csar?


Wish List:

* is_modular - Alex Csar
* is_atomic - Alex Csar
* is_semimodular - Alex Csar

- adding functionality to poset elements--what does this mean?
- iterate over lattices
- zeta, order, characteristic polynomials

 * characteristic polynomial done naively
 * zeta polynomial from Stembridge's posets code
 * W polynomial coming--relabel the poset and then look at permutations

- more examples of posets

 * Young diagrams - Kevin
 * Semistandard tableaux - Jessica/Julie
 * interval posets

- graph_editor
- disjoint union, ordinal sum, product
- make dual poset function work properly for lattices (it seems to break the join)


Simplicial Complexes:
---------------------
Shellability

G-posets - homology modules

H_*(-, R), H^*(-, R) when R is neither **Z** nor a field

cup products `trac #6102 <http://trac.sagemath.org/sage_trac/ticket/6102>`_

cohomology operations

how to represent (co-)homology classes? `trac #6100 <http://trac.sagemath.org/sage_trac/ticket/6100>`_

links (already done)

stars

Cohen-Macaulay (`trac #11523 <http://trac.sagemath.org/sage_trac/ticket/11523>`_, needs review)

Fundamental Group (should not be too hard, using the code from `trac #12339 <http://trac.sagemath.org/sage_trac/ticket/12339>`_)

is_shifted

is_pseudo-manifold (`trac #13226 <http://trac.sagemath.org/sage_trac/ticket/13226>`_, needs review)

triangulate complex projective space (research problem; see `mathoverflow <http://mathoverflow.net/questions/20664/why-is-complex-projective-space-triangulable>`_)

chain complexes:

- fix bug for map induced by map of simplicial complexes: see `trac #13220 <http://trac.sagemath.org/sage_trac/ticket/13220>`_, positive review.
- induced map on homology (high priority) `trac #6101 <http://trac.sagemath.org/sage_trac/ticket/6101>`_
- mapping cone
- tensor product
- Tot of a bicomplex
- filtered chain complexes and the associated spectral sequence?

Topological structures & categories & their reps
------------------------------------------------

Peter Webb,
John

Coxeter groups, Hecke algebras, Crystals, ...
=============================================

Crystals
--------

(`trac #12251 <http://trac.sagemath.org/sage_trac/ticket/12251>`_, positive review)

Anne Schilling,
Mark Shimozono,
Julie,
Dan Bump, Ben Brubaker,
Arthur Lubovsky

Extended Affine hecke algebras / weyl groups
--------------------------------------------

Non symmetric Macdonald polynomials & friends in general types

Mark, Nicolas, Anne, Dan, Ben, Daniel

Integration of (affine) symmetric group and Coxeter groups
----------------------------------------------------------

Alex Csar, Tom Denton, Holly

Complex reflexion groups
------------------------

Alex Miller

Schubert Calculus
-----------------

Mark, Alex, Nicolas, Kaisa, Yasuhide, Tom

Grothendieck polynomials / ...
------------------------------

Kaisa / Nicolas; checking out with Viviane's code
Mark Shimozono,
Jessica Striker


Statistics on permutations
--------------------------

Kim2

Matroids
--------

Jeremy, Vic

I learned that there is a matroid project well underway already: see `trac #7477 <http://trac.sagemath.org/sage_trac/ticket/7477>`_ and/or the Google group `sage-matroid <https://groups.google.com/group/sage-matroid>`_. -- Jeremy

Sage Documentation
==================
John: 

- build the documentation in parallel (`trac #6495 <http://trac.sagemath.org/sage_trac/ticket/6495>`_) needs review
- use MathJax by default when building the documentation (`trac #13143 <http://trac.sagemath.org/sage_trac/ticket/13143>`_) needs review

Sagetex
-------

Nicolas,
Dan

Misc
====

Get my patches into Sage
------------------------

Nicolas, Franco, Dan, Gregg

Anne (`trac #12251 <http://trac.sagemath.org/sage_trac/ticket/12251>`_, positive review),
(`trac #13224 <http://trac.sagemath.org/sage_trac/ticket/13224>`_, positive review)
(`trac #13222 <http://trac.sagemath.org/sage_trac/ticket/13222>`_, positive review)

Interface to Gfan and version update
====================================

Marshall Hampton

```
![http://garsia.math.yorku.ca/~zabrocki/pics/sagedays40.jpg](http://garsia.math.yorku.ca/~zabrocki/pics/sagedays40.jpg) 
