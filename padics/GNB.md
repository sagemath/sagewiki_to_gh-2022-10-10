 * ''Goal'' -- Design a specialized p-adic extension type for cyclotomic extensions of Qp and Zp. Design element classes for unramified extensions that take advantage of a Gauss normal basis for faster arithmetic.  
 * ''Type'' -- speed improvements, coherence with number fields
 * ''Priority'' -- Medium
 * ''Difficulty'' -- Medium-Hard
 * ''Prerequisites'' -- Cyclotomic fields in general will need to wait on [[../PolynomialFactoring | polynomial factoring]]
 * ''Background'' -- Look at [[http://perso.univ-rennes1.fr/reynald.lercier/file/talkL10a.pdf | Lercier's talk]] from Counting Points: Theory, Algorithms and Practice
 * ''Contributors'' -- David Roe, David Lubicz
 * ''Progress'' - not started
 * ''Related Tickets'' -- 

== Discussion ==

== Tasks ==

 1. Implement Gauss normal basis for finite fields.

 1. Implement Gauss normal basis for unramified extensions of Zp and Qp.

 1. Implement elliptic normal basis for finite fields.

 1. Implement elliptic normal basis for unramified extensions of Zp and Qp.

 1. Implement a special parent for cyclotomic extensions.  For totally ramified and unramified cyclotomic extensions this can be done now; in general it will need to wait on [[../PolynomialFactoring | polynomial factoring]].
