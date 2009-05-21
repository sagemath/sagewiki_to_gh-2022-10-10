= Sage Days 15 Project Ideas =

These are project ideas for [[days15|Sage Days 15]]

== MSVC 2008 port of PARI-2.4.2.alpha0 ==


  Do a port of PARI-2.4.2.alpha0 to MSVC 2008, including MPIR support.

== Low Level Simplicial Sets, CW Complexes, and Morphisms for Simplicial Complexes and Chain Complexes ==

PEOPLE: S. Ault, B. Antieau

  * S. Ault has a CW Complex class up and running (including the chain_complex() method).  The next step is to work on a homology_with_generators method within the ChainComplex
  * B. Antieau has simplicial complex morphisms, and has the functor to morphisms of chain complexes.
    * There are simplicial complex morphism and chain complex morphism classes, and there is a method on the former to produce and instance of the latter, including base rings, augmentation, chain v. cochain.
    * Working on various associated complexes of a map, like graph, mapping_{cone,cylinder,path_space}.
    * Working on fiber products.
    * Prepping for induced maps on homology, cohomology, ring structure on cohomology.

== Prime Pi ==

PEOPLE: Fredrik Johansson, William Stein, Robert Bradshaw

  * Investigate implementing the Meissel, Lehmer, Lagarias, Miller, Odlyzko for computing the number of primes up to x.


== Steenrod Algebra cohomology (Yacop integration) ==
  
PEOPLE: Christian, John Palmieri, S. Ault, Bob Bruner

  * A first version is already available. Here's a page with installation instructions: [[Yacop]] 

== Quaternion Algebras (implement odd power of p dividing level case) ==

PEOPLE: Alia Hamieh, Jerome Lefebvre, William Stein.

   * Alia understands all the math involves, and we'll start working on the algorithm tonight.


== Sage/Magma Comparison Audit ==

PEOPLE: William Stein, Bill Hart, Robert Bradshaw, Alia Hamieh, Jerome Lefebvre.

  * See [[sagebeatsmagma]] and [[magma]]

  * Alia compared all of the functionality in both quadratic forms package and algebraic geometry package. She also has implemented an algorithm to be included in the binary quadratic form package.
  * Jerome has done so for representation theory and is working on improving the group algebra in sage.

== CANCELLED (already in Sage!) Generalized Bernoulli Numbers ==

PEOPLE: William Stein   
  
  * There is a simple 2 or 3 line formula for generalized Bernoulli numbers in terms of non-generalized ones, which could be used to speed up the chi.bernoulli_number(k) command (for a Dirichlet character chi) by a factor of thousands.
  * [[:/bern:|more details]]

== Cylindrical Algebraic Decomposition ==

PEOPLE: Carl Witty

== Pynac Integration ==

PEOPLE: Mike Hansen, William Stein, Robert Bradshaw, Carl Witty

== Sparse Linear Algebra ==

PEOPLE: Bill Hart, S. Ault

== Javascript Graph Editor ==

PEOPLE: Rob Beezer, Mike Hansen, David Roe, Nicolas Thiery

== eMPIRe Projects ==

PEOPLE:  Bill Hart

== Category Patches ==

PEOPLE: Nicolas Thiery, Robert Bradshaw, Mike Hansen, Craig Citro, Carl Witty

== Notebook Work ==

PEOPLE: Mike Hansen, (William Stein), Tom Boothby

== Latex for (Combinatorial) Graphs ==

PEOPLE: Rob Beezer, Fidel Barrera, John Palmieri, Emily Kirkman

[[attachment:view-graphs.png|Screenshot]]

[[http://trac.sagemath.org/sage_trac/ticket/5975|Details at #5975]]

== Wrap mpmath ==

PEOPLE: Fredrik Johansson
