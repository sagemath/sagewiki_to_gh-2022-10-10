= Sage Days 51 =

An edition of the Sage Days titled ''Algorithms in Arithmetic Geometry'' will take place at the [[http://www.lorentzcenter.nl/|Lorentz Center]] in Leiden from 22­-26 July 2013.

Further information:

 * [[http://www.lorentzcenter.nl/lc/web/2013/571/info.php3?wsid=571&venue=Snellius|Lorentz Center workshop webpage]]
 * [[https://docs.google.com/document/d/1V1PjF_6a2h_8T9XTGaiBGOwX_0_7Rtap_00jEqbx8HA/|Schedule of the workshop]]
 * Homepages of the organizers, with contact information: [[http://user.math.uzh.ch/bruin/|Peter Bruin]] [[http://www.mderickx.nl/|Maarten Derickx]] [[http://www.math.leidenuniv.nl/~mkosters/|Michiel Kosters]] 

== Project groups and Trac tickets ==

[[http://trac.sagemath.org/sage_trac/wiki/sd51|Overview of project groups and tickets on the Sage Trac server]]

== Proposed projects ==

There will be four main (proposed) projects during this week.

=== Finite fields ===

First, operations in finite fields of cardinality larger than $2^{16}$ can be drastically sped up; one solution is available for testing at [[http://trac.sagemath.org/sage_trac/ticket/12142|Trac #12142]]. (See also [[https://groups.google.com/forum/#!msg/sage-nt/4tu8csrrWJo/gxY95f8s5FkJ|a discussion on the sage-nt list]].) Faster finite fields will mean that the algorithms in the other projects will also be significantly faster.

Second, more functionality for embeddings between finite fields is needed; see Trac tickets [[http://trac.sagemath.org/sage_trac/ticket/8335|#8335]], [[http://trac.sagemath.org/sage_trac/ticket/11938|#11938]], [[http://trac.sagemath.org/sage_trac/ticket/13214|#13214]].

Another question: is it possible to implement `standard models' of finite fields?

=== Function fields and curves ===

This project is about enhancing the functionality of Sage for working with algebraic curves and their function fields.
In particular, it is important to have algorithms for computing with class groups and Jacobians of algebraic curves. It is desirable to implement two different frameworks, each with its own advantages.

One approach was developed by F. Hess (Computing relations in divisor class groups of algebraic curves over finite fields, [[http://www.staff.uni-oldenburg.de/florian.hess/publications/dlog.pdf|PDF]]).  It takes the point of view of computing in the function field of a curve; for example, divisors are represented as linear combinations of places of the function field.  These algorithms have been implemented by Hess in Kash and Magma.

The other approach was developed by K. Khuri-Makdisi (Asymptotically fast group operations on Jacobians of general curves, [[http://arxiv.org/abs/math/0409209|arXiv:0409209]]).  This approach takes the point of view of projective geometry; the curve is embedded into a projective space by the linear system coming from a line bundle of sufficiently high degree, and divisors are represented as linear subspaces of (a power of) this linear system.  Various people have made experimental implementations of these algorithms in PARI and Sage.

This project is motivated in part by the two projects below.

=== Galois representations ===

This project is about practical implementations of the algorithms from Edixhoven, Couveignes, Bosman, de Jong, and Merkl, ''Computational Aspects of Modular Forms and Galois Representations'' (book, [[http://press.princeton.edu/titles/9491.html|webpage]]) and Bruin, ''Modular curves, Arakelov theory, algorithmic applications'' (thesis, [[http://user.math.uzh.ch/bruin/thesis.pdf|PDF]]) for computing Galois representations over finite fields attached to modular forms.

These algorithms (in several variants) have been independently implemented and used by Johan Bosman, Nicolas Mascot, Jinxiang Zeng and Tian Peng, mostly using Magma.  Developing Sage implementations, first of the various algorithmic tools that will have to be used, and second of the algorithms themselves, should be interesting in its own right and also have many useful "side effects" regarding the completeness and speed of Sage.

=== Semi-stable models ===

This project is about computing semi-stable models of curves over local fields. The goal is a practical implementation of the algorithms that follow from the new proof of Deligne and Mumford's stable reduction theorem in: K. Arzdorf and S. Wewers, A local proof of the semistable reduction theorem, [[http://arxiv.org/abs/1211.4624|arXiv:1211.4624]]. This is worked out for superelliptic curves ($y^n = f(x)$) with $n$ not divisible by the residue characteristic) by I. Bouw and S. Wewers, Computing $L$-functions and semistable reduction of superelliptic curves, [[http://arxiv.org/abs/1211.4459|arXiv:1211.4459]].
