== SAGE Days 2 Wiki: Coding Sprints ==
[:days2: SAGE Days 2]

Put ideas for coding sprints here.   
The [http://modular.math.washington.edu/sage/roadmap/current/  SAGE roadmap] is very relevant.

 * (Alex Clemesha) Making documentation more interactive with the Notebook.  All examples can be evaluated
and changed, but the changes are not saved (i.e. like the Mathematica documentation).  Possible related topics are
including images in the documentation, and cleaning up the online SAGE Notebooks so people coming to those see tons of
excellent examples, which they can modify and evaluate, but changes are not saved. (Online Notebooks are now *filled* with errors)
 * (MartinAlbrecht) Matrices: Decide about inclusion of LinBox and either include it or port the needed changes to ["Givaro"] (see Finite field elements). Then either fix LinBox where needed (e.g., gauss) or implement needed algorithms. (Maybe also wrap/implement ["M4RI"]).
 * (MartinAlbrecht) Finite field elements: Finish the transition from ["Pari"] to ["Givaro"] for small $\#F \le 2^{16}$ fields, wrap some more ["Givaro"] (& ["Linbox"] ?) classes. Wrap ["NTL"] for larger extension fields.
 * (MartinAlbrecht) SAGE/Wiki/Web integration. Needs design decisions.
 * (MartinAlbrecht) Pyrex code inspection would be very nice.
 * (MartinAlbrecht) Devote some time to ["Annoying Bugs"] and ["Bugs"]  See also the new trac server (http://sage.math.washington.edu/trac).
 * (KiranKedlaya) Internalize more GAP functionality into SAGE's own group classes, much as has already been done with PARI (for number fields) and Singular (for polynomials).
 * (IftikharBurhanuddin) Benchmark components of Sage with respect to other CAS.
   - padic, finite field (poly ring) arithmetic, for example factoring polynomials, root finding, etc.  The misc/benchmark.py file is very relevant.
 * (TomBoothby) Notebook usability.  Making tricky elements work better across target browsers.
 * (DavidHarvey) Move more arithmetic classes into Pyrex.
 * (DavidHarvey) Study how to make Pyrex code faster.
 * (DavidHarvey) Write a basic pAdicInteger class.
 * (IftikharBurhanuddin) Cleanup asymptotically fast elliptic curve rational torsion computation code
 * (IftikharBurhanuddin) Make the SuperSingularModule code run faster (http://sage.math.washington.edu/home/burhanud/SSMod/ssmod.py.txt)
 * (Bill Page) Implement a Sage interface to Axiom (http://wiki.axiom-developer.org)
 * (MartinAlbrecht) (together with Justin Walker if he attends) Treat the Singular SPKG and push the changes upstream.
 * (MartinAlbrecht) Make MPolynomials way faster.
 * (WilliamStein) Rings of integers of number fields
