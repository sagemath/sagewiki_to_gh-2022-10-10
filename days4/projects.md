= Projects =
Coding sprint and project ideas for [:days4:SAGE Days 4] June 12-17, 2007.

((NOTE: William Stein is currently reorganizing this page into sections.))

At some point a day or 2 before SD4, we'll have to: flesh these out more and print up the result in a nice latex document for everybody.  Then when people choose actual projects, they will create subpages on the wiki to track their progress, etc.

 * [:days4/projects/packaging: Packaging and Distributing SAGE] -- W Stein, D Deshommes
 
 * [:days4/projects/nb: The SAGE Notebook] -- W Stein, Tom Boothby, Robert Miller, Dorian Raymer, Alex Clemesha, Yi Qiang, and Timothy Clemans

 * [:days4/projects/dist: Distributed Computation] -- W Stein, Yi Qiang

 * [:days4/projects/doc: Documentation]

 * [:days4/projects/numerical: Numerical Computation] -- Josh Kantor, 

 * [:days4/projects/numbertheory: Number Theory] -- David Roed, David Harvey, Bobby Moretti

 * [:days4/projects/groups: Group Theory] -- David Joyner
 
 * [:days4/projects/linalg: Linear Algebra] -- Thea Gegenberg

 * [:days4/projects/linalg: Combinatorics] -- Mike Hansen

 * [:days4/projects/calculus: Symbolic Calculus] -- Bobby Moretti
 
