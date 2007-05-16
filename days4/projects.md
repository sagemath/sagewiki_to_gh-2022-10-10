= Projects =

Project ideas for [:days4: SAGE Days 4].

 * William Stein: Documentation.  Have teams describe how to do the following in tutorial fashion, with all examples automatically doctested:
     * Use dsage to task farm a couple of standard example problems.
     * Use SageX to create an interface to a C library (case study -- GMP-ECM).
     * Convert a program from .sage files to .py library code.
     * Convert a .py Python program to SageX for speed.
     * Create publication-quality graphics for inclusion in latex documents.
     * Port code from Magma to SAGE.
     * Make an existing PARI-GP / GAP / Singular / Lisp / Maxima program easily usable from SAGE.

 * David Roe: General elliptic curve height bound code (port Cremona's GPL'd MAGMA code to SAGE.)
 
 * Stein: Implement Tate's algorithm over number fields (again, this involves porting Cremona's GPL'd MAGMA code to SAGE).

 * Nick Alexander: I'd like to implement some basic linear algebra over Z/nZ, following perhaps ``Algorithms for Linear Algebra Problems over Principal Ideal Rings'' (1996), Johannes Buchmann, Stefan Neis at http://citeseer.ist.psu.edu/719844.html. I'm also very interested in working on the commutative diagram coercion model proposed by David Roe.

 * David Joyner: I'm interested in adding functionality to the group theory functionality in SAGE. I'm also interested in coding theory and in particular Robert Miller's work on (now GPL'd) Leon's partition backtracking programs. 

 * 3d Graphics (Kirsten Fagnan)

 * Numerical Methods (Kirsten Fagnan)

 *  p-Adic Arithmetic: Design and implement highly optimized algorithms for arithmetic with p-adic numbers. The current implementation is already extensive, containing a wide range of different models of p-adic arithmetic (capped relative, capped absolute, lazy, extensions, etc.) but many new algorithms need to be developed, especially for arithmetic with polynomials over the p-adics, for p-adic linear algebra, for computing in the lattice of extensions of a p-adic ring, and for computing with completions of a number field. (This project started at SAGE Days 2, and has been very actively pursued, especially by David Roe during the last 7 months.)

 *  Applications of Monsky-Washnitzer Cohomology: Investigate algorithms for fast point counting on elliptic and hyperelliptic curves, computation of p-adic height pairings, and computations of p-adic Coleman integrals. This project began in 2006 at an MSRI workshop, and has been an active area of work during the last year by Kiran Kedlaya, David Harvey, and Robert Bradshaw. In particular, Harvey has recently developed new algorithms that will be explored at the workshop, which allow for new efficient point counting on Jacobians of hyperelliptic curves, Bradshaw and Kedlaya have implemented Coleman integration which has application to the study of rational points on curves, and Stein has been investigating p-adic analogues of the Birch and Swinnerton-Dyer conjecture in many new cases using a new algorithm for computing p-adic heights.

 * Quaternion Algebra Arithmetic and Modular Forms: Create and implement algorithms for efficient arithmetic in quaternion algebras, and apply this work to computation of Hecke operators, modular forms, Tamagawa numbers of modular abelian varieties, and enumeration of elliptic curves of large conductor. Gonzalo Tornaria has long worked in this area, and William Stein is working with David Kohel and Lassina Dembele on the design of better algorithms.  This could also involve porting code from MAGMA to SAGE -- the two authors of Magma's quaternion algebra arithmetic have both strongly encouraged me to port their code to SAGE (or have partly done so themselves already). 

 * Distributed Parallel Computation: Continuing a major trend started at the MSRI workshop in January 2007 on parallel computation, participants will design algorithms for parallel distributed integer factorization, computation of Hecke eigenvalues, and other algorithms. In particular, participants will explore several of the other ideas listed above in the context of parallel computation. Implementing these algorithms will likely vastly improve the stability and reliability of distributed computation in SAGE.

 * Optimized Polynomial Arithmetic: David Harvey and Bill Hart (Postdoc, Warwick) have recently created and implemented what is by far the world’s fastest code for univariate polynomial arithmetic. Explore how to fill in the remaining gaps in order to make the results of their work easily available to a larger user community. Similarly, Tom Boothby has worked for about 9 months on algorithms for very fast evaluation of polynomials at points, and another project will be to explore how to deploy this.

 * Commutative Diagram Coercion Model: The current SAGE coercion model has some advantages (speed, ability to override for new classes) but also some issues.  A user is not able to override the coercion system at runtime and use their own coercion maps (this could be incredibly useful for polynomials, or systems of field extensions).  It is difficult to get a system-wide picture of what coercion maps exist: as SAGE grows, this will introduce bugs when the rules for transitivity of coercion are not followed.  It is also difficult, though not impossible, to implement coercion systems where the computation of the coercion map requires effort (creating a coercion map from $\mathbf{F}_{7^8} \to \mathbf{F}_{7^{24}}$).  I want to discuss a new coercion model, either replacing over built on top of the old, that addresses these problems.  Currently I have some ideas for a system based on commutative diagrams, but I want to brainstorm some more before implementing it.  This project will include discussions on ways to improve category theory in SAGE.
