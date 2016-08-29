# Network issues at Inria

We had some troubles with Inria's guest network.
Here's a command to make {{{git fetch trac}}} work on the InriaGuest network:

{{{git remote set-url trac git@trac.sagemath.org:sage.git}}}

= Sprints =

== Sprints on Coding theory ==

 * Review open coding theory tickets, see [[http://trac.sagemath.org/ticket/18846|#18846]] : David, Johan Édouard, Julien (Cyclic codes, BCH codes), Daniel, Clément, Arpit
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

 * Fix any open minor issue with `linear_code.py` as noted on the [[https://bitbucket.org/lucasdavid/sage_coding_project/issues/155/problems-with-linear_codepy|ACTIS Bitbucket wiki]]. Ricardo, Daniel, David
    * see #21306 above
    * issue 151 -> #20001 decoder types (Ricardo), https://bitbucket.org/lucasdavid/sage_coding_project/issues/151/definition-of-decoders-types
    * #21328 Implement parity check codes as a code class: Tania, David, Nicolas -> Open for review


 * Finish the implementation of Golay codes: David, Tania, Arpit -> open for review

 * Implement a class for Goppa codes. Implement a decoder, e.g. based on its formulation as a subfield subcode of a GRS code: Daniel, Tania, Johan, David -> Discussions

 * Finish and review Groebner basis decoding of any linear code (Irene, Miguel, David) -> WIP, see #21339

 * Create a base class for codes over (ZZ mod N). See #6452 for the relevant base module structure. Create a class for the famous Z4 codes and their embedding into binary codes. Joe Fields , Johan, Ricardo, David -> discussions in progress

 * Discuss guava and improve its integration in Sage: Daniel, Joe, David. Some details follow:
    * sage -i gap_packages offers no granularity
    * Joe did a review of main features of guava : we would like to have a place to point them and discuss them wrt to sage-actis (ticket ? bitbucket ?) -> wiki page at https://wiki.sagemath.org/Coding_Theory/Guava
    * Joe pointed the issue with codetables.de  and magma
    * few algorithms (minimum distance, code equivalence, automorphism group) have been implemented in C for guava. So the calling path is sage->gap->guave->adhoc
    * The most valuable seems to be Leon's code for computing the automorphism group of a code

 * Update https://wiki.sagemath.org/Coding_Theory. Done: Complete rewrite. Please check it out.


== GSoC 2016 related projects: Arpit, David, Xavier, Johan ==

 * Write and review related tickets (#13215)

    * experimental warning needs to be thrown properly -> done.
    * A lot of changes and improvements were made to the documentation of the ticket.
    * In needs_review now   

 * skew polys over finite fields (#21088)
   * This ticket is no longer relevant: it mainly implements inplace methods but they are not faster that standard ones

 * skew polynomials over (R, theta) where theta has finite order (#21262): in needs_review
 * Interpolation and minimal vanishing poly for skew polys #21131
   Working on rewriting history. Otherwise pretty close to setting needs_review.
 * Abstract base class for Rank Metric Codes #21226
   * Add documentation and remaining methods. 
 * Gabidulin Code + decoder: #20970

== Algebra ==

 * Improve the integration of finite field non-prime basis representation that was introduced in [[http://trac.sagemath.org/ticket/20284|#20284]]. Johan, Luca, David, Turku, Édouard, Bruno
   * See https://gist.github.com/defeo/cabab27ea93aeb9e0deb0ba8c5bc745b

 * Port implementation of asymptotically fast (GF(q)[x])[y] root-finding from [[https://bitbucket.org/jsrn/codinglib|Codinglib]]. Bruno, Johan => needs review: http://trac.sagemath.org/ticket/21333
 
 * Improve integration of the (GF(q)[x])[y] root-finding so that it is tab-expansion-available for any such polynomial (a reasonably fast implementation of such root-finding was introduced in [[http://trac.sagemath.org/ticket/19666|#19666]]) Johan, Bruno, Turku:

        * https://trac.sagemath.org/ticket/21331 closed.


 * List decoding should return empty list instead of None when no codeword is found: needs review http://trac.sagemath.org/ticket/21347

 * Refactoring class hierarchy for univariate polynomials : Johan, Bruno
   Look at overall picture Wednesday evening. Get master-advice from Nicolas Thursday. => Got super advice! (And even skeleton of code => in good way ;-))

== Linear Algebra ==

 * Fix and review http://trac.sagemath.org/ticket/17635 : update LinBox, fflas-ffpack and givaro packages : Clément, Charles

    - 23/08: fixed cygwin + cleanup -> needs-review

 * Link to new features of new LinBox release (linalg mod p > 23 bits, ZZ) https://trac.sagemath.org/ticket/19076 : Clément, Charles
 * Links to old features of old LinBox releases (sparse det/charpoly/rank/minpoly, for instance): Clément, Charles (Johan?)
        * https://trac.sagemath.org/ticket/13915
        * 23/08, Givaro: Fixed GMP detection using autotools, sent pull request upstream to Givaro: https://github.com/linbox-team/givaro/pull/28
        * 24/08, Trying to replace .pxi files with .pxd, to prevent type aliasing. https://trac.sagemath.org/ticket/21321  (needs review)
        * 24/08, need to remove the sage-interface in LinBox (by improving the linbox-interface in Sage). https://trac.sagemath.org/ticket/21327 work in progress
        * 25/08, need to improve IML wrapping in sage. https://trac.sagemath.org/ticket/21341


 * Fix matrix subdivisions (https://trac.sagemath.org/ticket/14064 ): Fangan, Charles, Turku. positive review

 * #21332 Creation of a method 'canonicalize_radical' for matrices : Fangan. -> positive review

== Other ==

 * #21352 Creation of a class for McEliece cryptosystem : Fangan, David. Actually triggered a discussion about the design of sage.crypto abstract class system.

 * coerce_binop rewrite #21322 -> Positive Review > Closed!

 * Learn about implementing codes over finite rings in Sage: Ricardo, Johan, Joe

 * Fix the libFES experimental package (Charles), https://trac.sagemath.org/ticket/15209, http://cristal.univ-lille.fr/~bouillag/fes/ (gave up, no time)

 * Design a more general Benchmark framework for all of Sage (or even more).
    * Discussion pad: https://mensuel.framapad.org/p/sage-days-75-benchmarking
    * Discuss Thursday. David, Clément, Johan, Nicolas, Miguel, Luca, Thiery
    * Agreed on working on something larger than just coding theory.
    * Decided to start a new project, aiming at designing a Python package: https://github.com/miguelmarco/bleachermark

 * https://trac.sagemath.org/ticket/20241 CyPari (Luca, Miguel?????)

 * https://trac.sagemath.org/ticket/19971 SCSCP (Luca,Miguel????)
    * mostly working client
  
 * https://trac.sagemath.org/ticket/18010 Multiple Zeta (Akhilesh)
 
 * https://trac.sagemath.org/ticket/18019 MPFI slowness (Akhilesh)
 
 * Cleaning old tickets: 
    * https://trac.sagemath.org/ticket/10261 -> needs review (Sebastien)
    * https://trac.sagemath.org/ticket/10948 -> needs review (Sebastien)


 * have a 'sage -rst2ipyb' command (Thierry), ticket(s) to come (involves a few new packages)

 * review https://trac.sagemath.org/ticket/20690 and package thebe.js for that purpose https://trac.sagemath.org/ticket/21309 (Thierry)
 * Continue to work on improving Sage infrastructure, in particular: (Thierry)
    * finalize backup system for : ask, patchbot, fileserver
    * uniformize ssl certificate management
    * publish the (sysadmin) doc that is spread among maintained services

= Lightning or slightly slower talks and roundtable discussion =

== Teaching coding theory (Wednesday afternoon) ==

 * Nicolas: "Introduction aux codes correcteurs" Option C Agregation http://nicolas.thiery.name/Enseignement/Agregation/
 * Luca: Bachelor level IT class taught in Java http://defeo.lu/in420/ (in french)
 * Johan: Master level class, with a focus on the maths
 * Clément: Master level: a classical CT course, with not much computer programming. Another one, more oriented to CIRC codes with a practical implementation project. (http://lig-membres.imag.fr/pernet/M2SCCI_Coding.html)
 * Visualization of Coding Theory (maybe using Graphs???)
Images would have to be bit map images/png (see: bit-array module in Python). But an idea is to have product codes that decode it. The main idea is to create a project that is open and the students have a free choice to decide what the final visualization looks like.
 * Evaluations of students/their submissions using Sage. 
 * Getting students to contribute to Sage as part of a course - write a Wikipedia page on a particular topic and the prof evaluates based on that (makes changes if there are mistakes). Or maybe add code or documentation to Sage.
 * SageMathCloud- advantage over other CMS is that it has Sage built right in and students can be up and running immediately. 
 * Another takeaway is to augment theoretical explanations of codes using Sage, for exampleone can create worksheets that can be shared so that  students can see visually (perfect codes - see Nicolas' course notes) how a code looks or follow step wise the properties of codes and a virtual pipeline of message->encoding->adding errors (channel)-> decoding. 
 * Using advanced CT features to support learning. Live demos (pick code, channel, encode, etc), functions for data, applications. Have students take a text file/image/video/sound and encode it and then add noise and then decode and analyze/compare it. Very fun for students to understand.
 * Demonstrate code efficiency, etc.
 * Interactive documentation base (Miguel) https://riemann.unizar.es/sage-wiki
 *  Nicolas: Improving my class notes
    * Btw: feel free to reuse any chunk of those notes if useful (e.g. for a tutorial)
    * Potentially useful features for those course notes: parity code, code from a set of words, drawing codes, text <-> vectors conversions

== Talks conducted ==

 * Tutorial: contributing to Sage: git and trac (David): Daniel, Tania, Fangan Édouard : Fangan Édouard, Ricardo, Joe, Clément
   * done -> slides have been uploaded
 * Tutorial: implementing new codes (David): Tania, Édouard....
 * Learning more about codes over rings (Ricardo): David, Tania, Joe, Daniel, ...
   * we discussed on what Ricardo would like to have in Sage
   * I (David) took some notes. 
 * Johan, Wednesday 11:00: "Decoding algebraic codes for the lazy mathematician". Done.
 * Interactive documentation base (Miguel) https://riemann.unizar.es/sage-wiki
