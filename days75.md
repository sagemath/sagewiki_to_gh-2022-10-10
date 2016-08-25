Sage Days 75 will be held from August 22-26, 2016 at [[https://www.inria.fr/en/centre/saclay|Inria Saclay]], France.

<<TableOfContents()>>

= Organizers =

Daniel Augot, David Lucas, Johan S. R. Nielsen, Clément Pernet.

Please contact David Lucas (david.lucas[at]inria.fr) for any question.

= Focus & Topics =

The overall theme of this Sage Days is coding theory and exact linear algebra related to it, but there will be lots of general hacking.
Even if you don't have any particular interest in coding theory, you should participate! 
Similarly, even if don't know Sage at all but are interested in coding theory, you should also participate!
There will be an installation session, introductory talks to Sage and its development workflow.

The aim of this Sage Days is to:

 * Introduce Sage to coding theorists.

 * Have presentations about the enhancements we made to Sage's coding theory library during Inria's [[ACTIS|https://bitbucket.org/lucasdavid/sage_coding_project/wiki/Home]] project

 * Help people to work on their own projects.

We plan on having talks on the mornings, and coding sprints on the afternoons.
The first 3 days' talks will be focused on basic functionalities of our library, the last 2 days
on advanced functionalities, with an emphasis on Sage development.

== Schedule ==

Disclaimer: This is a preliminary schedule which is subject to change!

||<#AFEFEF:> Plenary talks ||<#D0FFD0:> Coding sprints ||

||<5%>              ||<15% #FFFFAA:> Monday, 22nd August ||<15%  #FFFFAA:> Tuesday, 23rd August ||<15%  #FFFFAA:> Wednesday, 24th August ||<15%  #FFFFAA:> Thursday, 25th August  ||<15%  #FFFFAA:> Friday, 26th August ||
||Room              ||<:> Gilles Kahn  ||<:> Gilles Kahn ||<:> Gilles Kahn ||<:> Gilles Kahn ||<:> Gilles Kahn ||
||<#FFFFAA> 9am     ||<:|3> Welcome and install session||<#D0FFD0:|1>Coding sprints session||<#D0FFD0:|4>Coding sprints session||<#D0FFD0:|4>Coding sprints session||<#D0FFD0:|4>Coding sprints session||
||<#FFFFAA> 9.30am  ||<#D0FFD0:|2>[[attachment:git_trac.pdf|Talk on Git and Trac]] (D. Lucas)||
||<#FFFFAA> 10am    ||
||<#FFFFAA> 10.30am ||<#AFEFEF:|2>[[http://defeo.lu/sagemath-paris/sagedays75-2016-08-22.html#1|Introduction to Sage]] (Luca De Feo)||
||<#FFFFAA> 11am    ||<#AFEFEF:|2>Presentation of LinBox (Clément Pernet)||<#AFEFEF:|2>Decoding techniques for algebraic codes: algorithmic and implementation (Johan S. R. Nielsen)||<#AFEFEF:|2>Rank-metric codes in Sage (Arpit Merchant)||<#AFEFEF:|2>TBA||
||<#FFFFAA> 11.30am ||Hands-on Sage (tutorials, ...) See [[http://doc.sagemath.org/html/en/thematic_tutorials/index.html|Thematic tutorials]] including one on [[http://doc.sagemath.org/html/en/thematic_tutorials/coding_theory.html#coding-theory|coding theory]]||
||<#FFFFAA> 12am    ||Lunch break||Lunch break||Lunch break||Lunch break||Lunch break||
||<#FFFFAA> 1.30pm  ||<#AFEFEF:|2>Introduction to coding theory in Sage (David Lucas)||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||<#D0FFD0:|6>Coding sprints session||
||<#FFFFAA> 2pm     ||
||<#FFFFAA> 2.30pm  ||Break||
||<#FFFFAA> 3pm     ||<#AFEFEF:>Status report on [[https://bitbucket.org/lucasdavid/sage_coding_project/wiki/Home|Actis]] (David Lucas)||
||<#FFFFAA> 3.15pm  ||<#AFEFEF:>Brainstorming on coding sprints (David Lucas)||
||<#FFFFAA> 3.30pm  ||<#D0FFD0:|2>Coding sprints session||
||<#FFFFAA> 5.00pm  ||<#D0FFD0:|1>Status report on coding sprints||<#D0FFD0:|1>Status report on coding sprints||<#D0FFD0:|1>Status report on coding sprints||<#D0FFD0:|1>Status report on coding sprints||
||<#FFFFAA> 6pm     ||<:> End ||<:> End ||<:> End ||<:> End ||<:> End ||

We also expect to have informal short talks by the participants throughout
the week on any subject that comes up.

== Ideas for coding sprints ==

Feel free to add your own ideas on this [[https://mensuel.framapad.org/p/sage-days-75|collaborative PAD]].

=== Coding theory ideas ===

* Review any open coding theory ticket, see [[http://trac.sagemath.org/ticket/18846|#18846]].

* Fix any open minor issue with `linear_code.py` as noted on the [[https://bitbucket.org/lucasdavid/sage_coding_project/issues/155/problems-with-linear_codepy|ACTIS Bitbucket wiki]].

* Improve documentation of functions and modules in sage.coding.

* Implement the Hartmann-Tzeng bound for cyclic codes. See #20100 for cyclic codes.

* Cython implementation of the Brouwer-Zimmermann algorithm for computing the minimum distance of a linear code.

* Finish the implementation of Golay codes.

* Create a proper code class for any construction in `code_constructions.py`, and endow it with (some of) the known properties for that class.

* Implement a class for Goppa codes. Implement a decoder, e.g. based on its formulation as a subfield subcode of a GRS code.

* Create a class for binary codes and move the binary-code specific methods of `AbstractLinearCode` into this class. Possibly think the efficient binary   code methods in sage.coding.binary_code.pyx into it.

* Create a class for two-weight codes. Rewrite sage.coding.two_weight_db.py such that it creates elements of this class.

* Create a class for self-dual codes. Think sage.coding.sd_codes into it. Be sure to merge in trac #21165 before working on this, since it does relevant renaming and refactoring.

* Create an abstract class AbstractSubfieldLinearCode for codes which are linear over a *subfield* of the base field. Examples include interleaved codes, folded RS codes, and rank-metric codes which are linear over the matrix base field. Should AbstractLinearCode inherit from this?

* Create a base class for codes over (ZZ mod N). See #6452 for the relevant base module structure. Create a class for the famous Z4 codes and their embedding into binary codes.



=== Algebra ideas ===

* Improve integration of finite field non-prime basis representation introduced in [[http://trac.sagemath.org/ticket/20284|#20284]].

* Port implementation of asymptotically fast (GF(q)[x])[y] root-finding from [[https://bitbucket.org/jsrn/codinglib|Codinglib]].

* Improve integration of the (GF(q)[x])[y] root-finding so that it is tab-expansion-available for any such polynomial (a reasonably fast implementation of such root-finding was introduced in [[http://trac.sagemath.org/ticket/19666|#19666]])

* Fix and review [[http://trac.sagemath.org/ticket/16742|#16742]] regarding faster F[x] matrix reduction.

* Link to advanced fast polynomial arithmetic library functions such as multi-point evaluation and Lagrange interpolation.

* Link to fast GF(2)[x] library (currently used is NTL generic GF(p)[x]).

* Link to new features of new LinBox release.



= Logistics =

== Lodging ==

We booked a holiday cottage ([[http://www.cernayvacances.com/en/stay/de-toren/|The Tower]]
and [[http://www.cernayvacances.com/en/stay/le-grenier-royal/|Le grenier royal]] and will provide
free lodging.
As there is a limited number of rooms, please contact David Lucas (david.lucas[at]inria.fr) if you
want to stay at the cottage.

== Transportation ==

=== Arrival on the weekend (August 20-21) ===

If you arrive on Saturday (20th), stop at Massy-Palaiseau RER station. Let me (David Lucas) know when you arrive at the station and
I'll pick you there. We will then drive you to the cottage at 3.30pm.

If you arrive on Sunday (21st), stop at Massy-Palaiseau RER station. There will be two shuttles, one at 6.40pm and the other
one at 9.30pm. Both will depart from Massy-Palaiseau SNCF station. To reach the SNCF station from the RER station, please check
the map given below.

=== How to reach Inria Saclay ===

Board the RER B, direction ''Saint Rémy lès Chevreuse'', ''Orsay'' or ''Massy-Palaiseau'' and stop at Massy-Palaiseau.
Exit on ''Massy-Atlantis'' side and board 91.06B or 91.06C bus. Stop at ''Polytechnique - Laboratoire''.
A map of Massy-Palaiseau RER/Bus station is available
[[https://www.ensta-paristech.fr/sites/default/files/fichiers/menu_gauche/plan_gare_massy.pdf|here (pdf)]]

=== How to reach the cottage ===

From Orly Airport: Take the Orlyval to Paris, and stop at ''Antony''. Then, board the RER B to ''Saint Rémy lès Chevreuse'' and
stop at ''Saint Rémy lès Chevreuse''. We will drive you to the cottage from there.

From Charles de Gaulle Airport: Take the RER B to ''Saint Rémy lès Chevreuse'' and
stop at ''Saint Rémy lès Chevreuse''. We will drive you to the cottage from there.

We will also provide transportation by cars between the cottage and Inria Saclay.

== Meals at the cottage ==

=== Breakfast ===

Basic continental breakfasts will be provided every morning.
There is also a bakery close to the house to buy fresh bread and pastry. 

=== Dinner ===

There will be a buffet on Sunday evening.

On the other days, voluntary participants will take turns to prepare dinners.
Feel free to bring you own favourite delicatessen!

= Participants =

Please add you name to the list if you want to attend this Sage Days.

 * Daniel Augot (Inria Saclay - LIX)
 * David Lucas (Inria Saclay - LIX)
 * Johan S. R. Nielsen (DTU)
 * Clément Pernet (U. Grenoble Alpes, U. de Lyon - LIP)
 * Luca De Feo (U. Versailles)
 * Miguel Marco (U. de Zaragoza)
 * Irene Márquez (Inria)
 * Julien Lavauzelle (LIX & Inria Saclay)
 * Xavier Caruso (IRMAR)
 * Jean-Pierre Flori (ANSSI) (I'll show up randomly and will be commuting from Paris)
 * Arpit Merchant (IIIT-H, India)
 * Bruno Grenet (U. Montpellier)
 * Alain Couvreur (Inria Saclay - LIX)
 * Tania Richmond (U. de Toulon)
 * Razvan Barbulescu (IMJ - PRG)
 * Ricardo Alfaro (U. of Michigan - Flint)
 * Charles Bouillaguet (U. Lille 1) 
 * Nicholas Coxon (Inria Saclay - LIX)
 * Joe Fields (SCSU - New Haven, CT, USA)
 * Fangan Dosso (U. de Toulon)
 * Nicolas M. Thiéry (U. Paris Sud)
 * Akhilesh Parol (IMSc Chennai, India)
 * Samuel Lelièvre (U. Paris Sud)
 * Philippe Dumas (Inria Saclay)
 * ThierryMonteil (not sure about the exact dates)
 * Sébastien Labbé (U. Liège, Thursday-Friday)
 * Édouard Rousseau (U. Paris-Sud)


= Other files =

[[attachment:Demonstration of new CT features in Sage (Dagstuhl Aug 2016)|Demonstration of new CT features in Sage (Dagstuhl Aug 2016), J. Rosenkilde]]