----------------------

 * W Stein, etc.: Make it so vastly more objects are picklable:
  * Write way way more loads(dumps(s)) doctests
  * Fix them when they don't work.
 * Revise the guided tour part of the '''SAGE tutorial''' to much better reflect the symbolic calculus functionality, its pros, cons, etc.
 * W Stein: '''Documentation'''.  Have teams describe how to do the following in tutorial fashion, with all examples automatically doctested:
  * Use dsage to task farm a couple of standard example problems.
  * Make dsage ''truly usable'' for mere mortals -- this means having people who know little just sit down and throw random crap at it; then we formulate a plan to improve things based on the results.
  * Use SageX to create an interface to a C library (case study -- GMP-ECM).
  * Convert a program from .sage files to .py library code.
  * Convert a .py Python program to SageX for speed.
  * Create publication-quality graphics for inclusion in latex documents.
  * Port code from Magma to SAGE.
  * Make an existing PARI-GP / GAP / Singular / Lisp / Maxima program easily usable from SAGE.
  * (Bobby Moretti): How to create a ring or other structure object in SAGE, what class to inherit from, how to set the parent object, what methods to override in both python and SageX, etc.
 * M Albrecht: Go through the wiki and clean it up, write more documentation,  and check what content should be added to the documentation
 * W Stein: Implement a global '''proof = True''' or '''proof = False''' option that is queried by algorithms when proof=None.
 * David Roe: General elliptic curve '''height bound''' code (port Cremona's GPL'd MAGMA code to SAGE.)
 * W Stein: Implement '''Tate's algorithm over number fields''' (again, this involves porting Cremona's GPL'd MAGMA code to SAGE).
 
 * W Stein: Continue to flesh out ideas for '''JSAGE -- the open source math software journal'''.  I announced JSAGE at SD3, and it's been very interesting to see it start to take off.  It's critical that we actually *write* some code to manage JSAGE, and figure out how to really do it right -- much more work is needed.  In particular, a good way of dealing with code submissions from people that don't know much about SAGE development, but have awesome code and ideas to contribute.
 * Nick Alexander (from UCI) and Thea (from SFU): I'd like to implement some basic''' linear algebra over Z/nZ''', following perhaps '' Algorithms for Linear Algebra Problems over Principal Ideal Rings '' (1996), Johannes Buchmann, Stefan Neis at http://citeseer.ist.psu.edu/719844.html.   The algorithms of that paper apply to principal ideal '''rings''', and in the case of a principal ideal '''domain''', reduce to computing the Hermite normal form.  So this could expand to trying to compute the Hermite normal form in the manner of Steel's unpublished algorithm as implemented in MAGMA.
 * David Joyner: I'm interested in adding functionality to the '''group theory''' functionality in SAGE.
 * David Joyner: I'm also interested in coding theory and in particular Robert Miller's work on (now GPL'd) '''Leon's partition backtracking''' programs.
 * Robert Miller: '''Leon's partition backtracking''' programs are almost ready for inclusion as a SAGE spkg. I'd like to have each of Leon's original command-line functions wrapped in the library I'm working on. A native group theory class will be much more feasible if these programs are all available.
 * Kirsten Fagnan, Peter Clark: '''3d Graphics'''
 * Kirsten Fagnan, Josh Kantor, didier deshommes: '''Numerical Computation'''
  1. Incorporate superLU into SAGE with appropriate wrapping via sagex
  1. Incorporate clapack into SAGE
  1. Incorporate something that depends on clapack
  1. Improve SAGE's support for octave and matlab
 * William Stein, David Roe, Joel Mohler: '''Number Fields''' There are numerous issues with number fields in SAGE.  Basically the design is terrible.  The KANT developers have worked very hard for literally a decade to get the design of number fields right, but the design in SAGE (1) completely ignores all the good work done by the KANT group, and just doesn't feel right.
  1. Arithmetic speed -- Joel improved this a lot, but it's unclear what the best plan is.  Discussion at SD4 about design would be very worthwhile.
  1. I really ''do not'' like how relative extensions are implemented in SAGE.  It's terrible.  Design discussions + possibly rewrite it all.  The main problem is that it works way too much like PARI and isn't structural; it doesn't fit at all with how SAGE is supposed to work, and is utterly confusing from a KANT/MAGAM point of view.  It's really bad.
  1. Rings of integers and orders -- Discuss how they might be implemented; required functionality etc.
 * David Roe:''' p-Adic Arithmetic''' -- Design and implement highly optimized algorithms for arithmetic with p-adic numbers. The current implementation is already extensive, containing a wide range of different models of p-adic arithmetic (capped relative, capped absolute, lazy, extensions, etc.) but many new algorithms need to be developed, especially for arithmetic with polynomials over the p-adics, for p-adic linear algebra, for computing in the lattice of extensions of a p-adic ring, and for computing with completions of a number field. (This project started at SAGE Days 2, and has been very actively pursued, especially by David Roe during the last 7 months.)
 * Applications of '''Monsky-Washnitzer Cohomology''': Investigate algorithms for''' fast point counting''' on elliptic and hyperelliptic curves, computation of p-adic height pairings, and computations of''' ''p''-adic Coleman integrals'''. This project began in 2006 at an MSRI workshop, and has been an active area of work during the last year by Kiran Kedlaya, David Harvey, and Robert Bradshaw. In particular, Harvey has recently developed new algorithms that will be explored at the workshop, which allow for new efficient point counting on Jacobians of hyperelliptic curves, Bradshaw and Kedlaya have implemented Coleman integration which has application to the study of rational points on curves, and Stein has been investigating p-adic analogues of the Birch and Swinnerton-Dyer conjecture in many new cases using a new algorithm for computing p-adic heights. Kiran Kedlaya: for applications to rational points on curves, it would be useful to have '''iterated Coleman integrals'''. Also, what about p-adic heights on hyperelliptic curves with good ordinary reduction? Amnon Besser has a recipe for computing heights using Coleman integrals, but it would be easier if one could use only the Frobenius matrix, since then Harvey's improvements become available.
 * '''Quaternion Algebra Arithmetic''' and Modular Forms: Create and implement algorithms for efficient arithmetic in quaternion algebras, and apply this work to computation of Hecke operators, modular forms, Tamagawa numbers of modular abelian varieties, and enumeration of elliptic curves of large conductor. Gonzalo Tornaria has long worked in this area, and William Stein is working with David Kohel and Lassina Dembele on the design of better algorithms.  This could also involve porting code from MAGMA to SAGE -- the two authors of Magma's quaternion algebra arithmetic have both strongly encouraged me to port their code to SAGE (or have partly done so themselves already).
 * '''Distributed Parallel Computation''': Continuing a major trend started at the MSRI workshop in January 2007 on parallel computation, participants will design algorithms for parallel distributed integer factorization, computation of Hecke eigenvalues, and other algorithms. In particular, participants will explore several of the other ideas listed above in the context of parallel computation. Implementing these algorithms will likely vastly improve the stability and reliability of distributed computation in SAGE.
 * '''Optimized Polynomial Arithmetic''': David Harvey and Bill Hart (Postdoc, Warwick) have recently created and implemented what is by far the '''world’s fastest code for univariate polynomial arithmetic'''. Explore how to fill in the remaining gaps in order to make the results of their work easily available to a larger user community. Similarly, Tom Boothby has worked for about 9 months on algorithms for very '''fast evaluation of polynomials''' at points, and another project will be to explore how to deploy this.
 * '''Commutative Diagram Coercion Model''': The current SAGE coercion model has some advantages (speed, ability to override for new classes) but also some issues.  A user is not able to override the coercion system at runtime and use their own coercion maps (this could be incredibly useful for polynomials, or systems of field extensions).  It is difficult to get a system-wide picture of what coercion maps exist: as SAGE grows, this will introduce bugs when the rules for transitivity of coercion are not followed.  It is also difficult, though not impossible, to implement coercion systems where the computation of the coercion map requires effort (creating a coercion map from $\mathbf{F}_{7^8} \to \mathbf{F}_{7^{24}}$).  I, David Roe, want to discuss a new coercion model, either replacing over built on top of the old, that addresses these problems.  Currently I have some ideas for a system based on commutative diagrams, but I want to brainstorm some more before implementing it.  This project will include discussions on ways to improve category theory in SAGE. Nick Alexander is also very interested in working on the proposed commutative diagram coercion model.
 * '''p-adic L-series of elliptic curves''': Christian Wuthrich and I will do a lot along these lines the week before.  Finishing this off at SAGE Days might be really interesting.
 * Kiran Kedlaya: I would love to have '''Arithmetic on Jacobians of Hyperelliptic Curves''' (Cantor's method), ideally SageX'd. I don't know whether this could be ported from MAGMA.
 * Bobby Moretti: '''Symbolic calculus'''. Speeding up arithmetic, cleaning up functions.py, reimplementing and improving maxima's solve command.
 * Bobby Moretti: '''Weirstrass Normal Form'''. Implement EllipticCurve_from_cubic() without using MAGMA.
 * didier deshommes: Improve support for '''SAGE on NexentaOS'''. Several packages need to be patched.
 * Yi Qiang:
  * Improve overhead of running jobs with DSage
  * Completely convert to GNUTLS (use gnutls tools to generate certificates, etc.)
  * Improve web interface to dsage with Alex and Dorian
  * Finish implementing gmp-ecm wrapper
  * Help out with porting the notebook server to twisted
  * Implement parallel running of doctests
  * Fix doctest thread issue for DSage
  * Make the Dashboard widget more fun to look at and more usable
 * Mike Hansen: '''Symmetric functions'''.  Implement the algebra of symmetric functions using SYMMETRICA for backend calculations.
 * Mike Hansen, Yi Qiang(?): '''Bootable (Cluster) CD for SAGE/DSAGE'''.  Using BCCD ( http://bccd.cs.uni.edu/ ) as a base, create a bootable CD to allow one to easily turn in unused lab into DSAGE cluster.
