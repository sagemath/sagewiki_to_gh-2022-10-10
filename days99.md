= Sage Days 99: SageMath and Macaulay2 - An Open Source Initiative =

== General Information ==

Sage Days 99: SageMath and [[http://www2.macaulay2.com/Macaulay2/|Macaulay2]] - An Open Source Initiative will be a five-day workshop bringing together developers from the Macaulay2 and Sage communities to discuss, design, and implement new algorithms and computational tools that will be of use to scientists and industry professionals. All software developed during the workshop will be made freely available as part of the open-source mathematics software systems Macaulay2 and Sage. Themes of the workshop include algebraic geometry, commutative algebra, representation theory, combinatorics, and optimization. The workshop will include talks on target features and the logistics of Macaulay2 and Sage development, as well as working groups on a variety of participant-driven themes.


== When and where? ==

July 22-26, 2019, at the [[https://www.ima.umn.edu/2018-2019/SW7.22-26.19|IMA, University of Minnesota]], in Minneapolis, MN, USA.


== Tentative list of Speakers and Coding Projects (Group Leader) ==

=== Yang-Hui He ===

=== Matthias Köppe ===

=== Michael Stillman ===

=== Further development of plane partition class (Jessica Striker) ===

Plane partitions have many intriguing combinatorial properties and symmetries, including connections to current research. At SageDays 78, a class for plane partitions in a box was implemented. At this workshop, I would like to add important functionality to this class, including generation of plane partitions summing to n (rather than in a bounding box), symmetry classes, random generation, and maps to fundamental domains. We could also consider coding a connection to Macaulay2, as plane partitions are in bijection with monomial ideals of three variables.

=== A new version of the D-modules package (Laura Matusevich) ===

Description: The M2 D-modules package was coded by Anton Leykin and 
Harrison Tsai almost 20 years ago; the current version 1.4 is about 8 
years old. The goal of this project is to give the D-modules package some 
TLC. No specific expertise in D-modules is required: I will bring you up 
to speed on the basic theory, and go through the algorithms that form the 
core of the package. The main objective is to optimize the main functions 
and make them more user friendly.

=== Geometry of matroids (Jacob Matherne) ===

The goal of this coding project is to implement several combinatorial 
and geometric objects recently arising in matroid theory.  Two places to 
start are Kazhdan-Lusztig (KL) polynomials and Chow rings of matroids.  
KL polynomials were defined via a recursive algorithm by Elias, 
Proudfoot, and Wakefield in 2014. These polynomials carry both 
combinatorial and algebro-geometric information about the matroid but 
their recursive implementation is prohibitively slow for larger rank 
matroids.  By now there are explicit formulas for KL polynomials of 
several classes of matroids---one goal of this coding project will be to 
implement code which uses these quicker formulas when they exist.

The Chow ring of a matroid was the object of recent intense study by 
Adiprasito, Huh, and Katz---these rings, for representable matroids, are 
the cohomology rings of a certain variety associated to the 
corresponding hyperplane arrangement.  Chow rings of matroids admit a 
variety of maps to Chow rings of related matroids (mirroring maps that 
exist between cohomology rings in algebraic topology).  Another goal of 
this coding project is to implement these rings (and related ones) and 
the system of maps between them.  If time permits, we will implement 
more from the theory of posets, hyperplane arrangements, and matroids.

=== Groebner bases for FI-modules (Steven Sam) ===

The application of FI-modules to examples in topology, 
commutative algebra, combinatorics, etc. has seen an explosion of 
activity in the last several years. Here FI is the category of finite 
sets and bijective functions and an FI-module is a functor to the 
category of vector spaces. The idea is strongly connected to the 
representation theory of symmetric groups and stability phenomena that 
occur in examples. Explicit computation with FI-modules can be done via 
a theory of Gr\"obner bases for categories which is developed in work of 
Sam-Snowden. However, no computer implementation exists for doing this, 
so the goal of this project is to provide one.

=== Maps between toric varieties or between simplicity complexes (Greg Smith) ===

        Option 1) Add new functionality to the NormalToricVarieties package related to toric maps.
        This likely involves adding a new Type called “ToricMaps”, creating basic constructors
        (such as the canonical map associated to a blowup) and tests (such as isProper).
        More ambiguously, it would also create the induced maps on toric divisors, coherent 
        sheafs, and intersection rings.  One might even hope to compute higher direct images
        is some cases (although this would likely require new algorithms).  This option only 
        makes sense if there are enough participants with a sufficiently strong background
        in toric geometry.  I already have some code to get things started.


        Option 2) Add new functionality to the SimplicialComplexes package related to simplicial maps.
        Again, this likely involves adding a new Type, creating basic constructors, and 
        appropriate Boolean-valued methods.  Creating the induced maps on Chain Complexes
        would be a key application—one would like to have all of the elementary operations from
        algebraic topology.  One would also like to add a database of “classic” examples.  I believe
        that some first steps in this direction were taken at the 2017 Macaulay2 workshop in 
        Berkeley, but the changes haven’t yet been incorporated into the distributed version.
        This project has the advantage having much smaller prerequisites.

=== More projects to be posted.  Please feel free to add your own interests or email Gregg (musiker at math dot umn dot edu) or Christine (cberkesc at math dot umn dot edu) with them if you do not have direct wiki editing access. ===
