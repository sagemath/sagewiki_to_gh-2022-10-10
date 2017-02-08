Review Days 3 is a one-day '''online''' event held February 7, 2017.
The Review Days will officially run from 9-17, GMT+1, or until everyone runs out
of steam.

We will communicate using Slack and Framapad. See below.

<<TableOfContents()>>

= Organizers =

Daniel Augot, David Lucas, Julien Lavauzelle, Johan Rosenkilde, Clément Pernet.

Please contact Johan Rosenkilde (jsrn[at]jsrn.dk) for any question.

= Motivation and Focus =

This Review Day follows up on [[https://wiki.sagemath.org/days75|SageDays75]] on
Coding Theory, six months after conclusion of the
[[https://bitbucket.org/lucasdavid/sage_coding_project|ACTIS-project]] on
developing Coding Theory for Sage.

The main goal is to finish and review many of the open tickets on Coding Theory
functionality. See [[https://trac.sagemath.org/wiki/SageCodingRoadMap|CodingTheoryRoadmap]] on Trac.

= How to get together =

This is a virtual meeting, so every-one is invited to join from her/his preferred location. To communicate, we propose the two following virtual rendez-vous:

 * A [[https://sagereviewday3.slack.com/|Slack public chat room ]] with possibility to create sub-channels and private discussions if necessary;
 * A [[https://bimestriel.framapad.org/p/SageReviewDay3|Framapad collaborative pad]] to keep track of the working agenda, and to be updated with status reports

= Participants =

Feel free to add yourself to this list if you plan to participate for some of or the entire day.

 * Daniel Augot (daugot)
 * David Lucas (dlucas)
 * Johan Rosenkilde (jsrn)
 * Clément Pernet (cpernet)
 * Julien Lavauzelle (jlavauzelle)
 * Luca De Feo (defeo) — afternoon only
 * Bruno Grenet (bruno)
 * Matthew Rennekamp (mrennekamp)
 * Arpit Merchant (arpitdm) - joining intermittently


= Aftermath: Copy-paste of our Framapad = 

== Reviews being done: ==

    # 20335: BCH codes: solved the conflicts, doctests pass, but need a deeper review (Julien) --> we almost finished, it just remains to add some doc to explain the link between the BCH code and its underlying GRS code.


== Rebase and Review ==

    #20849: improve grs.py docstring (cpernet) -> merge conflicts solved


== Improve and Review ==

    # 20938: Decoding algorithm for low-order q-ary or binary Reed-Muller codes (Johan)

    #21088: Merged conflicts, resolved doctest errors and fixed deprecated statements (Arpit)



== Other ideas ==

    CyclicCode : overwrite dual_code()

    the ZeroCode should be available (Sage supports VectorSpace of dimension 0)



== Done during Sage Review Day 3 ==

    # 21328: Parity check code: just need a quick final review => Done (David)

    #21131 Interpolation, Minimum vanishing polynomial and Multi-point evaluation -> Positive Review

    #20899:  `AbstractLinearCode` should throw sensible error messages on printing

    #20087:  `__call __ (message)` on linear code or encoder should return a codeword -> Positive Review

    #20898: Syndrome decoder for a linear code sometimes sets wrong decoder type : -> Fixed, positive review

    # 20908: Reage index and catalogs for sage.coding (David, Johan)

    # 21333: Asymptotically fast (GF (q) [x]) [y] root-finding. (Johan)

    # 21024: Faster k [x] matrix reduction (could be closed # 16742 as invalid). (Johan)

    # 20087 (`__call __ (message)` on linear code or encoder should return a codeword): cpernet => done (positive review)

    # 20001: Wrote the table for decoder types and their definitions (David) => (positive review)

    #21159: Cached generator matrices and parity check matrices should be immutable: cpernet => fixed (positive reviewed)

    # 20953: minimum distance and gap (Julien)

    #21156: dimension() uses _dimension even if it does not exist (bruno) => Positive review

    #20787:  GolayCode looks OK, but we are stuck  in the --long coverage because of olf chinen_polynomial() stuff.
