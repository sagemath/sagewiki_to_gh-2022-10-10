
# Network issues at Inria 

We had some troubles with Inria's guest network. Here's a command to make `git fetch trac` work on the <a href="/InriaGuest">InriaGuest</a> network: 

`git remote set-url trac git@trac.sagemath.org:sage.git` 


# Sprints


## Sprints on Coding theory

* Review open coding theory tickets, see <a class="http" href="http://trac.sagemath.org/ticket/18846">#18846</a> : David, Johan Édouard, Julien (Cyclic codes, BCH codes), Daniel, Clément, Arpit 
         * #20342 as author (David) -> Open for review 
         * #20100 Cyclic code (Julien) work in progress 
         * #21306 doc on divisor (Ricardo) -> Positive review 
         * #21315 relative distance (David, Tania, Fangan) -> Open for review. Positive review. 
         * #20908 doc bugs -> in progress 
         * #21326 Prevent creation of code with length 0 (Fangan) -> Open for review 
         * #21165 Various cleanup to sage/coding -> positive review 
         * #20342 Rate ->  positive review 
         * #19913 non guava covering radius -> positve review 
         * #19251 immutable basis -> positive review 
         * #20443 decoder_type on non class instances ->positive review 
         * #19975 -> invalid/wontfix 
         * #20787 Golay codes -> needs review 
         * #20233 minimum_distance() fails for large fields (Joe) -> needs review 
Reminder: remember to add keyword 'sd75' on all Sage tickets you may be working on during these Sage days. 

* Fix any open minor issue with `linear_code.py` as noted on the <a class="https" href="https://bitbucket.org/lucasdavid/sage_coding_project/issues/155/problems-with-linear_codepy">ACTIS Bitbucket wiki</a>. Ricardo, Daniel, David 
         * see #21306 above 
         * issue 151 -> #20001 decoder types (Ricardo), <a href="https://bitbucket.org/lucasdavid/sage_coding_project/issues/151/definition-of-decoders-types">https://bitbucket.org/lucasdavid/sage_coding_project/issues/151/definition-of-decoders-types</a> 
         * #21328 Implement parity check codes as a code class: Tania, David, Nicolas -> Open for review 
* Finish the implementation of Golay codes: David, Tania, Arpit -> open for review 
* Implement a class for Goppa codes. Implement a decoder, e.g. based on its formulation as a subfield subcode of a GRS code: Daniel, Tania, Johan, David -> Discussions 
* Finish and review Groebner basis decoding of any linear code (Irene, Miguel, David) -> WIP, see #21339 
* Create a base class for codes over (ZZ mod N). See #6452 for the relevant base module structure. Create a class for the famous Z4 codes and their embedding into binary codes. Joe Fields , Johan, Ricardo, David -> discussions in progress 
* Discuss guava and improve its integration in Sage: Daniel, Joe, David. Some details follow: 
         * sage -i gap_packages offers no granularity 
         * Joe did a review of main features of guava : we would like to have a place to point them and discuss them wrt to sage-actis (ticket ? bitbucket ?) -> wiki page at <a href="https://wiki.sagemath.org/Coding_Theory/Guava">https://wiki.sagemath.org/Coding_Theory/Guava</a> 
         * Joe pointed the issue with codetables.de  and magma 
         * few algorithms (minimum distance, code equivalence, automorphism group) have been implemented in C for guava. So the calling path is sage->gap->guave->adhoc 
         * The most valuable seems to be Leon's code for computing the automorphism group of a code 
* Update <a href="https://wiki.sagemath.org/Coding_Theory">https://wiki.sagemath.org/Coding_Theory</a>. Done: Complete rewrite. Please check it out. 

## GSoC 2016 related projects: Arpit, David, Xavier, Johan

