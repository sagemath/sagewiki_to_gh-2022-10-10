

# Number Theory

<a href="/days4/projects/">Other SAGE Days 4 Projects</a> 

David Harvey, David Roe, Joel Mohler, Gonzalo Tornaria, Craig Citro, Ifti B.  

These sub-projects will be worked on as interest exists.  We will decide which of these get done on Tuesday during the strategy session (4:30-5:00).   

* Investigate Claus Fieker's paper for Galois group computation. 
* David Roe: Implement <a href="/days4/projects/numbertheory/tate">Tate's algorithm over number fields</a> (again, this involves porting Cremona's GPL'd MAGMA code to SAGE).  This is mostly done. 
* <a href="/days4/projects/numbertheory/number_fields">Number Fields</a> There are numerous issues with number fields in SAGE.  The KANT developers have worked very hard for literally a decade to get the design of number fields right, but the design in SAGE (1) completely ignores all the good work done by the KANT group, and just doesn't feel right. 
   1. Arithmetic speed -- Joel improved this a lot, but it's unclear what the best plan is.  Discussion at SD4 about design would be very worthwhile. 
   1. I really _do not_ like how relative extensions are implemented in SAGE.  It's terrible.  Design discussions + possibly rewrite it all.  The main problem is that it works way too much like PARI and isn't structural; it doesn't fit at all with how SAGE is supposed to work, and is utterly confusing from a KANT/MAGAM point of view.  It's really bad. 
   1. Rings of integers and orders -- Discuss how they might be implemented; required functionality etc. 


---

 

* (done) <a href="/days4/projects/numbertheory/padic_lseries">p-adic L-series of elliptic curves</a> : Christian Wuthrich and I will do a lot along these lines the week before.  Finishing this off at SAGE Days might be really interesting. 
* Kiran Kedlaya: I would love to have <a href="/days4/projects/numbertheory/jacobians">Arithmetic on Jacobians of Hyperelliptic Curves</a> (Cantor's method), ideally SageX'd. I don't know whether this could be ported from MAGMA. 
* David Roe: General elliptic curve <a href="/days4/projects/numbertheory/height_bounds">height bound</a> code (port Cremona's GPL'd MAGMA code to SAGE.) 
* Bobby Moretti: <a href="/days4/projects/numbertheory/weirstrass">Weirstrass Normal Form</a>. Implement <a href="/EllipticCurve">EllipticCurve</a>_from_cubic() without using MAGMA. 
* David Roe: <a href="/days4/projects/numbertheory/padics">p-Adic Arithmetic</a> -- Design and implement highly optimized algorithms for arithmetic with p-adic numbers. The current implementation is already extensive, containing a wide range of different models of p-adic arithmetic (capped relative, capped absolute, lazy, extensions, etc.) but many new algorithms need to be developed, especially for arithmetic with polynomials over the p-adics, for p-adic linear algebra, for computing in the lattice of extensions of a p-adic ring, and for computing with completions of a number field. (This project started at SAGE Days 2, and has been very actively pursued, especially by David Roe during the last 7 months.) 
* (later) <a href="/days4/projects/numbertheory/quaternions">Quaternion Algebra Arithmetic</a> and Modular Forms: Create and implement algorithms for efficient arithmetic in quaternion algebras, and apply this work to computation of Hecke operators, modular forms, Tamagawa numbers of modular abelian varieties, and enumeration of elliptic curves of large conductor. Gonzalo Tornaria has long worked in this area, and William Stein is working with David Kohel and Lassina Dembele on the design of better algorithms.  This could also involve porting code from MAGMA to SAGE -- the two authors of Magma's quaternion algebra arithmetic have both strongly encouraged me to port their code to SAGE (or have partly done so themselves already). 
* (later) Applications of <a href="/days4/projects/numbertheory/monsky_washnitzer">Monsky-Washnitzer Cohomology</a>: Investigate algorithms for** fast point counting** on elliptic and hyperelliptic curves, computation of p-adic height pairings, and computations of** _p_-adic Coleman integrals**. This project began in 2006 at an MSRI workshop, and has been an active area of work during the last year by Kiran Kedlaya, David Harvey, and Robert Bradshaw. In particular, Harvey has recently developed new algorithms that will be explored at the workshop, which allow for new efficient point counting on Jacobians of hyperelliptic curves, Bradshaw and Kedlaya have implemented Coleman integration which has application to the study of rational points on curves, and Stein has been investigating p-adic analogues of the Birch and Swinnerton-Dyer conjecture in many new cases using a new algorithm for computing p-adic heights. Kiran Kedlaya: for applications to rational points on curves, it would be useful to have **iterated Coleman integrals**. Also, what about p-adic heights on hyperelliptic curves with good ordinary reduction? Amnon Besser has a recipe for computing heights using Coleman integrals, but it would be easier if one could use only the Frobenius matrix, since then Harvey's improvements become available. 