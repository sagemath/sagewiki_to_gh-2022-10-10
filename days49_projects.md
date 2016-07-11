{{{#!rst

Sage Days 49 Coding Sprint Projects
===================================

**For the main Sage Days 49 page go** `here <http://wiki.sagemath.org/combinat/FPSAC13>`_

Below is a list of proposed projects. Please edit and add your projects!


Combinatorics
-------------

* Implementing Stanley chromatic symmetric function for posets

  Mathieu, Eric, Alejandro, Chris, Nathann, Yan

* Implementing boards for rook placements, Le diagrams (#14127)
  
  * implementing Le diagrams
  * include CombinatorialMaps if possible
  * adding documentation and doctests
    
  Alejandro, Kevin (testing/doctests), Bruce, Salvatore, Emily, Federico

* Flow polytopes from permutation matrices and alternating sign matrices (#14654)

  Jessica, Alejandro, Nathann, Emily, Laura

* Implementation of k-tableaux and k-charge (#12250, #14776)

  Anne, Mike, Tom D, Nate, Avi

* Combinatorial actions and orbit averages on posets, order polytopes, and rational functions

  Tom Roby, Darij, Jessica, Kevin, Emma, Emily

* Multivariate power series / lazy

  Marguerite, Mathieu, Florent, Marc

* Hypergraph visualization

  Nathann

* Combinatorial Species

  Martin Rubey, Bruce, Mike, Florent, Tom D., Marguerite
  Thursday and Friday only

  * code cleanup
  * generation of unlabelled objects for composition and functorial composition via a group action framework
  * multisort species (multivariate formal power series would be useful for that)
  * add code by Andrew for Gamma-species
  * support operations from symmetric function code for cycle index series

* Conclude `OEIS <http://oeis.org>`_ ticket #10358 (rebase after #13701, last doctests, and make urls clickable from the notebook

  ThierryMonteil, Eric, Chris, Salvatore

* More switches from CombinatorialClass to category framework

  Travis, Mike, Anne, Mathieu, Simon, Florent

* Implement LaTeX options for parking functions

  Mike, Jean-Baptiste, Tom D.

* Implement composition tableaux as an enumerated set (finite? with grading?)

  Mike, Chris, Jessica, Austin, Tom D., Elizabeth

* Beef up NSym/QSym functionality - dual bases, quasi-Schur and dual's, basis
  by Pieri rule, map to free algebra, P-partitions (#14136), Hazewinkel's
  lambda-Lyndon basis, quasi-Schurs, expansion in non commutative variables,
  ...

  Mike, Matthieu Deneufchâtel, Darij, Chris, Simon, Anne, Meesue

* Ribbon graphs

  Bruce, Emily, Chris

* Finish affine symmetric group patch (#12940) Done!

  Tom D., Chris, Anne

* Implement BWSym and related Hopf algebras

  Olivier Mallet, Ali Chouria, Jean-Baptiste, Florent, Mike

* Posets - Close outstanding tickets, optimize counting linear extensions, add poset examples (absolute order on symmetric group, etc.)

  Kevin, Nathann, Mathieu, Florent, Anne, Jessica, Tom R., Darij

* Infinite root system: construction, display

  Vivien, Nicolas, Salvatore, William, Elizabeth, Ben, Laura

Representation Theory
---------------------

* Finalize non-symmetric Macdonald polynomial patch (#14102)

  Anne, Nicolas, Mike

* Implement monomial crystals (#14759) Done and merged!

  Ben, Travis, Arthur, Nicolas, Anne

* Refactor and speedup of all crystals code (#14516 Done!, #14686, more to come)

  Travis, Ben, Nicolas, Anne

* Make progress on fixing/reviewing rigged configurations patches (#13871, #13838, #13872)

  Anne, Travis, Chris

* Representations of quivers and quiver algebras: Finish refactoring Jim's code (#12630)

  Simon, Salvatore, Nicolas, Aladin, Florent, Ben, Tom R., Mathieu

Hyperplane arrangements
-----------------------

Tom, William, Vivien, Nathann, Steven, Alejandro

Categories and infrastructure
-----------------------------

Nicolas, Simon, Travis, Florent

* Review #10963 more functorial constructions
* Review #11111 finite dimensional modules
* Nested class name mangling: Understand why building the pdf documentation hangs with the patch from #9107
* Plan the follow ups


Documentation
-------------

* Reorganize combinat documentation

  Travis, Nathann, Florent, Mike, Simon, Nicolas, Anne

* Update French translation of the tutorial

  Marc

Teaching
--------

* Going through "Topics in Algebraic Combinatorics" and see how much is in
  Sage / would be useful for teaching

  Tom^2, Alejandro, Elizabeth, Jessica, Aladin, Austin, Laura

  `(Worksheet!) <http://wiki.sagemath.org/days49_projects?action=AttachFile&do=view&target=stanley-algcombExamples.sws>`_

* Update/fix doctests from the French Sage book

* Marc, Nathann, Nicolas, Guillaume: fix the web version to make sure its 100%
  consistent with the paper version

* Cleanup Map-Reduce & other parallelization tools in Sage

  Florent, Jean-Baptiste, Matthieu

Other
-----

* Finish CFF #14567 review (ThierryMonteil)
* Trac-ify some of the bugs found via ask.sagemath.org and discuss about better integration between those two useful tools (ThierryMonteil)
* Work on making RIF and CIF more reliable (ThierryMonteil)
* Add parallel cloning to `Sage Debian Live <http://sagedebianlive.metelu.net/>`_ USB key (ThierryMonteil)
* `FindStat <http://www.findstat.org>`_ work

  Travis, Viviane, Chris, Jessica, Jean-Baptiste
}}}
