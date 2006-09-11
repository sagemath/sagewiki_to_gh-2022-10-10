== SAGE Days 2 Wiki: Coding Sprints ==
[:days2: SAGE Days 2]

Put ideas for coding sprints here.   
The [http://modular.math.washington.edu/sage/roadmap/current/  SAGE roadmap] is very relevant.

 * (MartinAlbrecht) Matrices: Decide about inclusion of LinBox and either include it or port the needed changes to ["Givaro"] (see Finite field elements). Then either fix LinBox where needed (e.g., gauss) or implement needed algorithms. (Maybe also wrap/implement ["M4RI"]).
 * (MartinAlbrecht) Finite field elements: Finish the transition from ["Pari"] to ["Givaro"] for small $\#F \le 2^{16}$ fields, wrap some more ["Givaro"] (& ["Linbox"] ?) classes. Wrap ["NTL"] for larger extension fields.
 * (MartinAlbrecht) SAGE/Wiki/Web integration. Needs design decisions.
 * (MartinAlbrecht) Pyrex code inspection would be very nice.
 * (MartinAlbrecht) Devote some time to ["Annoying Bugs"] and ["Bugs"]  See also the new trac server (http://sage.math.washington.edu/trac).
 * (KiranKedlaya) Internalize more GAP functionality into SAGE's own group classes, much as has already been done with PARI (for number fields) and Singular (for polynomials).