* Write and review related tickets (#13215) 
         * experimental warning needs to be thrown properly -> done. 
         * A lot of changes and improvements were made to the documentation of the ticket. 
         * In needs_review now 
* skew polys over finite fields (#21088) 
      * This ticket is no longer relevant: it mainly implements inplace methods but they are not faster that standard ones 
* skew polynomials over (R, theta) where theta has finite order (#21262): in needs_review 
* Interpolation and minimal vanishing poly for skew polys #21131 
      * Working on rewriting history. Otherwise pretty close to setting needs_review. 
* Abstract base class for Rank Metric Codes #21226 
      * Add documentation and remaining methods. 
* Gabidulin Code + decoder: #20970 

## Algebra

* Improve the integration of finite field non-prime basis representation that was introduced in <a class="http" href="http://trac.sagemath.org/ticket/20284">#20284</a>. Johan, Luca, David, Turku, Édouard, Bruno 
      * See <a href="https://gist.github.com/defeo/cabab27ea93aeb9e0deb0ba8c5bc745b">https://gist.github.com/defeo/cabab27ea93aeb9e0deb0ba8c5bc745b</a> 
* Port implementation of asymptotically fast (GF(q)[x])[y] root-finding from <a class="https" href="https://bitbucket.org/jsrn/codinglib">Codinglib</a>. Bruno, Johan => needs review: <a href="http://trac.sagemath.org/ticket/21333">http://trac.sagemath.org/ticket/21333</a> 
* Improve integration of the (GF(q)[x])[y] root-finding so that it is tab-expansion-available for any such polynomial (a reasonably fast implementation of such root-finding was introduced in <a class="http" href="http://trac.sagemath.org/ticket/19666">#19666</a>) Johan, Bruno, Turku: 
                     * <a href="https://trac.sagemath.org/ticket/21331">https://trac.sagemath.org/ticket/21331</a> closed. 
* List decoding should return empty list instead of None when no codeword is found: needs review <a href="http://trac.sagemath.org/ticket/21347">http://trac.sagemath.org/ticket/21347</a> 
* Refactoring class hierarchy for univariate polynomials : Johan, Bruno  
      * See <a href="https://gist.github.com/bgrenet/7d0c318f72eab845c58037e9b0d2702c">https://gist.github.com/bgrenet/7d0c318f72eab845c58037e9b0d2702c</a> 

## Linear Algebra

* Fix and review <a href="http://trac.sagemath.org/ticket/17635">http://trac.sagemath.org/ticket/17635</a> : update <a href="/LinBox">LinBox</a>, fflas-ffpack and givaro packages : Clément, Charles 
         * - 23/08: fixed cygwin + cleanup -> needs-review 
* Link to new features of new <a href="/LinBox">LinBox</a> release (linalg mod p > 23 bits, ZZ) <a href="https://trac.sagemath.org/ticket/19076">https://trac.sagemath.org/ticket/19076</a> : Clément, Charles 
* Links to old features of old <a href="/LinBox">LinBox</a> releases (sparse det/charpoly/rank/minpoly, for instance): Clément, Charles (Johan?) 
                     * <a href="https://trac.sagemath.org/ticket/13915">https://trac.sagemath.org/ticket/13915</a> 
                     * 23/08, Givaro: Fixed GMP detection using autotools, sent pull request upstream to Givaro: <a href="https://github.com/linbox-team/givaro/pull/28">https://github.com/linbox-team/givaro/pull/28</a> 
                     * 24/08, Trying to replace .pxi files with .pxd, to prevent type aliasing. <a href="https://trac.sagemath.org/ticket/21321">https://trac.sagemath.org/ticket/21321</a>  (needs review) 
                     * 24/08, need to remove the sage-interface in <a href="/LinBox">LinBox</a> (by improving the linbox-interface in Sage). <a href="https://trac.sagemath.org/ticket/21327">https://trac.sagemath.org/ticket/21327</a> work in progress 
                     * 25/08, need to improve IML wrapping in sage. <a href="https://trac.sagemath.org/ticket/21341">https://trac.sagemath.org/ticket/21341</a> 
* Fix matrix subdivisions (<a href="https://trac.sagemath.org/ticket/14064">https://trac.sagemath.org/ticket/14064</a> ): Fangan, Charles, Turku. positive review 
* #21332 Creation of a method 'canonicalize_radical' for matrices : Fangan. -> positive review 

## Other

* #21352 Creation of a class for <a href="/McEliece">McEliece</a> cryptosystem : Fangan, David. Actually triggered a discussion about the design of sage.crypto abstract class system. 
* coerce_binop rewrite #21322 -> Positive Review > Closed! 
* Learn about implementing codes over finite rings in Sage: Ricardo, Johan, Joe 
* Fix the libFES experimental package (Charles), <a href="https://trac.sagemath.org/ticket/15209">https://trac.sagemath.org/ticket/15209</a>, <a href="http://cristal.univ-lille.fr/~bouillag/fes/">http://cristal.univ-lille.fr/~bouillag/fes/</a> (gave up, no time) 
* Design a more general Benchmark framework for all of Sage (or even more). 
         * Discussion pad: <a href="https://mensuel.framapad.org/p/sage-days-75-benchmarking">https://mensuel.framapad.org/p/sage-days-75-benchmarking</a> 
         * Discuss Thursday. David, Clément, Johan, Nicolas, Miguel, Luca, Thiery 
         * Agreed on working on something larger than just coding theory. 
         * Decided to start a new project, aiming at designing a Python package: <a href="https://github.com/miguelmarco/bleachermark">https://github.com/miguelmarco/bleachermark</a> 
* <a href="https://trac.sagemath.org/ticket/20241">https://trac.sagemath.org/ticket/20241</a> <a href="/CyPari">CyPari</a> (Luca, Miguel?????) 
* <a href="https://trac.sagemath.org/ticket/19971">https://trac.sagemath.org/ticket/19971</a> SCSCP (Luca,Miguel????) 
         * mostly working client 
* <a href="https://trac.sagemath.org/ticket/18010">https://trac.sagemath.org/ticket/18010</a> Multiple Zeta (Akhilesh) 
* <a href="https://trac.sagemath.org/ticket/18019">https://trac.sagemath.org/ticket/18019</a> MPFI slowness (Akhilesh) 
* Cleaning old tickets: 
         * <a href="https://trac.sagemath.org/ticket/10261">https://trac.sagemath.org/ticket/10261</a> -> needs review (Sebastien) 
         * <a href="https://trac.sagemath.org/ticket/10948">https://trac.sagemath.org/ticket/10948</a> -> needs review (Sebastien) 
* have a 'sage -rst2ipyb' command (Thierry), ticket(s) to come (involves a few new packages) 
* review <a href="https://trac.sagemath.org/ticket/20690">https://trac.sagemath.org/ticket/20690</a> and package thebe.js for that purpose <a href="https://trac.sagemath.org/ticket/21309">https://trac.sagemath.org/ticket/21309</a> (Thierry) 
* Continue to work on improving Sage infrastructure, in particular: (Thierry) 
         * finalize backup system for : ask, patchbot, fileserver 
         * uniformize ssl certificate management 
         * publish the (sysadmin) doc that is spread among maintained services 

# Lightning or slightly slower talks and roundtable discussion


## Teaching coding theory (Wednesday afternoon)

* Nicolas: "Introduction aux codes correcteurs" Option C Agregation <a href="http://nicolas.thiery.name/Enseignement/Agregation/">http://nicolas.thiery.name/Enseignement/Agregation/</a> 
* Luca: Bachelor level IT class taught in Java <a href="http://defeo.lu/in420/">http://defeo.lu/in420/</a> (in french) 
* Johan: Master level class, with a focus on the maths 
* Clément: Master level: a classical CT course, with not much computer programming. Another one, more oriented to CIRC codes with a practical implementation project. (<a href="http://lig-membres.imag.fr/pernet/M2SCCI_Coding.html">http://lig-membres.imag.fr/pernet/M2SCCI_Coding.html</a>) 
* Visualization of Coding Theory (maybe using Graphs???) 
Images would have to be bit map images/png (see: bit-array module in Python). But an idea is to have product codes that decode it. The main idea is to create a project that is open and the students have a free choice to decide what the final visualization looks like. 

* Evaluations of students/their submissions using Sage. 
* Getting students to contribute to Sage as part of a course - write a Wikipedia page on a particular topic and the prof evaluates based on that (makes changes if there are mistakes). Or maybe add code or documentation to Sage. 
* <a href="/SageMathCloud">SageMathCloud</a>- advantage over other CMS is that it has Sage built right in and students can be up and running immediately. 
* Another takeaway is to augment theoretical explanations of codes using Sage, for exampleone can create worksheets that can be shared so that  students can see visually (perfect codes - see Nicolas' course notes) how a code looks or follow step wise the properties of codes and a virtual pipeline of message->encoding->adding errors (channel)-> decoding. 
* Using advanced CT features to support learning. Live demos (pick code, channel, encode, etc), functions for data, applications. Have students take a text file/image/video/sound and encode it and then add noise and then decode and analyze/compare it. Very fun for students to understand. 
* Demonstrate code efficiency, etc. 
* Interactive documentation base (Miguel) <a href="https://riemann.unizar.es/sage-wiki">https://riemann.unizar.es/sage-wiki</a> 
* Nicolas: Improving my class notes 
         * Btw: feel free to reuse any chunk of those notes if useful (e.g. for a tutorial) 
         * Potentially useful features for those course notes: parity code, code from a set of words, drawing codes, text <-> vectors conversions 
* Razvan Barbulescu wishes to use Sage (especially Cyclic codes in Sage) in his course at the preparatory school for the french _agrégation de mathématiques_ 
* Sébastien Labbé gave a Course "Introduction aux logiciels mathématiques" this year at Université of Liège. It is based on Python modules (sympy, pandas, etc.) rather than <a href="/SageMath">SageMath</a> because of problems installing sagemath in the windows computer room of the department. See <a href="http://www.slabbe.org/Enseignements/MATH2010/">http://www.slabbe.org/Enseignements/MATH2010/</a> 

## Talks conducted

* Tutorial: contributing to Sage: git and trac (David): Daniel, Tania, Fangan Édouard : Fangan Édouard, Ricardo, Joe, Clément 
      * done -> slides have been uploaded 
* Tutorial: implementing new codes (David): Tania, Édouard.... 
* Learning more about codes over rings (Ricardo): David, Tania, Joe, Daniel, ... 
      * we discussed on what Ricardo would like to have in Sage 
      * I (David) took some notes. 
* Johan, Wednesday 11:00: "Decoding algebraic codes for the lazy mathematician". Done. 
* Interactive documentation base (Miguel) <a href="https://riemann.unizar.es/sage-wiki">https://riemann.unizar.es/sage-wiki</a> 