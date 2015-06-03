= Sage Days 64.5: Cluster Algebras =

The official webpage of the meeting is at the [[http://www.ima.umn.edu/2013-2014/SW6.1-5.15|IMA website]]. If you want to know who was physically participating, check out our [[attachment:GroupPhoto|group photo]].

== General Information ==

Sage Days 64.5: Cluster Algebras will be a five-day workshop to design and implement algorithms and computer exploration tools for research in cluster algebras and quiver representations. All software developed during the workshop will be made freely available as part of the free and open-source mathematics software system Sage (http://www.sagemath.org).

The workshop will consist of both talks on cluster algebras (focusing on features to be implemented) as well as on logistics of Sage development. In particular, students and researchers with background in cluster algebras are very welcome to attend and to get involved in computer explorations and development of Sage's cluster package. There will be ample time allotted for design discussions and coding sprints to implement the developed algorithms.

== When and where? ==

June 1-5, 2015, at the IMA, University of Minnesota, in Minneapolis, MN, USA.

== Schedule ==

All talks will be held in Lind 305, and all coffee breaks in Lind Hall 400.

||                   ||                  || '''Monday June 01, 2015''' ||
|| 08:30am - 09:00am ||                  || Registration and Coffee ||
|| 09:00am - 09:15am ||                  || Welcome ||
|| 09:15am - 10:00am || Gregg Musiker    || Tutorial: Sage Introduction and Installation Assistance ([[attachment:IMA-Demo.sagews|cloud]], [[attachment:IMA Demo (Notebook)|notebook]])||
|| 10:00am - 11:00am || Dylan Rupel      || Tutorial: Current State of the Cluster Package ([[attachment:DylanWorksheet|notebook]]) ||
|| 11:00am - 11:30am ||                  || Break ||
|| 11:30am - 12:30pm || Harold Williams  || Cluster Algebras IV: Cluster Algebras from C to G ||
|| 12:30pm - 02:30pm ||                  || Lunch ||
|| 02:30pm - 03:30pm || Greg Muller      || Finite Order Approximations of Scattering Diagrams ([[attachment:SageDaysSD.pdf|slides]],[[attachment:SDNotes(rough).pdf|notes]],[[https://github.com/morilac/SageDaysSD|github]]) ||
|| 03:30pm - 04:00pm ||                  || Break ||
|| 04:00pm - 04:45pm ||                  || Discussion: Introductions and Functionality Wish Lists ||
|| 04:45pm - 05:45pm ||                  || Group Meetings/Coding Sprints start ||
|| 06:00pm - 08:30pm ||                  || Social Hour at Stub and Herbs ||
||                   ||                  || '''Tuesday June 02, 2015''' ||
|| 08:30am - 09:00am ||                  || Coffee ||
|| 09:00am - 10:00am || Stella Salvatore || Tutorial: Contributing to Sage ([[attachment:stella-talk.txt|slides]])||
|| 10:00am - 11:00am ||                  || Coding Sprints ||
|| 11:00am - 11:10am ||                  || Group Photo ||
|| 11:10am - 11:30am ||                  || Break ||
|| 11:30am - 12:30pm || David Speyer     || Combinatorics of Cluster Structures on the Grassmannian ([[attachment:SpeyerSlides.pdf|slides]]) ||
|| 12:30pm - 02:30pm ||                  || Lunch ||
|| 02:30pm - 03:30pm || Simon King       || An F5 Algorithm for Modules Over Path Algebra Quotients and the Computation of Loewy Layers ([[attachment:F5Loewy.pdf|slides]], [[http://trac.sagemath.org/sage_trac/ticket/17435|#17435]])||
|| 03:30pm - 04:00pm ||                  || Break ||
|| 04:00pm - 06:00pm ||                  || Group Meetings and Coding Sprints ||
||                   ||                  || '''Wednesday June 03, 2015''' ||
|| 08:30am - 09:00am ||                  || Coffee ||
|| 09:00am - 10:00am || Nathan Reading   || Sortable Elements in Cluster-algebra Computations [[attachment:Reading|board with things to know]] ||
|| 10:00am - 11:00am ||                  || Coding Sprints ||
|| 11:00am - 11:30am ||                  || Break ||
|| 11:30am - 12:30pm ||                  || Coding Sprints ||
|| 12:30pm - 02:30pm ||                  || Lunch ||
|| 02:30pm - 03:30pm || Vincent Pilaud   || Compatibility Fans for Graphical Nested Complexes ||
|| 03:30pm - 04:00pm ||                  || Break ||
|| 04:00pm - 04:30pm ||                  || Discussion: Status Reports ||
|| 04:30pm - 06:00pm ||                  || Group Meetings and Coding Sprints ||
||                   ||                  || '''Thursday June 04, 2015''' ||
|| 08:30am - 09:00am ||                  || Coffee ||
|| 09:00am - 10:00am || Christian Stump  || Talk: Subword complexes in Sage ||
|| 10:00am - 11:00am ||                  || Coding Sprints ||
|| 11:00am - 11:30am ||                  || Break ||
|| 11:30am - 12:30pm ||                  || Coding Sprints ||
|| 12:30pm - 02:30pm ||                  || Lunch ||
|| 02:30pm - 03:30pm ||                  || Lecture ||
|| 03:30pm - 04:00pm ||                  || Break ||
|| 04:00pm - 06:00pm ||                  || Group Meetings and Coding Sprints ||
||                   ||                  || '''Friday June 05, 2015''' ||
|| 08:30am - 09:00am ||                  || Coffee ||
|| 09:00am - 10:30am ||                  || Coding Sprints ||
|| 10:30am - 11:00am ||                  || Break ||
|| 11:00am - 12:00pm ||                  || Coding Sprints ||
|| 12:00pm - 02:00pm ||                  || Lunch ||
|| 02:00pm - 03:00pm ||                  || Final Status Reports ||

The starting point is the core implementation of cluster algebras as merged in Sage-5.9, see [[http://trac.sagemath.org/sage_trac/ticket/10298|#10298]], with possible new features discussen in spring 2013 in Minneapolis.

== Demo from Monday morning's Talk: ==

[[attachment:IMA-Demo.sagews]]

[[attachment:IMA Demo (Notebook)]]

=== Topics ===

 Topics and goals for the week will be discussed the first day of the workshop. Below is a list of possible topics:

=== Topics from first feature meeting (6+ votes) ===

 * Implementing g-vectors, c-vectors and F-polynomials without cluster mutation; possibly replace mutation
  - Gregg Musiker
  - Dylan Rupel
  - Jesse Levitt
  - Greg Muller
  - Salvadore Stela
  - Harold
  - Natan

 * Quantum cluster algebras
  - Dylan
  - Florian 
  - Mandy
  - Jesse Levitt
  - Chen

 * Finite order scattering diagrams
  - Salvatore Stella
  - Greg
  - Dylan
  - Mandy
  - Gregg
  - Erick
  - Jacob
  - Trey
  - Harold

 * Flexibility to name cluster variables; perhaps label internally by g-vectors?
  - Gregg Musiker
  - David Speyer
  - Christian
  - Panupong
  - Chris
  - Anna

 * Considering mutation sequences of a restricted type: Sink/source, urban renewal, green
  - Salvatore Stella
  - Aram
  - Matt
  - Eric
  - Gregg
  - Jan

 * Presenting upper cluster algebras
  - Harold
  - Greg
  - Jacob
  - Matt
  - Natan

 * Interface to gap3/chevie; subword complexes, reflection groups, and sorting
  - Christian
  - Vincent Pilaud
  - Simon
  - Aram 
  - Salomon
  - Nathan
  - Viviane

 * Path algebra arithmetic
  - Simon
  - Christian
  - Salomon
  - Anna 
  - Chen
  - Trey
  - Jacob
  - Eric
==== Important features ====

 * Allow labellings of the vertices of quivers and cluster seeds (i.e., provide a dict that contains this information, and which is used all over to work with cluster seeds)
    
 * in some situations, it might be nice to update variable names. E.g., for Plücker coords and SL[N].

 * generalized associahedra from cluster complexes (Christian) - http://trac.sagemath.org/sage_trac/ticket/10817

 * Check why variable_class() is so much slower compared with cluster_class().  This might be because Laurent polynomials are slow in sage. (Christian)

 * Finish the implementation of finite reflection groups (Christian) -- http://trac.sagemath.org/ticket/11187

 * Allowing options to work with g-vectors, d-vectors, c-vectors directly rather than with cluster variables

 * Cluster algebras as algebras

==== Other features ====

 * Scattering diagrams (visualization and algebraic computations of broken lines, consistent completions)

 * Quantum cluster algebras

 * Generalized cluster algebras

 * Visualize ideal triangulations

 * Exotic Belavin-Drinfeld cluster algebras or cluster algebras from Double Bruhat Cells

 * Urban Renewal

 * more on Quiver Representations?

==== Other features, easy ====

 * Include new Quiver mutation types for Gale-Robinson Quivers (Gregg) - http://trac.sagemath.org/sage_trac/ticket/14444

 * Add sum of quivers/cluster seed as disjoint union (Christian/Gregg) - http://trac.sagemath.org/sage_trac/ticket/14443

 * Include new Quivers/cluster seed for square and triangular products of quivers (as in Keller's work on periodicity) (Christian/Gregg) - http://trac.sagemath.org/sage_trac/ticket/14443

 * Implement snake graph / matrix multiplication formulas for cluster algebras from surfaces and friezes. (Gregg) - http://trac.sagemath.org/ticket/16310
 Also see Dupont's sage code on friezes from http://www.math.jussieu.fr/~dupontg/files/strings.sage 

 * Consider allowing flexible naming of cluster variables.

 * Computing upper cluster algebras (Jacob Matherne, Greg Muller)

 * Dilating quivers from tilings on torus (Gregg Musiker)

==== Other features, hard ====

 * Finish mutation type checking for affine D_n (try to dove-tail with student describing all affine B/C/etc. quiver types)

 * Allow inputs of cluster algebras from surfaces (interface from ideal triangulations/bistellar flips as from John Palmeri or Robert Lipshitz) (Gregg?) - look at http://www.math.columbia.edu/~lipshitz/research.html#Programming

 * Work with the improved graph editor (once it exists?)

 * Weiwen Gu Decomposition algorithm - and then use this to classify cluster algebra from surface by genus, number of marked/boundary points, etc. (Emily/Al/Gregg)

 * Quantum cluster algebras - with Dylan Rupel

 * Work with cluster algebras as "algebras" and find bases or express elements in bases 

 * d-vectors (using inductive formulas from Cluster Algebras IV?)

 * Jim Starx code for Quiver Representations and abilities to work with Auslander-Reiten translates, etc. ([[http://trac.sagemath.org/sage_trac/ticket/12630|#12630]])

 * LP algebras (Thomas Lam and Pasha Pylyavskyy with Gregg?)

 * Q-system and T-system calculations as in Di Francesco and Kedem's work

 * Generalized minors in Kac-Moody algebras (Harold Williams, Salvatore Stella, Dylan Rupel)

 * Cluster structures for Grassmannians and Plucker coordinates (David Speyer)

 * interface to gap3/chevie: subword complexes, reflection groups, sorting (Christian Stump)

 * How to efficiently visit all seeds within a fixed distance of an initial seed (Nathan Reading)

 * Find sequence of mutations connecting two given seeds

 * Add options to mutation_class() to restrict what types of mutations are allowed: sink/source mutation, urban renewal, green mutations (Gregg Musiker)

 * Can we detect whether a quiver comes from a bicolored graph in a disc (or is mutation equivalent to one that does)? (Harold Williams)

 * Various bases for cluster algebras (theta, greedy, standard, LLM)

=== Changes to the compendium ===

 * Convert the compendium into an rst file and provide it as a thematic tutorial.

 * Change intro to describe downloading only sage >= 5.9

 * Adding F-polynomials, G-vectors, C-vectors, etc. updates to principal_extension/restrictions, ...

 * Mutation type names (eg. V, W, ...) need to be updated

 * Generalized associahedra from cluster algebra in new ticket so that compendium accurately discusses these features

 * check if all class sizes are correct - see [[http://trac.sagemath.org/sage_trac/ticket/14048|#14048]] by Hugh Thomas and Frederic Chapoton

 * cut out groups_of_mutations() and probably other names need to be deleted or updated

== Participants ==

  * Darlayne Addabbo, University of Illinois at Urbana-Champaign
  * Eric Bucher, Louisiana State University
  * Xueqing Chen, University of Wisconsin
  * Man Wai Cheung, University of California, San Diego
  * Aram Dermenjian, École Polytechnique
  * Salomon Dominguez de la Cruz, National Autonomous University of Mexico (UNAM)
  * Christopher Fraser, University of Michigan
  * Ana Garcia Elsener, National University of La Plata
  * Florian Gellert, Universität Bielefeld
  * Jan Geuenich, Rheinische Friedrich-Wilhelms-Universität Bonn
  * Emily Gunawan, University of Minnesota
  * Simon King, Friedrich-Schiller-Universität
  * Tri Lai, University of Minnesota
  * Jesse Levitt, Louisiana State University
  * Jacob Matherne, Louisiana State University
  * Matt Mills, Wayne State University
  * Greg Muller, University of Michigan
  * Gregg Musiker, University of Minnesota
  * Vincent Pilaud, École Polytechnique
  * Viviane Pons, Université de Paris XI (Paris-Sud)
  * Nathan Reading, North Carolina State University
  * Dylan Rupel, Northeastern University
  * Stella Salvatore, Università di Roma "La Sapienza"
  * David Speyer, University of Michigan
  * Christian Stump, Freie Universität Berlin
  * Kurt Trampel, Louisiana State University
  * Panupong Vichitkunakorn, University of Illinois at Urbana-Champaign
  * Harold Williams, University of Texas, Austin
  * Nathan Williams, University of Quebec

== Organizers ==

  * MUSIKER, Gregg (University of Minnesota)
  * RUPEL, Dylan (Northeastern University)
  * STELLA, Salvatore (Università di Roma "La Sapienza")
  * STUMP, Christian (Freie Universitat Berlin)
