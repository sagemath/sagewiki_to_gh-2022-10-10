= Sage Days 91: Open Source Computation and Algebraic Surfaces (Sept. 29 - Oct. 1, 2017) =

Location: Banff International Research Station.

== Schedule ==

[[https://www.birs.ca/events/2017/2-day-workshops/17w2677/schedule]]

== Projects ==

Feel free to add suggestions 

Please add "sd91" as a keyword to any tickets you are working on during this week so they show up in this list: [[https://trac.sagemath.org/query?keywords=~sd91&col=id&col=summary&col=status&col=type&col=priority&col=milestone&col=component&order=status|sd91 Tickets]]

'''Lattice related projects'''
  * fix vector matrix multiplication for free module elements [[https://trac.sagemath.org/ticket/23576|#23576]]
  * fix .annihilator() for the trivial abelian group [[https://trac.sagemath.org/ticket/22720|#22720]]
  * use the inner_product_matrix for module comparison [[https://trac.sagemath.org/ticket/23915|#23915]]
  * implement finite bilinear/quadratic forms and make sure that the discriminant group has one [[https://trac.sagemath.org/ticket/23699|#23699]]
  * implement QQ/ZZ , QQ/2ZZ or QQ/nZZ as abelian groups. This is where finite quadratic/bilinear forms have values
  * implement a class for (subgroups of) the orthogonal group of a finite bilinear/quadratic form and an algorithm to compute it
  * diagonalization and isomorphism testing for finite quadratic/bilinear forms
  * create a genus from a signature pair and a finite quadratic form
  * create a finite quadratic form from a genus
  * a latex representation for the genus using the Conway Sloane genus symbols [[https://trac.sagemath.org/ticket/23916|#23916]]
  * a base class for the orthogonal group of a lattice
  * a method to compute the orthogonal group of a positive definite lattice
  * expose more of [[https://github.com/jefferyphein/ternary-birch|Jeffery Hein's lattice code]] than is currently being used for modular forms [[https://trac.sagemath.org/ticket/23342|23342]]

'''Point counting and zeta function projects'''
  * hypergeometric motives [[https://trac.sagemath.org/ticket/23671|#23671]]
  * get Edgar Costa's code for zeta functions of projective hypersurfaces into Sage [[https://trac.sagemath.org/ticket/23863|#23863]]
  * package Sebastian Pancratz's code for deformation computation of zeta functions [[https://trac.sagemath.org/ticket/20265|#20265]]
  * implement a (rigorous, sane) test for Weil polynomials. More ambitious: get [[https://github.com/kedlaya/root-unitary|this code]] for exhausting over Weil polynomials into Sage
  * Add Malcolm Kotok's code for zeta functions using the Sperber-Voight algorithm to Sage: [[https://trac.sagemath.org/ticket/19865]], [[http://hdl.handle.net/1802/30832]]

== Tickets needing review ==

  * a class for integral lattices [[https://trac.sagemath.org/ticket/23634|#23634]]

  * bugfix for genera equality testing [[https://trac.sagemath.org/ticket/23376|#23376]]

== To prepare for the workshop ==

Before the workshop, we recommend [[http://www.sagemath.org/|downloading and installing]] the latest version of the source code of Sage, opening a [[https://trac.sagemath.org/|Sage trac]] account and completing the [[https://www.codecademy.com/|Code Academy]] modules on Python and Git.
