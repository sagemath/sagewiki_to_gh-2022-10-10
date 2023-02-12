

## SAGE Days 2 Wiki: Coding Sprints

[:days2: SAGE Days 2] 

Put ideas for coding sprints here.    The [<a href="http://modular.math.washington.edu/sage/roadmap/current/">http://modular.math.washington.edu/sage/roadmap/current/</a>  SAGE roadmap] is very relevant. 

* (<a href="/AlexClemesha">AlexClemesha</a>) Making documentation more interactive with the Notebook.  All examples can be evaluated and changed, but the changes are not saved (i.e. like the Mathematica documentation).  Possible related topics are including images in the documentation, and cleaning up the online SAGE Notebooks so people coming to those see tons of excellent examples, which they can modify and evaluate, but changes are not saved. (Online Notebooks are now *filled* with errors) 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) Finite field elements: Finish the transition from ["Pari"] to ["Givaro"] for small $\#F \le 2^{16}$ fields, wrap some more ["Givaro"] classes (?). Wrap ["NTL"] for larger extension fields. 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) SAGE/Wiki/Web integration. Needs design decisions. 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) Pyrex code inspection would be very nice. 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) Resolve a large number of the bugs at <a href="http://sage.math.washington.edu/trac">http://sage.math.washington.edu/trac</a>. 
* (<a href="/KiranKedlaya">KiranKedlaya</a>) Internalize more GAP functionality into SAGE's own group classes, much as has already been done with PARI (for number fields) and Singular (for polynomials). 
* (<a href="/IftikharBurhanuddin">IftikharBurhanuddin</a>) Benchmark components of Sage with respect to other CAS. 
      * - padic, finite field (poly ring) arithmetic, for example factoring polynomials, root finding, etc.  The misc/benchmark.py file is very relevant. 
* (<a href="/TomBoothby">TomBoothby</a>) Notebook usability.  Making tricky elements work better across target browsers. 
* (<a href="/DavidHarvey">DavidHarvey</a>) Move more arithmetic classes into Pyrex. 
* (<a href="/DavidHarvey">DavidHarvey</a>) Study how to make Pyrex code faster. 
* (<a href="/DavidHarvey">DavidHarvey</a>) Write a basic pAdicInteger class. 
* (<a href="/IftikharBurhanuddin">IftikharBurhanuddin</a>) Cleanup asymptotically fast elliptic curve rational torsion computation code 
* (<a href="/IftikharBurhanuddin">IftikharBurhanuddin</a>) Make the <a href="/SuperSingularModule">SuperSingularModule</a> code run faster (<a href="http://sage.math.washington.edu/home/burhanud/SSMod/ssmod.py.txt">http://sage.math.washington.edu/home/burhanud/SSMod/ssmod.py.txt</a>) 
* (<a href="/BillPage">BillPage</a>) Implement a Sage interface to Axiom (<a href="http://wiki.axiom-developer.org">http://wiki.axiom-developer.org</a>) 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) (together with Justin Walker) Treat the Singular SPKG and push the changes upstream. 
* (<a href="/MartinAlbrecht">MartinAlbrecht</a>) Make MPolynomials way faster. 
* (<a href="/WilliamStein">WilliamStein</a>) Rings of integers of number fields (and possibly restructure arithmetic in number fields in general) 