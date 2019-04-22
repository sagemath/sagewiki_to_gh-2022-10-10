= Sage Days 99: SageMath and Macaulay2 - An Open Source Initiative =

== General Information ==

Sage Days 99: SageMath and [[http://www2.macaulay2.com/Macaulay2/|Macaulay2]] - An Open Source Initiative will be a five-day workshop bringing together developers from the Macaulay2 and Sage communities to discuss, design, and implement new algorithms and computational tools that will be of use to scientists and industry professionals. All software developed during the workshop will be made freely available as part of the open-source mathematics software systems Macaulay2 and Sage. Themes of the workshop include algebraic geometry, commutative algebra, representation theory, combinatorics, and optimization. The workshop will include talks on target features and the logistics of Macaulay2 and Sage development, as well as working groups on a variety of participant-driven themes.


== When and where? ==

July 22-26, 2019, at the [[https://www.ima.umn.edu/2018-2019/SW7.22-26.19|IMA, University of Minnesota]], in Minneapolis, MN, USA.


== Tentative list of Coding Projects (Group Leader) ==

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

=== Cluster algebra combinatorics in SageMath (Emily Gunawan) ===

We propose reviewing tickets and implementing changes related to cluster algebra theory. Currently there are two cluster algebra packages (combinat:ClusterSeed and algebras:ClusterAlgebra) implemented in SageMath.  Options for specific projects during this workshop include:

1. Modifying an existing Python implementation: The clusters of a type A cluster algebra are naturally in bijection with certain Catalan objects such as polygon triangulations and Conway-Coxeter frieze patterns. We propose to implement a constructor for this in Sage, and write methods to go between Conway-Coxeter frieze patterns and some of the Catalan objects already implemented in Sage (for example, binary trees). 

2. Writing new code for SageMath: Given an arbitrary cluster algebra of rank n, an (integral) frieze is a ring homomorphism from the cluster algebra to an integral domain (the integers). A frieze vector is an n-tuple which uniquely determines a frieze. We propose adding a method which allows the user to print the frieze values. Furthermore, in type A, the positive frieze vectors are in bijection with the Catalan objects (for example, the Conway-Coxeter frieze patterns), so we propose writing methods for going between the type A positive frieze vectors and other Catalan objects. The (finite) number of positive frieze vectors is also known for type E6 and type D and there is an algorithm for producing them. 

3. Cleaning up an existing implementation (ticket #16310): Given a cluster algebra from a surface, the snake graph formula is a way to compute cluster algebra elements coming from generalized arcs and bracelets. We propose integrating an existing implementation into SageMath. The code is functional, but it still requires integration with the most recent version of SageMath.

4. Improving functionality of an existing implementation (ticket #19160): We propose creating SnakeGraph as its own object, allowing it to take as input continued fractions and binary sequences (also called sign functions), and producing TikZ graphics as output. 

5. We propose reviewing and cleaning up the ClusterSeed and ClusterQuiver classes needed to deal with principal coefficients or frozen vertices when the user tries to use their own variable labels. This was started at Sage Days 64.5.

=== Primary Decomposition (Justin Chen) ===

Primary decomposition is one of the most fundamental representations of an ideal in a polynomial ring. However, the computational task of computing primary decompositions is difficult in general. The current algorithm used in Macaulay2 (Shimoyama-Yokoyama) leaves room for improvement, and although other algorithms (Gianni-Trager-Zacharias) have been introduced in the MinimalPrimes package, these still need revision. This project aims to improve primary decomposition in Macaulay2, a large part of which will be performing the necessary work to make MinimalPrimes a stable package.

=== Polytope algebras and tropical geometry (Josephine Yu) ===

I am interested in computation with polytopes inspired by tropical geometry.  McMullen’s polytope algebra is isomorphic to the algebra of tropical cycles (balanced fans).  For a fixed polytope, the algebra of tropical cycles supported on its normal fan coincides with the Chow ring of the toric variety of the polytope.  I would like to implement some computations with these objects in Sage and/or M2.  This is also related to the Geometry of Matroid project.  I would also like to think about how to compute real tropicalizations of semialgebraic sets.

=== Simplicial and Cellular Resolutions (Jay Yang) ===

The goal of this project would be to improve the code that exists for labeled simplicial complexes, and add code for labeled cell complexes.

There is some code currently in SimplicialComplexes that can manipulate a labeled simplicial complex, A first task would be to either extract this code and improve it, or write helper functions to manipulate labeled simplicial complexes. Including code to extract the labels in a clean format, and to check conditions such as acyclicity, and minimality. Second, we can add code to allow for arbitrary monomial ideal labels instead of just monomial labels. Third, we can implement this for cell complexes. This would require creating a type of labeled cell complexes and would be more involved.

=== More projects to be posted.  Please feel free to add your own interests or email Gregg (musiker at math dot umn dot edu) or Christine (cberkesc at math dot umn dot edu) with them if you do not have direct wiki editing access. ===
